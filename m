Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE446BA53
	for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Mar 2025 13:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821214; cv=none; b=ba+WY9Gzm7pUtuuDuCH6K6Tq65ZEJpLjgn4fUC8C5SZslZAqq2/GmTSwN4Tq8FVBsZaMKZynYKTElc6NfqqL4z0N/rUiYzLZfGonrcZ8sEhYTRzly6698cVMQ9xaDlEB1ja0YcN5M5M/LR9/SfqIn96vhBTFc4YS103hLLtgYrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821214; c=relaxed/simple;
	bh=taWPKzrzPPWwWWUyXk7Jrm0LLMk+CPdi72HjO8XYSQM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=sJq2lKmEwsvONTWKAj38U3JpKuylSnJecUXjZMNr8BkmyK47Zuh28oFy+XkE1sIv8bvtXaLXFzDVsZMaJz/DeQG7qIPMC+ur4NtGBzbBKoOYZ0JdBU8TCqe787d2WY6ZdMUD1mMMleFJ1xOcAQlyMqcMmLJ+CUthFXK+hNLQfj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ByluVXWc; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ByluVXWc"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C083410FB
	for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Mar 2025 13:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbVP0iqWv600 for <cti-tac@lists.linuxfoundation.org>;
 Mon, 24 Mar 2025 13:00:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B3AEB410F4
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3AEB410F4
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ByluVXWc
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B3AEB410F4
	for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Mar 2025 13:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742821209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=Xz++u+Ymc2S8iXgfw2VO6glsltt1/P4uR6OurT0s/Bc=;
	b=ByluVXWcAiyYJIWU0kIbiJhzGOJkTcwgLjOM1W+0hnP5N+HW/cGEMYvVM4ohnz/BVK5UZE
	UE26FBde6nu8p1uODX+jSgpbEhA0KW4fHw722NBFsy77Q8Nnp2HJdy58x9F1xSH4fanuxo
	rJhXACrkDN1hYJyNxoKk43xlzVrrucc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-z5qk3jbGP9Kf1YQBFvFf3Q-1; Mon, 24 Mar 2025 09:00:07 -0400
X-MC-Unique: z5qk3jbGP9Kf1YQBFvFf3Q-1
X-Mimecast-MFC-AGG-ID: z5qk3jbGP9Kf1YQBFvFf3Q_1742821207
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f6443ed5so91914966d6.1
        for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Mar 2025 06:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742821207; x=1743426007;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz++u+Ymc2S8iXgfw2VO6glsltt1/P4uR6OurT0s/Bc=;
        b=s7hXwgm0CqHR3jvUgHd01GU5scfmO+cXl3YnJaV962idr0VLcfGs5e0pHarY8Ibjw/
         Lx/3LEFqaI9GqZH6nNgVqhHQit8GbKbcb/9xgfptzcEPxRWJDn1Ei83HknpDqaaUHLLk
         98P1f/wrqYVqwb7g0ArHgUCPHqF8VBhrfhmxQ14/M1I+eEo8zJs98UcXVh9mDVQLA+nv
         p0J0Ki+FWROwiQAN2ECUfzF+u7zK3xfh82MAHwooVAqRwVseIMrMJSnT4vXacm3wtwJZ
         rcYKaURYmst43Kq3qulYz/tVaJ1Awbqnrt6lWSe7PgJu1mTeyr1AA1dG+AuHvNcnMyO7
         prRg==
X-Gm-Message-State: AOJu0YwiJxFaUO1u+CGxncLa3vPV+XHOxdzzVAfMHAK4f/smI5fS6uxn
	83qcyun+dChZzlbLnhtE9xbuVbOuBmKA/I5ikZSPFr9VH7NgqxKpXHAh6WvF0YwnNmLA163ua/9
	OwEF+BdGCcoVCu5OI7z3q8DdfBMSPzXoSXqewHinEcsBdkJY7qF2Poi2wmRVqxwp8NxsrO+N6KY
	5YNR0SY/J0jVANnSCdCbUgSizJaa5Ne02FJJWBEBNN7vymkM+dmg==
X-Gm-Gg: ASbGncv0CUXTqQL/aKRW04GLYTrPsbptwdYHPm2o0aoPgM/Pn7aXV5EXValNzF84LE8
	IVauBb0S3D6bB38itK6ej0PAAiia8nT9vekICtWQD40p/gJyiM8BgYhytVLh4zK/FAMubvs8IbZ
	Du+cphphwVYG49yTzFwzsKLOhBmWBB697y71sd6Dvq0xPBam7+yxqk7eX/3nnEHmWJNHgmFHkbG
	wPAKpzrKUPRJuhYM4GK2I1Fo+vOtXL0M9O3itC9izoXDsMKXVMMaqkWeL+fZ5baC8iGC0IXjfqM
	pVpcINDyi6uRKtUP
X-Received: by 2002:ad4:5ae3:0:b0:6eb:2e9e:74ec with SMTP id 6a1803df08f44-6eb3f0a6b8dmr213378346d6.8.1742821206478;
        Mon, 24 Mar 2025 06:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/8cHvJVLCkRZBJfhnN+aDpJn3bSzSUw4CrdUoKGc6au6yRj0kEmqJ24dlBsrEo9Y/sK3/6w==
X-Received: by 2002:ad4:5ae3:0:b0:6eb:2e9e:74ec with SMTP id 6a1803df08f44-6eb3f0a6b8dmr213376626d6.8.1742821205129;
        Mon, 24 Mar 2025 06:00:05 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3ef1f5eesm44509406d6.28.2025.03.24.06.00.04
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 06:00:04 -0700 (PDT)
Message-ID: <97e68d3e-7919-4a56-aec3-9b29bdfba9e9@redhat.com>
Date: Mon, 24 Mar 2025 09:00:02 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: glibc status update - Week ending Feb 28th
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cMdv3Urh8tSytQ5G8le-BsE59Ke104CrjCEzKnyRhnw_1742821207
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Current status looks like this:

https://sourceware.org/glibc/wiki/CTI
https://sourceware.org/glibc/wiki/CTI/Policy/glibc

- Reviewed GNU Maintainers guide.
- Reviewed GNU Savannah guide and implementation.
   - Added column since we also need to express our requirements
     for Savannah since it contains data for the projects.
- Wrote high level "Define security requirements for development (PO.1)"

-- 
Cheers,
Carlos.

