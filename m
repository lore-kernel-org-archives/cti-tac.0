Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B59137757D
	for <cti-tac@lists.linuxfoundation.org>; Wed, 27 May 2026 15:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897357; cv=none; b=QMCT/Ipfyxo1sdJrK7I9Mpow0EcDCGg45op1Xmcf+nWQjt0paDhQ2aXvlUzV0aJJCAWBnlfbAGp7E5Ntsl58+vWkxD64sia7bMyvSRYiZmD7oBCN6c7dy56jt/ONZw8A64vgGcxbQ8dttfOxkmJ8LjZXzVEPtoJDm9MjtJ7HKZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897357; c=relaxed/simple;
	bh=ySYzlFkHeIR9FTL+hPWR8fUgsV07y/CCnjUI0CpMGFo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=uCF85Lgyz57ZGqzQWSz58BVrHZi1LadBAFffk80IZXzpOdRYjJwpLqhZLl1W5QU6500SiyFJZwYNS5CnYPh49ci6y1ij65rfTqobpmTX0yZrhQ5/VAo/jOyPUYqpLx2dtsqWAg6Nm+gPcoM2mCXhxMPi7j4BWdH1a3qsjdPG7us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SVzZclu0; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SVzZclu0"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAE664212E
	for <cti-tac@lists.linuxfoundation.org>; Wed, 27 May 2026 15:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJs3k69m59cU for <cti-tac@lists.linuxfoundation.org>;
 Wed, 27 May 2026 15:55:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2BF84212D
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2BF84212D
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SVzZclu0
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E2BF84212D
	for <cti-tac@lists.linuxfoundation.org>; Wed, 27 May 2026 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779897352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0IanwuDJ+ZRtBLKKVYrNy3NSow0MJ6e5t9DhKNay5gM=;
	b=SVzZclu00octAYNeTb8FEVwvc2fNk0x+en4PNRW8ejNnd0eX0P76QQVvPT7cx0oSIwQQjw
	fuZUWqAc9qdCf98qqgaKUfsD4XvTFcuKuYs3cGZtC/5pu5P0u2loz8QSCDCHOhOny/iY4U
	2GBo1pV6zO8P9fGRjxHcyS84oBeFh20=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-BSuSgjIwNAy9ew4rtIgB4A-1; Wed, 27 May 2026 11:55:47 -0400
X-MC-Unique: BSuSgjIwNAy9ew4rtIgB4A-1
X-Mimecast-MFC-AGG-ID: BSuSgjIwNAy9ew4rtIgB4A_1779897347
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ccc2cd49cfso12840136d6.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 27 May 2026 08:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779897347; x=1780502147;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0IanwuDJ+ZRtBLKKVYrNy3NSow0MJ6e5t9DhKNay5gM=;
        b=LxfgG3ffNA5bCLQPxtcfAANjQbKOwWPz80ssEA9ZTtaakTAyCY41Cg6GIo978L4PKI
         S4kg6Cx9HR+bOtzbAZ27Ja8+Mt4zxo1ArmkVHtlKCMUwcZgRbb0YkTR+hdx5moBvTO8x
         +CHQR9/ewPfQXArizhH57Lj9FO5CRsah9NQjKWNtpjoUnXF2/v5TrnRjy3ylry3IVXxj
         qX5d7PtHTrlplBUjfQU0UYg5zyWYrtbL87CxWSNPv2PkbIcrn9t+rt5fyEb4+zmIRn6Z
         dvwl+vMufuJJyZpjvmT+mOSgvGNDSU8wqhAhl+ATNcZa7o4XgS9pbNzWH/i73wGS6Hh1
         wIjQ==
X-Gm-Message-State: AOJu0Yw8Dwqr8ZzdJ7MLXGV665vPlwgDAeXF6MhTvBDRR9gHmV7bcw0a
	SZVyIBSbUVDFYK4hP+k6jSH0QiggUUvqrgJyN3AumKzmN16htXNrG45t2LIEt/Xz7uklZY9wUx1
	pER8KG7Eg7xKHGqYdiHwxQsJ54etmZdv7SQlQrgBpvbF9rYgVmoIfBENsFoN02GPtBCVKXZJwaP
	RMWT9qL5k5eOGjwvRioccSPsqahat+AogvHnIvw+aF7tud5USIGZ2ouQ==
X-Gm-Gg: Acq92OH4JZiG32u+FKZJLxBajZ7q1AGoD+LF29mmAjP/eRNKxw8DPAi26sXiDkCM6ea
	tFVI1rUxf7zoFHHedd8wEdhuwjqKiIkdmODSKTNd5z+unB8rOz8+5gvYUaCFM7R1D/d4USA170q
	NcM7V+RBQjM63uuP4HREmQ7TRhvrDebkVGlYg0cuOoijnRPpspHyfMP958o6SkrDRY7uX616CG/
	n8KEqVO4ojC2NaAsAy1O/qAQU/xVymBbYy76+g1cqgL4FfsY/C6ZPaEL7a4h/0epRfZvIt/1gz3
	8+bYcLR08OPW0tqrIQWVZ+ioZ//CU3RpOGvV63foZpGfG6SRcDLuqnb2kH7RrsTrRUFGPyGQNmF
	PHYXic4UIYOpMjZlFa1ZfHS+QPC7PNR/Rp33ahVcRxb1Sk/KxEXfT2GH8z3ztgpnCXkaUBMm24Z
	skj0MgdDRSn/hHXbFiL0YzIA==
X-Received: by 2002:a05:6214:c82:b0:8b4:7009:3b69 with SMTP id 6a1803df08f44-8cc7b50025cmr399662736d6.7.1779897346720;
        Wed, 27 May 2026 08:55:46 -0700 (PDT)
X-Received: by 2002:a05:6214:c82:b0:8b4:7009:3b69 with SMTP id 6a1803df08f44-8cc7b50025cmr399662096d6.7.1779897346118;
        Wed, 27 May 2026 08:55:46 -0700 (PDT)
Received: from [192.168.0.116] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc812e0413sm187847416d6.31.2026.05.27.08.55.45
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:55:45 -0700 (PDT)
Message-ID: <4fdfac43-8511-47e7-a6a3-eab4f016e1dd@redhat.com>
Date: Wed, 27 May 2026 11:55:44 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: CTI TAC <cti-tac@lists.linuxfoundation.org>
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2026-05-27
Organization: Red Hat, LLC.
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e9J3zFLARfgVkEYoBxmoh50j85YTZcGMsCVwBY1vDEc_1779897347
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

​CTI TAC Meeting Notes 2026-05-27

Present
  * Carlos O'Donell
  * Joseph Myers
  * David Edelsohn (noted he will be late)
  * Siddhesh Poyarekar (noted he will be late)

Agenda:
  * Held May 12th meeting with LF IT to discuss next steps.
  * LF IT setup membership@lists.coretoolchain.dev in order to capture completed memberships from the LF systems.
  * Carlos to continue to move the Red Hat sponsorship piece forward.
  * Discussed Microsoft and sponsoring for CTI.
  * Carlos, I'll reach out to Jim Perrin and see who we should connect with.
  * Is there anything we'd like to see in a draft plan.
  * If any organizations in the OpenSSF member list are orgs which would sponsor, we can review contacting them through OpenSSF.
  * Carlos: Ask David for help setting something up with Bloomberg?

Action items:
  * David to reach out to Bloomberg.
  * Carlos to draft shared document with LF IT to outline steps in the plan.
  * Carlos to reach out to Microsoft.
  * Carlos is working with Red Hat on that discussion.
  * Sid to reach out to LF IT to check for SOW updated.
  * Kris to update the LF system connected email to membership@lists.coretoolchain.dev.

-- 
Cheers,
Carlos.

