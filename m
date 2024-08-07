Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068E21E2104
	for <cti-tac@lists.linuxfoundation.org>; Wed,  7 Aug 2024 11:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723028868; cv=none; b=bXF6pcWjqcW4kBA7uf+UnlDH+P4Qu/Vysfx9XB6HAyCdRVWkCn4LfNoN04X+KeJMWR28Xd9AQ13c6E3bd2gUzLK+MvIOlH1j6/nPZ2+AbMYLRkVm3KrrGchXl3Mq+rXjZ+/ENcMLTCBOAfxfNrm7eGE2BdhzUlnPVhS8vU0SGNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723028868; c=relaxed/simple;
	bh=7Mlud2tsPTrH7jrcnJjetP/ve0lU1ElKhXp4gyhzNTU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=PjdL6jtU8hI5zWGoaSccDKED0Ijq9mWbjdm7sPJGUVbegG4ZHtVlNEcT6h0eeCLefFq+7k3JWSmRZkYnf7YNp6mXw1Uljdf7wYY3cwG0PolIjqVcJwoI1YXkmJvzYiavL9K9NSnTIINk1f74ZScr4/XxveD1mMGSEZW2+Z9FSzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YwQmU48A; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YwQmU48A"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D6D840229
	for <cti-tac@lists.linuxfoundation.org>; Wed,  7 Aug 2024 11:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADA5CLThSmyO for <cti-tac@lists.linuxfoundation.org>;
 Wed,  7 Aug 2024 11:07:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=nickc@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81D4D4019A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81D4D4019A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YwQmU48A
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 81D4D4019A
	for <cti-tac@lists.linuxfoundation.org>; Wed,  7 Aug 2024 11:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723028863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=lHBvlFWRitBiIgP106bUA+d9KFkShusCqjSyEWOY0yM=;
	b=YwQmU48AK5WJE+30qTwDbVSCEII0g5IkWOTOO4Qnxvu8wVfJIZEy/ohWMvyMmW2jdDZ7FC
	JXeCkueFoqC2y5wwKKwvMq0IDP96YPGrYN7uwki1Jd2dbOveskL3nXxOqQbSuZEmKCYsjV
	3jDeV8AdzosBNd0YVSGoqldpArctpYA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-8na-veAkPECAgIEO489vqA-1; Wed, 07 Aug 2024 07:07:42 -0400
X-MC-Unique: 8na-veAkPECAgIEO489vqA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42816096cb8so18475515e9.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 07 Aug 2024 04:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723028861; x=1723633661;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lHBvlFWRitBiIgP106bUA+d9KFkShusCqjSyEWOY0yM=;
        b=Xi99RxawirJ85vgKbf6h+pnnJhxzFT4ZcVGD7AhXEl2gsCkBs/aBDx0pRbmP4XQNoy
         +lgtAdT2UMmYY9VsqprcA19V+voBBkDnEsmt2fLWWxSotKLwhitDh/XEdhxirLVDjyvy
         dnTaL1gKgsdnw42CLD2M5OrFTTr3/OId4tdtT+Sx1R8fOa/PG7quXWJiXAXSu9+hJQoF
         QfrRJ1DLs4SIzTP8MaFdhZICHsLodx36jfKk42OiE7eatTMS5a5WDKI712i9Wm2j7BUB
         oxfKmzZ5lFg8BJsd2PM0AcGhm9mlp88cqPTADgIiYKYDE2FQ5xux++2MFcagMutDZpbK
         b49g==
X-Gm-Message-State: AOJu0YxQAwLLwjzuIkQa9AIc2oGP6ljeaZO42K3uJKsoreO45Jh8hNAL
	IINMR5+B4NTPuSRVmjHJbl9jFFPaJi7AWy2O1zPncbPYvngUSNw4orXepS0OrYvjDc1I0lfl0al
	0vvrMSQCsZ9AmamCNUSp7jvI+gBbZuMlqstVEPOw5zqeodAQh601QKKR17+u44/R0Er73F64tju
	8Tuxlshh8ZxTAj22IcWk/1ODHlJV54aynb9O/lD/hc9QapHmLw
X-Received: by 2002:a05:600c:4689:b0:426:5f09:cf53 with SMTP id 5b1f17b1804b1-428e6b04507mr160538635e9.15.1723028860902;
        Wed, 07 Aug 2024 04:07:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9vI6cFa/Y+BfdlqRvkxCY4hcRTOLdw4OOwx2GHpDUN1FguEdHSs8Aqr243mZt22sSP8VPyw==
X-Received: by 2002:a05:600c:4689:b0:426:5f09:cf53 with SMTP id 5b1f17b1804b1-428e6b04507mr160538405e9.15.1723028860380;
        Wed, 07 Aug 2024 04:07:40 -0700 (PDT)
Received: from [192.168.1.18] ([79.123.80.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf0c2f3sm15513822f8f.10.2024.08.07.04.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 04:07:40 -0700 (PDT)
Message-ID: <67c7b140-f1fa-4598-9390-9628b3a64517@redhat.com>
Date: Wed, 7 Aug 2024 12:07:39 +0100
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Nick Clifton <nickc@redhat.com>
Subject: Also stepping down
Autocrypt: addr=nickc@redhat.com; keydata=
 xsFNBFm/2cUBEADkvRqMWfAryJ52T4J/640Av5cam9ojdFih9MjcX7QWFxIzJfTFYq2z+nb4
 omdfZosdCJL2zGcn6C0AxpHNvxR9HMDkEyFHKrjDh4xWU+pH4z9azQEqJh331X7UzbZldqQo
 16VkuVavgsTJaHcXm+nGIBTcUbl2oiTtHhmuaYxx6JTMcFjC7vyO5mLBw78wt52HBYweJ0Nj
 HBvvH/JxbAAULSPRUC61K0exlO49VFbFETQNG1hZTKEji95fPbre7PpXQ0ewQShUgttEE/J3
 UA4jYaF9lOcZgUzbA27xTV//KomP0D30yr4e4EJEJYYNKa3hofTEHDXeeNgM25tprhBUMdbV
 RZpf2Keuk2uDVwc+EiOVri48rb1NU+60sOXvoGO6Ks81+mhAGmrBrlgLhAp8K1HPHI4MG4gH
 nrMqX2rEGUGRPFjC3qqVVlPm8H05PnosNqDLQ1Pf7C0pVgsCx6hKQB7Y1qBui7aoj9zeFaQg
 pYef+CEERIKEcWwrjaOJwK3pi9HFdxS0NNWYZj8HPzz/AsgTTQdsbulPlVq2SsctmOnL42CZ
 OCTppGYwl53CG/EqVY+UQBzFzJBaY8TJRFFYVEy5/HH4H11rMoZwqIkk71EOGU3X6mWlANRi
 kR3M4GhVITRzuaV69Fed+OeXcCmP94ASLfuhBR2uynmcHpBKpwARAQABzTtOaWNrIENsaWZ0
 b24gKENoaWVmIEJpbnV0aWxzIE1haW50YWluZXIpIDxuaWNrY0ByZWRoYXQuY29tPsLBeAQT
 AQIAIgUCWb/ZxQIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQE/zvid2ePE9cOxAA
 3cX1bdDaTFttTqukdPXLCtD2aNwJos4vB4LYPSgugLkYaHIQH9d1NQPhS0TlUeovnFNESLaV
 soihv0YmBUCyL4jE52FRoTjE6fUhYkFNqIWN2HYwkVrSap2UUJFquRVoVbPkbSup8P+D8eyd
 BbdxsY6f+5E8Rtz5ibVnPZTib7CyqnFokJITWjzGdIP0Gn+JWVa6jtHTImWx1MtqiuVRDapU
 hrIoUIjf98HQn9/N5ylEFYQTw7tzaJNWeGUoGYS8+8n/0sNbuYQUU/zwMVY9wpJcrXaas6yZ
 XGpF/tua59t9LFCct+07YAUSWyaBXqBW3PKQz7QP+oE8yje91XrhOQam04eJhPIBLO88g6/U
 rdKaY7evBB8bJ76Zpn1yqsYOXwAxifD0gDcRTQcB2s5MYXYmizn2GoUm1MnCJeAfQCi/YMob
 R+c8xEEkRU83Tnnw3pmAbRU6OcPihEFuK/+SOMKIuV1QWmjkbAr4g9XeXvaN+TRJ9Hl/k1k/
 sj+uOfyGIaFzM/fpaLmFk8vHeej4i2/C6cL4mnahwYBDHAfHO65ZUIBAssdA6AeJ+PGsYeYh
 qs6zkpaA2b0wT4f9s7BPSqi0Veky8bUYYY7WpjzDcHnj1gEeIU55EhOQ42dnEfv7WrIAXanO
 P8SjhgqAUkb3R88azZCpEMTHiCE4bFxzOmjOwU0EWb/ZxQEQALaJE/3u23rTvPLkitaTJFqK
 kwPVylzkwmKdvd2qeEFk1qys2J3tACTMyYVnYTSXy5EJH2zJyhUfLnhLp8jJZF4oU5QehOaJ
 PcMmzI/CZS1AmH+jnm6pukdZAowTzJyt4IKSapr+7mxcxX1YQ2XewMnFYpLkAA2dHaChLSU/
 EHJXe3+O4DgEURTFMa3SRN/J4GNMBacKXnMSSYylI5DcIOZ/v0IGa5MAXHrP1Hwm1rBmloIc
 gmzexczBf+IcWgCLThyFPffv+2pfLK1XaS82OzBC7fS01pB/eDOkjQuKy16sKZX6Rt57vud4
 0uE5a0lpyItC2P7u7QWL4yT5pMF+oS8bm3YWgEntV380RyZpqgJGZTZLNq2T4ZgfiaueEV4J
 zOnG2/QRGjOUrNQaYzKy5V127CTnRg4BYF/uLEmizLcI3O3U1+mEz6h48wkAojO1B6AZ8Lm+
 JuxOW5ouGcrkTEuIG56GcDwMWS/Pw/vNsDyNmOCjy9eEKWJgmMmLaq59HpfTd8IOeaYyuAQH
 AsYt/zzKy0giMgjhCQtuc99E4nQE9KZ44DKsnqRabK9s3zYE3PIkCFIEZcUiJXSXWWOIdJ43
 j+YyFHU5hqXfECM6rzKGBeBUGTzyWcOX6YwRM4LzQDVJwYG8cVfth+v4/ImcXR43D4WVxxBE
 AjKag02b+1yfABEBAAHCwV8EGAECAAkFAlm/2cUCGwwACgkQE/zvid2ePE/dqQ/6ApUwgsZz
 tps0MOdRddjPwz44pWXS5MG45irMQXELGQyxkrafc8lwHeABYstoK8dpopTcJGE3dZGL3JNz
 1YWxQ5AV4uyqBn5N8RubcA8NzR6DQP+OGPIwzMketvVC/cbbKDZqf0uTDy3jP65OFhSkTEIy
 nYv1Mb4JJl3Sq+haUbfWLAV5nboSuHmiZE6Bz2+TjdoVkNwHBfpqxu6MlWka+P98SUcmY8iV
 hPy9QC1XFOGdFDFf1kYgHW27mFwds35NQhNARgftAVz9FZXruW6tFIIfisjr3rVjD9R8VgL7
 l5vMr9ylOFpepnI6+wd2X1566HW7F1Zw1DIrY2NHL7kL5635bHrJY4n7o/n7Elk/Ca/MAqzd
 IZxz6orfXeImsqZ6ODn4Y47PToS3Tr3bMNN9N6tmOPQZkJGHDBExbhAi/Jp8fpWxMmpVCUl6
 c85cOBCR4s8tZsvGYOjR3CvqKrX4bb8GElrhOvAJa6DdmZXc7AyoVMaTvhpq3gJYKmC64oqt
 7zwIHwaCxTbP6C6oUp9ENRV7nHnXN3BlvIgCo4QEs6HkDzkmgYlCEOKBiDyVMSkPDZdsspa+
 K4GlU2Swi/BDJMjtDxyo+K0M81LXXxOeRfEIfPtZ3ddxBKPva1uSsuz+pbN9d1JY8Ko5T/h1
 6susi2ReUyNJEJaSnjO5z13TQ1U=
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Guys,

   I have also been thinking about this and I have decided that
   I am relly not contributing to the work of the CTI-TAC, so I
   have also decided to step down.

   I wish you all the best and I continue to hope for bright future
   for all of the GNU community.

Cheers
   Nick

