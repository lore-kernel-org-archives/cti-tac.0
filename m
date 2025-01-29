Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699BC1DE4ED
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Jan 2025 14:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162327; cv=none; b=mjgaV/hGohQDdXWNnxn4gVNvwmvbR/OYb0Q41RHdzKMR8qWFhCMSGmw+yXrs4bvMg8oiUkiXkDdUflk2fgINdzNWa5NytNnOd+OHqyQsIhRioylaFtaH8p/nVURq1xBqyd3wpmzvjHOwUFlT1JzkFhoZMYodrI1A6anzSazhINQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162327; c=relaxed/simple;
	bh=aGRv6YVudZ+lwWi3zKrdzYyRrwPJCMXMb298xatDzFE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=TLDQlUUmcTO4tdkX7VBN3btKi5v0Hq+jmIuQSO2sEDBg/RH5Tv9z3vAZjS+d91IAhTKAnCqatTAI+/x2oXrQmAosiGR8sm+Rv1wrUEUBnUk9OLVlemZu9PgX2X/oF93kA8tSh95+pswfcleub5+2+ffrFR3Ya8qllJ7zV9iI9YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V/BhyW/j; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V/BhyW/j"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDE0881FF0
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Jan 2025 14:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xu9hWwAgHa2 for <cti-tac@lists.linuxfoundation.org>;
 Wed, 29 Jan 2025 14:52:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=codonell@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2207081FE3
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2207081FE3
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V/BhyW/j
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2207081FE3
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Jan 2025 14:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738162321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=aGRv6YVudZ+lwWi3zKrdzYyRrwPJCMXMb298xatDzFE=;
	b=V/BhyW/j/NSVz5f3C6mZGmQYA3oPaunlqpN/hkT9A8uTpOJGfC/BHBU+H2CcewFFX+4PmB
	xFo9L8szjmSXu/9oOYJrMJK9yWRBdHzBAQGa8Xzcb/1g2LS10i57yWJWYk7yY3Xqe93OdW
	i+MkJg0nWA8RpCD5u2CifTRhcASCM+A=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-8ICWrdRTNnufMqfz-xa-XA-1; Wed, 29 Jan 2025 09:52:00 -0500
X-MC-Unique: 8ICWrdRTNnufMqfz-xa-XA-1
X-Mimecast-MFC-AGG-ID: 8ICWrdRTNnufMqfz-xa-XA
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8f94518c9so140304026d6.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Jan 2025 06:52:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738162319; x=1738767119;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aGRv6YVudZ+lwWi3zKrdzYyRrwPJCMXMb298xatDzFE=;
        b=OG8TNUTeGOhS2AV+NhfvB1ROI2zHNER1yRsoX62U5QF/w4CB9G+CDkQAYw6t/bVmk4
         fbqXBMADVLYOQg9JO9Z59wORtKQV3qDAUyjwO1liWhDHFZH2E4sr6lrWD/+b4t44IOpn
         EaZBiDvRfFjuv6HEXlrVKKSe/tsYUB3A+Hq4CV0p65hr6xKAwC/07LgMVMDe4o7Kf4j6
         24oEdQ2+ge+Y3hNON2Skdb9ARJWrg7i3LSY+gPs3C4wF1uw6cwG6bTdnZCFqB/9UAYQc
         4MR9Y1pw5RfDHMgwedJsjLeLIkyozAdLuSzqrfkxjBmS3JhxliJSbrlc6oeGkNY3ulSr
         3B3Q==
X-Gm-Message-State: AOJu0YxP+7qozfK8N1y/zNwKWz83pXW7tnVmVB6zzwI1/V5E/fKrg38d
	eOv1YsyNSn2noJgFrVSEyr6jBhBNGB+brZWD2cW+Wq9gPFyyUSokbCLJwIHy8ufrqZWChnhCdaR
	eIVSef6bHA+JlE3rg4iypcYEnMvEc1J4M9to9peoxdm0o3Sjf/qCjHzWYvHCGg7QIEYEE9zhfz4
	o8WxUN18O1IQLIchAdZEIimxG0vZa+JKFXjljNSLf+feN2xcGOM4mZPw==
X-Gm-Gg: ASbGncv2RzQc/vzdhX/Fh5UU6gj3uLBL7TlRfeeU0vNuaoGp4XaB2z8SdJ7x3ZW2S92
	x0ugGat8gVg+oWA9HcEvO7ia9VKqYUl7/zXjRvksr0zeYOPkS+G5kl79Cg68DFQ==
X-Received: by 2002:a05:6214:2242:b0:6e1:fe68:11c1 with SMTP id 6a1803df08f44-6e243bb9599mr59610156d6.14.1738162319245;
        Wed, 29 Jan 2025 06:51:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFl7ArxBlTDvjSCNLPaJyq4x8INVu1Ix24Wd+og1BQ6zmTIEYn13pceY+wCHBia1Jv38eKr1f1FsDsls/p0Bxg=
X-Received: by 2002:a05:6214:2242:b0:6e1:fe68:11c1 with SMTP id
 6a1803df08f44-6e243bb9599mr59609926d6.14.1738162318996; Wed, 29 Jan 2025
 06:51:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Wed, 29 Jan 2025 09:51:47 -0500
X-Gm-Features: AWEUYZk4ca8uPvfHY6_3UPWKpCMDWKdAn8TZPDYQjTw8TgM-cHkM29u-2KXJLK8
Message-ID: <CAEMqeSpjPCR8fXA-13djKCudzXW5_736f658ggoYdtdLo5nxkQ@mail.gmail.com>
Subject: Reminder: CTI TAC Meeting (Today) on January 29th at 11am EDT
To: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -pIN40TXbpS3sZAmJZw3Iu6_6GCOCAo3CMkJn5WFIcI_1738162319
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Reminder: CTI TAC Meeting (Today) on January 29th at 11am EDT

Sorry for the late reminder, new year, and I need a new set of
scheduled emails for these reminders.

BBB Conference link:
 https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1

Recurring last Wednesday monthly CTI TAC meeting.
Agenda:
- Standing monthly meeting for review.
- Discuss current TAC topics and progress.
- Discuss glibc use of CTI services.
- Discuss in detail the next steps for glibc writeup, and reporting
process to the CTI TAC, and up to the OpenSSF.

Cheers,
Carlos.

