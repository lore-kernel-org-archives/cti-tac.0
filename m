Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D211F19A
	for <cti-tac@lists.linuxfoundation.org>; Mon,  6 May 2024 17:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715017175; cv=none; b=p3ufhQTuWS/pZZDStjknPZ526lNUqqQuTmcZWuhFkVYjAJ08ALu72xfA6gEbE/0NHBqxA3Qlp6N4e5H6ajY7EaXYdaVV+IwMTtS6TKbHoSadixgvy/R5x+jsumcQOxUTveQoFGzTE8eH0slQ7OnIB64mqVU+ZpHDgLW8L61R8xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715017175; c=relaxed/simple;
	bh=nLtQrr18f5qNAtHJ76VUJ80Z/xv9RWU9qDW+N+H1n8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Vw4qh5pujOn7cqvdm2VQUNY6xoLAaP9jy+rLxh7cLnn7cZm4tKKydDrcub/95wIG86dbA7zSyjtNJycZbRWpoletIPG3HJursTC5T+uRrqWIQqvFxa4j4ijdi2rMXi2HXdzaln3J8bqpl/TaE44WRbMsGHcQqnGPKhEXxe+c9rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bwWryV9I; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bwWryV9I"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 982F06061D
	for <cti-tac@lists.linuxfoundation.org>; Mon,  6 May 2024 17:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REmqTD-g9OFx for <cti-tac@lists.linuxfoundation.org>;
 Mon,  6 May 2024 17:39:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B8F760619
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B8F760619
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bwWryV9I
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3B8F760619
	for <cti-tac@lists.linuxfoundation.org>; Mon,  6 May 2024 17:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715017171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=j6nFyqeWSS86LavrOgkq+tObc2/bjhD2UHV1+r9BK1I=;
	b=bwWryV9I+Wp3HqtdtauQGHtMac+HuxzQ10WhDrc8ySAUuqVbDOz4cEwj35H6X1RBQ6hRgm
	a0uVN/Gu+4SMurxQJOSR6Phrj5CWk5QLzkI7Cc9GfrS54NWrFL5y5YBuFu7frFriN8YOc4
	q1nop1cNc6IKQmylwfeuNtrbd4tw5SI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-s_2GJUniOxOFp4LF2IueUg-1; Mon, 06 May 2024 13:39:30 -0400
X-MC-Unique: s_2GJUniOxOFp4LF2IueUg-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-43d873466b6so4656531cf.1
        for <cti-tac@lists.linuxfoundation.org>; Mon, 06 May 2024 10:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715017170; x=1715621970;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6nFyqeWSS86LavrOgkq+tObc2/bjhD2UHV1+r9BK1I=;
        b=Crko6V586ojIkBGrAQ6n5t5bkac2sb3qy1vtRQzKp7PTrgWj1o7oFNPHuahRDh7Ue6
         xZVQpS9BtbR0QiBF5pAt5FqRM/f79UduYkHoadeB1reIrVydvf7QrnSC0VTom/61ynIX
         pn97o00VOw5e0gYImm8lpk/Ek/xIfPLoIEhbWwxO59/vR4QMNPUMvtXDYzSNxEJ0y7fg
         PcoxEgDHSnIkx8dtPkgLKE+6ZGQldyxJPTK1raPqQu1MBWA4v7eTemrLKTg9D52aKQ7m
         MxuKMm1clpT39fzoQ09fRIL4I60cEJgsrFt9Tz9ex9zz+bnRgaY/E7FwjFmdH5tM48Zn
         2qPA==
X-Forwarded-Encrypted: i=1; AJvYcCUe2NCehyfC3+SxxfzuLTj+qBNaDmCik0i65dW1oJz8xeeRkhRA3oZ7G6+aQjKNPrG430Ncg9tVduQKpTeEPFNzqzVeYSJt1PgHE2y/Z8KgZTQ=
X-Gm-Message-State: AOJu0YxEc746bOL/7eaBRPJd350rFLOJjbizBuaFy2biCnm6xf00Le/x
	A1IDa1B7Av575BF1h8YzQIlNXSz+tGi/FIpu20KrxtZtpClOzxBu+gLbkNz6ddrYwLbVfCASDPt
	7a64ScFFV5agC0r60wzAU64xKZcFbPJFpcJ3E6FjZLaz3gyigo7hMsb49u85es/Y368up
X-Received: by 2002:ac8:7d01:0:b0:43a:dedd:3238 with SMTP id g1-20020ac87d01000000b0043adedd3238mr12083327qtb.0.1715017169624;
        Mon, 06 May 2024 10:39:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkmiw20+2aSTBvxqGstTRGf4Gg/bG+d6PR6p9JzDFpNJFkdK5ZeiMpNez0XzrS2Qz7miSVxA==
X-Received: by 2002:ac8:7d01:0:b0:43a:dedd:3238 with SMTP id g1-20020ac87d01000000b0043adedd3238mr12083309qtb.0.1715017169151;
        Mon, 06 May 2024 10:39:29 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id m6-20020a05622a054600b00436434cc3e4sm1032142qtx.89.2024.05.06.10.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 10:39:28 -0700 (PDT)
Message-ID: <0d061aad-ddaf-4edd-89db-9956812b2683@redhat.com>
Date: Mon, 6 May 2024 13:39:28 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: resignation from CTI TAC
To: Joel Brobecker <brobecker@adacore.com>, cti-tac@lists.linuxfoundation.org
References: <ZjkNS7VkI3am/6Fr@adacore.com>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
In-Reply-To: <ZjkNS7VkI3am/6Fr@adacore.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/6/24 13:03, Joel Brobecker wrote:
> Hi everyone,
> 
> A short email to let everyone know that I am resigning from
> the CTI TAC.
> 
> To give a brief explanation, this is what I wrote to Carlos:
> 
>> I think it is time for me to accept the reality that I haven't been
>> able to make any contribution to the group and I don't see things
>> getting any better with time. So I think the right thing to do is
>> to make it official and resign from my position with the group.
>>
>> I am very sorry that I never really was able to find the time to
>> participate. I hope you'll be able to find someone else who can
>> invest himself in this project.
> 
> Thanks again for the opportunity, and my apologies again for not
> having met the standards I expect of myself when part of such groups.
> 
> Wishing everyone in the group all the best!

Thank you Joel!

I've updated the website.

-- 
Cheers,
Carlos.

