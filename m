Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B0632AAA4
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Jan 2026 16:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769619104; cv=none; b=oIzo29kUymiS35VABVcoCmxSs9Ow/sXqGsLAbchPOYIbDz3BD7wEGpRxp//P0+QeJZUGQ2VveLW7kwQz8sw9O3f8CrlF+FnFrPn4GmwjLOv86UKv8E/vjlLmYgAklW0q1GBniQrQ8DAK4Wk1NYrhoz0jz40dF2ij51a3TZooZQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769619104; c=relaxed/simple;
	bh=r7shs81yis0hpw0kgGbAW6hCCMr79pZzNnmPJC4HeaA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=JmkSN1sQ91HoStgN2IUOlq7Zk2t9sLg5cGiDwRytOU5d2xQoZHaPJkwpmTb3ycUoLD74no7sN+ufG/eOCDlO+WJBB4bypQndeo0C8CR1J7L5mPzu3wyVzIyGojJUUgT+GUqOK6YgLez1QTOjbSgXlnvXJ3QgzkQneMM9xTwH3x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pax95Hj7; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pax95Hj7"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7732140190
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Jan 2026 16:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJzNmlVI-V6O for <cti-tac@lists.linuxfoundation.org>;
 Wed, 28 Jan 2026 16:51:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45839400C5
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45839400C5
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pax95Hj7
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 45839400C5
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Jan 2026 16:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769619099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=idbOZigv1VvAKszHa/wawAYbEdU4K70iGDmWGrKdNjA=;
	b=Pax95Hj7iTQH1i6iCuAMIWlIn4AxjEAeLE2NQIVskrxP/YPniK/LlW1r8FdLhJkdU8+Sn4
	07DVOkOABr2C4BHmPIk/CHoqztENq1eu6tE7ZmAi1yposWq/4g/EORt1aWbIu08wv3lhb8
	dANAJMrLleW595pBZ5JcsTr5YDopSUA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-RpgJw5IwP0aTsbGSbWt4fg-1; Wed, 28 Jan 2026 11:51:37 -0500
X-MC-Unique: RpgJw5IwP0aTsbGSbWt4fg-1
X-Mimecast-MFC-AGG-ID: RpgJw5IwP0aTsbGSbWt4fg_1769619097
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70fadd9a3so24899485a.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Jan 2026 08:51:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769619096; x=1770223896;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=idbOZigv1VvAKszHa/wawAYbEdU4K70iGDmWGrKdNjA=;
        b=powdki+CHAzukWk7783gJWOM4FazNUaHRHiXLU3yh6zmXEg56FODJoSKz1VSrQbNwK
         v6NJDfZT8DAIhCbSXPxZI1DUG9ffsO31F+tyPPGoMEJ+k00JsCzU3ivsE4ytk4VA+gvF
         lhrFEect4i93w3au9qLV6pwrNMf2PBc2SJ99kM207sx6YunC+1/7aBzqH0qghzAbwPXI
         fdFh4wJAT6BuWMGf0Pqa2zaziN6B2yyKcsVG3a7eBaEqRbEL6lS2IOKceL4LgEqDcQR3
         /p4kS0wazrn3lFgCBnZK+1hnHLJoUxcyaQflqDp8Y8i2r8yhZZBCOt7sv8hhbAMvrDmE
         sntQ==
X-Gm-Message-State: AOJu0YxSDN/+Msg9HOK2YSZTy8aJJYEEYZwpVPHAvA7+ffSQAQPblY4t
	C+/6DoIN/9LVBxNTVwdle2L/jUqiU7fYhJHnavzSLwoWu/KvkqOYc0vVYnVS32i2XFvtQyvpn25
	AnDcQg7pkmvasix2FtKl1AxZr01cNqDaDQnP/m7h95eXZLsY/3NzYHplF2VJa8fkalXHkjGsJHD
	nF6RveAa4UEFsyOYeeFcRDkmlwEke7Ji32g9gTODBUeizs9x1C9O285g==
X-Gm-Gg: AZuq6aK9lO7QMoVwZlmHgAGmLFl1H1JoIBcAYSWkQ8xwFptOUc+55CFiPHEfi4rFsXA
	8ViPx9xrJaBHV6HrfiHXBMVf7vfA++w1Gp5c1sUabtniL4iEN+7zJRDtUn++a+mfGlPjemMbAZR
	R2EJ6A9s1LlZRmgHx2rkUQ/NhSRJyqEjE3/cWSAD914ZiImud0+XGx/BIJqBImp5lLqEW7/5cGA
	PhYxNUj3N3KVVT94TPIK8Jc2ZHMF1vZkhnIvX/x5xjlneXBCGgQw767DS1oTnF5FNmMv85y8QHg
	cPjJ/F48jfZqrQ+c+rTqQ5Dkn+Gn2zJks3M2ddEpEOdJ6Y6jx/RBd0uw+8Y4SNw5og70Dfyuuj0
	XL1Z+gBXkHWqg/OUriJO9jJiSlfvzeOSjrJU1CUSsuob37r13LIPQlFzWH6HxI2ReJTqXsM5/46
	Ir2SCIYtphnw==
X-Received: by 2002:a05:620a:319b:b0:8c6:aaf3:cb44 with SMTP id af79cd13be357-8c70b842261mr734835885a.4.1769619096137;
        Wed, 28 Jan 2026 08:51:36 -0800 (PST)
X-Received: by 2002:a05:620a:319b:b0:8c6:aaf3:cb44 with SMTP id af79cd13be357-8c70b842261mr734832185a.4.1769619095456;
        Wed, 28 Jan 2026 08:51:35 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d457e4sm216625385a.43.2026.01.28.08.51.34
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 08:51:34 -0800 (PST)
Message-ID: <bd1e0f22-a022-422d-86c7-92fd538dbdda@redhat.com>
Date: Wed, 28 Jan 2026 11:51:33 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2026-01-28
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 m/A+1AHg4g==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y9r_IwEfQbMjS5nC5tle15AGcwplm2c0FTI13BthPZg_1769619097
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

CTI TAC Meeting Notes 2026-01-28

Present:
  * David Edelsohn
  * Carlos O'Donell
  * Joseph Myers
  
Regrets:
  * Kris Borchers (OpenSSF) - FOSDEM
  * Siddhesh Poyarekar
  
Agenda:
  * Posted glibc to CTI move email yesterday on the 27th.
  * There is a large 44 email thread in progress with community discussion.
  * Carlos: I'm reviewing the thread with an eye towards which questions are still unanswered and pose gaps to the move.
  * David: I'm writing up a response to Alex.

Next steps:
  * Put the current plan into a CY26 schedule.
  * Carlos: I will reach out to check with LF IT to determine status of updated SOW.
  * Run the first weekly CTI Office Hours to discuss the first steps of the move.

-- 
Cheers,
Carlos.

