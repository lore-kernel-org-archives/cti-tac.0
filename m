Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722591DE885
	for <cti-tac@lists.linuxfoundation.org>; Tue,  8 Oct 2024 12:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728389140; cv=none; b=sfbLk1Av+WBNPp7/fVMuNk+RE+YDTuorTdpPv2YCEaFLV2zqTSuVtjKxMa0M5DJAKdLBcOzVyb48y0mCuVwbJGfyqoMgHzhfn6B4mnMBjhUHyBzY4YDtIBrnQsg0cX+ggzvDFFLjs8XhN+4OEFike/cKpP686x57Va8tYBl7Hdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728389140; c=relaxed/simple;
	bh=WYh40tatk74W+FfHQggkKVM4A25DMyeYYcCUK4dHEzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=u20ANZneYvF9emZ+wr30CdKoBWvXsuRpemsVrB0vWae7AYmp2ZDDUdLq7UOYVQ+7+NgxfdbQjByQxSZHnSLmZhKCTcH4qAZyIqDLQSGTr2A0hvnhm1l3aQuYlVVwXOnhnQjs7n3833M+peyVK01j2D8CfcSqaJ8fazCnN3tYKFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UmSDYvdV; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UmSDYvdV"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A88A4010C
	for <cti-tac@lists.linuxfoundation.org>; Tue,  8 Oct 2024 12:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DCyccct9NXV for <cti-tac@lists.linuxfoundation.org>;
 Tue,  8 Oct 2024 12:05:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E6E0B400D2
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6E0B400D2
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UmSDYvdV
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E6E0B400D2
	for <cti-tac@lists.linuxfoundation.org>; Tue,  8 Oct 2024 12:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728389136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DgGqPmD87qFy/iNgRFLr3V0OQpYTE3wmjyGsi9rVUag=;
	b=UmSDYvdVktFHhNVKLjs7z5+pwqxVxufgCk2Y+we8K49KrXjyMA/OsFsQtn7SWC0x+yF8fn
	HpKRToZo3b5Jvb+BWybWdsQGpjiJ5SkbGdEJZmbVIyVMHESAhj39iYAxsrNB7iX6ofzTld
	E6rgyrLzc2/edlmRUF1gNugVwpcy7vk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-dLANwpI4PjydCHN6BITmqw-1; Tue, 08 Oct 2024 08:05:34 -0400
X-MC-Unique: dLANwpI4PjydCHN6BITmqw-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-45f07ddcefdso1345801cf.0
        for <cti-tac@lists.linuxfoundation.org>; Tue, 08 Oct 2024 05:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728389134; x=1728993934;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DgGqPmD87qFy/iNgRFLr3V0OQpYTE3wmjyGsi9rVUag=;
        b=s9st+U0mvK7hw92Ubps+ye5Ioc7QJ7LQIae5+j8Z7Z+Be1WncxRWk1KGpBSHTbOOUi
         1mELnRDtJtAA8fMvma55iTRy8yYhyMs6zyXPykPJ35ug3/eL4Bpgvq0g63WGNB7cG9Ms
         g5a08TLLQ5JvDKkZQUIVC01HiuQD9EXfZeRJA32zNMD6XWBkIO69QZOUhx+icnnSDHUP
         ik2TVi7X5B7/HlVD2PSutDwcZL7r/sJLfUzhHIDp2T3em3YrZQZ21sbo1hGOcK2IAp7y
         v8cMWgD4WJ+HYgosq49VQ82iMbzpBs+6Jkten2vSO4hQIQdk2nSFC98ArkjM4yq3qjtM
         pm4w==
X-Gm-Message-State: AOJu0Yz0xMdlf9RnE82sKjDPjulcDCYMkw6vnoTWatocwvBI4lmtHCsy
	fMtIimxoFqQLsFoI1PgPrtCBfZgwfXX4GHmr///t2vbRbfuU6JLSozM7g+JEbpeJUB4yKqc+U8D
	e3Vu/ORrAsFidb8C1UZhwtjcbluQNOtMBAtrmylkMthI/MQsUzGxbQlIx+DynlhekW0rRHdqXXx
	OxiKv7r7UsoHphhTx//92hazmFO0/wNDp78O7TfAxAyo0+gSJvy51V
X-Received: by 2002:a05:622a:89:b0:458:1651:b235 with SMTP id d75a77b69052e-45d9ba9ee58mr214000401cf.20.1728389133993;
        Tue, 08 Oct 2024 05:05:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhf22POIDvYVlVOimmrrFrBAG7F/4sVEpu3/4sSwR1OxyL0JVb8//F05bZFdd9PZqtSsFKkg==
X-Received: by 2002:a05:622a:89:b0:458:1651:b235 with SMTP id d75a77b69052e-45d9ba9ee58mr213999721cf.20.1728389133385;
        Tue, 08 Oct 2024 05:05:33 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45da7514306sm35605921cf.39.2024.10.08.05.05.32
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 05:05:32 -0700 (PDT)
Message-ID: <137c1a7a-b499-47b9-8e6e-128e8e73e921@redhat.com>
Date: Tue, 8 Oct 2024 08:05:31 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tac: Nick stepping down.
To: cti-tac@lists.linuxfoundation.org
References: <20240925145918.482756-1-carlos@redhat.com>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
In-Reply-To: <20240925145918.482756-1-carlos@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/25/24 10:59 AM, Carlos O'Donell wrote:
> Nick Clifton stepping down:
> https://lore.kernel.org/cti-tac/67c7b140-f1fa-4598-9390-9628b3a64517@redhat.com/
> 
> Move Nick Clifton from active TAC members to previous TAC members.
> 
> Signed-off-by: Carlos O'Donell <carlos@redhat.com>

Pushed.

-- 
Cheers,
Carlos.

