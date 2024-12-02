Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2C61D8DFE
	for <cti-tac@lists.linuxfoundation.org>; Mon,  2 Dec 2024 20:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733170176; cv=none; b=WEXhQBif9X/cBVWORd7BN61Hu9bZGooQ32O5zZ7C2WPzXO5kqcsvtgiRDGB3Q/zNbk3NVRVbXfbyQnq9Yxbo/j44RdHeUkOmrIqH+fCd2TiOF0VKdbisqXevMPNL06zYISxS/w+5zCfjfsweRv7gX1FDyW36bGNiAd/L1o4pN0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733170176; c=relaxed/simple;
	bh=XEjIhRcvMTiMKv4WKuGRu0coVPNanHjHdwLpTgvBhTo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=N3YrpBf/JELoguxwaeGJAsXDpidsIgpXneUzc1nLOgj4yQpN6OMtBT+zK7FDucMi/ysfsRo6FD1s1JyvzZe1bWrROa53Ya0OqrLTXa2hkwWUXpFlXeKkiMBvwVYkcHX3yUSrpjVXdt3Vlr2slXLqpZgydwgdXoOJPUJOhX39RAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZH5xiSBr; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZH5xiSBr"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C733D4054B
	for <cti-tac@lists.linuxfoundation.org>; Mon,  2 Dec 2024 20:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Di_on69J16oP for <cti-tac@lists.linuxfoundation.org>;
 Mon,  2 Dec 2024 20:09:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 860FB40558
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 860FB40558
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZH5xiSBr
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 860FB40558
	for <cti-tac@lists.linuxfoundation.org>; Mon,  2 Dec 2024 20:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733170171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=yB00ks6i5VvrQHqxk4BuNj0E4x0hUVfcWNWgQL9v9uU=;
	b=ZH5xiSBrCV3rk6f+L8Aiaayxdcmmy5PLS9nYB3AYWal4WbYHQTZk5vbu1e+uRWqJdeJkyV
	i9LpNRbiykvmMFqsX0tb8xCfuBoMLGQOKoOGwHlwOrZiDOYCbWE3DQeedpdv3Y8VeQ4tad
	9eXWvWWt8OiVMcK8zeC8wtL3cSwE4zk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-h4yT9r5BNsa9hIPz0SST6g-1; Mon, 02 Dec 2024 15:09:30 -0500
X-MC-Unique: h4yT9r5BNsa9hIPz0SST6g-1
X-Mimecast-MFC-AGG-ID: h4yT9r5BNsa9hIPz0SST6g
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b678f64ac9so746463985a.1
        for <cti-tac@lists.linuxfoundation.org>; Mon, 02 Dec 2024 12:09:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733170169; x=1733774969;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yB00ks6i5VvrQHqxk4BuNj0E4x0hUVfcWNWgQL9v9uU=;
        b=w7UzqJm4MtkCu/JmSvmoJAvOZU6dIVQrjUBBRrV6pmM6U9ZS2QVUHk3sQ3VKxIJo+m
         ohMEaEDmuLat+rX/kNh8vwfP4ZPi1X22HjD+AvDMWEIkOm6Rznx0qLnqEPEhC6YAb8s3
         E/PkS2IsdpdsUEOb96aixizSL1fSzxNtVxr1I5WX6CfLjsQnz4Yfi3C00fRWRR1YuLRv
         o3NpV3Txz8/EoPZZivQVL7td50AyDMHV3BdZ+uxjJJ1McRmo2PYSMq1XUrjY+1uQ5Bc3
         ZvISYYMX8LK6x8tT18qX4c4ltGWELXv9eqeq8LFeGlVrfDPhbtKRy8qEVnVwN0MuOnbt
         ClPg==
X-Gm-Message-State: AOJu0Ywg4ApGrBfdHhw0NF0p0e7oTFU/FUQd7Oc1MZLU5R2UHV6dr8Vs
	gin4fwtpppx0/AKA1Og/y40ZHTwcODk8jJjQhPZN6u4+Pw7vgbUh/z+Stvq1nBEsAlhG3MMq/rk
	D5CapuSud7S6grWmfKcda0zvxeMlL5OrVeSewZiE4UaBUvrTUgCMQB2w46mr8Yy49CbLZSzTv7+
	j82QJG5hKWPQfRcYZ+UvzFV2KrpBpsVWZlHFGGMboojLkMq66Gbw==
X-Gm-Gg: ASbGncu3pnnLpm2awhfBNrhHg/7wYKZ9Et5VNH1ZMFEusfLonUvgUet59wZtyHRuwVV
	L8bmvlwzhyqs1nV63+4hzQDrldeagv3Uxbk0sF/k0vVTDwwEgSY+DcEM+2QG48OfcY/7eh9WrTG
	vjpwdfNC9cDOGCe2eM41q/lAPCxI09j8HmGOXVpt/4ieN6NaWLwwImK+o/pCvaJmFHA4Ir6F/Nu
	q7TXWRLNaLkkTBcgxjb65tdyXDwWidbL71xvWlNlUAu9j3X+Ig=
X-Received: by 2002:a05:620a:2915:b0:7a9:a9be:2fc4 with SMTP id af79cd13be357-7b683a8ab98mr3519420085a.29.1733170169523;
        Mon, 02 Dec 2024 12:09:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJbChSN7xGI0ej+fGCGtu/s4c7ZroNKeAhHDTv6cujms73AJ3e1Zmnh3CZD+hyu6uf/h+vcA==
X-Received: by 2002:a05:620a:2915:b0:7a9:a9be:2fc4 with SMTP id af79cd13be357-7b683a8ab98mr3519414985a.29.1733170169055;
        Mon, 02 Dec 2024 12:09:29 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b68492d147sm440962985a.31.2024.12.02.12.09.28
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 12:09:28 -0800 (PST)
Message-ID: <370f83d9-f771-4327-811b-049d74efe0fe@redhat.com>
Date: Mon, 2 Dec 2024 15:09:27 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2024-11-27
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d55w6q0Qit90-OeIMfLl2qL9ncXVol_f0vcQWs6NwCk_1733170170
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

​CTI TAC Meeting Notes 2024-11-27

Present:
 * Carlos O'Donell, Joseph Myers, David Edelsohn.

 Agenda:
 * Carlos: From previous meeting we now have glibc "passing" https://www.bestpractices.dev/en/projects/9644
  * Should discuss silver and gold review from last meeting and if they have infrastructure impact.
  * No binutils, or gdb.
  * Not all items were easy to check off.
 * Carlos: Still writing updates for the glibc community.
  * https://sourceware.org/glibc/wiki/CTI
  * https://sourceware.org/glibc/wiki/CTI/Policy/glibc
 * Questions for the TAC:
  * In writing up the 4 practices as defined in NIST SP 800-281, I naturally get to a place where we must document what it is that we we want from the services e.g. isolated services in distinct VMs that provide freedom from interference with other services. This yields a kind of axiomatic start to the whole process. Is this OK? I will assume it is OK, since we want state of the art secure infrastructure. This requires making some statements on behalf of glibc that we want particular things e.g. bugzilla harmony in a distinct VM.
  * [joseph] We should distinguish from external requirements made by standards such as NIST and how we interpret those requirements.
  * [joseph] Do we have documents we can point to that show that process/cgroup/namespace isolation is insufficient?
  * [carlos] Yes, there are other documents that describe best practices. We could leverage NIST SP 800-207 and ask for best-case zero trust architecture where we don't trust the kernel running hte services just like we would not trust the network. Thus we are asking for VMs for the services.
 * [david] Brainstorm having a discussion with a variety of stakeholders beyond the CTI TAC that can make their support shown. Discuss how that support is shown in various venues e.g. mailing lists, talks, industry meetings, customer meetings etc.
 * Next steps:
  * AI: Carlos to complete and publisize the glibc notes about specific NIST SSDF steps. (in progress)
  * AI: Siddhesh to look at GCC and OpenSSF Best Practices badge and infrastructure requirements. (status?)

-- 
Cheers,
Carlos.

