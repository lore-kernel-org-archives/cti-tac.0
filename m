Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5212A1386D2
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709842974; cv=none; b=GJjpyUTxh1U1hpce8YN/Etbs768kpVKRppXvmcc9+ZVYXjptzkYenSh3wII3ZkM0Q/++8NpHEiUcT1n9hLGNrAKsseJL/2elKCPMsplS+ILzFXYcRe5MTwGo9ATsqDl99JSW3re27ESzX1abUmiPvSkzHYJXeN7GGmVWOCeXZdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709842974; c=relaxed/simple;
	bh=kiaiu+Ht1xrbTGZGy8NMPC3/J4aI+0pD00mG4itDlA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=k2tZTdv9VsnJVLXcT7ggU9OCFfXs1WcSjq8c2NwwCxlQXomLXRDRdBkbplCoJQhDEUoL60oBsXyrykgfggQ5td/vvEmrWG5LtP0hiC2xs+JXXfEzfGwBaEzN4MZtxbqu7OpsI++lqWeYngobLFBrmBNdHwRjRBOEAdc3Henlnh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f+helrc1; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f+helrc1"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E03BC405E2
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-NEckCY7q51 for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 20:22:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA51B4029F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA51B4029F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f+helrc1
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BA51B4029F
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709842970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0UDtRFT+ldDe2ZQo5bx7wQ0VnpvHd73hcUNO/NQQoe4=;
	b=f+helrc1GfozbZv8XUs0L89UqSeEOEP5aKgSoddju18kiLC76mk1xnnvgJhAR6Tc6do+Ae
	vqPPVJ6FcHtezF0UTGbbbdMM09Eh+Wc7TXxlnkCFbPSRKVjxRio8aR1402Xei0YDnPt/6+
	Q97fY2PuJslnRP4P94gGayun/h0nfDA=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-PFRh324dOGqwyLujS1Nt8Q-1; Thu, 07 Mar 2024 15:22:49 -0500
X-MC-Unique: PFRh324dOGqwyLujS1Nt8Q-1
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-7db9dbebcb2so403504241.1
        for <cti-tac@lists.linuxfoundation.org>; Thu, 07 Mar 2024 12:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709842968; x=1710447768;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0UDtRFT+ldDe2ZQo5bx7wQ0VnpvHd73hcUNO/NQQoe4=;
        b=rvqHw1Q/dh1JQqO9Dcj/s7dbNt/Kvsir5crI+BZUZkVYIOuaoF4J5qyYnU60AhHAIx
         g+cZ+JsR9/oksHOUqHSDpckaVGpBV7VHgQ7gMUJX4MuEFR6TZfWxexMxMbbLzpf8u8f1
         hkfr15IFZtnA5Q4qJtwecxBdUv7T7YzX6R3vPDUzzaiWTddN/MNM57ArNb4GwFBnoRns
         ELaJ4e3GG5yxxCatPpmpP+glX0EDSWBaZmHAn9B/GssccXpvvRn1nZvIaZTpe0HAmL9d
         r6lImkt0AsNjcpdjbyNVZfLRS1RhIN0XNJma8Olj80TvU80rvUTc7lCsT2jMDhBddN/2
         ct0w==
X-Forwarded-Encrypted: i=1; AJvYcCWyo8tCIWgA03heigMD2YDyncOysaeTWVa5p5oWqwloiGkXd1S+bpPxb1+vG5iyrMNxJ2ZVd2ufYiMYd4wHWeRY/G2s58sAMIWkNtg9y6vtn7I=
X-Gm-Message-State: AOJu0YzGj3JqVx3uFneCF4xc2PJ7LRQDTIX58mTUkrIxGt9oFdN2cBzW
	A0L7r+DhOLW3dhV4wCDvyGvFhPLQGznxdNvtFM+Z58BVbVYly/g3d/aAbgasMsa4axeuQHg4eKJ
	VCx1Mca7HxD2/MwecvAD9gSHK7rVTzS0gPHt+RWg5q9pYA2vkGuQ8/FlcN3HtoZyvTdqL
X-Received: by 2002:a05:6102:510c:b0:472:fb8c:2054 with SMTP id bm12-20020a056102510c00b00472fb8c2054mr4700277vsb.33.1709842968430;
        Thu, 07 Mar 2024 12:22:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsoNm1Y/GAhGGCikRZks3INzVhZ9RCY8aCkBNji5O9LDDUJ9sObtnqtjExf26xQq/ldS6ZXg==
X-Received: by 2002:a05:6102:510c:b0:472:fb8c:2054 with SMTP id bm12-20020a056102510c00b00472fb8c2054mr4700266vsb.33.1709842968087;
        Thu, 07 Mar 2024 12:22:48 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id kv9-20020a056214534900b006905c8b37bbsm7360743qvb.133.2024.03.07.12.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 12:22:47 -0800 (PST)
Message-ID: <191eb22c-ec30-4f01-a7b9-b7b9fa5ae0fb@redhat.com>
Date: Thu, 7 Mar 2024 15:22:46 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] projects/glibc: slightly adjust the structure
To: Siddhesh Poyarekar <siddhesh@gotplt.org>,
 cti-tac@lists.linuxfoundation.org
References: <20240307193019.4028812-1-siddhesh@gotplt.org>
 <20240307193019.4028812-2-siddhesh@gotplt.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20240307193019.4028812-2-siddhesh@gotplt.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/7/24 14:30, Siddhesh Poyarekar wrote:
> Add some subheadings and fix a broken link.
> 

The HTML part is not OK. Please check format of cross doc ref.

> Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
> ---
>  source/projects/glibc.rst | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/source/projects/glibc.rst b/source/projects/glibc.rst
> index 7e6604a..a400dab 100644
> --- a/source/projects/glibc.rst
> +++ b/source/projects/glibc.rst
> @@ -5,6 +5,9 @@ In 2024 the goal is to migrate the glibc project to use CTI services.
>  
>  The community feedback was collected from July to August 2023.
>  
> +Current Status
> +--------------

OK.

> +
>  The `GNU Maintainers for the glibc project 
>  <https://sourceware.org/glibc/wiki/MAINTAINERS#Project_stewards_.28GNU_package_maintainers.29>`_
>  were asked to make a decision on switching to the services provided by
> @@ -24,13 +27,17 @@ this document to provide assurances that FOSS would be used to provide
>  services and that there was a checking mechanism in place for services
>  to remain FOSS.
>  
> -Next steps:
> +Next steps
> +----------

OK.

>  
>   * Revisit discussion with Paul Eggert and attain resolution in March 2024
>     to move forward.
>  
>  Posted originally here: https://inbox.sourceware.org/libc-alpha/45e98807-908f-0968-b6fe-5dbb0af265b1@redhat.com/
>  
> +Service migration
> +-----------------

OK.

> +
>  The following is the suggested list of services to be migrated (with notes):
>  
>  * Mailing lists
> @@ -81,7 +88,7 @@ The following is the suggested list of services to be migrated (with notes):
>    * Isolate BBB from other services.
>  
>  The current list of glibc services were put together as part of the
> -CTI TAC `glibc service enumeration <./enum>`_.
> +CTI TAC `glibc service enumeration <./enum.html>`_.

I don't think this is correct.

I agree the website link is broken, but it has to be a cross-document reference
that works when generated as html (rather than assume html).

>  
>  -----------------
>  

-- 
Cheers,
Carlos.

