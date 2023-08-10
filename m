Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C940D1E1DA
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 18:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4549760EC6
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 18:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4549760EC6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=KP4aCwG+
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6yyf-D6c_A68 for <cti-tac@lists.linuxfoundation.org>;
	Thu, 10 Aug 2023 18:15:32 +0000 (UTC)
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B2D0760AFC
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 18:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2D0760AFC
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-767b6d6bb87so81445285a.2
        for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 11:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691691331; x=1692296131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pFXAgaQ93dA1fatx682Br2yeDqFKG0+rxSksGe9QGf4=;
        b=KP4aCwG+IKwD/G64FL4xgNWTX1jdd7CyV3ef8pyf/J8YbRtfeV1QUFZ+nS94HoMIWZ
         7+6TiK9ELM6HjhLkQ2DJIJaX/TKCm6FwhzXpU4e1LkCpyg57mmFjAHdOXtRSFsSZpyIR
         PgTDz4adgAF/HEuKOvTk0cRTTzXDGYc1gVwLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691691331; x=1692296131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFXAgaQ93dA1fatx682Br2yeDqFKG0+rxSksGe9QGf4=;
        b=MOdje5JCbsEM4M2WDxyvk4XuPa6D+jqgVtES/sNhmZHhLotwILk+Z3Q/Za7hHamA2v
         4+d/NBiknYwqtSCDHjZl7GOb+AhmRVvQbaIYgnyK5LDljbQNVlQLLGH2+J+K/Zi/d2/7
         gZo/pE6u81EcfWLhcIt6LYdRT/JLA59wLmfmN4UcxExCKjPy/yP+WC9ErpvuMrjOn6nn
         ouxqcUplPv50KViOcL+FbEo2vjDpdA9q52T0wrx0RatMU24Ph+5CGRdx0XWFg7r9krfs
         EM9gNZkfomS+5ZhvUdNKM88VhCIoafRCoCh1X6GIGYTUhtmTwgZPUAU4PvtW90Qf4XP1
         DQSg==
X-Gm-Message-State: AOJu0YwJvgOfqjfx4L8wfXbr1jkBPAs7T2FE8rtiRS9J+K0OAx/nsM5F
	miktE2J7hgPeMqMGxhtiBzgY4VXHz0/lfDv0Rqo1rQ==
X-Google-Smtp-Source: AGHT+IHg1xVx8hhbIoQV44yqnAhuq7KgGRA3CZ2gghuxVYWrNpb2jZ7MZSSQNFdpuu52TSUxaKI3Ng==
X-Received: by 2002:a05:620a:44c4:b0:76c:e6b6:58d3 with SMTP id y4-20020a05620a44c400b0076ce6b658d3mr3711985qkp.22.1691691331524;
        Thu, 10 Aug 2023 11:15:31 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id o12-20020a05620a130c00b00767d2870e39sm659774qkj.41.2023.08.10.11.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 11:15:31 -0700 (PDT)
Date: Thu, 10 Aug 2023 14:15:22 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Siddhesh Poyarekar <siddhesh@gotplt.org>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Resources for glibc CNA
Message-ID: <20230810-container-startup-099fa7@meerkat>
References: <3b30c81d-e328-0379-d7b8-92bfbe322b39@gotplt.org>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3b30c81d-e328-0379-d7b8-92bfbe322b39@gotplt.org>

On Thu, Aug 10, 2023 at 01:17:02PM -0400, Siddhesh Poyarekar wrote:
> Hello,
> 
> I recently proposed setting up a CNA for glibc and it looks like there's
> general consensus on us doing this.  As part of this set up we would need an
> email address (preferably one that can accept encrypted submissions from
> issue reporters) to reach the glibc security team and web pages to publish
> security advisories.

I am not familiar with "CNA" in this context, but I assume it's some kind of
Numbering Authority similar to a CVE?

> I wanted to know if this is something we could/should set up on LF
> infrastructure or if I should try and get something up on sourceware.
> Konstantin, does LF already have some infrastructure for this that we can
> share?

Yes and no. We do have infrastructure for encrypted communication called
"remail" where hardware vendors discuss vulnerabilities that are likely to
affect millions of high-profile devices. For example, it was used for
collaborating on the patches fixing the recent speculative execution
vulnerabilities. The setup is described in this document:
https://korg.docs.kernel.org/remail.html

However, this may be an overkill for what you need and also introduces
multiple levels of complexity that you may not want. The alternative is to set
up a private PGP keypair and share the decryption and signing subkeys among
members who are duty bound to respond to vulnerability reports.

For the publication, I usually strongly advise a simple static site that can
withstand very high traffic. I believe there is general consensus that
"toolchain.dev" is the domain to be used for CTI purposes, so something could
be published on advisories.toolchain.dev or similar.

-K
