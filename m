Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56342DBF78
	for <cti-tac@lists.linuxfoundation.org>; Fri, 23 Jan 2026 16:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769186850; cv=none; b=D+mkkDNs15HwuRIVd4fXCBcVDzSYs0iKZ+g6935oJSjEMdh86sp/YZhcTlD+zNzgkIdjaLiedTzDTUNwZkI2zvV0/fyXKHFHahKXz0SENXBPLwoD/s24Yyx10G/+P8Ca2BEfn8Q8Nxl8nnJzz2HWmBiSf2ZRZUFl+6nTtrPBCtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769186850; c=relaxed/simple;
	bh=fpBGvki0ZLqaX0vo5/cJ4jQbDC9GENrKdMKOtzAFSq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=XM2G2Gru80hQ8GLJXdppBxlKV8wsRQQIM/YrJjqZ3OVsRLa8W7FwY92YcwLXL3u/uYUuH2ufc9OyLOa/kTkhjC4EJJvYutXLZiGnLuBHmeIwKic+H3erzQpvM6sVAGiXWwGWHvJ1rIHK3cgM9bNQffHPd2t85p0ARTx5ZoF2LSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hzAapyyJ; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hzAapyyJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4150B83C51
	for <cti-tac@lists.linuxfoundation.org>; Fri, 23 Jan 2026 16:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.791
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuwqePBPL613 for <cti-tac@lists.linuxfoundation.org>;
 Fri, 23 Jan 2026 16:47:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 05BD783B57
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05BD783B57
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hzAapyyJ
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 05BD783B57
	for <cti-tac@lists.linuxfoundation.org>; Fri, 23 Jan 2026 16:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769186845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nIGwU9fI/hTBpWrIP+0Up3vJ+o190LsS8YXB6L4b5L0=;
	b=hzAapyyJ5Q2EdzE01QWcq4hE59JyEGXP+vWijKbImStNjpqO+fjh8ItgNEgglpsOku2zqu
	GnL5SPg6XRSBHam0K4Mz5BrQttwXyguetfHyYmZ8qq6ZkE3HeyediVUobn7mj5FAwY+Y2z
	K73x6JDHExklYYUDydd63OyuABXzpTk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-TBO21vuWM9WvKdcz8mqZbA-1; Fri, 23 Jan 2026 11:47:24 -0500
X-MC-Unique: TBO21vuWM9WvKdcz8mqZbA-1
X-Mimecast-MFC-AGG-ID: TBO21vuWM9WvKdcz8mqZbA_1769186844
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89482366332so74081476d6.1
        for <cti-tac@lists.linuxfoundation.org>; Fri, 23 Jan 2026 08:47:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769186843; x=1769791643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIGwU9fI/hTBpWrIP+0Up3vJ+o190LsS8YXB6L4b5L0=;
        b=fDAL/766VQEX6IXZ0B8/B2UcPMdbZi9leWgp4CKjqa6ne+bZPxUZQEvU4Cts6KFdGC
         xSOikuXPaZ1sH67TeyRE01TcqwJVy8o4DC9EXkAv7xmNc+we5Z9vqWYoDfIqosGR80au
         bZrf71lrBG8K9D9cs1TaTDVAwzxCZ2zLssV0+PsSQjvVyg0smc1xPMphFzn9Es1OoRmK
         lcerYJOHEBcjYhwHW2H4d8zDjWs9wrwpCO6S5u0dN6Kbp/X3Pf5Pw9ZAh2VOJPsHmeTP
         jUgbyjmW1RLzACqJklZl+4FZUyPx/HkaIS08b2TZo2ar3jrwSRmhbyxT1QesdXVcR7EW
         wX1Q==
X-Gm-Message-State: AOJu0YzPWL+p6OBYCZcJ53m/69JMuslCtq4vHU5uTRxhCgrPQwcvCeUh
	wtwKw4d/29MrN6EsXw9wkzvQghdiGzmVTW59tZn+KH2jXeCvgZsZOLRgCojEFN3dZw7mSQJemUQ
	OHeEuV13t9j+pr20g9pJIHdqZb4ltz8lSBM9XqyeuKyb/3ReRI5bL97DnCU7ZWZMXbztesGHQnL
	x9ba1XxUfTo3WyVWH6oI2MJLZty5DQGOwwIeRypvMgnVi79tI5d73tNw==
X-Gm-Gg: AZuq6aK/gHImC198a4RMGbpDb1Mv25AVidiXmCdFVHyyJeR6C3RjvyOioSPG3L1QO+f
	Ney6BkEP4cjzq/bQFDKjNlhLm18Ftw6X2yT9XenRLKQFHdZRaSo/mvDVfWk0v/HI/ScMG8v0yc/
	ljkTJDoBBhtEmQ1YbvIs9fSnITJcRuWGv8jwvyD7hmZoAUN52gwnqZUbq31zlXkPwN0WBdyeYh+
	qdoQsqw6m5oRjtHHcYmdNWEtTIWwuV0MnDkiTjxT3zJnERxBL0dZw4h7njZyEqXhUrtjwy7MYum
	PlqC+G5PwuCbopD9p32QtWM29g1SOxTqUgnxez67zlFab+VQ+YBvr6ZITrKUZYk8pyYxi7Zqh0V
	h01V+InWihncsr2PD/U9nTghArmTS7OjBNJiMol/m3gRYUHuRzTTclOeIR7mrfuloiNzEgl6IqG
	6S74mNxzAFW7M=
X-Received: by 2002:a05:6214:f05:b0:882:3f38:4fbc with SMTP id 6a1803df08f44-8949020ec73mr48130296d6.61.1769186843455;
        Fri, 23 Jan 2026 08:47:23 -0800 (PST)
X-Received: by 2002:a05:6214:f05:b0:882:3f38:4fbc with SMTP id 6a1803df08f44-8949020ec73mr48129746d6.61.1769186842721;
        Fri, 23 Jan 2026 08:47:22 -0800 (PST)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89491831999sm20101546d6.15.2026.01.23.08.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 08:47:22 -0800 (PST)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [COMMITTED] faq: Add 2 new entries with link to charter and SSDLC.
Date: Fri, 23 Jan 2026 11:46:58 -0500
Message-ID: <20260123164717.454694-1-carlos@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: afb2iKGzfkEuAwyzpfjOTmcnlSPn2waN3pc-96I1hwM_1769186844
X-Mimecast-Originator: redhat.com
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a question and answer about CTI's charter.

Add a question and answer about the GNU Toolchain SSDLCs.

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/faq/index.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/source/faq/index.rst b/source/faq/index.rst
index 81bdc3c..08e731f 100644
--- a/source/faq/index.rst
+++ b/source/faq/index.rst
@@ -59,6 +59,13 @@ Some of the major goals include:
 
 * Prepare for additional software supply chain requirements from
 
+Does the GNU Toolchain or the projects have documented security requirements?
+"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
+
+Yes, in 2025 the CTI TAC worked with the community to write these requirements
+into a series of SSDLC documents. The project notes are documented
+here: `CY25: Define a SSDLC for the GNU Toolchain <https://cti.coretoolchain.dev/projects/glibc.html#cy25-define-a-ssdlc-for-the-gnu-toolchain>`_.
+
 Why are you currently using Linux Foundation IT as the service provider?
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 The CTI TAC recommendation is to use Linux Foundation IT services for
@@ -171,6 +178,10 @@ Are there any presentations covering CTI?
 """""""""""""""""""""""""""""""""""""""""
 Yes, in October 2022 the CTI TAC gave an `FSF hosted community Q&A <https://media.libreplanet.org/u/libreplanet/m/the-gti-project-a-conversation-and-community-q-a/>`_.
 
+Does CTI have a governance charter?
+"""""""""""""""""""""""""""""""""""
+Yes, this is part of the associated directed funds governance documents and is located here: `The Core Toolchain Initiative Fund Charter <https://cti.coretoolchain.dev/gov/charter.html>`_.
+
 -----------------
 
 * :ref:`genindex`
-- 
2.52.0

