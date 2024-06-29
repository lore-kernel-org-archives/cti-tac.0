Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBC11D52D
	for <cti-tac@lists.linuxfoundation.org>; Sat, 29 Jun 2024 13:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719668225; cv=none; b=skIAOhNC2DO+CyVTQg40QBkQ7hZGAuU7b1uU+oiQBXCq+Zy1x8g2m8b4E+hRvTfqRfRQAmVKA2eI0gaGRO6wGzUUURqKkOPeQCZqYIUCgO0obOyC7b/hpDyz24VGMM7g9I5CdXPgn3EQ/k2jKSmpsnHBCry7B3iYq7akH95SEjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719668225; c=relaxed/simple;
	bh=NrdQlQG1W1PgWU8ueojRv/+NIhY/CzpA2jOVDTtvddI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYer9eRxRsMHtUIqf432PG6FuCea+828C8/DvKOOT8d+9s6uZ99Uy5TrGhMWTWI259vu+fBfwZs9/DAIGi5G9PDxo/9nHpdRcs+P3AZiey3RQWnKFiFhYrnytgLNLTAyNgHZGTB7SGGXiRprZB/V5EAngimldOXL98ik7Xz2jJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VTHYTBad; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VTHYTBad"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00E0F60773
	for <cti-tac@lists.linuxfoundation.org>; Sat, 29 Jun 2024 13:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i22kCSFjYWhS for <cti-tac@lists.linuxfoundation.org>;
 Sat, 29 Jun 2024 13:37:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F33716070D
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F33716070D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VTHYTBad
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F33716070D
	for <cti-tac@lists.linuxfoundation.org>; Sat, 29 Jun 2024 13:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719668221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dE9U35a3GFV84DE7uyjbmdmgDkUdNbfTc4Y8QV/XYAM=;
	b=VTHYTBadYiCbRQ5Xd9amAYB3n5StBgkv9ELbjXm7IgHuQcEsjoyD+8O5cwbDr0afk+s3Uz
	Y0Ykzka4hjvjqsOUVD6p6dNL4mQQUQp66GMCsmbWmOO23LcGIsUWZY/aF4UtlBUdLYmTIg
	cr9re7gHw/AbbtLgZzcF0A1sT1o+7no=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-TB1nIInCNpKQq7LxY2Kdiw-1; Sat, 29 Jun 2024 09:36:59 -0400
X-MC-Unique: TB1nIInCNpKQq7LxY2Kdiw-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-79d588000e4so234948385a.1
        for <cti-tac@lists.linuxfoundation.org>; Sat, 29 Jun 2024 06:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719668218; x=1720273018;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dE9U35a3GFV84DE7uyjbmdmgDkUdNbfTc4Y8QV/XYAM=;
        b=Zw6FNa+rE7c1hPZSWaaMOWfC9V4YrMMoYovITMg/eXeVwdYhAFWeW4PhZdF975MhK4
         zHkGcVUC9TmNLBfxJOG5O/vIwwUvAmRXsfMX9ZTUD9Rmg2UNBEjzrneCnbOgRI9fE0aa
         FYyKiDVdFf5Dlkn0VmBz5CZ8nRoqQ1G4a+ipIdmyDjpeK7Z2zpPF3lB9FK5bbADmca80
         L6SaOXVVkVdKgCBV20uAVSmO4stlKPR3+M2HTW2CLc2fTPTcrgM/kvLBflG7VC17IiZ7
         m/fv5RcKH22sJnxuIFpBA9HjMDULUeC5zqE81cwnyy3uVCsjZdWZIkHYUuOyDzsPQl+X
         W98Q==
X-Gm-Message-State: AOJu0Yxht/RcXF2x8TFT8elUEn8xBfjBzHMN3LQHJkoIxnNEQc8W1hO6
	6KLZybwUC/adZyAnM2EK/0mGLUVsaWGN8SbC6lCooVoF9PGVcXELeoUUMCNgDepay6odH9Y2hoI
	Abo16AayWmr9APCeWduJxRY+E7PXQY9iOjzm0njkee8rOqKY1wEN4ID7Wlr4EOHudIHHl
X-Received: by 2002:a05:620a:4087:b0:79d:7014:920e with SMTP id af79cd13be357-79d7b97b11dmr149955185a.7.1719668218596;
        Sat, 29 Jun 2024 06:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOrC45vCR2fU6dgDoKlPkVgba4K0jcQyGvc/oN8iX4ZI2LdFRg6Cr6n3mQWbX3drcjatLFkg==
X-Received: by 2002:a05:620a:4087:b0:79d:7014:920e with SMTP id af79cd13be357-79d7b97b11dmr149953685a.7.1719668218268;
        Sat, 29 Jun 2024 06:36:58 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79d692f0bcasm162357085a.80.2024.06.29.06.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 06:36:57 -0700 (PDT)
Message-ID: <c1362537-eab6-4da0-b26b-3dc40293c223@redhat.com>
Date: Sat, 29 Jun 2024 09:36:56 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CTI TAC Meeting Notes 2024-06-26
To: "Frank Ch. Eigler" <fche@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
References: <a1e31779-b3c3-4016-ae69-27aced5971e9@redhat.com>
 <20240627142532.GA2948@redhat.com>
 <587b16a0-1cc9-4987-a36e-f4f3306aa14b@redhat.com>
 <20240628220047.GB15310@redhat.com>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
In-Reply-To: <20240628220047.GB15310@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/28/24 6:00 PM, Frank Ch. Eigler wrote:
> Hi -
> 
>>> Given that the routing issues mentioned were upstream of the
>>> colocation facility itself, effective improvements in failover would
>>> have to work in a cross-colo way.  Is the intent to have
>>> failover-capable servers in multiple colo facilities?
>>
>> Yes, correct, as noted in the just published SOW:
>> https://lore.kernel.org/cti-tac/2186f48a-12cd-4630-8944-26b9042e924a@redhat.com/T/#u
> 
> Can you point out where that is spelled out?  I see "it will be
> deployed within a single public cloud environment", and am missing 
> a part which talks about replication of git etc. across multiple
> colocation facilities.  (e.g., as far as I'm aware, grokmirror git
> replicas are read-only.)

Sorry, perhaps I misunderstood your question.

Are you asking if we will have authenticated 'git push' capabilities across
multiple co-location facilities?

-- 
Cheers,
Carlos.

