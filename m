Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5496A32E72C
	for <cti-tac@lists.linuxfoundation.org>; Wed,  4 Feb 2026 13:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210817; cv=none; b=Vfw8aBT+Xds1JOCV/qPXsCKP9776GpoDncco3zovj1PKl+8W+qQBWuYsDisKVKXVIa523zlzp4mHX5F/IgwdLNHOFXvldfruZRem2TrGs0tEFAcqELOjNOHDrfQKTScsaFO2mPosgwnSlQU0cDKecqhtPLrW7eQKEVl5SR9c8OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210817; c=relaxed/simple;
	bh=wDqAPej+uzABo9P4GlJCwtgh9ahQ+nx4/TKsH50PsjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=g3LXhNVII4Un/d+o7QE5LyLLgyqxgPKvi+UTBLFyLQof7A6h8jmRsIL4Q3R2rSY7xGt874Y4N/TQGxh+v9W9xSLnbdCrIPIWU69F5FbtavtYDrPoPyN+BtIluHqlYHhJ6ODjCkszCIqiSYWonwzGp9BmWeXf0ABZSevMvnMWjqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UgGs7v8u; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UgGs7v8u"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 036CD40363
	for <cti-tac@lists.linuxfoundation.org>; Wed,  4 Feb 2026 13:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.795
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXQn09I4rBnB for <cti-tac@lists.linuxfoundation.org>;
 Wed,  4 Feb 2026 13:13:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D85F3400FB
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D85F3400FB
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UgGs7v8u
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D85F3400FB
	for <cti-tac@lists.linuxfoundation.org>; Wed,  4 Feb 2026 13:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770210813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FJKirX1Vq/Edd+sDVSAh4D28q8KBAgux07BNeZU/dfk=;
	b=UgGs7v8uGZ4nV4u7eiCbxtpoQOzPhvjs6tl7D/YF7gaZtDDqEEJEtiSy6NyufLyfcaW8Yp
	JUUkd6We/JOlsDjLPq/r0oHdFws0TcMkhLN2gYNKghDJdqazg1Csceyc4GuJgRoJ3Fu9am
	e9C2dybQS6/o4CzwhLYP30/iRnF8i18=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-NjJl9YX_OHm8kM21mGX47g-1; Wed, 04 Feb 2026 08:13:33 -0500
X-MC-Unique: NjJl9YX_OHm8kM21mGX47g-1
X-Mimecast-MFC-AGG-ID: NjJl9YX_OHm8kM21mGX47g_1770210812
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8946198b977so183094136d6.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 04 Feb 2026 05:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770210811; x=1770815611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJKirX1Vq/Edd+sDVSAh4D28q8KBAgux07BNeZU/dfk=;
        b=LZGQ8J2sUHB3rOiTOV4XshmuzBOvmri2LeWc/OnXPZI6zDMuZoMAeJoBCozdNXAwwb
         zON3yX4Q44n/EaF9LeDVabtInRvKrg0zHwEebS2GffEud+vkXowk62xiX0/5hHaC8sn/
         +rOOMaZR5yazsV9djZUFznuyRz5ScUZB4BhoNBkrCCA0TzQ3+bROwZp60BeAWuZRTBcW
         3eZiefuoGY6CcmSwuDlB7aA6Lw/1ZQeTqUE9EQ+NSMv9HF+6vNyg51hONcr0jBVwBZqJ
         1W5InKBy4cSOb2+WMf2ZV/n/13/p6trycs/It2PC2/z1GIlWz8w2ERxACJ6HHIITa/7H
         HaeA==
X-Gm-Message-State: AOJu0YwVjziXvjuH0b/MgkAmSKp63wtCJRhU1eBVcneYYmajX0GA+Hr/
	j994ZKDNNXx+yiRIQKuQDk5eHgCEwtYLTM092zetlbFwCqmj+HyJpwYjDWz30PNueet6jp/h8vF
	bhpWRyq2Pmfn5dNy25a/6GRJ4RUYtTi6k8rq1bshYJia3IB/8zdwNDggXe06KdbuUUAcRIhYPEz
	irGVDIkZFwtZ1aKXY/dESjtmUavKGwAqHNTjR1FpCDMDRCKyZkf7rzPA==
X-Gm-Gg: AZuq6aLqZh749Y9ad8qwwayI+Wb4gMq7sDCypbdrvtwv2F2lxUw7fI5YRq0owNlSwiQ
	HH3Jtd2qGWF5on9X7GyKJHcgVP0nqM2yP53qKAgKS3OqBP4Cx/Hw4exEkXpv7j+nKlZBhi85/qV
	jC8jHCKW27Y3iG3Al8DurIk8TKwfQ0/ZMNCGMvsfubL8/6adquGchmRBHD4C9PyLlBOeP9zQoP+
	kun9oeV2XqxIbEthGSUt7m0o596SyvGmjxqAEG2PcvSHUXlqNRsMdLcBVwct1c4uipPpW2AR4QW
	MpMCqeDDmY9twYxeFwKGNhzes7PmtRiIgwWH+UwHiu/nlJCKauGN4MrQqWCxDEWe9YddY5gCHKY
	AqDZ0fGrNWisoPCzDeSdtcsGQMq4WTcgN7JDCp62qizexB9x8Ea7to4sw3lyLb5vRZCW5wxvQLl
	rcVSDw3X+Tr5w=
X-Received: by 2002:a05:6214:29e9:b0:894:7de0:b7de with SMTP id 6a1803df08f44-8952214b81amr38640036d6.29.1770210811472;
        Wed, 04 Feb 2026 05:13:31 -0800 (PST)
X-Received: by 2002:a05:6214:29e9:b0:894:7de0:b7de with SMTP id 6a1803df08f44-8952214b81amr38639606d6.29.1770210811017;
        Wed, 04 Feb 2026 05:13:31 -0800 (PST)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89521c19762sm19030796d6.14.2026.02.04.05.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 05:13:30 -0800 (PST)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [COMMITTED] glibc: Update second and third meeting notes.
Date: Wed,  4 Feb 2026 08:12:50 -0500
Message-ID: <20260204131326.3101552-1-carlos@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rd0oKeXAFRwiEiYAIcYtNKDYpMl_DC5CMNAVVLAPd7c_1770210812
X-Mimecast-Originator: redhat.com
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/projects/glibc.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/source/projects/glibc.rst b/source/projects/glibc.rst
index f243697..2fee94a 100644
--- a/source/projects/glibc.rst
+++ b/source/projects/glibc.rst
@@ -10,6 +10,10 @@ We will be hosting weekly Office Hours for CTI to discuss developer questions an
 
 The first meeting will be on Friday January 30th from 10am to 11am EST5EDT.
 
+The second meeting will be on Friday February 6th from 1pm to 2pm EST5EDT (supporting later timezones).
+
+The third meeting will likely be very early to support earlier timezones.
+
 Migration plan includes:
 
  * Migrating from git to gitolite.
-- 
2.52.0

