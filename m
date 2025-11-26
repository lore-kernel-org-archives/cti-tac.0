Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16519C13B
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Nov 2025 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764177898; cv=none; b=mVdOSu9cDHTGtcVLns1koc1DuWouQY58YA9w5T97GKBLQzx5o9CZbrHhO1e+KbAtSkxBtxv9gZbGtm/Iy5Y7SqBiK4jZxCofKJchOogURBCBZK2TL6SU4blnOsQ2yDTXi3wqIhVRoPAv95s5G4Cmvv2wgtbbK3WPhcFrIzHkJs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764177898; c=relaxed/simple;
	bh=AwJyRlydbdIOZ/eN6dcTmIcP7vrE6dFiIIakUHMJv9Q=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=kRaOMevXyrGWA4P9jHSpzAOzuHgjtYC2V0n8dz7IlqiJ2nLj3Qn3El8/lFY9LuxRtDaQmtHZnwLWapKYDM0H1HOUPt0VOto5IDvPEXYw1jZGKQVUm0GtYpaPFYz0Ffi8xoh2h8f/fHJ4XBQR6RmK7PFgSWjJCvylSrLfKCSbhAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aE6z1jNp; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aE6z1jNp"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF2FE605C5
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Nov 2025 17:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MduxReb7QTuX for <cti-tac@lists.linuxfoundation.org>;
 Wed, 26 Nov 2025 17:24:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9EE6D605C3
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EE6D605C3
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aE6z1jNp
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9EE6D605C3
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Nov 2025 17:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764177893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=tpd+Ue1uh7f62A9X+HevMYK+/L81L2Q0YAUK2cQ6Kbg=;
	b=aE6z1jNpQ+84RtxAd+U703WaG7bthvlw/6OGyBU7mMUDMvYijfJLXIHILCEudvFEAuzlBB
	BczgB6MDSY4fz8xupVDWGmpBojKOI+TxkUqT1g+emwdiTTqFbSd3d1sDgZaeM3+8BzlKtP
	bMbURqmKd5ENTvlln/Ud55GYIOD7YFA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-nnMRDJTUOWGFmiRz64bapQ-1; Wed, 26 Nov 2025 12:24:51 -0500
X-MC-Unique: nnMRDJTUOWGFmiRz64bapQ-1
X-Mimecast-MFC-AGG-ID: nnMRDJTUOWGFmiRz64bapQ_1764177891
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-882380bead6so185195166d6.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Nov 2025 09:24:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764177891; x=1764782691;
        h=content-transfer-encoding:organization:autocrypt:subject:to
         :content-language:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpd+Ue1uh7f62A9X+HevMYK+/L81L2Q0YAUK2cQ6Kbg=;
        b=EY7qXKTEXNc7aqq0K8vSOCwDLKTkI82LiYBe/RiPwfd2UZG5WHhwPL08v2A9068iSl
         SV7eilj63x1O/grkKzYj6LiDP80vEyD3P+GKvqBEFGOArDP4JeX9pxFPK8Ub885D7CoK
         3y6mZpisZKdWeiCdKgtMtPTqeENHjws/q/baHgvXxzYxblP2IRojYNkeAR6ENtZ2YaQk
         l+YxMPr9PBwrQprPINUatGMlKD1YaThTkkOihdEhIF/LLWt5oveUbMJLGcyyzHEEoa2O
         q5UA7/q/nTii3lNVpS/YAf8XW62ndLh81H09iHZ++JlGwofNpFTu6Rhb0fdj3MqYuNvX
         VZzg==
X-Gm-Message-State: AOJu0YxLjRs2hCU+KdGb9zfjt637TkzsV7+8s8TLjmFnFTJXifPMLJdE
	G1S3ZfyXN4pI234XO/crE5Tst+VvvVNeiz07Sl+JgWragk/yUlQpCmGHsGohZmAbAoMfuWH39bF
	KOkcx9Sb78OL5zJtl82XahBlka5GLc2tudWvgNQyBQ+g+Xbq8Tmn/Bgcu67P/Lz1gNcgO9F4Ama
	6pFsO+aXPaSmVKD2AHj7vKEI+cYmv2r8wC1Ff4OYP/p+lSqPlTYQXfsw==
X-Gm-Gg: ASbGncvWAbwZJ+HJeGrS9Vwyz0TrkfBeYoDWhuWBlHj0W6dMV0F84VfknGmAP0mpSEp
	l28LyL1m6NT2hlDPoV4Fq1zP3gs6WtrEzA753xjsl+IDlqmfxcXk+vq3sO9plBVeQ7XGTXF59zt
	VEzmXnix7+i00g8kuMb53PUDxR80vJ4YdWA5AeP4N/VVR3tzCxDQO/WDPgYpJJIFiJPg+hUityg
	N6slC2ZDlAk2zujKyGMctWYkVQCfY80V6nju7NqOaEwQiLxj5XJ1mY2doJE868EZWVLsWj+j+6n
	BXsmi0yDxxkYoCJcM4u+PqZaLkdZo8/vStmpxuWx5Pzcy7YIjwRFuOQeO8bc9mUlFeWBkF0XyIH
	WmqoFP5iH/oU=
X-Received: by 2002:ad4:596d:0:b0:721:7a6a:b703 with SMTP id 6a1803df08f44-8863afb4c1fmr113769186d6.53.1764177890943;
        Wed, 26 Nov 2025 09:24:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0lkH3YFOCZ7fagQ4cmcclGaTFldVthMezDV/llmF+54TuXvRXi6WotliOpZqR1EQLsFdLzA==
X-Received: by 2002:ad4:596d:0:b0:721:7a6a:b703 with SMTP id 6a1803df08f44-8863afb4c1fmr113768696d6.53.1764177890369;
        Wed, 26 Nov 2025 09:24:50 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e445b28sm149672116d6.1.2025.11.26.09.24.49
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 09:24:49 -0800 (PST)
Message-ID: <3b1aaa90-9b46-4ce3-9209-4b9c358107d9@redhat.com>
Date: Wed, 26 Nov 2025 12:24:48 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Subject: CTI TAC Meeting Notes 2025-11-26
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 m/A+1AHg4g==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WtPfLwN3l641CyY4YzvHt9N5ydF2HZcGEwWNsjSQjqA_1764177891
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

​CTI TAC Meeting Notes 2025-11-26

Present:
  * Carlos O'Donell
  * David Edelsohn
  * Kris Borchers (OpenSSF)
  * Joseph Myers
  * Siddhesh Poyarekar

Agenda:
  * Discussed strategy for moving forward.
  * Discussed if we had enough material discussions for weekly updates?
   * Yes, with enough material each week we can make the transition.
  * Noted that we need to continue to update the community, not every quarter, but more frequently including weekly updates on CTI progress to show the project continues to move forward.
  * Decision tree? We can anticipate some of these responses.
   * Share FAQ items.
  * Suggest collaboration with Sourceware on specific projects?
   * Fold it into the main conversation?
   * Publicly invite Mark to have a role.
  * Ask publicly for certain sponsors.

Next steps:
  * Setup another meeting with LF IT to talk about transition again. [Done]
  * Carlos to share more FAQ items with CTI TAC. [Done]
  * Carlos to work with TAC on obound communication.
  * Carlos to post to the glibc mailing list to raise infrastructure move again.

-- 
Cheers,
Carlos.

