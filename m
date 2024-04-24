Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79001160862
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Apr 2024 15:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713973791; cv=none; b=ncBRzdtmvZbPqUg64TX5Fo1Qi9praIqBPaVBDwMjfV85xqhnbc2mpWMKW5qYw8X8VlVg5i20sTLSLH19jBCb1TJdPEbpZtfY6E+CXGmB4Fju+J4avAnmEi8uEo8d/3G/WgPuSiIezReXoF33HSoLYTz1EBbjCZ6+twSk0mFDvmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713973791; c=relaxed/simple;
	bh=oSxSBdwPjYKIfDAFlnDxtF24SUqk3xwQCcJWd/3jdwg=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Sa7C6Op/YDUkNvzLoKelUbn7DanaPYrWQ0Z4BGXwLOHcIpPn/cgLwwLaDXqytmJYbVv6n229QWKMHW0+Pf3GgYOO8FX58j7YphnROmcg2ec41bABrebCaUfCYuW9OlFYa1J72PB84OBX14eprwFxbsQNc49e7Kk8oaLcwY89ZD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MjGZzBxb; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MjGZzBxb"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0FAA60BD5
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Apr 2024 15:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmExwIfnh_Z6 for <cti-tac@lists.linuxfoundation.org>;
 Wed, 24 Apr 2024 15:49:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DCD3260BBD
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCD3260BBD
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MjGZzBxb
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DCD3260BBD
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Apr 2024 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713973787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=D4issXthrJx/qLQ6UW5hVQW9Lq4+401YqlssOer/wAs=;
	b=MjGZzBxb6502jat1hEZ87Z/UI6QX4nqsBUa03jYYcuHPf+o1BnmZpR7lO9sZ1u2aQgb6Gg
	n1ghm4LNLNxl01SRlDKHBv9QIHc8k0kswc6p4/CkPd5qbGSICKb//rQAC0sSCnzayhaaWr
	cd5Xqp3/qG7E7r2dxTRbAeHd/QPiFYk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-irM7ExetPhOhciu9S152sA-1; Wed, 24 Apr 2024 11:49:46 -0400
X-MC-Unique: irM7ExetPhOhciu9S152sA-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-78edb34cf1fso895586985a.3
        for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Apr 2024 08:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713973785; x=1714578585;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4issXthrJx/qLQ6UW5hVQW9Lq4+401YqlssOer/wAs=;
        b=k3fkzepMr8kMf6fgxcqhP2NB2nVowJ7/t4ZSY6SZ/f2aP1lzbXw3iPbJ+d7URCpL7A
         wV16dyKSIbGFd4CajzPCgYsYL0i2xYnl5avcLVAoAdj6ZnAlnbxA4d5dUltf5pKcOk45
         C1EyjiPGfeBgFG343Wq8jqICkxf86eNM+iTpFS5agjfOPePOmxqKI33+vKCIw/uttz4K
         SZ9B+Yv4naQJvLkQKm0XpCqgItM/9pz2CllCH1CR2sPM9tPec3a6WmT8MseeboHzHJQX
         kV7EftS8q1qx+w3QNoy2G3/4cFYSApcx7GlCLF7ghBqCIs469D5jPvWjgkxJ21hHZXZL
         sxFQ==
X-Gm-Message-State: AOJu0Ywn47d4XQxN0Xe77E6FmA+H3VuxNBxX88bh1ZWwgl0dEDgMEiWk
	WH32Rs3GEDWCE+RBDRn1KD3SRy9S29mxMXYgeGiEIqL3Roqj3DRIon8bUvN5CwTV/zg98sVBeWS
	Mjbszv7Y2K8fLNCjNleTf62o7LZ63ChKjnswBM/Q02K4dxgbO+GnJAvkzs4DB5GjD6bNwvMGZaA
	n0XVYTxGA7j+RFYmbqkQhO0pJRmTZxpct4JrkLdPyKGrSG56a23g==
X-Received: by 2002:ae9:e403:0:b0:78d:6377:33a6 with SMTP id q3-20020ae9e403000000b0078d637733a6mr3204638qkc.66.1713973785683;
        Wed, 24 Apr 2024 08:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHRVYvdgbP9/XWLZtNAx80v29az2k3Bg7Ttr5n3L1w4BNBUsQnn1u81Xo2mUs+Ak8X96r/dw==
X-Received: by 2002:ae9:e403:0:b0:78d:6377:33a6 with SMTP id q3-20020ae9e403000000b0078d637733a6mr3204613qkc.66.1713973785145;
        Wed, 24 Apr 2024 08:49:45 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id w16-20020a05620a149000b0078f1a57ac0csm5204313qkj.83.2024.04.24.08.49.43
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 08:49:43 -0700 (PDT)
Message-ID: <4dc7d706-f6fc-4494-b24c-b1a38fc98810@redhat.com>
Date: Wed, 24 Apr 2024 11:49:43 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2024-04-24
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

CTI TAC Meeting Notes 2024-04-24

Present:
 * Nick Clifton sends his regrets.
 * Carlos O'Donell
 * Konstantin Ryabitsev (LF IT)
 * Joseph Myers
 * David Edelsohn
 * Siddhesh Poyarekar
 * Bennett Pursell (OpenSSF)
     
Agenda:
 * Schedule going forward.
  * Done: 2024-03-28: Setup meeting with LF IT to start migration plan.
  * Done: 2024-04-04: April first week meeting with LF IT and draft plan.
   * In progress: LF IT put together statement of work.
  * In progress: 2024-04-08: Sharing early draft plan with the community.
 * Konstantin: Provided SOW to Carlos for early review.
 * The SOW is considered to contain confidential information.
 * Carlos: The migration plan, and a high level plan can be shared with the community that doesn't contain contractor confidential information.
 * Carlos: TAC needs to review the confidential SOW.
 * Next steps revised:
  * Review LF IT SOW with CTI TAC and finalize SOW.
   * Konstantin: Send email out with text?
   * Carlos: OK, I'll send the text out.
   * Konstantin: Scope of work can go to the public list?
   * Carlos: Yes, that works.
  * Early May 2024-05-03 - Share early draft plan with the glibc community.
  * Mid May 2024-05-17 - Agreed migration plan.
  * May - OpenSSF GC read out of the plan and SOW and costs.
  * August 15th - OpenSSF GB meeting
 * Outcome: Have a LF IT SOW that we the GB can approve.
  * August 1st - glibc 2.40 release (possible migration blocker or the point at which we switch infrastructure)
 * David: Do we have any concerns about xz-backdoor git hooks and the issues on sourceware?
  * Joseph: One of the specific things was systemd user sessions letting everything in the hook run synchronously. One thing we do get from the commit mails we get committer and author information. It is relevant to know the pusher and author. We are flexible to allow something to be done later. Certainly things like sending email doesn't need git server permissions.
  * Konstantin: Yes, you are specifically mentioning pre-commit, so it has to run on the git server.
  * Carlos: The only discussions I saw were about xz-backdoor issues in the containers and VMs that are part of the buildbots which are out of scope.
  * David: We should include the hooks functionality in the scope.
  * Carlos: Note the hooks https://github.com/AdaCore/git-hooks
  * Konstantin: Yes, gitolite already has much of this functionality. Like commit message formatting can be done distinctly as a hook. There are already some projects we've done that have commit requirements.
 * AI: LF IT to send public scope information for SOW to cti-tac list.
 * AI: CTI TAC to review by 2024-05-03 the SOW text to finalize.
 * Next CTI TAC meeting is May 29th.

-- 
Cheers,
Carlos.

