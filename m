Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383BB25783F
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Sep 2025 20:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758746556; cv=none; b=KoieAx/CrdGKdl6IFYiOUdju+kWLF9xZ8ShQLzHMoJljuCRp9R60VQkDwWwzF2eWlaJZRNB9/KfeFFxjEw/0Daswuub7JX5nrVvG0xYAjSr29SaUmmeu6wC8vHCnpTLjsKjDYHvl875BOzUuPnX3OdIraoOQ06g6MJz5ID8fsps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758746556; c=relaxed/simple;
	bh=j+C4Iu3c/S3CG7uB/E/CdSk1PomaPD9XR9zB24mMYUI=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=WNkLP1946oIPWe7s7AK9dHqiXtFj5O9mKDGtpJ2Y+DYR6b+vrWOAM0z9vLoP1ecwZXQLOnGrCOdhMD4Yn3Op26RX8ugVByMu5QZYxsuZz+1qneqTFgKfx21OdcAz1rWfDJr1mDczhWlb5KeOz/TjHNoHre00NlNBKZv0odwPN58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bYhd/mjq; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bYhd/mjq"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCDB461019
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Sep 2025 20:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wuaZlCiw03nx for <cti-tac@lists.linuxfoundation.org>;
 Wed, 24 Sep 2025 20:42:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6412560F95
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6412560F95
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bYhd/mjq
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6412560F95
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Sep 2025 20:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758746551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=pGJogWpc3n/RrdYTruyMMsKIzkgpV/kb6BYtLMyBEKI=;
	b=bYhd/mjqUAVd1kn2tAB1aVVg6t3aqKJ3UHrUwIeUGZv7BrKRnifjXqt0KlrWfx4a1cxaji
	4N/y5omrabnp4wM5+9q1Mbu9DSutFJgYee1YauTvJB2Dn1pLGhd+tUS/e1p2RKCwdtWKNv
	rOqBUB7E46O9ZQaVqf1ZdkzvsqUzzps=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-LpGVVQbkPbyAa4rkGIPOgA-1; Wed, 24 Sep 2025 16:42:30 -0400
X-MC-Unique: LpGVVQbkPbyAa4rkGIPOgA-1
X-Mimecast-MFC-AGG-ID: LpGVVQbkPbyAa4rkGIPOgA_1758746549
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7c547f51b36so3499836d6.3
        for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Sep 2025 13:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758746549; x=1759351349;
        h=content-transfer-encoding:organization:autocrypt:subject:to
         :content-language:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGJogWpc3n/RrdYTruyMMsKIzkgpV/kb6BYtLMyBEKI=;
        b=nj+QZ6QyRgHoCf6o4MYbRp5FwO80V/sSi8L+Gvp7Pg+VHpLSOAQuMvPOz/ETr4mDDE
         C+zoKg3FZAGDQXiQSrqu3ieWpkXKRHTOd0vDA6a+77koeMsrZBPHVlPPBqm4jcgDoPO/
         X8hvGEaxWQnWmOtO5zhHCAG7Coh59+3+XrwRBqAnJwd5FUCt/vICWLFvGY/pf7cbEzW6
         KPuVmMPzMm2W3syqP0b8F2YzPi+rBS5nP9LqmwA/oQgiRS10DnxcXAE2U4tulavls/Qk
         r6ItFW1v8GnFxtrgYI1UwZd4d9oGFuc9friu1hfOJd0DaLiBgeCu5xUWOWddpcV81DBr
         EWew==
X-Gm-Message-State: AOJu0YxXDW1+iDmfZs4/RXyHGnvBTmmO25ATkawhZPwc85ypm2XYMj0U
	JUZc+y2KprZ0jeYMa58TXSQYcIxQ0p/kqFp5cQB+y4mhhxJZfe4wc3QxjiGqjEXyNtb01RAG4hD
	0YS+iMCCrMWbEOsmf05HPI0/wEMJm1cBWN4Cj//7gEFhY5frsjX8tDK/l1YShuEpr3kbI4BJcPR
	+Ksh5rxPtSe71XSEBfI1vQfupvTgOKMYmd9MVjHfynz9PRznwX35SCIw==
X-Gm-Gg: ASbGncsrFufzulX6Q8N4GAvmJuaSCnT5nUCm7c/VQtDvdc1jRwctWCPb/lmsPN4wN32
	QyTRL+PVHEmW5U+6UinJDRnUJ2qVriiZTn64XvvaSVd6C/bd3JklvAtdtyLuot4TrJLW2ztAmPK
	gMEhTJqsRCzwCOYx/VBp8H7WYoMBZRSYny8O/l9chqF42nBiokFixLk2tYYbUFwdZ7dpMtmLkUA
	1KXJsMM/F9EiLduVSjs88rQ6SXhyQRk++p+UnuVSpegNZTu2YL2t2j6XGcbUARGLCrWNAwk03Dm
	a9iYcROhpRtUS2AiwqSB3HD8zJ8VnY8l1PBrWFGi
X-Received: by 2002:a05:6214:1cc4:b0:786:e3b6:bb99 with SMTP id 6a1803df08f44-7fc3128e0c3mr18411746d6.29.1758746549064;
        Wed, 24 Sep 2025 13:42:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgMjf2QBHrfOnaiDkNGlBWza/ksH2Q6EqDbLIEDSi92AhI0SrkOMIt3C++gBQTYIQ+HqsTKQ==
X-Received: by 2002:a05:6214:1cc4:b0:786:e3b6:bb99 with SMTP id 6a1803df08f44-7fc3128e0c3mr18411506d6.29.1758746548527;
        Wed, 24 Sep 2025 13:42:28 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-801359684casm868356d6.15.2025.09.24.13.42.27
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 13:42:27 -0700 (PDT)
Message-ID: <a0e12467-d54c-405d-a398-3463572729b9@redhat.com>
Date: Wed, 24 Sep 2025 16:42:26 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Subject: CTI TAC Meeting Notes 2025-09-24
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 m/A+1AHg4g==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mr-pfKc6tIUYzSeQbHZqf5xJvsLUhzKuuMk6PwJtP24_1758746549
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

​CTI TAC Meeting Notes 2025-09-24

Present:
   * Carlos O'Donell
   * David Edelsohn
   * Kris Borchers (OpenSSF)
   * Joseph Myers

Agenda:
  * Should we have an agenda item in the glibc BoF to move infrastructure?
   * codonell: Yes, add an item to the glibc BoF for glibc moving to LF IT infrastructure.
  * August 19th - Started a gitolite conversion step: https://inbox.sourceware.org/libc-alpha/4e9f65ea-a1bf-4d69-9dd5-63aa301f0b42@redhat.com/
  * codonell: Re-raise the issue with the glibc mailing list about moving infrastructure.
Next steps:
  * Carlos to post to the glibc mailing list to raise infrastructure move again.
  * Carlos to add items to the glibc BoF at Cauldron to provide feedback.

-- 
Cheers,
Carlos.

