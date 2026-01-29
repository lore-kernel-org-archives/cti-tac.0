Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642272D46B3
	for <cti-tac@lists.linuxfoundation.org>; Thu, 29 Jan 2026 22:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769727303; cv=none; b=CT9ElSjDsSALL2YnqI/cg9HPHLEQRQanRwnvAFPTtJlCpIJ6UL/CzVVkCIawaKOizFUKzGRccpKeoudLaHdh9cRzWcuS6fm9mY8EbVfS3CfO9aVbyK5jhB2TOzkfR3jhzhyIdc8BCAfE7jzTAfc+7R9sT3jBLd4cfO9MWj6iPz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769727303; c=relaxed/simple;
	bh=zMhBm9320XP4dIxkNnEX87enGzYpPse3pTd0Rb5cXug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=Cx44YTKmX9xNKJVeh6ouEufQTlx9awUa1El2Fr8znNuzc4UqQby4cnApQTk2zz3L+16tdrEBaOeaR/XEWqZ5eS+9THrcgTUhTE2XIKKhNvPL5ebeZWg05fnOsgqaj3PTSwXhFAriiUFGa2Rg8CHoIQa1q9ikecWxChuf6Gh6sMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XNzBNdtC; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XNzBNdtC"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E46A60BF2
	for <cti-tac@lists.linuxfoundation.org>; Thu, 29 Jan 2026 22:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCIV2b53BFPv for <cti-tac@lists.linuxfoundation.org>;
 Thu, 29 Jan 2026 22:55:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0378C60A9A
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0378C60A9A
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XNzBNdtC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0378C60A9A
	for <cti-tac@lists.linuxfoundation.org>; Thu, 29 Jan 2026 22:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769727299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tK/DhGLx+ThHVX06HVZemVtv/eYI8Mqwmwn9dl3V5mQ=;
	b=XNzBNdtCaH0TlwgrXnvXVYfWpXXMi/NWc3o+x37bXwNVk2OcBCk4QRcixSx00wTossag2U
	KLd32WDHZzZwkvvq1oMV2TYCtWqjcBrQucf4xJesiGm10KG2OpmU9U1yr6vk/ymfr1tnDC
	MDaraPas3osImSvV9549kGJvPiZf6jk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-v0dVPNVsM723NeDcsmIZ4Q-1; Thu, 29 Jan 2026 17:54:57 -0500
X-MC-Unique: v0dVPNVsM723NeDcsmIZ4Q-1
X-Mimecast-MFC-AGG-ID: v0dVPNVsM723NeDcsmIZ4Q_1769727297
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89463017976so42178326d6.2
        for <cti-tac@lists.linuxfoundation.org>; Thu, 29 Jan 2026 14:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769727297; x=1770332097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tK/DhGLx+ThHVX06HVZemVtv/eYI8Mqwmwn9dl3V5mQ=;
        b=xDKcP0QdRKB8e3zUlEL1bD+hygKhuepVAyfVs8o5tD7nkxj3o2/V5fRkmNzK67Nbnb
         hTuQ0wXUVBx1ihoBsFF9I9AeyOwJKrf5qxl9LrbYwfwEW8OrBvP29SCVqVXeTq6EeNsc
         E+L40XOLniv8oe93cth2rC75Skme76fHsUdQRkj7RVBYqBJNHVeRudKb16Lb3ljfYoP8
         hDILmVUA+Ge6zVjEaqhM3bDaAn26GDrlZGDmloatl/BFeTjzhxHDn87FY+Gpy5njg8bh
         fO/kmjk2k81FkRDm+ZgmZUZF0XBoMx9XutQM3vTKulOtAeebtdI6BhVsdvHAfHaQjWAE
         geCw==
X-Gm-Message-State: AOJu0YwNRg+Y4y7KYfH+9NrDelgPMHh80GgYeNNd6WLNduWRVmkdJ2x6
	dVz7KQZ5ihDjAO4EPfrNZw6d+aY6eHvXMF/HFV5vHkwWD0UU3nHoPAb+ejVnOd8S8AgvkAgpD84
	kGvdNR/zZajrLjGmpwgNqXWxCJb1GcxaH1Z0kz0SIrcZHfPp0nHde0bGqI3ivtM2l6O4klj2Sf1
	nZt9as36TZCs6DMtSy1y+4HDEM3Rb3gVrx/vcXfreFSIvo9wPmIxkWPA==
X-Gm-Gg: AZuq6aIV7ouH+Me6CoHVIChgep8Z6UXH0ZTAu4eU1SPlq6090KOC5fWlybpv1chkF3j
	C3VXkCskz8ceo39ZLXlN+MGLHHt8w8QMvZV99T8GPCPBBIV0zEDFYnzaLDsD9DMEhNyU7uzUdAd
	PSxqhnqiC7bpHHy9tS2oQcT8Yq9uZ2fr3nAxVIu9+/CbIpQQorZJYjOZSoYbGW9xIJhQJzML0lf
	JGVldnE3qho668bJ1akoIotU9a3U9RDDQ7tiMYf3A5ZgTdmeUdF1XMW48G85nhYa+BY8y5Hf9mO
	1IU75+B6541UBDsRu7bsU3jL/R/PEDhen/btzPVm7vt26gKHYoi2HSdfBCf7MIIq+n9q8y2ZoIW
	LAH9UaWCbN2dbuEiFit9+WzKgcSOOqRMl2awMaKAHyIR3KLqv5KZEmgmWBHUk5L/VjergBSW639
	dM/H+4H+d1q1w=
X-Received: by 2002:a05:6214:1947:b0:88f:ca79:844a with SMTP id 6a1803df08f44-894ea115386mr14315886d6.48.1769727296665;
        Thu, 29 Jan 2026 14:54:56 -0800 (PST)
X-Received: by 2002:a05:6214:1947:b0:88f:ca79:844a with SMTP id 6a1803df08f44-894ea115386mr14315656d6.48.1769727296125;
        Thu, 29 Jan 2026 14:54:56 -0800 (PST)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d376e65bsm46446006d6.55.2026.01.29.14.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 14:54:55 -0800 (PST)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [COMMITTED] glibc: Update CY26 plan.
Date: Thu, 29 Jan 2026 17:54:34 -0500
Message-ID: <20260129225453.1943721-1-carlos@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yeEE4zLCRqwXmKGZ3cMWksrqx1V3DwH9zsIQkPQ_W_Q_1769727297
X-Mimecast-Originator: redhat.com
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/projects/glibc.rst    | 30 +++++++++++++++++++++++++++++-
 source/spelling_wordlist.txt |  1 +
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/source/projects/glibc.rst b/source/projects/glibc.rst
index c3a01b7..cc5889f 100644
--- a/source/projects/glibc.rst
+++ b/source/projects/glibc.rst
@@ -1,3 +1,32 @@
+CY26: Migrate glibc to CTI services
+===================================
+
+In 2026 we have started the process of migrating core services for glibc.
+
+We will be hosting weekly Office Hours for CTI to discuss developer questions and the migration.
+
+ * Video conferencing link: `Office Hours for CTI <https://bbb.linuxfoundation.org/rooms//gq0-ndw-gku-r2e/join>`_
+
+The first meeting will be on Friday January 30th from 10am to 11am EST5EDT.
+
+Migration plan includes:
+
+ * Migrating from git to gitolite.
+ * Migrating mailing lists.
+ * Updating the SOW with LF IT.
+
+Future steps in the migration plan include:
+
+ * Migrating bugzilla.
+ * Migrating patchwork.
+ * Migrating the website.
+ * Migrating the wiki.
+
+Current Status
+--------------
+
+Posted the `current next steps to the community <https://inbox.sourceware.org/libc-alpha/287f1496-8f87-4ed3-a18b-3cb8c52c2ab3@redhat.com/>`_.
+
 CY25: Migrate glibc to CTI services
 ===================================
 
@@ -10,7 +39,6 @@ As of 2025-08-19 an `evaluation of glibc moving from git to gitolite is in progr
 
 As of 2025-08-11 moving to new infrastructure is on hold as we discuss the core reasons for the migration.
 
-
 CY25: Define a SSDLC for the GNU Toolchain
 ==========================================
 
diff --git a/source/spelling_wordlist.txt b/source/spelling_wordlist.txt
index ac68c02..dfcd436 100644
--- a/source/spelling_wordlist.txt
+++ b/source/spelling_wordlist.txt
@@ -63,6 +63,7 @@ spamassassin
 spammy
 svn
 testresults
+th
 toolchain
 transferee
 trybot
-- 
2.52.0

