Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2149A25F98A
	for <cti-tac@lists.linuxfoundation.org>; Fri, 20 Mar 2026 14:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774016144; cv=none; b=kYBHF1cI2AZtBHwrjIACkcwTlTG2qds0Y2EtwtxTvbIOcM/IJTT3ttP+hxlfGDJa/FKIGQmWA/Y69XkmYJduKjJ6rquKG1cTpIlA/1YTOjs1isiDaGY7NaubEzOePKtaZkzJcrc2FEnyIfzvod3Htw3JoL1CzASQvtinVDdoEcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774016144; c=relaxed/simple;
	bh=z0DC46gatbmhq5mc89V5gduAgX+O3hZcgZOhOca703c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=S2mEAgE7HdSnK8Ng/T8J8jbwfAG8Ey5avqgASNZzFN12CMldbHuVEJNiMvTpVXjjozfMfcxYiM6NltZpEbQneqfC1x8mdvyhxH887DkcuD8KHRHPV0OdZSD0CvJ/aaqEOm3Ogpm4t0OTQVCCV2k7Pxwm+8MMfNOoiZYOx9o27Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a5WIJGy3; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a5WIJGy3"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D15EF61B53
	for <cti-tac@lists.linuxfoundation.org>; Fri, 20 Mar 2026 14:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q22DwPe9M2gJ for <cti-tac@lists.linuxfoundation.org>;
 Fri, 20 Mar 2026 14:15:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B7CC461B4D
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7CC461B4D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a5WIJGy3
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B7CC461B4D
	for <cti-tac@lists.linuxfoundation.org>; Fri, 20 Mar 2026 14:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774016140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X1AizgRHEG/xgfooMCme07KQ2ewotC3Jy6WmGN5TbaE=;
	b=a5WIJGy3BYhh38y7alr1+RccW0my+9hghfp7edZLOfDlsLiB3cN3sqPYBbVQGWmVtXCpOx
	an70k9gLvX65b5OF4nzfTg87hf/f8i+oCXzLFOSEecfM0GsWBrPTGYZnnx+5ZKcxNksRCA
	n0PZ4U9bemGjflIoRLz72gaOpgmlrGA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-g1F7GI6TMm2UEn4YWTov5w-1; Fri, 20 Mar 2026 10:15:38 -0400
X-MC-Unique: g1F7GI6TMm2UEn4YWTov5w-1
X-Mimecast-MFC-AGG-ID: g1F7GI6TMm2UEn4YWTov5w_1774016138
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfcf23c0e1so269088285a.2
        for <cti-tac@lists.linuxfoundation.org>; Fri, 20 Mar 2026 07:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774016137; x=1774620937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1AizgRHEG/xgfooMCme07KQ2ewotC3Jy6WmGN5TbaE=;
        b=ZIBIqwVJFkP/uxlYJHRZ5vzNWqV8km/c1bNQFmWtXVnDK9T8qJ31ILlFcrHTm6Ej2x
         PEgJ2Dc3KOyY0ktmvtzbfThHihY0pnl4nbyKDrPc6LAY5EG40F27AQwKAg8nnQlaJ+GM
         Dv7kZSO6xqTohPB862DzkLjXqmpC8sJ9mgpJ/SokDJZCTVY65iFx+CUqD6DbnY1owTWM
         iTMsvIlFbTNhQ7+y9DCxiQk0aCFxblAOeTT3X7yEVhIVAc3qp3G82ihOKZrU47nszHx0
         qa9/2Qmp8RXGRBa09th8O50CYtH1q2RjZrDWu1VtNxXxiIiFKd1xSmnmTYT/TyZhDVFe
         0svg==
X-Gm-Message-State: AOJu0YxPYjg0Lq3uyxwE498PIOaDT2SJWUWwHVrzyU3bfm+aWlsK2lym
	tAW/CzTK3CIYdKux+TFAbtG5Gs9giWwTxYxNz6Xg+Y7K9DLF08mKJ7CaQPuCDkAV0eBDQZfkK7e
	eQtWeDvGXAiekP8aJ7/KQiRuAWjO/cuOKOpQ2KLdxwVprosXHEgEVh+CKDqjW+wpa31N4mMApP8
	oc64X1DxLPqzAyepSjNfL7P9THUvm9iH4c/NvoL7qsZyUb/x8O1fTeuQ==
X-Gm-Gg: ATEYQzx6BM+zHEoZx1FM+TzVROUHrh1vQinfQFLpdJQjTNZe899dVTuSv/JPpJ8Le2D
	FIpVG5O5nbvpyFkOhvHdkGz+RqXRAOITZk+QJZDvWPgZqxovL3gpJXOK+wXs5Jffyzjn7n8rO55
	33Q2JrSyZFWEP6Hurtol38PGF5/44WOvpuG6yGI3BBqLZm92YL/7G0eq4au5O/lHhpW/v5yD0Xm
	eyOG54FMD6Z/ge71I64712Q0chIl7xBytxRNsfiYGQADWPdvwEF291QLqmqYULFFbmLHug1ENsC
	wkNVEXdL+cWsiZPMmhGoNFNAwy9rr8C0dCg+K/Y4Mx3kdQwLDWrYvg9a3TRd9BBPdipKvgCZ26E
	GkC6gKxnIQtfCt0kGSDVKMiDGpKKWJoXB56pb1tb2b6Exi2e3Yp4D9J5qqgPpyo9lZGV8d8egLj
	lKmuafb3OCJ6Zk1gYS89fsxVv1
X-Received: by 2002:a05:620a:7103:b0:8cf:c1c2:8fb with SMTP id af79cd13be357-8cfc7e8aae4mr446111685a.21.1774016135152;
        Fri, 20 Mar 2026 07:15:35 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:8cf:c1c2:8fb with SMTP id af79cd13be357-8cfc7e8aae4mr446056485a.21.1774016131046;
        Fri, 20 Mar 2026 07:15:31 -0700 (PDT)
Received: from athas.localdomain ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfd47c9226sm5450085a.23.2026.03.20.07.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:15:30 -0700 (PDT)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [COMMITTED] glibc: Update meeting minutes and next office hours.
Date: Fri, 20 Mar 2026 10:14:32 -0400
Message-ID: <20260320141526.1951732-1-carlos@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q7L_3VP18iAaVrJzxikhOIokcUZf9xPCXcoHBQugIdY_1774016138
X-Mimecast-Originator: redhat.com
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/projects/glibc.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/source/projects/glibc.rst b/source/projects/glibc.rst
index 4032cb2..71e80a7 100644
--- a/source/projects/glibc.rst
+++ b/source/projects/glibc.rst
@@ -8,9 +8,9 @@ We will be hosting weekly Office Hours for CTI to discuss developer questions an
  * Please `sign in to BBB first <https://bbb.linuxfoundation.org/>`_.
  * Video conferencing link: `Office Hours for CTI <https://bbb.linuxfoundation.org/rooms/gq0-ndw-gku-r2e/join>`_
 
-The next meeting will be held on Friday February 27th from 10am to 11am EST5EDT.
+The next meeting will be held on Friday at 11am to 12am EST5EDT.
 
-Meetings move between time slots to support APAC, NA East Coast, and NA West Coast participation.
+Meetings may move between time slots to support APAC, NA East Coast, and NA West Coast participation.
 
 Migration plan includes:
 
@@ -27,6 +27,8 @@ Future steps in the migration plan include:
 
 Meeting minutes for Office Hours for CTI:
 
+ * `2026-03-13 <https://inbox.sourceware.org/libc-alpha/b158b348-a8e0-4b80-8795-ca926d10f14d@redhat.com/>`_
+ * `2026-02-27 <https://inbox.sourceware.org/libc-alpha/eabfe0be-7e59-4484-b4bd-248f4fd3682a@redhat.com/>`_
  * `2026-02-13 <https://inbox.sourceware.org/libc-alpha/41a4d52e-e890-4a12-9046-92f1a6f51eaf@redhat.com/>`_
  * `2026-02-06 <https://inbox.sourceware.org/libc-alpha/803a7a2a-c324-46a9-bbc1-8d892f08b3ca@redhat.com/>`_
  * `2026-01-30 <https://inbox.sourceware.org/libc-alpha/252c1170-ffba-4dc7-9331-49b46a2deaed@redhat.com/>`_ (first office hours)
-- 
2.53.0

