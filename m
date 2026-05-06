Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3407D3F54C9
	for <cti-tac@lists.linuxfoundation.org>; Wed,  6 May 2026 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086263; cv=none; b=oq1V7oZF64CfrVh8ggh3LxTguEs0HQgvWE0J90cSl4u+b+C3FJ6k0iS94C2PdfnHMNp+LU5ESCbp3VgaVpPSB4btMKmDGMkFW2o17KPT2UC1ES8SuuW+/7O6eaWvv0zNIVPSGBoHTmT2XNhkNCV3C7oXg/Qs2w9N4GnuPP5hkIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086263; c=relaxed/simple;
	bh=+bBgJqh7tP3kqOT/nncSrs1iXSK/J1sW6pmdUiy6ksU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=uWYi39UfBvn4PVk7XdERyg/CrHM9vc45wOkjlu8Jh0nNDKoz2z7LnHpnRivRSA3rbDePUFJyOAozuynlYN0vJJo6CsJHSWTFU4sIHlTugNStUCNAJE4iCjZHQ5nkXR7c24oL1tFJhW0cJh2UZ2L0GVd2eUViDiQOZpoGL3XAVyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ffsEubAs; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ffsEubAs"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D33B340F20
	for <cti-tac@lists.linuxfoundation.org>; Wed,  6 May 2026 16:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vMPvK6p3tK9i for <cti-tac@lists.linuxfoundation.org>;
 Wed,  6 May 2026 16:51:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B44AE40F12
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B44AE40F12
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ffsEubAs
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B44AE40F12
	for <cti-tac@lists.linuxfoundation.org>; Wed,  6 May 2026 16:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778086259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N3W6/GWIHvQ8eRB4o1fy0lV1eWalH0xvuquRT4IkOGU=;
	b=ffsEubAsPa43Qz/JxJNLudI9c+n7A0Ff3XbloIAdTNlwDX10TXv32hs1I34CEoCYjpyRv5
	C9OpJGzX1WyGNhhX8I1fQiuCMxLkMZO8Ymum5LTovWi6lAECiXHzB6MMEVf2l21eTa4UDt
	S50ZNLRrUD7UwIOK8QQB6vmDR8sgQT4=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-HMuiqocuOo-SYA48c2wcvQ-1; Wed, 06 May 2026 12:50:58 -0400
X-MC-Unique: HMuiqocuOo-SYA48c2wcvQ-1
X-Mimecast-MFC-AGG-ID: HMuiqocuOo-SYA48c2wcvQ_1778086257
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95ce6d50ea7so3222078241.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 06 May 2026 09:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086257; x=1778691057;
        h=content-transfer-encoding:subject:organization:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N3W6/GWIHvQ8eRB4o1fy0lV1eWalH0xvuquRT4IkOGU=;
        b=IrPHx55J1bhpFLzs80OcrVAirhm+OzVcR3HRFTIiuns9BNcOI9hovGUjhy1Y7kl9ti
         mRVF4L8k1sYc9nm1PZLtgeLvMa8aqY3i+9DpmNT/wYIuJrToXtdfXXNo3sF5J3SIfyTK
         PWX4hMMivEXJNhOfL+GNFA5QRDN+ScmfXZ4Mnx0PmqLt0tSwFKC3CE/Hh5tKHNC5RCuz
         qV0siEYOgwx1tN+5X+JGrKLEZvGQP7G7rRfIacRUQmQZNpU7qBOF4D3VenLPAtT5FfPV
         PZ44r9qTex+//Y9tVxe2om6mHI1zMdr0cITwf6RfsxnDN5jQlrGLBVrA0hFu+ion3HT1
         gVLA==
X-Gm-Message-State: AOJu0Yxgv4hhWDCWzDPHgJeiS6Qv9WiK22m/mdaLsNOjc3OPPoHCwM7j
	IGm8zLO/PR/TMDZQ4vwuQeAqSMOIHKVx5BM4RxDliYKiEGoF9xspAsBNIhQ4b7eg6oIlw1qothd
	ASKm8OYz+ig1rP3RqarO3oDzZcFWlFY8RZdScNLC9fzjfkIqgIf3nd9hmfK7hHcd8N7R1pW2wGz
	2aVrPs8txos6KkJYHVIs1U9DN3SAG27KR7etEfUh7+cvRdenO0t9V0aw==
X-Gm-Gg: AeBDievS94ELlYcJ3ekVZvz4/BI/DaYjzh05DolAosXVOoloQO9iPNJrQTlqk9X4+14
	6u4qszmyXUuLC/jMMELd+o62XGNx/uaPGc7uBo7uET2s8dv5dzet20zmF8LwO4PfXLGu99FFg91
	2xDZYWVFAQjHE2RxQAH4bUTcL+PuUR0wdUg8nnfB+RQQKd7fz4MZ0K+TA4275SqnY9FWFuPL3ee
	OaqPYrh8qOQIViXcBbGAyUwWeEIGli4/uDuPIOsHUXMqnN6hAy8z2TR8B5Fp02mt9ip2/QEMyoH
	I4YVchVKuQApeWMyceHco1/ANi2W0ooGFnbMUJm8tXMONYFgrfmsiqfjcgWHcH/ONOuqwIV9bO1
	0kZ4NOgqSHSzCESuovvMFeoC7PHBXCsUMDkyZWffXl2SU8NGT7uiVFXT1XTevDGHjJYbmCuwGoa
	H8VrMrauKMaFQXCTZwjYKSpHba3BSylG5f
X-Received: by 2002:a05:6102:374d:b0:611:e0c2:1604 with SMTP id ada2fe7eead31-630f8fcf085mr1966036137.19.1778086256851;
        Wed, 06 May 2026 09:50:56 -0700 (PDT)
X-Received: by 2002:a05:6102:374d:b0:611:e0c2:1604 with SMTP id ada2fe7eead31-630f8fcf085mr1966023137.19.1778086256008;
        Wed, 06 May 2026 09:50:56 -0700 (PDT)
Received: from [192.168.0.116] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-630f858f550sm1837905137.3.2026.05.06.09.50.55
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 09:50:55 -0700 (PDT)
Message-ID: <f6247e90-45f1-406b-9913-2b4b1a82280a@redhat.com>
Date: Wed, 6 May 2026 12:50:54 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: CTI TAC <cti-tac@lists.linuxfoundation.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat, LLC.
Subject: [Action Required] Creating a "membership@coretoolchain.dev"
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hZ_NrR4cWXVh6eDkE5qN54cFPMPUmojGYwBWMvBudPI_1778086257
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

CTI TAC,

Given that we're actively pursuing CY27 membership we will need an email to
use for the directed funds workflow notifications (part of the Linux Foundation's
workflow for payment).

The most common form here is to have a mailing list "membership@" that can be used
for emails from the system or from members submitting processed PDFs or asking
questions about the processing steps.

Unless anyone objects I'll file an LF IT ticket to create "membership@cortoolchain.dev"
which matches other LF projects e.g. membership@project.com.

The list will be private or have no archive (I'll ask LF IT) to avoid leaking possible
confidential sponsor information, but will include the board and TAC which are actively
working on sponsorships and need to be notified when an agreement is signed.

-- 
Cheers,
Carlos.

