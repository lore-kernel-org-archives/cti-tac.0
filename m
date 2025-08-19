Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0770A2773FA
	for <cti-tac@lists.linuxfoundation.org>; Tue, 19 Aug 2025 12:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755607701; cv=none; b=UpZRTO0wu4c09rz16v/nlLi5zeCIKMJjJWwu/EjZZZv6fYQYFQ3MTH/B7nOvCGjBuoL9VLY1JwgDZ1atbq9vKkyw917hTmOKJGepV2FysFzhVmGQ6qMFtxGXeeILEfDpAzHjgCJr7Q7egrmH3HP+YI+tYXQCDv6dOyB50WmaSgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755607701; c=relaxed/simple;
	bh=KETktqpSVL9xJISCKyszDNjXTCR/N9Dv/pOs99kzDGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=eJ2vDhyO8ptno9rW+2VbYafQvRmqZ3/swSZWlToX68VqbQPshDU3gbb/jMC35czSqicXYT+XhN1NaVuiASDwExIRH6mY4Q0PR8cdXqUrT6AYk1Snereuu6OdtpwThQvVdKlAdYc57F+n0ImP5tRBgwEzdcuI1uQPORVS3QxLYL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AEPN/1qa; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AEPN/1qa"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 918E5608D2
	for <cti-tac@lists.linuxfoundation.org>; Tue, 19 Aug 2025 12:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTXZS-vsoPm8 for <cti-tac@lists.linuxfoundation.org>;
 Tue, 19 Aug 2025 12:48:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C311E60A64
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C311E60A64
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AEPN/1qa
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C311E60A64
	for <cti-tac@lists.linuxfoundation.org>; Tue, 19 Aug 2025 12:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755607695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Haip/OyhBv4Y2bJ5+jxo5jA8E1wFxUC9VZmoaSLEEX0=;
	b=AEPN/1qaPsNiAOgCJsJpqEB5bAGlWZXTYja24DecKB2udW0uCHmsfGLRnw4GohY637Q4Qa
	CbtqzI8DatRWlfh1iGccEHG4tnkLvL0N6Tle0tMtBgS4FQrx2jb+s3yL9ra6Hmtc4f7knf
	RvcI8O9YH+YgMkPa/ptTxnqJzba8ZlY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-FqtuHEBiMMGSJN8V7yqVOA-1; Tue, 19 Aug 2025 08:48:14 -0400
X-MC-Unique: FqtuHEBiMMGSJN8V7yqVOA-1
X-Mimecast-MFC-AGG-ID: FqtuHEBiMMGSJN8V7yqVOA_1755607694
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a88ddec70so52351366d6.0
        for <cti-tac@lists.linuxfoundation.org>; Tue, 19 Aug 2025 05:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755607693; x=1756212493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Haip/OyhBv4Y2bJ5+jxo5jA8E1wFxUC9VZmoaSLEEX0=;
        b=NgTLy48SZ7xUKGJpOYMGexzDUr+5GVIonR3y01AKlyLT8N/v7q+cD/OryWPspZPhoH
         sLowRReq/CCF5Y0iOF4znkxrhrK9Wxcly45s6RODRXCDmTtdPjEuLlqyl8gkQyhHzagV
         Z6d5xlCtNPyzgjEcngK6x8afLG2XHkn03W5yDYTHiPyBelTsxjI8EQ9+J4rTJQXRv3A5
         pkMDvbErKuaqkgwLV4q6ntDt/DGZOmBHzTW2cjVMg+FbfojFKszuEyfojefZYpUr1QWK
         Ru4hHZe/ef/G91tTHcC+cfUvk2pafUXHyJyMd84yRmJNpoT8KCGc0cA8JfSYG/1uS7K5
         ruWQ==
X-Gm-Message-State: AOJu0YwJINvU7G9Izxtr6Dmc06XUc3G43fVMGw8LpjnSH5hfkU4BdQNw
	cw5vx32b7X2APW6EZJEehfSgkgisLta+Tw95+P0nxRZFfv5BkiFJcIgg3diqJZhCUUL3dkzAGFJ
	zg8MMEaYvz1Vv7VHRPwKXod1svbVo+OfXXm9FYTohcwYowLQNxTm/exhD1l/wQXRacL9Zu3FvYV
	wSrAyQoB41tsC5qTglD4NBhWNkjXi+iHdmvHpUsT8Uy4Yyiu70crSTTA==
X-Gm-Gg: ASbGncuHx6/0HJz+0GXtRsh4+6ZmBZ03U//XgNDcouKZAdQhmPADsx5yNa3hykzWSiZ
	gGbq7VBFKmngk4tNjFvu2iaoQQ3W82brY4LnGcGGGcgQRAQkj0FyzBihKwtFZ9o0S6DzhaXJvDa
	PDYbz86SZpLEcp7q+dhqyPpTr6fXc4YU4rzPpGUyUl7cCEt/QuPU7Mf8rmkOaDpm6TEdDf893oB
	Cm6ZfAFqwQhPgHxf6QyLSsOa8a/TNbg7FKQHrTTCTY4CKXZPtLS7zg3ktOlaSz3BN5D2Uz+b9L4
	g+TYgsOwdWrHPRqqHdgdZY1SURDSdlWBkHJLx0Kabw==
X-Received: by 2002:a05:6214:3009:b0:709:65c1:f17d with SMTP id 6a1803df08f44-70c35b48751mr29928426d6.25.1755607693131;
        Tue, 19 Aug 2025 05:48:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnUyjgrF3MaU7XI20bV/1/ZQq1ttZmpvEWFGvPebOsI6hcpPGMQ3sVtNKOsunnCu95Ye1ipA==
X-Received: by 2002:a05:6214:3009:b0:709:65c1:f17d with SMTP id 6a1803df08f44-70c35b48751mr29927846d6.25.1755607692197;
        Tue, 19 Aug 2025 05:48:12 -0700 (PDT)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba902f4d7sm68980966d6.2.2025.08.19.05.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:48:11 -0700 (PDT)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [PATCH] projects/glibc: Update current status for CY25.
Date: Tue, 19 Aug 2025 08:47:53 -0400
Message-ID: <20250819124809.1720821-1-carlos@redhat.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Gfp_Y_zWPD7pBypMlbImYNgCqTRMCfUWDpIpU-st8OA_1755607694
X-Mimecast-Originator: redhat.com
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add notes for SSDLC update.

Add notes for next step in SSDLC changes.

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/projects/glibc.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/source/projects/glibc.rst b/source/projects/glibc.rst
index e8c77f2..726f658 100644
--- a/source/projects/glibc.rst
+++ b/source/projects/glibc.rst
@@ -1,3 +1,25 @@
+CY25: Migrate glibc to CTI services
+===================================
+
+In 2025, as with 2024, the goal is to migrate the glibc project to use CTI services.
+
+Current Status
+--------------
+
+As of 2025-08-11 moving to new infrastructure is on hold as we discuss the core reasons for the migration.
+
+CY25: Define a SSDLC for the GNU Toolchain
+==========================================
+
+Worked to create a top-level `GNU Toolchain SSDLC <https://sourceware.org/glibc/wiki/SSDLC>`_.
+
+Worked to create a `GNU C Library SSDLC <https://sourceware.org/glibc/wiki/SSDLC/Policy/glibc>`_.
+
+Worked to review existing infrastructure against SSDLC: `Comparison of Sourceware Cyber Security project policy checklist <https://sourceware.org/glibc/wiki/SSDLC/Policy/Sourceware>`_.
+
+Started proposal for PS.1.1: `glibc SSDLC: Proposal to use gitolite for access to source code <https://inbox.sourceware.org/libc-alpha/4e9f65ea-a1bf-4d69-9dd5-63aa301f0b42@redhat.com/T/#u>`_
+
+
 CY24: Migrate glibc to CTI services 
 ===================================
 
-- 
2.50.1

