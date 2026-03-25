Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BDC3EC2C4
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Mar 2026 16:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454908; cv=none; b=l+yla/zbp7Z2wPmCTO6m0AFDQ96g0YN5546MAA377Bu0giIMIMmDS/yhQLWV3WGhAiSyIv/5EIdKvkiZoRvyQ4S3i/vUOa+32nCsH1tMgOyhNRtWbmhyTVMyAZvrvm9XQwjMAh2XsbkrP64KlrlfjU2pRxaX8VXRy46AkcIpdak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454908; c=relaxed/simple;
	bh=V8p94K63wo5UjzjMxhKJRrwqscTIinHMzhbWz5sbF/Y=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=FOtYkS37hetQH5uQUWlZoL5ZjYl5vHPJkVAe/Ez4WOURNjGcTK8JXeJubNefWcQZyKpBd6F0rWqcxMlJZrVt7Cwg/RZqunw4187YhlSuPYWhXnlbZ49CeFcwNcfUzZV2zO3dxroJA1Sj5wINYbccDerC7zLQmysOWlFTy1L87L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lrv3Ebzq; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lrv3Ebzq"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81EE740546
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Mar 2026 16:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9FWXO5-_LUz for <cti-tac@lists.linuxfoundation.org>;
 Wed, 25 Mar 2026 16:08:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6871A40213
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6871A40213
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lrv3Ebzq
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6871A40213
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Mar 2026 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774454904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ci+/Uy8l57uGBxxY+CllMntSK3SHs2cHWIuSrrW6kbc=;
	b=Lrv3Ebzq8oQQEJgdlhM/hUQdxUY1iY6tl2qPe7V24J4tw9icZPL04vS+iSL8zRPlSRr5a9
	Xt8/R1nXAeBzPLwEoJoQ3izY2oYCbchtDpF4TQj8fiaGY3RLWm9697RdnQebhYqE8Oushq
	bMZzBKUcVnbGRqsXSfOnzow7cbGwxPI=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-HWYkctXhPOq9cbCLn-G5YA-1; Wed, 25 Mar 2026 12:08:23 -0400
X-MC-Unique: HWYkctXhPOq9cbCLn-G5YA-1
X-Mimecast-MFC-AGG-ID: HWYkctXhPOq9cbCLn-G5YA_1774454903
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-79a51ba2bf9so97890937b3.3
        for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Mar 2026 09:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454902; x=1775059702;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ci+/Uy8l57uGBxxY+CllMntSK3SHs2cHWIuSrrW6kbc=;
        b=TX4xGIDO+Y8Z5dHFFfs5dq1XyuThoLJ87eNEWMbn5acYJs8pP3ZTylbe5vLlsFzKUD
         TtU+W62L2Fabo5rwCYMtxaxOXChLPJyMP0GThZjRh4WZMCY4aes8+G5jbod16NSpC2ZF
         lVsqcpaZt+Nhbfx3n5Jwj/ojtioVe1zsCY2eIA6NEfIrPiX/LTaiAo2/45EeKjkEs5bi
         YmyEVpZ+r67TlExASHeh5v9OTt41MkuRA9QyHXDOoGqH72KYcJwsjwHGvdIuFxGP3hw/
         raz1os4j3m1KiaX3RhiixRQN5SDQrmdqXyAT2AWfBO7ZVEfuqwUzSoa7jvNga1xlqcqq
         AXJA==
X-Gm-Message-State: AOJu0YwQjfd6Q4YbHpVCtjv0d9aGWM5T4qWLplzUrVf8EEXbafqzQ/T8
	ocViEa63ax50TnGuqnyzVjbtB9v1WsXnjy5UbO+NyqZmhdYkzp1nV1XvSDkWkLTuklLX1OZUrNx
	0cQxwBkrmnDDZwqqJywukUwajj3rwWY+2pZVSoU6Vvo/fkg2DogBKw9aHIvDJxYhuDtahQQcx6F
	8cXdMp5md4qCCA6KIq5r8yXuzOfDXXFwjiV9MWBrgZEuVbLnIfkZyLQA==
X-Gm-Gg: ATEYQzyZnTgd1rn6f96L7Bokk6ZlKZQUpKJLssAThSZkxm0MAD7vJ2c7t+H9qVs5IEp
	X5d4yy+8JPXo3MRNvFat6OaPkiBzJXMV1z5Q4Gao5PR3xINJDVFumbeDR4qdIYJy7wqHXlxXSFj
	ZlJqCXbEJU+NPlXeNwEwGGsjuf/GJM8G4hGBG2RarRqN3nY8XmES0vDTpDWMOrZ0CbL4HOfVIgc
	YJzVysH3X1Yyk7zEshsgyW7JD2vGvRX37/qUnhu02QFIrhAaVJCryacs1DhoAbvdgQotd2ScLj2
	Gp6a4O3wAR3RsF1qImPHdJa3b0q1gqYPGr6sR/7r5D7nkqZIsv058CfInvd+p4djpPdhKdnpFIO
	xCiJyox9HCuIKs/QSpS4vsOY7yWxIJS+CEdXFfHltEl9Ls3pzBLAV9a13fZlMJ8AOP0XXEMrAuK
	TZhwhhUyyDWYwhHMeujX3bCA==
X-Received: by 2002:a05:690c:46c4:b0:79a:b46c:e61b with SMTP id 00721157ae682-79acf33154emr46623617b3.2.1774454901965;
        Wed, 25 Mar 2026 09:08:21 -0700 (PDT)
X-Received: by 2002:a05:690c:46c4:b0:79a:b46c:e61b with SMTP id 00721157ae682-79acf33154emr46622907b3.2.1774454901314;
        Wed, 25 Mar 2026 09:08:21 -0700 (PDT)
Received: from [192.168.0.116] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cd5854764sm1006286d6.7.2026.03.25.09.08.20
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:08:20 -0700 (PDT)
Message-ID: <13ab8d70-7ac6-4bbe-86aa-d9f5ae95d7e1@redhat.com>
Date: Wed, 25 Mar 2026 12:08:19 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: CTI TAC <cti-tac@lists.linuxfoundation.org>
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2026-03-25
Organization: Red Hat, LLC.
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hBJd4j2Ci0fxQ8ZNx8MOcm9P2GvCD1iQ6VntTbUFSsc_1774454903
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

CTI TAC Meeting Notes 2026-03-25

Present
  * Carlos O'Donell
  * David Edelsohn
  * Joseph Myers
  * Kris Borchers (OpenSSF)
  
​Agenda:
  * LF IT SOW review and final comments.
   * Noted that one of the phrases needed rewording.
   * Sent email to LF IT for changes.
  * Meeting with LF IT to discuss transition plan.
   * What would the timeline of the transition look like?
   * Would we start in September?
   * Testing in September with a transition in February?
   * Email sent to LF IT to schedule a meeting with the CTI TAC.
  * CY27 pitch deck review.
   * AI: Carlos writing pitch deck and will ask TAC for help with slides.
  * CY27 meetings with sponsors.
   * Double checked ownership of shared files.
  * Review CTI ADF agreement one more time before going to sponsors.
   * Review any issues before restarting CY27 questions.
  * Review community questions
   * Decided to respond more broadly.
  
Action items:
  * Carlos to work on pitch deck and include TAC in review.
  * TAC to plan meeting with LF IT for initial discussions.
  * Kris to get a copy of the latest ADF docs for review.

-- 
Cheers,
Carlos.

