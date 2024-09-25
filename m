Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F5A13C67C
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 18:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727289810; cv=none; b=ueDXyxvLtkA7cHdWzIMB88MfXLC2lpxpYnwvi8nTPcTJXCds8AlldE8W/0nSpeUA8E0PZHt0B++UxhMYevI/YTf8jhezevqu88w70dB3/W6jH9/yxREAvVX8CZSoCs9A5d9OiTy4T7tBVyRNYqpWK3n9/aMmQ6DxbdFjr0Hl7s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727289810; c=relaxed/simple;
	bh=CF8aQBnXbWFcOE9MtNYYHHY3fqBaudwjJ+hMCeYveTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQK92Z2jJSNCtyJ41CyIWrFpzwW/B7IWbxg+g38GXKU9FCGoTsCO37TNchwhJ2G5DUHPXobFwMmAsqZZUnOT8l2jImHWn3sC0eDVfbgkJCWJEk52wfysZFJj9N6AeTeEki1Dh4Hli1mLt/ssOHYQ6J1tMWKsPVnfEgChzCGzG4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RCpnWG0w; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RCpnWG0w"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E953560796
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 18:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gI5K2dzXZhJ for <cti-tac@lists.linuxfoundation.org>;
 Wed, 25 Sep 2024 18:43:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D5D160760
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D5D160760
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RCpnWG0w
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0D5D160760
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 18:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727289806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z7D3QjssGntQEfhX0OXzKmMAdg3mTwqd5afvmzATmJM=;
	b=RCpnWG0wzatFhYRNfCMcTQm//jMvearOgVzFqrY2YD26W0YE9yl3giwK/NTHF2wXjCru4M
	1OrJjqEoVX21TaAGyPpRGmFXSyLCad3nj62XUT6FdZMnoqcvuaJOuxF/hycv7D1rfmgnfd
	Gy12aOj0alCQxd0yCw/1kQPs9YO0MFc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-FuUCTefIP4KGv4tR-IAvNw-1; Wed, 25 Sep 2024 14:43:24 -0400
X-MC-Unique: FuUCTefIP4KGv4tR-IAvNw-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2e06c9217bcso237131a91.3
        for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 11:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727289804; x=1727894604;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7D3QjssGntQEfhX0OXzKmMAdg3mTwqd5afvmzATmJM=;
        b=vu3f4AvKxYFQlaZbqGDKWdPCJy6oRoAu+hN6xZIaYlenOnYHeArobpKqTnYw3hQKL9
         6u45XS42PNFVNbQrQt1XqliCHlbOqH61I7kLb5Pf66yNgk/BoJ1n1XwIwy/i6kwB0KHj
         k0a+Lt37LhL8/VXV/stumRCLDezrNWmp4aEi3cqeEgDQz430zM8ZuYz9ly19aBn7Jstq
         DBTi+3D3eoxbDM376p7YqrSxTiHgPNMfhl5Ci/Wt9LiMUvlxQhjGbyouwQylPs15xvEy
         Ss+6pM3A0G97uPqkzmsXftr2/B+7tQxFAVU7leY+JgpndcIekfDsM6WoikH9K4jriBZ4
         5n2Q==
X-Gm-Message-State: AOJu0Yz1yyT376HaLRdC1Lsm7CmYTpyc7pIYusokKlFQ2Q3kDQrZsV2W
	H9RiYMGr1XuKUF+C6qLMmJdwtBymiAGGsHbtS02Me6w/fKGuayndX4GpTkkzB89mOcgiYRnIyJq
	dpeoJawulDkxyljcRm9TIiWzfjiXgpLp13mEJgcEmUEM14gepn6l06O46vK1Mmmz/126n
X-Received: by 2002:a17:90b:1bcd:b0:2d8:f3e7:a177 with SMTP id 98e67ed59e1d1-2e06ae2caf3mr3947391a91.6.1727289803874;
        Wed, 25 Sep 2024 11:43:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDEOCoZN5pQMmF4F5c/HppHOsGEVYLD9tmucAi8SdvkawBbQ/EXyApb5VuEKTJMXB13oBseA==
X-Received: by 2002:a17:90b:1bcd:b0:2d8:f3e7:a177 with SMTP id 98e67ed59e1d1-2e06ae2caf3mr3947374a91.6.1727289803499;
        Wed, 25 Sep 2024 11:43:23 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e31bbc2sm1828152a91.56.2024.09.25.11.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 11:43:22 -0700 (PDT)
Message-ID: <caa77e84-b4a5-457f-bdc0-b03fd09c0214@redhat.com>
Date: Wed, 25 Sep 2024 14:43:20 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CTI TAC Meeting Notes 2024-09-25
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org
References: <e3551841-0427-49da-8cb0-833a335daeca@redhat.com>
 <20240925-monumental-steadfast-urchin-8b1ae1@lemur>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
In-Reply-To: <20240925-monumental-steadfast-urchin-8b1ae1@lemur>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/25/24 12:10 PM, Konstantin Ryabitsev wrote:
> On Wed, Sep 25, 2024 at 12:04:17PM GMT, Carlos O'Donell wrote:
>>   * David: Have we heard back from LF IT?
> 
> Hi, all:
> 
> Apologies for not attending -- I've not seen any invites, so assumed our
> presence is not required.

No need to apolgize, we discussed with Adrianne Marcum (OpenSSF) :-)

You're not on the CTI TAC meeting invite because we don't normally need LF IT
to attend each meeting.

The only outstanding question I have is around the OpenShift and RHEL costs
in the SOW and if we can negotiate with IBM and Red Hat about those costs.

I've sent you distinct emails about that, but haven't heard back from you on
that. I think this is something we should pursue?

> To my knowledge, there are no outstanding items for LF IT. We have done some
> initial cost analysis for openshift and cloud deployments for the SOW, but no
> further work has been done since then, since my understanding is that there
> isn't sufficient "buy-in" from the glibc community to proceed with any service
> deployments at this time. Please feel free to correct me if that understanding
> is incorrect.

Correct, I'm going to proceed on getting the additional "buy-in" from the parties.

I think that to get that "buy-in" we might have to add some text to the SOW and
sponsorship agreements, but I'm going to collect all of the possible niggles and
hand them to the TAC to review in one block. They include things like making sure
that LF IT has time each year to review software usage against requirements, which
includes a FOSS review. I don't want the SOW to change right now, but I'll collect
any amendments and review with the TAC before they go to you.

-- 
Cheers,
Carlos.

