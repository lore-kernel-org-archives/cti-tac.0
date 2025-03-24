Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BADBA53
	for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Mar 2025 13:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821224; cv=none; b=FCorgtTlEhQ8NuzxAYD72P4H5IPHen833IzF30e0zYvm8y4puWmQ8pmqvX/r00TqPhnPStBGwMWcHyyxsnHMqeQ0mcix51D35knSkvGAjb63wgRie+3yXO17maCRigkn1B0DKRmILAGIUf2oTKFjY4/ELG36LK5SLlAObk0SRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821224; c=relaxed/simple;
	bh=liU5AZQvclLCmSiWeZ2CSqI07HqRxhTH4HCrW8NvXUs=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Mdyg9qnItyZkE52r8fw1eXuYUZejhNHc5yStosbN+yEBor57AYWgxfIsOYzU9hu4onabpi9iI+peA2YZ8DpIgwKk9s3Jjrq5Rubxtis/hR04Rl7zWkfZ3hzAqZMHYmsxVhKUb0fGgc4IoLk2OiiAHqWZ4vbBGBYqyi5Ra8QkZAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WapeR0bl; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WapeR0bl"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE88D60AE8
	for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Mar 2025 13:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MoxRJggn-Wz9 for <cti-tac@lists.linuxfoundation.org>;
 Mon, 24 Mar 2025 13:00:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B49BF60BCF
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B49BF60BCF
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WapeR0bl
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B49BF60BCF
	for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Mar 2025 13:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742821220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=gd0WGflL3Kwvc1UGZ8Pcs+oJ3h5xSLNTv2bRvXpV/PI=;
	b=WapeR0blJD5Wx6YGXGJFRQw6i6HlZiubD5U3TsjXizu85LuLkryCqD23Ns7YPZNZMCo110
	yOM4vmkfGLn6VE8XRPjwORD95NZZGzS4biBlUYFwuWn0FSXIln6ugD+czHFq2nd/NJYXMT
	3FviZqGHFh6tNnKAS3hb5fhJArPeruw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-sTRQAEwUO4GG1cGV8YGlZA-1; Mon, 24 Mar 2025 09:00:19 -0400
X-MC-Unique: sTRQAEwUO4GG1cGV8YGlZA-1
X-Mimecast-MFC-AGG-ID: sTRQAEwUO4GG1cGV8YGlZA_1742821219
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f6443ed5so91922436d6.1
        for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Mar 2025 06:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742821218; x=1743426018;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gd0WGflL3Kwvc1UGZ8Pcs+oJ3h5xSLNTv2bRvXpV/PI=;
        b=tO1eYPR5krFs++UBNwfkd477TCztPVDyTByJtsZhYVLK4cbiWLqHcydfkmmcIk29wV
         SsDQXeYBRasR/DpqSwBoPtCUXYs4OagEF8VFUOLl4vunjoZqZdB0TD8owV8V7IjN5bvT
         xaB1UGt460ITMCNBHgXCfwH41CAvlohRvHyZAPzyTb6ARzF6PYwyB3Mqs5B1Buwj/eg+
         51eZz59vfu6S54RB/aYelYudfDW9aFi6dTnOCaAizlC4QKtmH8YV+e2yDhkuYuxKppyq
         p498m9hDPeGMs9QY08F/t6tQ5QjIOx19yOq8swTXxwNOUHkapvzkBVBgeRHg4CohP6Ff
         P2pw==
X-Gm-Message-State: AOJu0YxNgPPkZqudPVFQBKm1qfcu6+KARRvSR4Ck7sNroYRKOympN3G3
	wjvkynALBvRArEwIefOw5mdAnXit+tqWeQaLCv531VxLD6bNQImh91ulu1uWbqN+mqtLPvhgJBJ
	fhrzwRC/In03JN7v1Pof+8VgFwZWMZzinR21HvsIhMnuPEFozXqqk1RaD2pN/v2KQk5Eq012u63
	+thl+d4Nd7+77s5ZzCkmdMG1wO2VcVAo80hNPhpUkwtihXAxuodg==
X-Gm-Gg: ASbGncsdUsWmXO2ASH7Wg3eTE91i6hvjbVRAEdoBYv4u7J80ONitwpCGVmoKpW+FBZ/
	yanSyrREonO9ri9R9njNs4ER6qF24/a5FmSZAl7Q5abTc45w8B0pwF7k4SoMPhdDzI6MPo7XbDz
	Zert5HKTLdPbgMbizKj6iUQQlpYdFZE/Z3xVZQsFf7XiPVPDAZNQhyGXMtmRrvrui3imLDRAgS2
	tM8x4vFtAocX5J0BgRK+tfE9fI5eZyBnV4NCrFgr2NHSquDvobB7nL7N2PlDXKoi2KWx61/NXWL
	R0BHUtEkKqXLBu7X
X-Received: by 2002:a05:6214:226f:b0:6d8:b733:47c with SMTP id 6a1803df08f44-6eb3f187d4dmr220310526d6.22.1742821218259;
        Mon, 24 Mar 2025 06:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+YzKOLQo562SEYaNpN+7DpTv08Df7l0dYrfSiVH8HFAUVY3DdHYt723bmbwooDU5VlRgdKA==
X-Received: by 2002:a05:6214:226f:b0:6d8:b733:47c with SMTP id 6a1803df08f44-6eb3f187d4dmr220308886d6.22.1742821217416;
        Mon, 24 Mar 2025 06:00:17 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3ef1f5eesm44509406d6.28.2025.03.24.06.00.16
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 06:00:16 -0700 (PDT)
Message-ID: <5150a8bf-c88c-4128-8a41-e63da2e580f4@redhat.com>
Date: Mon, 24 Mar 2025 09:00:15 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: glibc status update - Week ending March 14th
Autocrypt: addr=carlos@redhat.com; keydata=
 xsFNBFef5BoBEACvJ15QMMZh4stKHbz0rs78XsOdxuug37dumTx6ngrDCwZ61k7nHQ+uxLuo
 QvLSc6YJGBEfiNFbs1hvhRFNR7xJbzRYmin7kJZZ/06fH2cgTkQhN0mRBP8KsKKT+7SvvBL7
 85ZfAhArWf5m5Tl0CktZ8yoG8g9dM4SgdvdSdzZUaWBVHc6TjdAb9YEQ1/jpyfHsQp+PWLuQ
 ZI8nZUm+I3IBDLkbbuJVQklKzpT1b8yxVSsHCyIPFRqDDUjPL5G4WnUVy529OzfrciBvHdxG
 sYYDV8FX7fv6V/S3eL6qmZbObivIbLD2NbeDqw6vNpr+aehEwgwNbMVuVfH1PVHJV8Qkgxg4
 PqPgQC7GbIhxxYroGbLJCQ41j25M+oqCO/XW/FUu/9x0vY5w0RsZFhlmSP5lBDcaiy3SUgp3
 MSTePGuxpPlLVMePxKvabSS7EErLKlrAEmDgnUYYdPqGCefA+5N9Rn2JPfP7SoQEp2pHhEyM
 6Xg9x7TJ+JNuDowQCgwussmeDt2ZUeMl3s1f6/XePfTd3l8c8Yn5Fc8reRa28dFANU6oXiZf
 7/h3iQXPg81BsLMJK3aA/nyajRrNxL8dHIx7BjKX0/gxpOozlUHZHl73KhAvrBRaqLrr2tIP
 LkKrf3d7wdz4llg4NAGIU4ERdTTne1QAwS6x2tNa9GO9tXGPawARAQABzSpDYXJsb3MgTydE
 b25lbGwgKFdvcmspIDxjYXJsb3NAcmVkaGF0LmNvbT7CwZUEEwEIAD8CGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEEcnNUKzmWLfeymZMUFnkrTqJTQPgFAmagDwgFCRDhXm4ACgkQ
 FnkrTqJTQPgLlw/+JD7l4tj8l8hAMUlszrlIT6IhKSODzjrGO+6d9Y6T9vyE2kk4Xbn+kdJf
 uBl+wj2+U15MsQe9Z4RwowIB3YHHXgj53M2OjqOAY/sRWXZVDfmVj03hqW8D7zFxjc0SZ9cI
 TI0MwrDWc+Fr3naXeo7HhgjUmULfPndxb8NHVV4Ds2DTkZoUMwB8l3dboD+nKi5GbfVBf3Q5
 cBw0CPkxPl0hxD9sr5IMgWIKVLtvztMIXv2xWAavqk8pQjk0zCYd46GcA8d9pZuac24e9NbM
 ZzTxu6cP0sKhub1JFIadyBHtJnEV/8Auc8nXJ63QY3h0QVCJYV35gQeejEdMD94in2XTkxk0
 A/xCp32bmSZv5flsmdAIv5LK4jTKLvzd6BSy/v7qlpgQ7sNaxQ/JRd+8YuBIiUVIp/kgGezD
 qtGZSpvPCFuG3LxsdvAu7JAzBY3sfBd2lSGOeHX/JK0nQ6s97j4HlSuXIabSOdsCI5UGSOq5
 thbIqfK3ewUSUB0yGvWf7EyuZugtCZOaFGpvcT3ix9/sP1fTRlJl+bNjMcO8GwedDoy85oeg
 yLCEV9gejCr+NijLfPYtb1s8o0hYu13uBojFyBv+bkUI5hTQaVLacq7VglA/QLOy/3mtM2v5
 4OEotiNXbKypHFKnoks/MFpP4xdwxGX5jU4MgFg80aPFGr0oZVXOwU0EV5/kGgEQAKvTJke+
 QSjATmz11ALKle/SSEpUwL5QOpt3xomEATcYAamww0HADfGTKdUR+aWgOK3vqu6Sicr1zbuZ
 jHCs2GaIgRoqh1HKVgCmaJYjizvidHluqrox6qqc9PG0bWb0f5xGQw+X2z+bEinzv4qaep1G
 1OuYgvG49OpHTgZMiJq9ncHCxkD2VEJKgMywGJ4Agdl+NWVn0T7w6J+/5QmBIE8hh4NzpYfr
 xzWCJ9iZ3skG4zBGB4YEacc3+oeEoybc10h6tqhQNrtIiSRJH+SUJvOiNH8oMXPLAjfFVy3d
 4BOgyxJhE0UhmQIQHMJxCBw81fQD10d0dcru0rAIEldEpt2UXqOr0rOALDievMF/2BKQiOA7
 PbMC3/dwuNHDlClQzdjil8O7UsIgf3IMFaIbQoUEvjlgf5cm9a94gWABcfI1xadAq9vcIB5v
 +9fM71xDgdELnZThTd8LByrG99ExVMcG2PZYXJllVDQDZqYA1PjD9e0yHq5whJi3BrZgwDaL
 5vYZEb1EMyH+BQLO3Zw/Caj8W6mooGHgNveRQ1g9FYn3NUp7UvS22Zt/KW4pCpbgkQZefxup
 KO6QVNwwggV44cTQ37z5onGbNPD8+2k2mmC0OEtGBkj+VH39tRk+uLOcuXlGNSVk3xOyxni0
 Nk9M0GvTvPKoah9gkvL/+AofN/31ABEBAAHCwXwEGAEIACYCGwwWIQRyc1QrOZYt97KZkxQW
 eStOolNA+AUCZqAPEAUJEOFedgAKCRAWeStOolNA+D38D/9WnZY9fUmPhZVwpDnhIXvlXgqX
 cspZJEBWNS5ArFn8CLcje7z9hzX3+86lqkEeohTmlgtTg4ctZzM+XKyWSiqHCRCR+FX5SKaa
 1VveBtwvjTSVmtV1m0rNHEvUZ5x47A8NadWqYi6uOQ22FhEqUOiwJ7EHzk4w9W3gT1913XT1
 vmkCn6FtQcrQvJT7pP+oA0YIVs8ADayJcqWHM+Ez7L2fpfAzBDhIS7dq2MYU8LQOQAsx1y7H
 6njp5dN/OI/aN/RL6XeX1Kxl4Xe+hc+tq457fLAUnmaevUldvKThuj+5/Cd4DW25MxaqinfY
 m/U6pBQ4ZwQPGWA0f+GKiJcLosSRXxIuEdZAl82ht+KgT3zhV/BvQRmrD6wX3ywPkJap8h4K
 ibwz3r6NbHKdCX22ok58oE8NAWtmTRTKXDhh8oWOKdIYjX6jJzdb/F8rPNoEY3UiYbaNTxt5
 TE9VD+yWilYO796HMXjXenCOlghy3HFmZbsQ4N+FlG6LQD7cnwm56kcrJk1IlnQXOSOd2BA2
 qNbM1Ohry3B+1F4Oaee+ZKH2C5y7Kx0y3m1b5X7Wpx76H5BeUAp6dQi6nNYeqM9PglZIMvSe
 O4uRThl5mMDx8MXQz6M9qQ5anYwre+/TudTfCzcTpgXod1wEqi2ErJ5jNgh18DRlSQ3tbDvG
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: co997uryVwpH7A4xWVzzBIYd_ty6sOCmrY00QKc7H_Y_1742821219
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Current status looks like this:

https://sourceware.org/glibc/wiki/CTI
https://sourceware.org/glibc/wiki/CTI/Policy/glibc

- No progress.
- On vacation for March break with the kids. Back on the 24th.
- Will add extra hours on the week of the 28th to catch up before our meeting on the 26th.

-- 
Cheers,
Carlos.

