Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E03F3358A0
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Oct 2025 15:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752407; cv=none; b=OscrP6jvHEIdQrNZfZKXHp+95LngQMJ7BHyORtajzw2pS9/Tf89Cyxpr1j8rv3NzK/aTMZQ5CUkVDbOydzwm7BBf+iwe0cGO8vNKVRHioNYsl1yVMxCh1ZflghS6krwnKfKdPuBnqIekLmQ4pa671EDx5WAlp7A22XlEZh5kkyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752407; c=relaxed/simple;
	bh=pvMVKpRraExzLMA7rpyw1RKhlRQ9twKc67OhVeOaAXo=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=ACAKgT8XSQiXr/kssZfj6NPEViRt6WBaFxUKVtd+fhI2/67dBBvpbecmyAVWTaLHqECPDNMasfNyUFwtQkNVGz7WCYMJWn5obRO2xbOBb/T36EnX9ueaVMTEYAntmT0v77fN/m/+O9ODiBT0l7fcFZF1BEQ6FoGmy6TbmUy8vgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eCTpJl3M; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eCTpJl3M"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D821F4075A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Oct 2025 15:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQENc0xywkEo for <cti-tac@lists.linuxfoundation.org>;
 Wed, 29 Oct 2025 15:40:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6596F406FF
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6596F406FF
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eCTpJl3M
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6596F406FF
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Oct 2025 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761752402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=P5liVFj8zQ4q7g8S7Xg2ODkcdh3yUGvrqOBH0UW+Rqc=;
	b=eCTpJl3MmasKQ6xY7+m4PpunL3H8XgYOhKewkOzhschcfvgqgOyDdmFktBBurWJGOAjgc/
	qOnTxu0vROscolmVrPc+II2gaIGd48rgb3nEWnwBR37opoiTLIYEaLacuiS5L98qwkJ8nA
	Te47ttROEh2NTyQE7XfCP9T2XFA5ftw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-XssMo1VqPqWDZj7TZSWDDw-1; Wed, 29 Oct 2025 11:40:01 -0400
X-MC-Unique: XssMo1VqPqWDZj7TZSWDDw-1
X-Mimecast-MFC-AGG-ID: XssMo1VqPqWDZj7TZSWDDw_1761752401
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8a3c5e46a06so972030385a.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Oct 2025 08:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752400; x=1762357200;
        h=content-transfer-encoding:organization:autocrypt:subject:to
         :content-language:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5liVFj8zQ4q7g8S7Xg2ODkcdh3yUGvrqOBH0UW+Rqc=;
        b=B/oxHOu+EtXgmnEozOuo9TmfXPU1pL85qOL84mM8GEho8fD0xUOVBMTj4xS+xLCZpD
         KZ1xyNs9fTmPcl3iBZMdBWWVqxA8v9SET5vv21F1wIF7G6Ncq8IltpIIXEOdqJh9p+8F
         zdzRXRbc1a5WM9zovARwuBHLpIb0ayTNqEyX5kXxfI9yEbmtuCoN5461zFXSgSAGGoAA
         Ia2lUPVRnVZYpAguJvqKju4wSdoLHhvNZMI6UdZUGQMQ8x9N8T/QjDqY09Z6tU+5iWEj
         stZ6KQXXTTDsOTclOQA8e80MFPgXLKBfIE1IZZ7mfMDPnxoG1W8GhlEaqxRuvH/kq1M9
         oIdA==
X-Gm-Message-State: AOJu0YwSMDW5ZOsJTvHIa0jGrNfdcd8NPAbx6pICEQV9/wIl5KYQtuuE
	rdeypQPgijfOucnESCCsWjW1GcgrRr9CXz6KjrqxQrhnFGFqvPTnoWlAjJ1oB0+AtjxXi/dZgRV
	05fe9fD/6/+fcl5Du5FVvNJAY/1H8f4NDHrYUkyjOrcuBU18qD90N6C0l0E0YxTb883e4+zLXCu
	G7JWhJ+bM5Fz59Muysl4gcYX+cFOoTx2vPuhSadV2FAt+TLDK/Tt3nNQ==
X-Gm-Gg: ASbGncsm13GF+O58fSN2xRl3V6SbUFTBwFrVwj8vQmLnOD5PKtsWu+hlotbIsd6XmDt
	rLrLaIHmYoHy8Gzfvflb2GFIW+98uEH66A8+pBU3OAO0UYg8L3SSFwDyLXbIrz7OPgjOqz1nsDK
	iOsvZn2E6EzSp/E0OprhtwXu1UfkPYkCza7clwb97JyU/AxYwULd+U9de6OJSxTeojQWxBKYKkq
	l71v7uZ15Fp9OVLW9dmmB3So45p6W+B0FbBjFz6lpoYiwbhtQkSTPckADuFf27N6JTPlAILbyKy
	1VmrELk8oCdrMifHL4PWGVVuVEUbycx6jFOrGN02kHD4wND7G3dCPyrWSHxegj4k85F9XyFk6x3
	M
X-Received: by 2002:a05:620a:2b44:b0:8a3:2bec:c342 with SMTP id af79cd13be357-8a8eef624f0mr469727885a.55.1761752400456;
        Wed, 29 Oct 2025 08:40:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE18JlsFCPDxnI7AUOgMcHNulm+hr5RjdTstWmE+Tg3H+tNVUmvdWyU+xNQcxws0dqZYZaYcg==
X-Received: by 2002:a05:620a:2b44:b0:8a3:2bec:c342 with SMTP id af79cd13be357-8a8eef624f0mr469722885a.55.1761752399913;
        Wed, 29 Oct 2025 08:39:59 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f2421f6a5sm1090393485a.5.2025.10.29.08.39.59
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 08:39:59 -0700 (PDT)
Message-ID: <efca566d-6826-44d5-a599-240e0d1353d1@redhat.com>
Date: Wed, 29 Oct 2025 11:39:58 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Subject: CTI TAC Meeting Notes 2025-10-29
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 m/A+1AHg4g==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5PHlH8HhJcKuaJggc0bBm6B6EICri58I4wxSS5Y8KJg_1761752401
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

​CTI TAC Meeting Notes 2025-10-29

Present:
    * Carlos O'Donell
    * David Edelsohn
    * Kris Borchers (OpenSSF)
    * Joseph Myers

Regrets:
    * Siddhesh Poyarekar

Agenda:
  * Discussed the GNU Tools Cauldron 2025 glibc BoF discussion and the use of CTI hardware.
  * It has been 15 months since the August 2024 proposal.
  * Discussed David's suggestion to reach out to potential future sponsors.
  * Note from Joseph that future infrastructure will likely need some forge support given the direction of the development initiatives.
  
Next steps:
  * Carlos to post to the glibc mailing list to raise infrastructure move again.

-- 
Cheers,
Carlos.

