Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F17017623D
	for <cti-tac@lists.linuxfoundation.org>; Tue, 11 Jun 2024 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718108333; cv=none; b=CqGAH4GanW0epeEBdoJRf3mJMDI8s9P9RIc3z4iV2v0s/DtLZSWLzIAyWaceSbWgGol/FbbLS74VjeV3wcb6ztRPTOP+DS1ctUoiMBEpIA2zW4HIp9pxR5ogSZ6YpXDo2N1IZLpSwNtzJBo9h3hrcSS2quFcDqep3hWkFAKShzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718108333; c=relaxed/simple;
	bh=S0WtSV1MhI+teR51TQj9ywfGLMmqYxWs4Uj6YrM937Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhA4z1zDLKNFTKirkF2pHNkBTTTTaons6uWvbTaKEv9i7xWkdkYRTq00HfnAShIlhTklCkqDxCEjdQPzlSeQKlxXGQN8Mvkw+joVUBcCF/BY6MysvKn7LgiUwLgJafsjln4AJL/e+osSOvASZlL7rEPW+zGlFDUVYlfPv4SnjUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TxQKp/rv; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TxQKp/rv"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 520074023F
	for <cti-tac@lists.linuxfoundation.org>; Tue, 11 Jun 2024 12:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzZn6pj6twzH for <cti-tac@lists.linuxfoundation.org>;
 Tue, 11 Jun 2024 12:18:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 537204022F
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 537204022F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TxQKp/rv
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 537204022F
	for <cti-tac@lists.linuxfoundation.org>; Tue, 11 Jun 2024 12:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718108329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QKxFH9vj+d9mPCUcBMD8ipekCA6So+FjrxBuaY6Q3+k=;
	b=TxQKp/rv/E/DU4s7iXTGSI74EcmtWcqUdTdnJOA100mF5X/+nnt7yE2IqeCQkHj94xBoSb
	bqqES1khuBaioLJZX2l9v8B36svJSL/Z9KcP5H3bHr0x4VeU7fdZbGD+cmJJkJtpsmGUEr
	A1O8S4ofkboGNSHL05FoDpTUlGRlPhc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-6SeklDbXN1q8n0PztV4_4g-1; Tue, 11 Jun 2024 08:18:48 -0400
X-MC-Unique: 6SeklDbXN1q8n0PztV4_4g-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-795cce8b773so116776385a.3
        for <cti-tac@lists.linuxfoundation.org>; Tue, 11 Jun 2024 05:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718108328; x=1718713128;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKxFH9vj+d9mPCUcBMD8ipekCA6So+FjrxBuaY6Q3+k=;
        b=lFsdBSh/cYC0rNLV40yGNBPEbwy0f4uhwpzcax3YUOhKbZzRTnfT6peaSXD7yOCeBc
         h2AopAeIZX91CJl3ZTSN4DHUP3tUozxo9laGO70pzi9PMR/LdJ0/my3veqFCc2YEHrl1
         fy3Gmjr63d93TUaDawXPAWIGkovC1qFxOea0IfELGFzbhmjs6CuseewQZiZI9fvyP7bE
         9yIJBsVTSls0TiPh5ooUbmt0XaHTtz56I1dZGSGTirn/iHEHLwDvMbRI3zjbPAtckSJI
         GqDvSQe7nC3ORLhjT+t3gm5kerXgI7G1ZoD8PD30hu95qJyWMYs3PZ2Yn3HrU4KtoeSl
         45fA==
X-Gm-Message-State: AOJu0YyJeie6L1+Bd0lBpQZ4EJ3KW5xmhQS3B0UvL152lbznXt3SbQb3
	pfMGitTYnriaeUKMuzM/wWCrRrOmQLvajOD+OQMgQbonOjylnnliA6vYJ1gUVJHOuS6tMSCbg6G
	olh407SaMeIbF1RnwMp4F++7MudZkh9qFSqR3k3pioTvleDxFhtzXK5IuoT7wJ0oO456d
X-Received: by 2002:a05:620a:4688:b0:795:478e:a1ed with SMTP id af79cd13be357-795478ea2dcmr1478359285a.77.1718108327767;
        Tue, 11 Jun 2024 05:18:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELNs329cVWXD9uFMumK7IgQZsgy8v/fVMASn8iKSmJqXyrtXlVN23THucJPBuHU5IAVlrwZA==
X-Received: by 2002:a05:620a:4688:b0:795:478e:a1ed with SMTP id af79cd13be357-795478ea2dcmr1478357985a.77.1718108327413;
        Tue, 11 Jun 2024 05:18:47 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79532813a4fsm509450885a.13.2024.06.11.05.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 05:18:47 -0700 (PDT)
Message-ID: <73f1388d-3285-4b9a-b7b0-67d78f906a2d@redhat.com>
Date: Tue, 11 Jun 2024 08:18:46 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] source/faq/index: Update FAQ.
To: "Frank Ch. Eigler" <fche@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org,
 Siddhesh Poyarekar <siddhesh@redhat.com>
References: <20240529135110.3917584-1-carlos@redhat.com>
 <c8da333c-1734-423a-976f-d2114ce597c0@redhat.com>
 <20240605183306.GC6896@redhat.com>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
In-Reply-To: <20240605183306.GC6896@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/5/24 2:33 PM, Frank Ch. Eigler wrote:
> Hi, Carlos -
> 
>> [...]
>>> +In order to continue to support these communities we must start to adhere to
>>> +the modern cybersecurity principles including moving towards zero-trust
>>> +architectures with strong application sandboxing for all provided services
>>> +e.g. NIST SP.800-207, separate and protect each environment involved
>>> +in software development e.g. NIST SP.800-218A PO.5.1, and use multi-factor,
>>> +risk-based authentication and conditional access for each environment.
>> [...]
> 
> Thank you for offering those extra book references.  It would help
> even more if there were an itemized list of those particular
> suggestions or mandates from those books are of your interest, and how
> each is absent on sourceware vs. to be satisfied at lf.  In other
> words, offer a way for someone to verify problem, incompliance and
> compliance.

Such an answer goes beyond what I would normally put into an FAQ. The 
intent of the FAQ is to be smaller quick to read answers to specific
questions.

Such an answer could also be viewed as antagonistic towards Sourceware and
I don't want it to be seen that way. I would like to continue collaborating
now and into the future with you and the other overseers.

-- 
Cheers,
Carlos.

