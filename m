Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BC224B33
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 21:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709845628; cv=none; b=qCDxEggR6Tq0GyP2udBOF856ICDqiEixAMvrgpzvQqnmr7BUmkmbRZdeI99rEel78xawID2v92p8i8WDhThlXYWTlwpLC3bIowpIrCIddAgwU0L3HoRHfIYkcYEgpPOnVf0hQOMOScw0/YGQygsVQOwYCsR3aBs0dcdq6hYwfzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709845628; c=relaxed/simple;
	bh=+iZI9GeVqWzUyvhHHkICM0EleEh4e3IohPdvutAsC64=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hsmTBx9Dgqx6btNLzMd8iRv765AEeyg5ZROmnNvb7bemECVAcZkGXZ78l42joN8mJltJgHb9Up0EOs+3WxQch/OU/rF4ZBVdWuBgAZgpTwgjPJcRZCW8jrdPSMpEERMStXBEDLBPIGNB2d9tqZWWpjtspbRocafbC4QmwfpjjGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qe82psUL; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qe82psUL"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26C42610C1
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 21:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hh0fBVGgCBFA for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 21:07:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 801DC608DE
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 801DC608DE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qe82psUL
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 801DC608DE
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 21:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709845623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2p8gZx2ljUwGoM9VWRtz1t9O/thn9OepQlVyoVLFbQw=;
	b=Qe82psUL56DRup4u3EvCOp+riYdiErM1m1Lpd/3JuSqx/9ZIgxAlmy/SzyKkmM14WLYbNq
	6GAeXYzNAdwRitMkwAvudalo4uXENrR/neJ+k5va5yOwAgj9Ss5/Zr3ulO2vdeLl/zlOCS
	R3kblqedJKgfCCJ8i2CCoFzt+BtHDQ8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-1kuS_pz6MaSoV3qyPR28sw-1; Thu, 07 Mar 2024 16:07:01 -0500
X-MC-Unique: 1kuS_pz6MaSoV3qyPR28sw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-69046d68828so1520716d6.2
        for <cti-tac@lists.linuxfoundation.org>; Thu, 07 Mar 2024 13:07:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709845621; x=1710450421;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2p8gZx2ljUwGoM9VWRtz1t9O/thn9OepQlVyoVLFbQw=;
        b=Y617tuXDMRIly6oiLCBZChzIfztIz6j89aVXIKn9iv6h+jPYQ3EDInJkT7RV7Bwygt
         wEN1OAgGU8ue9Hgg1Ab5SA2cSlJX1x+ninqcyhrU7m517KcRpHmCT93Bkgfsm50XjTmb
         OfKyvwEjDE9A52jgyDbx+oqB7mY0CklB7g06nyUp7TqNVtyEmu1/ukqNFIhD7/b3PMiq
         UHfCONA0lQimYfVmXpIpYGAGNxZo4vTE9tXvDVSJgL1Qv8qhUld2v+d89b/KvqXPX/Ia
         B3Tw5YDXiuzGgpyhZnTJBf954JzLDFN2QBkXPGIu7EF46ZgvfarA5APisFS+PC6lct48
         GF2w==
X-Forwarded-Encrypted: i=1; AJvYcCUaCGx58NrZI8FvxSUDCp2zdCRL9cFjgfTN2H6c7+wbweVtsHSpx1WbQiYzZV4HVj16+fm34ZMZnPioAVI5mmSX0+0lIW37LrYw7Y4CBNOByhk=
X-Gm-Message-State: AOJu0YzdEAB85bL0Jj6/mLw2d78bAxV5ZuDHJ0zyeXhUXN/JuFD4fQ/z
	rGFmXfsBB/BeZWRHm3ezzmF6Ci52RDgAduFRLrQcuILGDighoo4Pb2PG4e/J0Zs/mN8VI6YjGVT
	vx9spbZaU/QK6dcyRStUKm0ijuE3hB7yI8o+NCkD5e4y8u0WcHAMP4bQEnGB9YfL5fsSw
X-Received: by 2002:a05:6214:168:b0:690:7928:87bf with SMTP id y8-20020a056214016800b00690792887bfmr9956871qvs.22.1709845621332;
        Thu, 07 Mar 2024 13:07:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTsTh2SO16VryImp/Daxgbw1G3GXT6dfjG1wUGZM+nmWe5Tm+OyR9FyhiMm1OLV+EIddvbmw==
X-Received: by 2002:a05:6214:168:b0:690:7928:87bf with SMTP id y8-20020a056214016800b00690792887bfmr9956859qvs.22.1709845621069;
        Thu, 07 Mar 2024 13:07:01 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id nw5-20020a0562143a0500b0068f2d2f64d1sm9055360qvb.32.2024.03.07.13.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 13:07:00 -0800 (PST)
Message-ID: <e019481d-4977-475e-b575-2aa2f04bb483@redhat.com>
Date: Thu, 7 Mar 2024 16:06:59 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] Add a toplevel README
To: Siddhesh Poyarekar <siddhesh@gotplt.org>,
 cti-tac@lists.linuxfoundation.org
References: <20240307193019.4028812-1-siddhesh@gotplt.org>
 <20240307193019.4028812-3-siddhesh@gotplt.org>
 <ac03517b-3ccc-4117-9a5d-edb2893a8220@redhat.com>
 <44b3846a-d1bd-46fa-bac2-3fc59832ca3e@gotplt.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <44b3846a-d1bd-46fa-bac2-3fc59832ca3e@gotplt.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/7/24 16:00, Siddhesh Poyarekar wrote:
> On 2024-03-07 15:25, Carlos O'Donell wrote:
>> On 3/7/24 14:30, Siddhesh Poyarekar wrote:
>>> Add basic instructions to allow one to test and later submit changes for
>>> review and inclusion.
>>>
>>> Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
>>
>> Content looks good though, you can keep my RB and push so long as you call it README.md.
>>
>> Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> 
> I'm calling it README.rst instead, since it's more rst than md.  Is that fine?

No. The README.md is intended to be rendered by forges that mirror the repo
and should be in markdown regardless of what we use for the project itself
(rST). For example Github only renders markdown and a README.rst would not
be rendered there, we'd need to use pandoc to sync an update of the same
file but converted.

Suggestion: Call it README.md; and keep it in markdown.

-- 
Cheers,
Carlos.

