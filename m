Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6A447A884
	for <cti-tac@lists.linuxfoundation.org>; Mon, 28 Sep 2026 22:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=140.211.166.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633908; cv=fail; b=PEP7MzkIv7bYpM5aWkoN1lIsuAkLjeyPIrzVKYzMR3xcpJ5zuMQMaDgvUJC9M2xiaHGLATtIkwTr75VDyJ8eHrv10f0QfbJVb3ZhCELYsEzYBnHf1HzuupSSp3CO5BFBJhYs9hdlvaM+HdMVcL18Hh9POdbz/fZ/cB85V/kb9b8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633908; c=relaxed/simple;
	bh=cVtv6dLXEIXxCX3KEOwZuruRHgUkIRw6nVunZwfdHDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aI2Y/WIh9+BdK9bs+He+0cogQBVV7NDEEi+OWrpI4uMWFoicMqL2cehnaoEbhnzk2bIG0sYOA2uaiOCA2Ij7fHd9EQCLRI3+4wL9NFepKej0EIjbQwzImWAHUa0K7qS+8tY8jmbIHaAApOJ4IElfN7ItiAg8dbQrGXuOBbTYk/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X1uEew/U; arc=fail smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X1uEew/U"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1019340090
	for <cti-tac@lists.linuxfoundation.org>; Mon, 28 Sep 2026 22:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.702
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJ8TkZ1617CN for <cti-tac@lists.linuxfoundation.org>;
 Mon, 28 Sep 2026 22:18:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org AE0CD4008A
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790633906;
	b=IgPVra1cK2m+QdD/+1QOrl31rHmeyrfEF4pIiczkjyMHHl5o9ABQasjZ6/fUup1buulp
	 1n2q08QFyn5HObImqEhUFb9m5YD5zHbAJqWO6LDyqk/H0PTJoRKrWE/Cs9u0abWDwM4fi
	 R7KAukqX141a0bSi5a9qf8Y2dbqT6c/jsNNInn7+TeHi+ANI2ceIRa/4fODWN71MxALR1
	 KsW+e1m0DuXhAxtRHGw5rwOWgUJFghorcPKvY4cKV5u6iW8k/eFcw4Oocf6TlkX3OYYR6
	 KtmBgq/YG0PfPxuqOFdobPUZUbyH1nsAqdrZSZWomh3E/0uO6wI8hv5ygVk9FvainJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790633906;
	h=Received-SPF:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:From:Autocrypt:Organization:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Language:Content-Type:Content-Transfer-Encoding;
	bh=1Gduy0RXpvxWvF3GZzaEagUWtJgiZR8DQcDAJWrEYU8=;
	b=FC8fK/LeRZGPcxESXB8fIRmb6fwjnWmE0ruAnVU7NL5ioE9qLi/vTJkm5D7mStUNUgHD
	 2itHPcNEU92hVL8MW874QKKbGNpegLpzK0oBYafwKhqkyCuiEnoEhmLx/pGzDbC76Nn0e
	 GjaUolDAzVy2Cq+wsmLpuMup5y7WuifGVCiQvwbxNIMwH/C3yCBq14xGYHOCEe9R3e1pn
	 Kl0EHj6F/ZK66fDOd3KOMhAGDRsKHkdhX7uvADEpHWxA6Ral6Kt4WxCg21VJYuuDwHfQc
	 vrV20FznzXMeFgv2S/VibkGKprB7gtWVpWc5RkPxVaoeTyDKnYWcYwi2ssXFfk3R1ow==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; dmarc=pass header.from=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="X1uEew/U";
	arc=none smtp.remote-ip=170.10.129.124
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X1uEew/U
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE0CD4008A
	for <cti-tac@lists.linuxfoundation.org>; Mon, 28 Sep 2026 22:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790633902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1Gduy0RXpvxWvF3GZzaEagUWtJgiZR8DQcDAJWrEYU8=;
	b=X1uEew/UsYB9ihYAx/anbYvC/wQz5DvX8y8c+97r6D8M/Ko+S13uUJ/rJ7OihcEfiMuY08
	iuD0jAa68rGpcwgkAwAY4FFx3n98Z2C+OtSrFTcL+OgGx5JJ+tzzVpFPIDc1o8vsbZ33Ry
	4pOhnJW6e2VHqBBeeRv02xwimLrIRV0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-bKpHnmK4OgabRUqCYOjRpQ-1; Mon, 28 Sep 2026 18:18:20 -0400
X-MC-Unique: bKpHnmK4OgabRUqCYOjRpQ-1
X-Mimecast-MFC-AGG-ID: bKpHnmK4OgabRUqCYOjRpQ_1790633900
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530e12b296bso80429891cf.3
        for <cti-tac@lists.linuxfoundation.org>; Mon, 28 Sep 2026 15:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790633900; x=1791238700;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1Gduy0RXpvxWvF3GZzaEagUWtJgiZR8DQcDAJWrEYU8=;
        b=0NwHRUl7GydfuLWFSvR1M65yqz67+VucKxgTIdrW4g62IkZ+QkL/iZBD48jbp9NvxW
         y3u77qjvCNHMF+fNV6UxFJGW8v4EGQFRb8D0atfHmc0YHsE+kf41I+oQz4dFXxgYBX4e
         M5cD9azxF4Ipa7jl/as24aDn2X/pKz9F/VCHyXSWvUmr9hFDg/CCHGokJbMxOEuQYpdZ
         hyvHssZ754NsPbCV+iyUpBUrDt3WZobj2x4oMW1qdwhtYcil5yi5TInY+dp1lDJZ74RR
         TEIZ1RW4QtjD0Xb/ArgxQY/aBp0UpG4UCa/H93Dog6oWPOqJHIGOur6lJ8iRy6gjq3/f
         q1Uw==
X-Forwarded-Encrypted: i=1; AKwUvBwW6dRP8V8AUHD3VbIN8+RX54T2ES1p7owzyiyxZyerAuf98VhdvCLleLoou6rIC3f3eUJdZs/s@lists.linuxfoundation.org
X-Gm-Message-State: AFuF++mKn97N8dzAPaxkv8+iq/kKWp7c/FYRAYVZLSGc1dhFaDNxAf+1
	EcRZy+CVVGUkL1dptw1f4wWm7jRszSOvSeDRZL2lpVivF2QZw/8Z+EOiCEgOSjB5xA4Bb5MLhCU
	sKGGCAvq2kX8qlAsd+HBbPP32QWsN82kYxkanYE+4rt2d1DewMeO8HNj2x1dIkVPvM66vPHZRok
	/tuerJ
X-Gm-Gg: AYBFou02oNbplDR6atbK9/DAWZGX4gxVcAP0IQ40JpA0JWqcSXmRpIFfwpRXk2MZOiG
	Wb+8wNgCC/ppqdHzvCD+gkCeM9iCS76n8zDBbUTECsyTdmNQvSvr4hNBwZfXKG/zfiDRFIZ0JV8
	ZdHjusrVKsDFWOeOIBEieq97qhGUqvO1JnsZ6uT4W2ZPPdZBsaA9cklov7EVL4vrIechioQC42/
	2RUZ/+bGIQNjmlYGliRVoDXl+4gZ57/XQJ0en/ltHzamfXi85Go3QDsWiMMzEG2jkJQYnL/OrPh
	klZUmC2MHGVGELmv7VJfUExNINcHI2JB7NVjs0VufaSHUyno3FFsZGae7dnv5+3QFRvhDXae+XQ
	r3kfGMcaT2jIUwwUIF6NV2o1sqDB+aMdO1zh2gfdLkmoSruk15wr9TCcKtEwg0I9ATSWsjIElLr
	8=
X-Received: by 2002:a05:622a:1b9f:b0:530:f214:6240 with SMTP id d75a77b69052e-5330b6d434bmr235176651cf.60.1790633899887;
        Mon, 28 Sep 2026 15:18:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1b9f:b0:530:f214:6240 with SMTP id d75a77b69052e-5330b6d434bmr235176221cf.60.1790633899375;
        Mon, 28 Sep 2026 15:18:19 -0700 (PDT)
Received: from [192.168.0.116] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533223d1ad0sm73924511cf.23.2026.09.28.15.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 15:18:18 -0700 (PDT)
Message-ID: <622d1863-6f54-4cce-82d2-4c6bf1fd1b34@redhat.com>
Date: Mon, 28 Sep 2026 18:18:17 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: cti.coretoolchain.dev misconfiguration?
To: Siddhesh Poyarekar <siddhesh@gotplt.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 cti-tac@lists.linuxfoundation.org
References: <1e40ef07-8a23-4c86-a7a2-8cfb58fef525@gotplt.org>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 hsfHTTi7JQ==
Organization: Red Hat, LLC.
In-Reply-To: <1e40ef07-8a23-4c86-a7a2-8cfb58fef525@gotplt.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FBhKYU7XwMK04_qirAUQeesGkTTChowGN1Ey7Q8-Ptk_1790633900
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/26 6:04 PM, Siddhesh Poyarekar wrote:
> Konstantin,
> 
> Looks like a couple of folks in the glibc community ran into a
> certificate configuration issue with cti.coretoolchain.dev.  Could
> someone from your team look into this?

I submitted a help desk ticket to get it into the queue.

-- 
Cheers,
Carlos.

