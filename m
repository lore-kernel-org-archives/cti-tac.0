Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCF913A26F
	for <cti-tac@lists.linuxfoundation.org>; Thu, 15 Feb 2024 20:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708027274; cv=none; b=iZsjAXVxyJM39CnrTQJFbb9i7G2lMzK4BkXGGKbOalyIZ/rx76I6MpNGo2aj9ROyemjm7Yoo+ks1AMxlXpiV2l+JKbyWg9R8DmHsT1+1cQDeOSBdtDX/VAhOdT5lmSKxwz1VjPZFe16CF3kfkIjz76jbPFKQiXcI5y/+S91sfNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708027274; c=relaxed/simple;
	bh=eD+NMmRDh82I29B9lE5T21wAXZ30d5nuGunJkb/nqQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IWbCszgJvmjsmMqaYaOA9iY7dHehA9J3pAhA6tbun8fK0C/nFMMiUSpxx/bO1YnaQKidiC0nDyE8UczvbtoIS7B3UcO2JXwGyOGWinOdLQjGkR53ru2ualv47kGI1SogIc/1c+U9lRcSB3DQ6ie84x66tueuIfiW4sJUUBqApQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=baQxpHLC; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="baQxpHLC"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1C70418B6
	for <cti-tac@lists.linuxfoundation.org>; Thu, 15 Feb 2024 20:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SAp8psOJfETT for <cti-tac@lists.linuxfoundation.org>;
	Thu, 15 Feb 2024 20:01:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E9A140798
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E9A140798
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=baQxpHLC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2E9A140798
	for <cti-tac@lists.linuxfoundation.org>; Thu, 15 Feb 2024 20:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708027269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rixYxgw7SQBdcwweaawlgrpwg/hT+LmlkgL+VwJ7nig=;
	b=baQxpHLCSkDDGnLQBQOvdnDHrDFtjR+8x/Owivt4+OuFQ1Vy9KghOzDThDiUMSRoC7NVOP
	Rsnvz1L9+rZevsj9hq47Tr2tRIkmnCDFOmOiFWtrDTZCbiQkH6I+ZIW6dB6lxgZB5M1eVv
	phHg9JRkoTr9n4G4cKHHGmPXdkk4nos=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-ANoP95DNNyGHiT8ZG15ceA-1; Thu, 15 Feb 2024 15:01:08 -0500
X-MC-Unique: ANoP95DNNyGHiT8ZG15ceA-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-781d8e14fd8so164338785a.3
        for <cti-tac@lists.linuxfoundation.org>; Thu, 15 Feb 2024 12:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708027268; x=1708632068;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rixYxgw7SQBdcwweaawlgrpwg/hT+LmlkgL+VwJ7nig=;
        b=CyGOOs2yfwrYdF6/tqBJEZ0ZPNqgmSCnbJcUzvUm+muPlKq4DGW7xmVEDcxris9u3K
         y8pkIfIDyv1UJpF4X9hbK2J64Do3yQiY2Vr7aDwKENitieR3fBqCBsazrNF+a6Zfi1Ku
         1butfzU0g2X1JFk8eW4R9yqj3Takg5icQThU4c7j0llMPQWGmxN2dQrTHkn4NkkVoi8h
         7cYfPI5YOiM4eQQJDaRnXAK651j5qZAioAt91xNorKSwXJrm6MDAGXgTsXqs+7xNGhDl
         iiarTIfznKXLTZERKCoTyDMxqsuO29KvocyQB6edaDEgB1xdpBGCWJl5JcpEeqLiJ7ZH
         yoZg==
X-Forwarded-Encrypted: i=1; AJvYcCVdHi7YH6Zs2tDPngjfpuW1CrTr1V6fgQ7/nLEu2pgsSkmczoFA1E8k3W31yC4edoba0CyeU0tl1DJExNzr/TKDBQmrj9+IP2beXBqeYbuW34A=
X-Gm-Message-State: AOJu0YxeOnXycaTgdpWIBhhLoCLoZyP6KSxGS1n249NV1YloaI0cgIvB
	gqJmJsAhR4Zu0tvRInqYbunMkyiU5fJXtnvnuuKyRVShOZzjzmMZ7YhXUzNBLbRRosPqbXmlUvV
	O5EK2wcjhbNYg4aMQKb8d1647PvxxK87xhUGEpVCa2u3eYXks8K+iehNvPi6MxSoNMjtn
X-Received: by 2002:a05:620a:2490:b0:785:b8b9:f0a6 with SMTP id i16-20020a05620a249000b00785b8b9f0a6mr3164960qkn.52.1708027268090;
        Thu, 15 Feb 2024 12:01:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvQVK3yqPf4FZyYuQtxiOW4Uu8bXnjP3zI0rcTrTyAeavumTsseQ4dcgXV4tncmKXY9zcC+g==
X-Received: by 2002:a05:620a:2490:b0:785:b8b9:f0a6 with SMTP id i16-20020a05620a249000b00785b8b9f0a6mr3164943qkn.52.1708027267817;
        Thu, 15 Feb 2024 12:01:07 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id vq2-20020a05620a558200b007873b3d0573sm491413qkn.123.2024.02.15.12.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 12:01:07 -0800 (PST)
Message-ID: <034863fa-201e-4f06-a6b2-f799011cfb77@redhat.com>
Date: Thu, 15 Feb 2024 15:01:06 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Meeting to add David Edelsohn to the trusted introducers list for
 the CTI repos.
To: Siddhesh Poyarekar <siddhesh@redhat.com>,
 David Edelsohn <dje.gcc@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Joseph Myers <josmyers@redhat.com>, cti-tac@lists.linuxfoundation.org
References: <a263ae8e-6d86-48f3-a4f2-98e4560a8035@redhat.com>
 <CAGWvny=YNRCLK02Lh7QCwsuP4T7btJqrtiydpG6ZFM8jM+9VxA@mail.gmail.com>
 <CAAmeS-bm2-dtzPok9dif6-U2FJ0cajyv0LhV0J6JPhSmzOX5Lg@mail.gmail.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <CAAmeS-bm2-dtzPok9dif6-U2FJ0cajyv0LhV0J6JPhSmzOX5Lg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I've sent a meeting invite for Friday February 16th at 1230h EDT.

The meeting is open for anyone to attend.

We will use the CTI TAC BBB meeting roomg: https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1

The only agenda item to be discussed is adding David to the trusted
introducers for CTI repo.


On 2/14/24 19:56, Siddhesh Poyarekar wrote:
> Friday works for me too.
> 
> Thanks,
> Sid
> 
> 
> On Wed, 14 Feb, 2024, 19:44 David Edelsohn, <dje.gcc@gmail.com <mailto:dje.gcc@gmail.com>> wrote:
> 
>     Hi, Carlos
> 
>     I'm available on Friday afternoon.
> 
>     David
> 
> 
>     On Wed, Feb 14, 2024 at 8:55 AM Carlos O'Donell <carlos@redhat.com <mailto:carlos@redhat.com>> wrote:
> 
>         David,
> 
>         My understanding of the process is that we would need CTI TAC
>         members to meet with you and LF IT where you read out the
>         contents of your ssh key fingerprint and then you mail the pub
>         key to LF IT and they add you to the trusted introducers.
> 
>         I'm available Friday February 16th after 1200h (EDT) to do a
>         key reading meeting. Likewise Tuesday February 20th after 1200h
>         (EDT). Wednesday February 21st I'm free all day.
> 
>         Alternatively the next scheduled CTI TAC meeting is February 28th
>         and we could take some time there to do a key read out.
> 
>         What works best for you?
> 
>         -- 
>         Cheers,
>         Carlos.
> 

-- 
Cheers,
Carlos.

