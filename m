Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96C91BC08C
	for <cti-tac@lists.linuxfoundation.org>; Wed,  7 Aug 2024 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037063; cv=none; b=XmNvVAe4bkGDrLpGoJIfkaEaY8E45ihZwvsjWIGboApzQePvBL459Oq/iPPegNNsRRKoYbEGKDlZdXZGX0UQsYlBTKUUAvUh6y6eznxYyJIi6B+UiqPoNsQy28kBTyEb8TZHIjfTPqw8UctEcS8on8VXXlhLRlKsWScEbGxkeXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037063; c=relaxed/simple;
	bh=KykGGBzcAZ/+/pbw9ETTl+/bB1kt319ga250so6v6KI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Cibdc2+zq48sZBlchbsEc4Vwc4xVDKqLk5I3QwNKjviG/GcevIGoGHKlZ2mEE0EUCJb+ys2OdngsNSVQ4miRii7nt2lvJYYVzA/9FTyZqRhzLhxYVWoI9F0SZLqJKFmJ/4x7BTebvS9GmhruHFE/K8QZoKwg9FjBIiNWXW3y8R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fxtN9wQt; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fxtN9wQt"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F82A812F5
	for <cti-tac@lists.linuxfoundation.org>; Wed,  7 Aug 2024 13:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4lJh84xXdc7 for <cti-tac@lists.linuxfoundation.org>;
 Wed,  7 Aug 2024 13:24:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20A03812F4
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20A03812F4
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fxtN9wQt
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 20A03812F4
	for <cti-tac@lists.linuxfoundation.org>; Wed,  7 Aug 2024 13:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723037057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XunORC5emVgBFN13Xao6PxprWnc2ZoDPnbWV4dd3n5s=;
	b=fxtN9wQtdF/8+wMvUsE9exM+RyaKzG2Z7Kq4v09t5netp5k5ocT0iatPMZKuRzSmJFjuDX
	PUILHhWhC05dbFH1AOYHBx8/IrOHdVLF3kKiCj2pbZY2VJQBbz5/W+pIXce6QkEIlQs5P/
	ciZBY3hrePQMG7Wo9UpjQLB4d2tBJGc=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-XrPIJoUIOXGH3k1OkuTE4w-1; Wed, 07 Aug 2024 09:24:13 -0400
X-MC-Unique: XrPIJoUIOXGH3k1OkuTE4w-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7092ed92f7dso1236628a34.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 07 Aug 2024 06:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723037051; x=1723641851;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XunORC5emVgBFN13Xao6PxprWnc2ZoDPnbWV4dd3n5s=;
        b=PW0zxFLX4tKRRrjEC2HIwCdySJDIOcqEe0xAd1qcQ+eEJeXttPv2+gISJsb4HaSC3+
         I8wFg8xT9Jbf0K9IPWZBLI4L6XZpAv9aWDpoujyhf/fBTn7BSN+i5RwyMSN93ryXWqc6
         nhMj49p9DY7BojigcQvIrX+WaxILrWdBA5aJBUTKsWUZYOG6YMmE35DiXxWDN+1Dc/wx
         /Fbqe/Vkzos7SoL+J/+WYdt7TiTr6m2sP1ViK3rY+sczY1F94CbvnG1S8thGHkPpqCFs
         r2F5smWRmE8Fv3CCzxQnBe39B2IVgdAky+VNeZIg8QSSvcZqHVlblPEEyueEl6Tn6Lj1
         YpBA==
X-Forwarded-Encrypted: i=1; AJvYcCVUdgWJmYxaty/5yrKmlcxkqFDS1mRxOpOETbEAcfJlo9Q+4GQ755+kso03tXrgurbTar3VVYzGXkVLy2AHR4oqUcQLtuvJWvdz35QGa8hOY9c=
X-Gm-Message-State: AOJu0YykAege8Lx7/JKpWBfiLx3efKpOHCfCAmQnA2fPkYVitb3jzCyT
	3YARfiyIGVZyPvrVwJc7P3OcG1r2GUuJD/i7Hyzv4EDLSUyW7KaQrJBNBnYVpIVPtuTnhEU7rOa
	mLp07p0xjfvWGwvDkqmf1vB/ZkL9Vgz3yHzH04rfsEoe6c7uUlo5TsNrCHCOMk0s8hQJq
X-Received: by 2002:a05:6830:4902:b0:709:3839:b7d2 with SMTP id 46e09a7af769-709b9978697mr20007013a34.31.1723037051582;
        Wed, 07 Aug 2024 06:24:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6ed041GtqukVVdcpH90HpczKmSiX+o4D6+4GemNaI4Y/sMlDYd4GkfByVIPRcIjclUCrw2g==
X-Received: by 2002:a05:6830:4902:b0:709:3839:b7d2 with SMTP id 46e09a7af769-709b9978697mr20006992a34.31.1723037051211;
        Wed, 07 Aug 2024 06:24:11 -0700 (PDT)
Received: from [172.20.2.49] ([64.72.84.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c79b2aasm56780976d6.54.2024.08.07.06.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 06:24:10 -0700 (PDT)
Message-ID: <c5ce9d36-b5e7-4c00-ad86-638c47c6a33b@redhat.com>
Date: Wed, 7 Aug 2024 09:24:10 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Also stepping down
To: Nick Clifton <nickc@redhat.com>, cti-tac@lists.linuxfoundation.org
References: <67c7b140-f1fa-4598-9390-9628b3a64517@redhat.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <67c7b140-f1fa-4598-9390-9628b3a64517@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/7/24 7:07 AM, Nick Clifton wrote:
>   I have also been thinking about this and I have decided that
>   I am relly not contributing to the work of the CTI-TAC, so I
>   have also decided to step down.

Thank you for all of your contributions to date for the binutils service analysis.

I look forward to talking more with the binutils / gdb developers around the
security needs for infrastructure.

>   I wish you all the best and I continue to hope for bright future
>   for all of the GNU community.

Thanks! I'll update the website next week unless someone else beats me to it.

-- 
Cheers,
Carlos.

