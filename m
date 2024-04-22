Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DF515218D
	for <cti-tac@lists.linuxfoundation.org>; Mon, 22 Apr 2024 18:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713809140; cv=none; b=OVh0AftoSnRkxt9XhIpYIO+5j4BIVRCrMZtoX/mYyA7FXQ2umZNkPGwHi4VdzHkh8ddo9gZYL+/6Go+Ymy24uSC+UL+UZKJ2gvrEs5tTVbFvWOrNI/wF8XXR/2vsfnSCvQ/4kPKaQ0U7flEUFbA9O97gknK9+EextQiyinSsagM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713809140; c=relaxed/simple;
	bh=D5XCRLZjWWEL0HOKEmZxitDJa8nkvJtH/W7X2vlblZQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ftFybG38cuiV84Os0Y9gl4V02bl26S07Xsgj2HNYJJeJXXEPk3YXH/pG47nMzywWGZZCp58ujgk/D6Aarn+8IEwCQxEycXhkrZEs0+DiUBcHTUDBssH49kG+s7pgXvMJuAosHg6PqOQpCgoZQxrmsh1XHkunY/q4Ma3+vPM/xuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=imG/4zOx; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="imG/4zOx"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ED8440B4D
	for <cti-tac@lists.linuxfoundation.org>; Mon, 22 Apr 2024 18:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RaT08p21jxFc for <cti-tac@lists.linuxfoundation.org>;
 Mon, 22 Apr 2024 18:05:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=codonell@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 687A440610
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 687A440610
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=imG/4zOx
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 687A440610
	for <cti-tac@lists.linuxfoundation.org>; Mon, 22 Apr 2024 18:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713809136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=D5XCRLZjWWEL0HOKEmZxitDJa8nkvJtH/W7X2vlblZQ=;
	b=imG/4zOxif7zWaL4OhtVh2MAqi8g8kiIU/otl5d99UBSm9X+E1q2syU5NaoJQcFHJ9pbly
	reb6I/BWFJA48+pzgVOAVF2xnFihMnYE92gNXpWgy0nXfLiAJTZcZKLdwH7+nENDDyTLDm
	a5GZTLrOOrdEh+VisEdpOx+WCIh6ON0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-sJzg5N8FNUOMEvudR9BmLQ-1; Mon, 22 Apr 2024 14:05:35 -0400
X-MC-Unique: sJzg5N8FNUOMEvudR9BmLQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-69d93700ceeso68714766d6.2
        for <cti-tac@lists.linuxfoundation.org>; Mon, 22 Apr 2024 11:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713809134; x=1714413934;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D5XCRLZjWWEL0HOKEmZxitDJa8nkvJtH/W7X2vlblZQ=;
        b=E6f8BgkaC7OHGzcE0hlnkZ2v0PbmpIP4zn2awi85uZc43LIZ4/NzE/5hSEvCtGPsI2
         Ytpw1Q7P85IQw/jBlh7vGrth51ydBf6lAbUhTEvTqkLJLEyah9b+XBUliBkZWM9yhuA8
         58mxzwSU+mVxYcOK/Q+zwjR2f8/wrftWn40TXQd/z5aHs+QP255uRmFEOHH/sbNS1rEY
         3orZBGG3ZttYMumg8W2X6nVTFRzWUbNjoHdChP3KIAmvrWdVPWvz0gY0h1l6kureCYYY
         Cy6RFhSeQeu6YkkNf6hTcPsFUb4T5Zu1fpvHwozthAmf9GN2inBTJDCev+IVnaPpDlv3
         1D/g==
X-Gm-Message-State: AOJu0YykRvYBAS/PulMuEwvohmZj+itJhie7rUBNC0C+Q0Xz9ckSZxn1
	nmVyEGn9q2qjG62AzsYDDVzr4veHLzHnhx0kYuGROYacRTa9raLMFGFElYV2OHHO1Xn+r4Qd5zF
	DuPdemGk7LRoXs2g5qE92caFBTtZg/r6hG8x4vV3ZJ7VG126HO99NxO8oAt58yogxV4c1UF9pwm
	kvoVCzt+2qYjfEFFtZw6nxKAypGp5HBcgkgWNJOdBddNxDr+6/OXDaqA==
X-Received: by 2002:a0c:ab1b:0:b0:6a0:5446:dbc1 with SMTP id h27-20020a0cab1b000000b006a05446dbc1mr11246869qvb.2.1713809134499;
        Mon, 22 Apr 2024 11:05:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFea+PyMjSQGr7P1uYPlX2MftvBUbXSPixqtmHsEyOMCATMFILWr3FEiYjdMux6xuMp49lEKCow/4vg+w85HP0=
X-Received: by 2002:a0c:ab1b:0:b0:6a0:5446:dbc1 with SMTP id
 h27-20020a0cab1b000000b006a05446dbc1mr11246856qvb.2.1713809134219; Mon, 22
 Apr 2024 11:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Mon, 22 Apr 2024 14:04:00 -0400
Message-ID: <CAEMqeSqwO=cMcJ6N=oiu4hV8Zx9emJ8z8C9EH0z7u2QxoyxrdQ@mail.gmail.com>
Subject: Reminder: CTI TAC Meeting on April 24th at 11am EDT
To: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Reminder: CTI TAC Meeting on April 24th at 11am EDT

BBB Conference link:
 https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1

Recurring last Wednesday monthly CTI TAC meeting.
Agenda:
- Standing monthly meeting for review.
- Discuss current TAC topics and progress.
- Discuss glibc use of CTI services and LF IT planning.

Cheers,
Carlos.

