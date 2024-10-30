Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855A11E009D
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730291538; cv=none; b=TUEaaBWnE7YE6PmPIH+NEGyhtuP4/tEQBeaQ+uNadUTv1Ko91MnYY1Ly6W+2mGFQ/pnc0PBTOSf4DiAcsTOyL4+f4D1ROIA68HWpw7BU7Qgvq3ZPKvw+LSiPW6+pLqjcFOZldMSd7ETW9aTJithDM49egK8W9L3YE3EAjw8dRhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730291538; c=relaxed/simple;
	bh=i8XAm0CtlEdI1fwOklyntUt0zEO2tI8otvA5Z7bF+Q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=syaw9uWuww6AgZrGquCPgnmZ5Pkmfdjv6qFtLioj5f8tUuFkVMOlHsr4ImqSGSQ0ANdpnFlTgg72MWtN8H+cT9mptsRl4dBAZQvzAS89kOse5++ITx05LXkQwFcOAagY3/ZHbao6xSaKsCO5PRIvbbm5nEqeHaWzaU51iRBsOBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a63DPkr8; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a63DPkr8"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23463400BF
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 12:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SB4_MRzI9t8e for <cti-tac@lists.linuxfoundation.org>;
 Wed, 30 Oct 2024 12:32:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D95840382
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D95840382
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a63DPkr8
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9D95840382
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730291533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=F5EIAsV6lz8oeyo+x6g/JIg33Y0ODXM72FpDOccclJ8=;
	b=a63DPkr8BR6ta7jJGvDLTtOAi9nblrkmKqM1Jwu9Z4AHWKdHsNz4l+L9hrbtdmKkCzyWFU
	Haq5mRwgHlT6esIsPlrLb3o3xVJIjptqicQE/skyq8mC+04B4uy9RFbSSSpPOyc1O0W3xu
	0y3hwTOlM0CBIzet63MExdQHE5gnst4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-CUrj2eLuOQWJceirxJcvJQ-1; Wed, 30 Oct 2024 08:32:12 -0400
X-MC-Unique: CUrj2eLuOQWJceirxJcvJQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cbe77eeeadso89342276d6.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 05:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730291532; x=1730896332;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5EIAsV6lz8oeyo+x6g/JIg33Y0ODXM72FpDOccclJ8=;
        b=aLU6u7uvIT97iUod6ms6hzVvMG8VVWsxNdB+5hlAJb22sEEZI6G98omR/thkD9znh/
         35GgU03igvQSyX/+lsOOHq4fiAcMaiH58nDuJQ8Xgq/VKaE4mMbDudzNTRo/zR7hDCfZ
         N0H+McOx3ypjZrd+C9nWPZHFyoTcwFzGCB0Ryxf0+B7uwN6F9FH090HQGi41XJXXJOoe
         OGV5thcK0aI+pczaJosJIgvrtR26HbqWDllVETb4xSvYpGKmSsyFvxjJUzBOC0yhAI9/
         b5kNfQxSYrsyy5xDyh7HbusuVc+vx2ztGHsFLwnaJ95+rIjEx5oghwbbJfjG0qKT3XRS
         4yeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv8iVzg3bh5/wD4jJEVE4NHbDuGnLQ8wb9xgQLiMYi6J+jhdbmKUIf0mwgOsho84omfISKk0Nx@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yws/Sl3PtlGO24mLeV0ja2MRJn8atgSEg/5NcGu4ntOIvUBwT7m
	o7TLnq2GXvVDw9ew2zNQcW0v9F6M1sviCRDNUyHlKjrk8NuLt99vGBXKNYft8l37y8eTpKSN9sr
	709IKdVyZoaKrfFQcxi9HhdH21ExF5dUYti89XTW/gc+QFbH1C5iAOPPE9/01VfYNHSE7
X-Received: by 2002:a05:6214:4382:b0:6ce:233c:1d5d with SMTP id 6a1803df08f44-6d18583c420mr198567376d6.38.1730291531714;
        Wed, 30 Oct 2024 05:32:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxuxBl3tGf0/w3F/nOUT9vPjHBYBGJNU9DbH38gVcIJhcfNsrBdvc6u91zTW63nx/ajW4H0g==
X-Received: by 2002:a05:6214:4382:b0:6ce:233c:1d5d with SMTP id 6a1803df08f44-6d18583c420mr198566866d6.38.1730291530989;
        Wed, 30 Oct 2024 05:32:10 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d179a2c999sm50852556d6.106.2024.10.30.05.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 05:32:10 -0700 (PDT)
Message-ID: <3a2c2d35-3b86-4286-a393-5ec166659f92@redhat.com>
Date: Wed, 30 Oct 2024 08:32:09 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Core Toolchain Infrastructure - October 2024 update
To: Mark Wielaard <mark@klomp.org>
Cc: gcc developers <gcc@gcc.gnu.org>,
 glibc developers <libc-alpha@sourceware.org>,
 gdb developers <gdb@sourceware.org>,
 binutils developers <binutils@sourceware.org>,
 Overseers mailing list <overseers@sourceware.org>,
 cti-tac@lists.linuxfoundation.org, =?UTF-8?Q?Zo=C3=AB_Kooyman?=
 <zoe@fsf.org>, "Karen M. Sandler" <karen@sfconservancy.org>
References: <9ee5b9e1-3f84-4d9e-8249-7a4bf8080bb0@redhat.com>
 <20241030103912.GD28606@gnu.wildebeest.org>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
In-Reply-To: <20241030103912.GD28606@gnu.wildebeest.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/24 6:39 AM, Mark Wielaard wrote:
> Hi Carlos,
> 
> On Tue, Oct 29, 2024 at 06:02:03PM -0400, Carlos O'Donell via Gcc wrote:
>> Recent discussions on the glibc mailing list make it clear
>> that we need to expand and discuss more about our "why" along with
>> the "what" and "how" of these changes.
> 
> Zoe wrote a good summary of that discussion back in July:
> https://inbox.sourceware.org/f20ce996-e9c6-4b6c-856d-eec6e14af26e@fsf.org/
> Has anything changed since then to address the issues raised by her
> and others?

Yes, that the CTI TAC needs to expand the discussion of the "why" to the broader
list of the project, and that starts by writing up (something I'm in the progress
of doing) the detailed notes for glibc, particularly why we would want to meet
any of the requirements (and which specific ones) for a secure software development
framework. I'm writing these notes up for the community to continue our discussion.

Then once we have the full "why" written down, list the pros and the cons of an
LF IT-based solution and alternatives, including Sourceware, and again "why" the
TAC recommends one solution over the other.

I can get down to specific requirements and possible solutions for them, including
things like securing logins with 2FA etc. Which *could* be solved by Sourceware
today possibly using Nitrokeys (open hardware and FOSS), for example.

Having all the details spelled out would allow Sourceware to make progress on the
same issues raised, and I can even file infrastructure bugs if that helps.

> I don't believe the community is helped by trying to set up yet
> another, corporate controlled, organization or doing some highly
> disruptive move of some parts of the services our projects are using.

My position here is that the costs of running secure and robust infrastructure are
quite high, and engaging directly with corporate sponsors like we have done before
is the simplest way to pay for FOSS infrastructure. CTI is exactly the same model
we have today, but with broader corporate involvement, instead of just IBM paying
for the current services. This engagement happens in a place where the larger
contributors are already engaged at the Linux Foundation.

Have you discussed with IBM and other larger sponsors to pay Sourceware PLC to 
fund expanding the current services?

My deepest concerns here is that Sourceware PLC cannot convince larger sponsors
to provide the funding to do what needs to be done to scale out and improve our
services.
 
> I noticed you attended the Infrastructure BoF at the Cauldron and seem
> to be experimenting with the new Forge we setup. I hope you will be
> happy to work with the existing community and the existing
> organizations that support the GNU toolchain and the Sourceware
> infrastructure, instead of trying to setup yet another organization
> that would split our efforts.

I'm excited that the GNU Toolchain community is looking at different workflows and
solutions, but if I'm honest the same question of funding and service/workload
isolation applies.

I'm *more* excited to pay Codeberg directly to support the GNU Toolchain to support
the development of Forgejo, particularly given that larger groups like Fedora are
considering Forgejo.

Thanks for your feedback. We can continue the discussion once I post more to the
overseers list.

-- 
Cheers,
Carlos.

