Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E310762A
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 18:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39E7D83FB8
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 18:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39E7D83FB8
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=QeSKDK6Y
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01xAaMEoS0Lf for <cti-tac@lists.linuxfoundation.org>;
	Thu, 10 Aug 2023 18:41:11 +0000 (UTC)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1B68B83BEF
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 18:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B68B83BEF
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6418c819c3cso660556d6.3
        for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 11:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691692870; x=1692297670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtIojyC5PFWgdEXZt3F5+DHsAacl8RHMcewNEDfkSkA=;
        b=QeSKDK6YOvTiM9HvMjlEy/ySzAGAkrFt5n17jPYdewKne0ax5at6I/1RCBZGEiNGUB
         Bpo0k7OBQd9PEq72TtLDF3zwlqi4Jgarrg438ATrKtxmLFCg88F+hpJgh0ljCA2knQdp
         aZXQoRCAdDJ58PJLXrg58XDzoi273d0dOiZWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691692870; x=1692297670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtIojyC5PFWgdEXZt3F5+DHsAacl8RHMcewNEDfkSkA=;
        b=EtxgCWPdqVuyZPAt+i3ZkNUI8B9dRQ/PWm1yz2f3bjNiJ8jCSnc4xtoFdIcGQH+/TK
         yi5MdWL/MoZgf5KVddGTCzjlKatgHR5zUMg1qj2t+QNbP2o/wkiB1TG72i1JydptsRSm
         1SroTaqxVYolWGas6mbn7eUjrI5i8H89kUDbKwfDaxXiMYcf1AL6wa7ddq5PDoa63Ypq
         G/WCviBZmJc7mg84Uj/E6j6jLhsezbP9uQ0tlXp16m4ebrSSbkFp3PkdgIO8Xodfrv6X
         NxaV1Ha5gbtNWz46mCnqTv2XGwRa+pMQYw9ZOiGGBkxz98sMIemRTIQjAS+qfiTM9afI
         x3mg==
X-Gm-Message-State: AOJu0YwcgI5ezUP7ZT7HJyghmbVha0lRQDG1Iws6kirL8Q9jN0uAVi3+
	H+i5JuQBqwIGJT05RdV6OBZVxpDP
X-Google-Smtp-Source: AGHT+IH+vQiYjYSKPBHjTbUsVzeWVRNdpcpsodzFa0cuwXLaSqQRwSCu29evJKNBY7niAwzipm9xtQ==
X-Received: by 2002:a0c:ab58:0:b0:63d:336f:23bb with SMTP id i24-20020a0cab58000000b0063d336f23bbmr2827304qvb.21.1691692869856;
        Thu, 10 Aug 2023 11:41:09 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id u2-20020ae9c002000000b00767c961eb47sm671080qkk.43.2023.08.10.11.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 11:41:09 -0700 (PDT)
Date: Thu, 10 Aug 2023 14:41:00 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Siddhesh Poyarekar <siddhesh@gotplt.org>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Resources for glibc CNA
Message-ID: <20230810-slingshot-kilt-01ce9b@meerkat>
References: <3b30c81d-e328-0379-d7b8-92bfbe322b39@gotplt.org>
 <20230810-container-startup-099fa7@meerkat>
 <3e9faab8-7272-dba1-d84d-60008ab95375@gotplt.org>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3e9faab8-7272-dba1-d84d-60008ab95375@gotplt.org>

On Thu, Aug 10, 2023 at 02:25:36PM -0400, Siddhesh Poyarekar wrote:
> > Yes and no. We do have infrastructure for encrypted communication called
> > "remail" where hardware vendors discuss vulnerabilities that are likely to
> > affect millions of high-profile devices. For example, it was used for
> > collaborating on the patches fixing the recent speculative execution
> > vulnerabilities. The setup is described in this document:
> > https://korg.docs.kernel.org/remail.html
> > 
> > However, this may be an overkill for what you need and also introduces
> > multiple levels of complexity that you may not want. The alternative is to set
> > up a private PGP keypair and share the decryption and signing subkeys among
> > members who are duty bound to respond to vulnerability reports.
> 
> remail functionality is exactly what I had in mind actually.  What
> complexity would be involved in setting this up?

It's managed via a backend git repository and mostly just requires getting
familiar with the format. While it does support S/MIME, the general experience
thus far has been that it's not worth the trouble, so everyone just does PGP.

It wouldn't take too much effort to roll it out, but we do need to settle on
the domain name to use, since we'd have to set it up for mail delivery.

> > For the publication, I usually strongly advise a simple static site that can
> > withstand very high traffic. I believe there is general consensus that
> > "toolchain.dev" is the domain to be used for CTI purposes, so something could
> > be published on advisories.toolchain.dev or similar.
> 
> Ack, a static site would be perfect, perhaps with markdown pages and git
> access, similar to our plan for the wiki.

Another option is a restricted public advisories mailing list with a
public-inbox frontend (similar to lore.kernel.org). This would provide you
with both pull-based and push-based subscription options.

-K
