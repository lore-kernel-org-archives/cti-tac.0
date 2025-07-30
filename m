Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F6F2DCC1B
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Jul 2025 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753889097; cv=none; b=QCsbVpQ/Xsrn5nTfD/M5HSWllMkhPUbXujY6M2OtQVal5oqhXWFJ7KS0XAVkBDjiZnXLpZ++rTwyDaz8kgQ2kQW8A+G0bsOCbtrc3aIE+3mNf7EkMQHNXb9k/SKo1uFk3JdQ8AFyovvHv6eDowYCN8li9iLdqKAEIkLeps+9vwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753889097; c=relaxed/simple;
	bh=ps9drP7zBWNNzE0jgOr6R5n9aj9KLWhzJYozL/ebywk=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=Stu6t3v5q8mnGV+RZJLhYqUGv0sFxhl6G85lzW6qvAUjJggwxnbFetJ0zwvfJvBqEajZ8ctlughgCNTuZnoGt4i/AIOM+RlykBvi/WD1Laz0rwfSIjsJXFhl/4mScH2gt26QJrv57i8zHZ/1DuApKMc67mPx3l4IimkxuK31EsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KhxViqU8; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KhxViqU8"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 985B1613D3
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Jul 2025 15:24:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KkftuT1Jzx_U for <cti-tac@lists.linuxfoundation.org>;
 Wed, 30 Jul 2025 15:24:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CF14760FCA
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF14760FCA
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KhxViqU8
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CF14760FCA
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Jul 2025 15:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753889093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=bConGOis7uOein/gLnhuHOusnhMKA+eBToPsVpBTFX0=;
	b=KhxViqU8dl992WUAk1XPfB+Y8u4d7s8hTWkWETsAXieKfTGf1NeUrh7CyQukLdu8zbCMcd
	LEty6qp4Kcmf/9Xzj9RUP/lEWl/7+pRceeG34j3nuambjKVrWN4Pkw+nQOsBoBX2rzEhWW
	/1ncloiea1VB3i47uQN7T2jkkNF243Y=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-H1cNUFJ0Ma6szrjZw-2cog-1; Wed, 30 Jul 2025 11:24:52 -0400
X-MC-Unique: H1cNUFJ0Ma6szrjZw-2cog-1
X-Mimecast-MFC-AGG-ID: H1cNUFJ0Ma6szrjZw-2cog_1753889091
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e350826d99so1265262085a.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Jul 2025 08:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753889091; x=1754493891;
        h=content-transfer-encoding:organization:autocrypt:subject:to
         :content-language:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bConGOis7uOein/gLnhuHOusnhMKA+eBToPsVpBTFX0=;
        b=MGok0f4oh36xN+f7spTAmDlIjmvJYiy1Y4d8aVS3BZnJGVglDlhlXZo6XA4XaruQZ1
         9c/uNcc6bm4dSGBpMDXIXhvetnxo1m/5HAADRGlAR+vLr+JW7LIe4l3RNW+Q8zZq2pPj
         99EK1XvUWbzvdxX/AONAoBhgOPqnOSHuKFlPGsZiH08SQimgo2EEMUb6kC2OftRDV8t3
         5JD/QKFfLMr3JJLVvJwHpbxO3f5G95Cw1qlhZXn9s6h6ikzu1qT2w4+5ASLkhmFM6HQU
         LKh/B/8nBnJgtfqoAKkZeobgQo3LeSwIDnoP/cu44h91rrlWpS4o1n9nEp/hVj1iT9sU
         0L5w==
X-Gm-Message-State: AOJu0Yw0F8yWZ7MDGmgAaK/BkHgdYvABB3Wl7fM1Cg39DmS9q8sy2Eqr
	BV1UJnrVvulNpO/vl6Z16rvDl99d4jTCY+DLPHZGHHoXIW4SgEpI2pDeO+3ZlW887qmHdH0B/aF
	b9unMPA82AQkLNckd7TiO02lYnkPs6nXqQAlCiTyagfdN75XQ0+2jRUTfQg+4KEu7xApL0u97v4
	TcWSKnFP8F8k0dOGkfIAsTzAts9wUXhPU6iL5yqDVYRaCfD2mjCSd8gw==
X-Gm-Gg: ASbGncsye9lPvkNj5Pn5etYH4c73BlCQw//N8YlZKN9x5A7fuNLLUSkXaYyJYGAZ2ko
	JI7gD3+imLin69o1XUuMMT4UCBjw4FS64YCUpIY2dIUSIFaAj/P927nnMfjJC8JSDgso3737JK3
	2DkZ2y0pni1l901jLsAG4T0o1P+kTPL10F6jYP4LkIHRASocXNSvCZiDDk5VHqJJmpjqu+1S5SR
	5/0upvQ51i93qrMc7lqot6E7dX1nNc9SrLjnba/Si4hKR4akDCxjXY3ZejtvVQeQ9ERGnwTG9Cr
	ndfWK8LswbhK/jltqhcuvqMqSOAx9zPLtH4OEDh5
X-Received: by 2002:a05:620a:a91b:b0:7e6:20e0:f932 with SMTP id af79cd13be357-7e66ef93d75mr504810585a.7.1753889091373;
        Wed, 30 Jul 2025 08:24:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdxHqBlECwSBA+J/hUiH3T7PDmJ1aSKQvgPs46vrcxH90CkaGOBU3s+C+ARIjVBebW33gSPQ==
X-Received: by 2002:a05:620a:a91b:b0:7e6:20e0:f932 with SMTP id af79cd13be357-7e66ef93d75mr504804885a.7.1753889090739;
        Wed, 30 Jul 2025 08:24:50 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e643898ea7sm589105685a.79.2025.07.30.08.24.49
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 08:24:49 -0700 (PDT)
Message-ID: <1147e939-c6f0-4ae5-a0e0-a38fc05455e2@redhat.com>
Date: Wed, 30 Jul 2025 11:24:49 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Subject: CTI TAC Meeting Notes 2025-07-30
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 m/A+1AHg4g==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5FIx1r4Cii6bu1sTV2T76EaTAOiTTtNJX644VVt4FFc_1753889091
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

​CTI TAC Meeting Notes 2025-07-30

Present:
    * Carlos O'Donell
    * David Edelsohn
    * Kris Borchers (OpenSSF)
    * Josepy Myers
Regrets:
    * Siddhesh Poyarekar
    
Agenda:
  * [codonell] Published the charter, which answers questions.
  * [codonell] Posted direct questions to Mark (Sourceware) around funding.
  * [codonell] Note that OSUOSL has asked for funding from Sourceware.
   * [codonell] I have asked for costs and budget.
   * [david] This aligns with recent changes to OSUOSL.
  * [codonell] What are my next steps? What steps can I take to raise the issue with the FSF?
  * [joseph] We need to be following the GNU Ethical respository hosting criteria.
Next steps:
  * [codonell] Need to post an update to the CTI website around the SSDLC work.
  * [codonell] Post this week (2025-08-01) a post about governance and infrastructure.
  * [codonell] Write up a CY25Q3-early update around infrastructure.

-- 
Cheers,
Carlos.

