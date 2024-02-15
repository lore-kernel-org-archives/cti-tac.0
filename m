Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB5A13B289
	for <cti-tac@lists.linuxfoundation.org>; Thu, 15 Feb 2024 20:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708030796; cv=none; b=eO8ftNnmW2koqvufRavX6ySvcJzdV9Tot4NR0F/PUuAFrI4jdfLhVK4hPzydvVU5zrv+v03ZxQQVmiDuQVmMl0tAczy0i0m1kq+4LW/Awklj9l2AtGHRk4jvPKT4gLJAXPSY1kEjNww4xbeuXSlezcxtAAtuIyMSgXx9Xv4e4BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708030796; c=relaxed/simple;
	bh=zcr2eEUuFjhxeB5exEXQrOnXcC0CMF3Rc9d+/naazvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGhLEcPJ9EWAWNbUv4l5fm1zgy3bXtSq8eB7t/OJmVkif14BBpM/oH7mRfwX8L7778wpaMGcK7dGHwpvYan3cDja9dnmwlic6IRVSyDmvQ0qOAezMXb+Q3dtRKORvGok+I+huaa+NN4tQe95G7eWZo0iEQbO2qsAPaJQCmyYW00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F6rvithR; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F6rvithR"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 518B040513
	for <cti-tac@lists.linuxfoundation.org>; Thu, 15 Feb 2024 20:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C1dUIKMt1NYu for <cti-tac@lists.linuxfoundation.org>;
	Thu, 15 Feb 2024 20:59:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9144A40505
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9144A40505
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F6rvithR
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9144A40505
	for <cti-tac@lists.linuxfoundation.org>; Thu, 15 Feb 2024 20:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708030793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZCdjWy4wIGrBKgCGiySRLwMXDWW/3+Sd0mLI5l8dbk=;
	b=F6rvithRY2HZq75lT5dBzp0JxDMy73OerTl0ztzYuGYMzCwodmupSUFfbUgWutgaEVxj0E
	iEN8bsJ4eABqXo40nqQpRYZ+4HuxF+k47MrNPlm+mZVfay743AgZkOG4Sgvvh+9c6Znm3Y
	KqEnzwrr1JPnYkKw6IhPcZkXwPRoG8w=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-VrSqTC9EPV2qhFunUKpemw-1; Thu, 15 Feb 2024 15:59:51 -0500
X-MC-Unique: VrSqTC9EPV2qhFunUKpemw-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-78734b44810so150029485a.2
        for <cti-tac@lists.linuxfoundation.org>; Thu, 15 Feb 2024 12:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708030791; x=1708635591;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZCdjWy4wIGrBKgCGiySRLwMXDWW/3+Sd0mLI5l8dbk=;
        b=rp1bPFB6xfJQKtYcGP6CAGrZ5m9sK350W2ed72qqGzQmWjninfSxqxsNmrq9QIvqWP
         XwzXqrNAmbsLMtLUc/gnB2ZAp6fC10clA23GpN3GPVO4UOMSvZsXVwxPE8ZEowy0xVqP
         sCvSs5dGN3Lo9qKFxewDr9xirPBv8RjAdZy5ZsoiC5C5rtdL/xOFWv2GB1eOjigNDA3j
         n1Hdrr/mmdJ0u9FNxCmBLe+Y8a7NHDe6Q8ZfvgIARj1xJXG7V84dAw2m5iUkQwDSg2Ed
         OtkRGjcwtuCQCe09+WKY3Iw8tz8L2RXN1gWGiwRCjZW7rM1FNxNt4ZcTBrkieGXVMCDU
         ZhVg==
X-Forwarded-Encrypted: i=1; AJvYcCUtCVfkqU1hqWscnRYmAdgj/wQ2wCeJQtrblrDaC+LX9al9F7CVlbUK+rGLkp/orzc3vPP5S/XqlvfcUw3ooArfS9nN+sQtwW1icxcYrMkwadg=
X-Gm-Message-State: AOJu0YwR01Dv+K7gUutukkpQnRdZQA2zkEuMZlA/WyinijIXtyla55du
	g8ryCWbCh4dCVwgYCz5mPyKGoS+mbV3tg1K/apvrJUmcx1LGxhk4u6uWuJjr0h2R++BLu1/J2xm
	tZAImA4ybU97V/NCHwxO55LKdd0s6iQ//zSEqyNlzWRTsbOtLQiQ/mR7t/qNmCGZ5I8Jx
X-Received: by 2002:a05:620a:35c:b0:785:62c3:9f5b with SMTP id t28-20020a05620a035c00b0078562c39f5bmr3343935qkm.22.1708030791341;
        Thu, 15 Feb 2024 12:59:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGn9S5Y7WRw5k9S+49OKsxZxDKe0Klnlp8dWVVYv/ADKBcnFKdFA8bxDaflAvLOqUJHtNZ//w==
X-Received: by 2002:a05:620a:35c:b0:785:62c3:9f5b with SMTP id t28-20020a05620a035c00b0078562c39f5bmr3343917qkm.22.1708030790985;
        Thu, 15 Feb 2024 12:59:50 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id g24-20020a05620a219800b007873354a792sm920899qka.67.2024.02.15.12.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 12:59:50 -0800 (PST)
Message-ID: <95f1c77e-05bd-4b48-8627-21d4235b44a0@redhat.com>
Date: Thu, 15 Feb 2024 15:59:49 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Meeting to add David Edelsohn to the trusted introducers list for
 the CTI repos.
To: Joseph Myers <josmyers@redhat.com>
Cc: Siddhesh Poyarekar <siddhesh@redhat.com>,
 David Edelsohn <dje.gcc@gmail.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 cti-tac@lists.linuxfoundation.org
References: <a263ae8e-6d86-48f3-a4f2-98e4560a8035@redhat.com>
 <CAGWvny=YNRCLK02Lh7QCwsuP4T7btJqrtiydpG6ZFM8jM+9VxA@mail.gmail.com>
 <CAAmeS-bm2-dtzPok9dif6-U2FJ0cajyv0LhV0J6JPhSmzOX5Lg@mail.gmail.com>
 <034863fa-201e-4f06-a6b2-f799011cfb77@redhat.com>
 <12eb3516-8df9-d771-de20-faf3e3c8f235@redhat.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <12eb3516-8df9-d771-de20-faf3e3c8f235@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/15/24 15:55, Joseph Myers wrote:
> On Thu, 15 Feb 2024, Carlos O'Donell wrote:
> 
>> I've sent a meeting invite for Friday February 16th at 1230h EDT.
> 
> I send my apologies for absence from this meeting (assuming you actually 
> mean EST).

Sorry, yes EST5EDT.

-- 
Cheers,
Carlos.

