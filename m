Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148881F03C5
	for <cti-tac@lists.linuxfoundation.org>; Tue,  2 Dec 2025 16:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764693575; cv=none; b=RpBR9zKTlZvZlo0Cu2xqBZmyCDCOZulmd/KV9SzfdMzsxrhdSFSBlGjM3DhSoIAGF3o03KOa55u8u9tQj5hCrja8Iv4BjUPlSFTfuLVdL46Y2PALTapdtyKOiAIKnT2BtxJWj2Hk9gemNF812bgQNkQ6DfdQjAuhbaE+g4KWbNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764693575; c=relaxed/simple;
	bh=kv/gjA5XuFrsQmvEWLVySiylju7uOmwLlUzuku72C9w=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=qDoaK6DjKD8DPhdlh45z0gigsk1NOkiD3PE3KgLjegtf+MfeW70S0p8lju5N1PsAmjlSWqJ7zJRws/C1c0J37dH5GDbX65G6PlovlxgBjVg6DI0cZwwiEA5YfWQOsUy7k8CTPCoFYWXLDdsjiFKEHx0UferbMrBQNTvXuDSG7xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DiaGpHAT; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DiaGpHAT"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8481E611AD
	for <cti-tac@lists.linuxfoundation.org>; Tue,  2 Dec 2025 16:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9Mii1IqX8fx for <cti-tac@lists.linuxfoundation.org>;
 Tue,  2 Dec 2025 16:39:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72AA860F6B
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72AA860F6B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DiaGpHAT
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 72AA860F6B
	for <cti-tac@lists.linuxfoundation.org>; Tue,  2 Dec 2025 16:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764693571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=LACHLZWKU29lYYAp+zx2m4wbkCUQ0FkhL3omMZxBxVc=;
	b=DiaGpHATUSpaa5anIPf7mRmS/+gzrKXHRWbG4t0X5pINPqgJHWNgbYvqb29rnF6SIBYSJ7
	IQX7QSdOoelHz+J0ioQ8vmH/1SWM6y6eR/0SO7TG3IOBH0O5ILsz54gnGjWMW3vwaALCul
	0pOYXzoIEKp43DXu45loF2UB4u++fQg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-KySwnSgLN1yDhpX5IRZgAw-1; Tue, 02 Dec 2025 11:39:26 -0500
X-MC-Unique: KySwnSgLN1yDhpX5IRZgAw-1
X-Mimecast-MFC-AGG-ID: KySwnSgLN1yDhpX5IRZgAw_1764693566
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b19a112b75so300627685a.1
        for <cti-tac@lists.linuxfoundation.org>; Tue, 02 Dec 2025 08:39:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764693566; x=1765298366;
        h=content-transfer-encoding:organization:autocrypt:subject:to
         :content-language:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LACHLZWKU29lYYAp+zx2m4wbkCUQ0FkhL3omMZxBxVc=;
        b=YmLB9J4YWHLApnNJibQDc0gH5UTto4XdRZI4pkuL/GLIi4T6B2kUobO/z/XB6Uw6KQ
         wTPB8jU+6Ei/SQptz6tf4ii8i9QLv/6lD4PqCtjrq0ZklWFFAvwPmVuM81OWULdLp/Gy
         bARy4/vvpgsHxOIcVnuNEYjf8z+76hg2scPiBxYF/8rR3gFvAk7JlCAHwMzm/LqpP4Ah
         fG09nfPnGYSuuMmI4Ak3SLB/3s8v9rwZOnKQh5fJSg4yt+3aUXT3PSpi8KjgOq+0loU/
         cZRcGP3jE9CRL61h54icTMG0ng8Pis7FfZSGdalXtwwaosZib/ANRxYFCexW8XfT70Jc
         qxmQ==
X-Gm-Message-State: AOJu0Yzn8SC5nf7cvmdsmhnYRKdXL1oEwYUC6B24j+mTWAHfCVLhWaPA
	4DiZFP/EtBnTkiBOoIBuxZoToEfy6kUSbqIa/LsS9erz5WfLHC4YXcHlEgEXm0HU2kE8mwHm/MI
	AJ+9zvMQbMUvc704Y2UDCyEUWZuSmZMoqkNXhJV4qlx3TGjWDpS8lsBcbpWLXg9ecQEYjpMaXHh
	iJt/ewHdsMMVGog+D2dVDXZg1CBYTcttQhiPFZYqoOWBUkXWNeXLTu3A==
X-Gm-Gg: ASbGncs+SN7szLPgbAAGUUVUjRhMLsLqjt8TlR+hK3NupClsGrnKgCY2VWEiwNFDc9z
	dj5sSAy/9hR00INL56LR2pB1hewJ11l8i89rvE6oDtlx0ZZB/bw5Zfi2FFyDaXGqH5pphU9ICx5
	uUJKxwPSnmoRgUwpjDRNNLPQGY/WHceljv7foNHtRAvqrqdBCrZkKV5JY/L+4Okry1fQ5a65cM4
	d5OTWA8kzYjaTSMn2s7p6UikUapvAaiwRfjtIig2lVwR+OR3HOdOMNQH+PgUtLJfTYrWIIpWkf2
	94uv5rHrl6YXy/OODkcMQ0toxiWeEyVpKxV1+BGHUz+Oscn2mx6t0gDgBeurz/I5c98hJhBtFZn
	VdDRYJto3vN4=
X-Received: by 2002:a05:620a:4007:b0:8b2:f145:7f2e with SMTP id af79cd13be357-8b33d4adb17mr6011585585a.77.1764693565801;
        Tue, 02 Dec 2025 08:39:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3U8/SYO63tFLEOWwXSyIrzid+THoFCxXeKcILcyDSeL5KhlHV7Ll3knm5yL27Kmte1qssNQ==
X-Received: by 2002:a05:620a:4007:b0:8b2:f145:7f2e with SMTP id af79cd13be357-8b33d4adb17mr6011578585a.77.1764693565221;
        Tue, 02 Dec 2025 08:39:25 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b52a1c90f4sm1109965185a.41.2025.12.02.08.39.24
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 08:39:24 -0800 (PST)
Message-ID: <bc3aaff6-fa14-4b0d-8b4b-99e7c4461eba@redhat.com>
Date: Tue, 2 Dec 2025 11:39:23 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Subject: FYI, Posted on "glibc SDDLC: Review git to gitolite transition and
 access policy..."
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 m/A+1AHg4g==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xPQKDWdu_cbwuUYhUF-i2WToJG5ouZGCch-0nbqG57g_1764693566
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Posted my update on the glibc work to go from git to gitolite:
https://inbox.sourceware.org/libc-alpha/c580762f-db94-4b05-9b00-30b128b35bbe@redhat.com/T/#u

tl;dr

Propose removing access to 94 keys, improved observability over who has access, and finer grained ACLs.

Note: Moving to CTI for infrastructure (LF IT) would accelerate this work.

-- 
Cheers,
Carlos.

