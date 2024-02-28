Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAF713D2F2
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 23:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709162390; cv=none; b=i59r2jkGM6fwxv3m9tbbT0DrIyjtJS/rnNtXOeTu9rPU8vniopZyawXUv5ilGfdhdu9iF2w42NCuaBN7VLucjX9Rfclti6z1zS/EOJuQv/4Bf1d1EMf04Fnk2DDrKYT9ZGcDrKLTowp9Hixp6QdKC20/ECOCF8KKHJ8GQYPJskw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709162390; c=relaxed/simple;
	bh=CPDn5I/kApIy9hE0k/wJZK8NmJQg0ycEEignySzMdxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8Rjys1HwXgTwmRTMt24LnCcCPtjK3pTFu6TEXRAHw83z1/MgcXBRkTremljbaZL1uW72Y4yLDvWi/Vk+qjy+NXik0D4NfZL12+xp2lwrTNO7HK9OgKGDXvoB56NOr+hcSO+LjmSJY6MORIgXy8rmDVOTOEFvh1Og/Gxfeg94JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gTohbYfe; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gTohbYfe"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0E2B60BB2
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 23:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQkLW-VYt8IK for <cti-tac@lists.linuxfoundation.org>;
	Wed, 28 Feb 2024 23:19:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC21760A52
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC21760A52
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gTohbYfe
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AC21760A52
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 23:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709162386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jtopo3XylooHZPNtqBnmPh8cV+a8WzXpq2Bu+jghIB8=;
	b=gTohbYfeyLaNan75jqs+POP1dbFdJMvIG+qLstZA6dPm91ELcptFh4nngmofpOBdbIwc4w
	zYnnY89az1tsjctFfy4KE6Em985uGz12XeAGg8MihuT1QfzGpRv/WaTt1wtAqixacsFPD0
	NFiuTN3EYhFBo+cqH2yCYD+DUh+VcP8=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-XCe2fB2bM2qo172Edzpv3A-1; Wed, 28 Feb 2024 18:19:44 -0500
X-MC-Unique: XCe2fB2bM2qo172Edzpv3A-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-6096c745c33so753217b3.3
        for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 15:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709162384; x=1709767184;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtopo3XylooHZPNtqBnmPh8cV+a8WzXpq2Bu+jghIB8=;
        b=c4wTh4Z6HptxpOD8T77g/WzAjIybGHaAr61aZCo1OamlQ2krvOExKgBFoygbaz7/iX
         qrmULg1H0rEKh8uknj57cry14PUNq40NBsR7qR/EAxX+dnjh7xPW3J6gFTNcWILLUcmD
         FVevyUKOj6A+wvzwlYdrGFLL24MiHh8IKDnvr7TbYfQYCbf5KmqfvU6KYM/0ZI/MfjL2
         MFnjSYyt6NpHQHlyKUtu/B+6iNErhWNzUTon2VPwN5kdhBN0sx/CjAfmrSwnlwkEeW6D
         qASbLvMYMCYHgMv6a0NauY+COmRcPj/k0EPW/5YWmoG9NjnUwwcvNDyPVEaND4G1dUvG
         yL2Q==
X-Gm-Message-State: AOJu0YzLngOmQ7DTyal6MQHzCoY8epMNM4fF7igAWafk9tHrETz841jO
	coiHSc+qCGh1hG4MlKW6iOIFUSmUgG7mlqlRMf+lEoGSGdTTlRCPNnPpAnZNRIIM6kz3X5Ne0Ty
	R1NCrlH5yYqXDj6doX/tD8FT67LaKuM6giAiZqkoaWvQr4C46WdOsx2Z03NwhkkIPGEf+
X-Received: by 2002:a25:dc41:0:b0:dcc:6d85:586a with SMTP id y62-20020a25dc41000000b00dcc6d85586amr714019ybe.49.1709162384385;
        Wed, 28 Feb 2024 15:19:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5W4bqKTpE0pPoPO+411trFb4ph4jxTWD9LIO8rXQIlqRxApNs5P/8gIbynTOyatjb9iVfhA==
X-Received: by 2002:a25:dc41:0:b0:dcc:6d85:586a with SMTP id y62-20020a25dc41000000b00dcc6d85586amr714010ybe.49.1709162384105;
        Wed, 28 Feb 2024 15:19:44 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id v3-20020ac85783000000b0042e5da69d93sm113405qta.1.2024.02.28.15.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 15:19:43 -0800 (PST)
Message-ID: <6f509356-b893-40da-971f-bb0fde4484b9@redhat.com>
Date: Wed, 28 Feb 2024 18:19:42 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Next steps to turn on https://coretoolchain.dev?
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org
References: <26fa2971-f3c4-4b92-b89d-9157e21f59b7@redhat.com>
 <20240228-functional-impressive-pegasus-ee839b@meerkat>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20240228-functional-impressive-pegasus-ee839b@meerkat>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/28/24 10:23, Konstantin Ryabitsev wrote:
> On Wed, Feb 28, 2024 at 08:26:42AM -0500, Carlos O'Donell wrote:
>> Konstantin,
>>
>> I pushed an early sphinx-quickstart to gitolite.coretoolchain.dev.
>>
>> I've got a lot of the next pass of content ready.
>>
>> How do we turn on https://coretoolchain.dev?
> 
> I will enable that in the next few days. However, I thought the site was
> cti.coretoolchain.dev, not toplevel?

Let me check the CTI TAC notes...
~~~
 * Consensus is around "coretoolchain.dev" for "cti.coretoolchain.dev" documentation.
~~~
You are correct, "cti.coretoolchain.dev" was the final decision.

Thank you!

-- 
Cheers,
Carlos.

