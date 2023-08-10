Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B3A22F02
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 21:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7804941DF4
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 21:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7804941DF4
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JQWml5Wb
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
	SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gsrM45kIWvmw for <cti-tac@lists.linuxfoundation.org>;
	Thu, 10 Aug 2023 21:34:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1E18141DEE
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 21:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E18141DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691703242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SuhFWHKvodzGFINBEl6MuSUFZo1FqCqBy6JJgTAPt3w=;
	b=JQWml5WbVhpIQvSVBnf8Aw5kBNQHAtImUC+wgUEBEyT3p21Ae3S/Xotk6TqEzOR/39wDJG
	FOteaiIvaQgbfWdC3up/AMjFCwlYd9+FEzEr0NO6Q97K0ubHMkyRGHren6Z5FgUpHWk719
	BO6wQkkO6drS31AVQXvZ/v1myIxlcgk=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-2tTXTh2xPge7MziTJgOnPA-1; Thu, 10 Aug 2023 17:34:00 -0400
X-MC-Unique: 2tTXTh2xPge7MziTJgOnPA-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-586bd766310so17822647b3.0
        for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 14:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691703240; x=1692308040;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SuhFWHKvodzGFINBEl6MuSUFZo1FqCqBy6JJgTAPt3w=;
        b=QA2P6ameGgUFY4vGpAr8P+xhDh8IGqwnh3WNJPjCwHK6vl5Yr8KdIVxsbqrlDKnJ+G
         IUH8nAcpU618p97X68HXjNEIcm9GyPAtAWhkE7e2ONv/SC2VJ5+xhwG11C/XVWICo7sj
         FFa6iDLpFYjgv2LVhIqmWP7e+ZEZoQ+gHnTP5e4R5dqPXJtoBuEV2l8Gws6/Po0TV2Xl
         2rH/NKBsxOGgS0uXUO6JoJg3fb8A69RP4YNjkx/+CTL1W9/eXRLZshs3stdWaRGP8QCF
         vlhpeaSyc9nQbvdvKFfFLg2OicccNRsVrfwYDK/ODwZFMZY3BzqpNJRyoG7uFCDlABJH
         h6Zg==
X-Gm-Message-State: AOJu0Yzb52NrfN0nRWOaulSOU30TeerXpO8MU/kJi9KZiql1CZrxUbu+
	ETkxwTZnJ+G27/AftBH7U6a0+ZHXNZV4aaXr7JUtpFQcNQXLL2+HCXjGComEZ5ujH3HTP2qGxk/
	lWUZchELFB/ijiTpE0dHERCZrI6reScw=
X-Received: by 2002:a25:c552:0:b0:d11:254a:aa71 with SMTP id v79-20020a25c552000000b00d11254aaa71mr3894309ybe.44.1691703240387;
        Thu, 10 Aug 2023 14:34:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUnbEL6l9cDQ4IGQmG8+m96Ioy6/4Gczw1GZYfpJ4SwegUf0Mh+MXOMIVh8x+aM7mX0T2SRg==
X-Received: by 2002:a25:c552:0:b0:d11:254a:aa71 with SMTP id v79-20020a25c552000000b00d11254aaa71mr3894298ybe.44.1691703240119;
        Thu, 10 Aug 2023 14:34:00 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id e191-20020a2537c8000000b00d071631665fsm562708yba.59.2023.08.10.14.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 14:33:59 -0700 (PDT)
Message-ID: <5ff7a8f2-225e-eec0-44c6-afaf08f5944a@redhat.com>
Date: Thu, 10 Aug 2023 17:33:58 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Resources for glibc CNA
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Siddhesh Poyarekar <siddhesh@gotplt.org>, David Edelsohn <dje.gcc@gmail.com>
Cc: cti-tac@lists.linuxfoundation.org
References: <3b30c81d-e328-0379-d7b8-92bfbe322b39@gotplt.org>
 <20230810-container-startup-099fa7@meerkat>
 <3e9faab8-7272-dba1-d84d-60008ab95375@gotplt.org>
 <20230810-slingshot-kilt-01ce9b@meerkat>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20230810-slingshot-kilt-01ce9b@meerkat>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/10/23 14:41, Konstantin Ryabitsev wrote:
> On Thu, Aug 10, 2023 at 02:25:36PM -0400, Siddhesh Poyarekar wrote:
>>> Yes and no. We do have infrastructure for encrypted communication called
>>> "remail" where hardware vendors discuss vulnerabilities that are likely to
>>> affect millions of high-profile devices. For example, it was used for
>>> collaborating on the patches fixing the recent speculative execution
>>> vulnerabilities. The setup is described in this document:
>>> https://korg.docs.kernel.org/remail.html
>>>
>>> However, this may be an overkill for what you need and also introduces
>>> multiple levels of complexity that you may not want. The alternative is to set
>>> up a private PGP keypair and share the decryption and signing subkeys among
>>> members who are duty bound to respond to vulnerability reports.
>>
>> remail functionality is exactly what I had in mind actually.  What
>> complexity would be involved in setting this up?
> 
> It's managed via a backend git repository and mostly just requires getting
> familiar with the format. While it does support S/MIME, the general experience
> thus far has been that it's not worth the trouble, so everyone just does PGP.
> 
> It wouldn't take too much effort to roll it out, but we do need to settle on
> the domain name to use, since we'd have to set it up for mail delivery.

I don't have a strong opinion here, but I would rather start *simple* and _then_ scale up to
remail only if we need it. If we can just use gpg/pgp then I would prefer that.

I agree we need to settle on the domain name, and I would also pick "toolchain.dev" since
we want to use that for other CTI projects, and a landing page like "advisories.toolchain.dev"
would be fine.

>>> For the publication, I usually strongly advise a simple static site that can
>>> withstand very high traffic. I believe there is general consensus that
>>> "toolchain.dev" is the domain to be used for CTI purposes, so something could
>>> be published on advisories.toolchain.dev or similar.
>>
>> Ack, a static site would be perfect, perhaps with markdown pages and git
>> access, similar to our plan for the wiki.
> 
> Another option is a restricted public advisories mailing list with a
> public-inbox frontend (similar to lore.kernel.org). This would provide you
> with both pull-based and push-based subscription options.

I like the static site backed by git better because it allows us to do all kinds of git-based
auditing and review. I get the appeal of a mailing list, but I'd still end up committing something
somewhere, and then sending an email via an API. Might as well just commit and regenerate the
pages.

-- 
Cheers,
Carlos.

