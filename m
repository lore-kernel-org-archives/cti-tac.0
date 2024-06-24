Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B150BFBEF
	for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Jun 2024 21:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263342; cv=none; b=RJ7w6Pu0iYhFuRCDYxQjgDDBldpcwEkx0BXLhb2Fi+isAPVdHEOjI/UuC+++qCIJUZCkG09IK6PMC2hot7jxnHqdeWFZos2JhX9wtvzbB9uzH7vgjYOMfta0tslRq55Kf5qMR2fbY7fL2nA4oA1VNk7Spm0jC0dp9CRdQUDStdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263342; c=relaxed/simple;
	bh=R1FA1HTaBiv+hOEBQtaR6b0Tx+mjCtdrViEWULhzuoY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=rv3mJSar7VYy7AhlcwySrI2Tm6+wRUh/KR2xLN09jlDhVe3l2yTVHYhRoUdAVF4K8+Msk/Ok4toUeJX6+dSfBxhZYL4U3Kz0dpkCj1bbn2YBrdITeKrlFGoBTJ876mthOd33wpfoTKObO/E1oHgm5TaYpArvc+pLEQVhEjY5/RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DhQ4xLsZ; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DhQ4xLsZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35BE340AE6
	for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Jun 2024 21:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAVuvB-CRlaW for <cti-tac@lists.linuxfoundation.org>;
 Mon, 24 Jun 2024 21:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=codonell@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 15AE340AE5
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15AE340AE5
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DhQ4xLsZ
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 15AE340AE5
	for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Jun 2024 21:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719263337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=R1FA1HTaBiv+hOEBQtaR6b0Tx+mjCtdrViEWULhzuoY=;
	b=DhQ4xLsZ9xeg290UKm8xlY7AMWHRENXNGIpsbecF0ERJ3kTb+o4PAATxJMvsk4LBZ9ny2u
	9Vk1kPur+CYd9atP0hPIvXGFE8gEN3GxMwcnuhFsH4mQSxqy3s2yKAMD+nn2cP8Hzw1KTk
	FNAKHczOzhZ1On3A3JpY6Y2uFxiS0b8=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-pSgz_ytlMDKQipG7wKsHsw-1; Mon, 24 Jun 2024 17:08:56 -0400
X-MC-Unique: pSgz_ytlMDKQipG7wKsHsw-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2c7e3d54957so5389305a91.3
        for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Jun 2024 14:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263333; x=1719868133;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R1FA1HTaBiv+hOEBQtaR6b0Tx+mjCtdrViEWULhzuoY=;
        b=aOgsYXi2cptFmwpMUYGYRJpC0Q9UTUbixUyykcTdErIBaKoqm0g5Z3CG8gTeohkI2j
         iFRp2/nEicbyE3vLOnZpAcHWa09Qoa7MJTY1XOZ/whB6Gb6nyoj/fF67XIdzH5rzJhc9
         3pF2CzkFAlJWA4G8eg+fit1jICSXnXerwWd7TJbBqm66U/thu7AJEigp7sFh31Y/FdGj
         nzV1zkXjND39htpZph1mnzdewTL2F8b14lzznrwMPJSN0JKSR3VJqb4QVSPSwd+zZoiB
         BpcNjGT2oHTFjaQxjrsIhPTHcnMvSvCjDnCkWBODc8Ev4/bYLDe3iclKHVMzQEtdP1MX
         Z43Q==
X-Gm-Message-State: AOJu0Yxzp1LxqyhwPKQjL15gkkQxKsWPLSDWcnXDtvorPwcdKqpYjNX/
	XpgNY0SlUkztLbMwzB4DC9NrfyyMouKwF3TyjVDVw90Uhw4ArP1FD+tE1kEevITlqYL/OLWyKp6
	C39scbKSKQvUkIprcfLe9V7diQ3WLvL2Fn0BdrPoWvhfijTrxthzXb7ZYIUavfK0F2E/JIf+1Bg
	W0+dYX69nh327dTuN7qbb8fWHv2k+deYrt53LohlNTWi08oDyaUfZv0g==
X-Received: by 2002:a17:90a:bb85:b0:2c2:3762:2c18 with SMTP id 98e67ed59e1d1-2c85822be92mr4959287a91.22.1719263333685;
        Mon, 24 Jun 2024 14:08:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESVuS7YiNQXzXglHTYVoa+IqZDtZQegQ1FHeD9eGMz1mBJ/RVKLBP7iijkZGpy01LMu9jzNVO85WyNz2uKeEg=
X-Received: by 2002:a17:90a:bb85:b0:2c2:3762:2c18 with SMTP id
 98e67ed59e1d1-2c85822be92mr4959269a91.22.1719263333280; Mon, 24 Jun 2024
 14:08:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Mon, 24 Jun 2024 17:08:40 -0400
Message-ID: <CAEMqeSq5N9SxyDNMF7VF0-xa+1ocQ87Gh4PUDvkFES83boHYPQ@mail.gmail.com>
Subject: Reminder: CTI TAC Meeting on June 26th at 11am EDT
To: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Reminder: CTI TAC Meeting on June 26th at 11am EDT

BBB Conference link:
 https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1

Recurring last Wednesday monthly CTI TAC meeting.
Agenda:
- Standing monthly meeting for review.
- Discuss current TAC topics and progress.
- Discuss glibc use of CTI services and LF IT SOW and progress.

Cheers,
Carlos.

