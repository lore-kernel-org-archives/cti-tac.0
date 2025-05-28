Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF7A1E8332
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 May 2025 19:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462379; cv=none; b=ajmllVWMqp4teYxxGxY8cmJXMD5J3e1IeyYlPZO0iXKXqlZbrQ8nGnDDFWY/JTZpC6GT6dgb3Ymovpnba+PjFOYaPB+xf+iBjZ/G1x8wsFqgrhcoMnjHHm8Rr3zqXFuAccXsWLfOkFodGzH8Mon+F9iB3WDRurxkIv9rnMbPgcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462379; c=relaxed/simple;
	bh=jeWTVtj8nYhnTOxqCiucsqM8uW1G+UMubh0niNCiZQY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=m0IF9MZpE7D14Afd5X1vQTpKhZkzA+D4VYIWn2+caZqn1kmMdgaqfQ5pjevKnIYE75x1VaWHaA/wZ/AWrU9we6AIZ6BRFM2kju6FYCJE68NWKTU+sW0X6eOePWyCASRYiTxhQwMutLV7jaAoXWjhS33nDxY5nT9bq9Kuzo3ZiXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AZGvWvNT; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AZGvWvNT"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D46F81BA9
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 May 2025 19:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iS-Uqqf0NZAH for <cti-tac@lists.linuxfoundation.org>;
 Wed, 28 May 2025 19:59:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D3ABD81B83
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3ABD81B83
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AZGvWvNT
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D3ABD81B83
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 May 2025 19:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748462373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=dIdopgfeI5rveyhr++wJt2k0a7f8cXdYunbbbU5j1Ng=;
	b=AZGvWvNTYPVkL9R8BpRRHZKYEDqBGqmyWJ6nxDT+9iJZRKt3E+MKgl5aWlxM0ObiDurUYs
	qJ3EWeh8lffk3t33zMaor2XKZ0HemF7gRft8qts6ke/uH8xhHBHUBhM3fzABBnF2+6G7YN
	ZvqUu8y/LuopaeCz4uzuUhdsfbQeAis=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-3tqGBQ2ZMjCXwdZDQ2-2yw-1; Wed, 28 May 2025 15:59:32 -0400
X-MC-Unique: 3tqGBQ2ZMjCXwdZDQ2-2yw-1
X-Mimecast-MFC-AGG-ID: 3tqGBQ2ZMjCXwdZDQ2-2yw_1748462371
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6faaa900d82so4353426d6.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 28 May 2025 12:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462370; x=1749067170;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIdopgfeI5rveyhr++wJt2k0a7f8cXdYunbbbU5j1Ng=;
        b=G7MYZMron+m8DL3Im9UxVI9Eyx6tV08LkRNvbeVt+5fcbJKQCaeCZXYjZZtsH07MzO
         R5nhCBZdz8lh/pFhOngzNz42td4VFLZ3LSheJdDhelVhoQKX/Txmd3jF6FIqcm+XmLnA
         JZRE6lOy2T70+LPijoI7nV7ug9m567DPETqdlgBM8Yl8McPaggwnvhuoOqVgYcmaIVjh
         WsHSEBzIwdxckuru1+KsEmOM59kxnH5hFVawRZ8wfVfrkw+NI0JqrOnPjaLBCutw78NR
         tE5XRiMdw8+fJVK9LHdn36M/0wBzCDk9lbFI6pUtjHTGa8/rhWa2Aym7LlHlFpv59spp
         SsKg==
X-Gm-Message-State: AOJu0Yw/7heJV8wXyAtG/DX1SQB+/UNConFpRiMz3dY4NKyt2Ja7WnnF
	/XR3YTs/IMSJ7d/ykd4T9I5gM12jpxEkoF3bB0uq7hhjiCCRdm59Gz+d5ftypY1j9/1paTOdU+G
	QthCJq4ROQRsgWKcqoOXGN/NE85KV+UJZFW8L+KhlYyBPxUHqYBvCvxvgJjUVTaEuPcacfjpUub
	tfoLrpvRIWW1oCeKWWUd8Kftm68KD0DBJM+jr2StnD9xGFG3QoVgyfrQ==
X-Gm-Gg: ASbGncvvBwjBdcrAoLWWSJXiTUEFnjGQigOkRZy1n39iWuVfAvrHBkwlhCyBfSc1p7K
	lrRpCG5Wog8LgIHxeVbgan3IfzJxEMQHM1dNtKo+7cdGvomsZnvjrcZgyo25PSVzGoXRPt7cCB4
	klmFVAx76Agqpsr18AKrkdSAsDLbJOs79O107YelcAKkDHTarGCYCc6E3EOMk+em4JaFvm+5ogp
	pe5AB/U4mT+yF9MtQSjug6jAmCbv6SxbUQ12KzDew0FrwbU3jandOvwhtOriFAqwq3fJsFSiDIV
	FukKa+ssndLP
X-Received: by 2002:a05:6214:6114:b0:6fa:9e71:fb6b with SMTP id 6a1803df08f44-6fac5d14781mr10510406d6.6.1748462370652;
        Wed, 28 May 2025 12:59:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmtBB+AzTBC5LR5L63KU+pVeJDCpNdkOmPtoSihz9y+MUGV/Vub9hUTZxVj4IqGjWNujjxgA==
X-Received: by 2002:a05:6214:6114:b0:6fa:9e71:fb6b with SMTP id 6a1803df08f44-6fac5d14781mr10510066d6.6.1748462370183;
        Wed, 28 May 2025 12:59:30 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac0bb9d36sm10219316d6.79.2025.05.28.12.59.28
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 12:59:28 -0700 (PDT)
Message-ID: <e7cf22c4-664e-4fd9-9933-b6b1eb6e4954@redhat.com>
Date: Wed, 28 May 2025 15:59:27 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2025-05-28
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -dHoOE_Kc7GgBvL07Li4QH3lDzf5kTjCa9lcm3Lx8WU_1748462371
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

​CTI TAC Meeting Notes 2025-05-28

Present:
  * Carlos O'Donell
  * Joseph Myers
  * Kris Borchers (OpenSSF)
  * Siddhesh Poyarekar
  * David Edelsohn
       
Agenda:
  * [codonell] Both SSDLC docs are posted live.
   * Developers asked why not just use a forge? (Comments from Andrew Pinksi)
   * co: This doesn't solve all the problems around hosting and supporting it.
   * de: Does the forge meeting the project requirements?
   * co: No.
  * [codonell] Analysis of Sourceware security checklist.
   * https://sourceware.org/glibc/wiki/SSDLC/Policy/Sourceware
  * [codonell] Noted that we discussed with Kris the meeting with OpenSSF GM. And wanted to have more than one agenda item for a meeting with Steve.
   * [kris] Maximizing the value of that meeting would be ideal.
  * [codonell] Presented to the OpenSSF TAC on our progress.
   * https://github.com/ossf/tac/pull/488 (CY25Q2 status update)
  * [siddhesh] It is hard to gather consensus since developers don't want to get involved in a complex conversation.
  * [siddhesh] With the SSDLC docs, we have restarted the conversation.
  * [codonell] Getting support from specific core developers is important.
  * [david] Expanding this conversation beyond the core leadership runs into problems.
  * [codonell] Do I need to get all the glibc stewards to respond publicly?
  * [david] Is this different from the DCO change?
  * [siddhesh] Should we extend this conversation to include Sourceware? How do we extend the conversation to support the security of the projects.
Next steps:
  * Carlos to post direct questions to current Sourceware progress.
  * Carlos to update the CTI website with current progress.
  * Sid to still review OpenSSF best practices badge gold and silver for hardware requirements.

-- 
Cheers,
Carlos.

