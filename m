Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF90328263
	for <cti-tac@lists.linuxfoundation.org>; Wed, 18 Feb 2026 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771425610; cv=none; b=Q06Awn5fKxitrjFeVhcZA0IhsS2XNz9v/76l+xXQVrLrskzMgAbK7nzqvezTcOm9Th4YCVoKSwUWBGNoprpWTF8zXehZW6KIeji2Sc1WGTmzVaiMorrKdGJPBje7z4fqUDtlAc+6A2vKYN88cpUhYO+TlWtyi+qxAOsVh9NOf+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771425610; c=relaxed/simple;
	bh=5oLZwZUYXougEV88NvHtz/hgFJaBYnheRUHk0A/0Vrs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=GZAVsRIA4xX0Fguq6jxznr6OvfazH4R1H6aQuzGWp420NlHUk1hgcRk5Re3UyxfRFyRNstLiT7uNhz83+HSJ6TpcCjwNMF2zcjgoAPvRN/mH1DDbnYBjszplK6lldmXyD2F5RSNwqnN2Rq8IFhxQch+YP71cBQDnENwA/0GGW1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bt4g165g; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bt4g165g"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48E23607EF
	for <cti-tac@lists.linuxfoundation.org>; Wed, 18 Feb 2026 14:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdLUZ6yUWyWj for <cti-tac@lists.linuxfoundation.org>;
 Wed, 18 Feb 2026 14:40:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E7961607D1
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7961607D1
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bt4g165g
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E7961607D1
	for <cti-tac@lists.linuxfoundation.org>; Wed, 18 Feb 2026 14:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771425606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+Er4PLB2DmwyEoH7AbGujyAGk1HrQ+wyE+WhpfiN79E=;
	b=bt4g165gXxRItC6erZWRGZ4/Y4OoGhRH2Rf+LL9xQvvel09SGE6Q9YNxXHS3Q1oQT8ohHe
	jxzfDTVRdbmvXi2At3lz2kIS8rl7/bGe+LIR4NtXqwOtC/IG1pnXPDCqdvPC476IMaNChn
	aBw3t37E75TveXxHTbeE3EXSyKdGFwU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-sxzSx0kVPHGvNc77ydo5wA-1; Wed, 18 Feb 2026 09:40:04 -0500
X-MC-Unique: sxzSx0kVPHGvNc77ydo5wA-1
X-Mimecast-MFC-AGG-ID: sxzSx0kVPHGvNc77ydo5wA_1771425604
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506c0231e63so110872731cf.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 18 Feb 2026 06:40:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771425603; x=1772030403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Er4PLB2DmwyEoH7AbGujyAGk1HrQ+wyE+WhpfiN79E=;
        b=qxl5AX1L5EvxnluhZctu0wPJwV47m0KBPjmjLJsdp6TZV3JawXi2Sqh67+Fg/fg9xo
         SnrP8OuTcopqEU7TtoPFJr6MdfGHiOANmAeWjNDm0v4SW8LHR+23AYdLAKUQs+qfdMjE
         m10tPyERkaFKUuxq90hrYU3bM3nbzJioB0TOonnBSd8wYKKzlsIvSxNMvhHhVLSLiwwP
         oJ4KJIPaAQ9Ug0+sn90f5yKI+3MluUzuzRGZ3WWIhS2tYhhNVY80ZG6ju6VH2PsUlOfZ
         bXhGejCbqknipjoYvxCR6v1uXS9m46WbpICAZQcW9gkofJGOrN4VJSnRjBUPtj95U+ld
         M1XQ==
X-Gm-Message-State: AOJu0YxnuSvVHN+9g/+rlh1jfuEdiFNEy18uz6+PRmyxcpQ1Pd5rXGjV
	K55DdMV9YcZaR+hgKrrM5rs6wxicxMa/46y4PJv0nBoDVoBvalP6i2Xkp/U1S0h8Gpd5tSDAGH2
	dJTEuhsVUE8D/nIDjuiS2tTciDg9/25pYDmTiQO3GXln+GzFxB7+XXsxeAxypMmGzr3JtNgFPw9
	KQzoLwOQX27ShN+a8PwkKEEEGAmt3hW+jHy5Tqz22vdLzsCHLtAm+lcA==
X-Gm-Gg: AZuq6aLqyXt8F8Gf+LThfcdMRcSKJuhMapn6lXGKSq6WH/nva1pSLdYBhHuB+xxkXDP
	N+hvYQo0B9KCizR4teHiHgINUnM/IqmGNINIShH+IZ6B+Hl/v9J71za3aUtfJrYLghFLFnaSsN2
	fE4htQEtdECQPti+/4ZwLmac82VhxqsXjadpgKAjKPYZSaxOpRLOPbb8suD5OUJQMI+8gsNQPUC
	F1WZNYr4snrfKHPwazu+UJKZXNz0RGda8JaGdpDdBbCg40TKE+/NR+DcElpKcs8avw8Y3K+Vobs
	o74W7fk28bf3vo8yRWuFN+9go9hT5VmqsnMMBlo/38MPMAFEHuEXb2h3rZpqzMrvxo2/bAFO6/S
	X9BuqBBqw/vm3P5n/DASea7Qfz8uX86GXw5zumOReqAtbGFWPssMk9mee/SgTo3mj47mshbOWbn
	yWWNaTbHlr62RsugXckMXQMi3Y
X-Received: by 2002:a05:622a:34b:b0:4f4:bce1:31b6 with SMTP id d75a77b69052e-506e919bd33mr24777181cf.19.1771425603596;
        Wed, 18 Feb 2026 06:40:03 -0800 (PST)
X-Received: by 2002:a05:622a:34b:b0:4f4:bce1:31b6 with SMTP id d75a77b69052e-506e919bd33mr24776751cf.19.1771425603015;
        Wed, 18 Feb 2026 06:40:03 -0800 (PST)
Received: from athas.localdomain ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0bc16dsm1914023085a.4.2026.02.18.06.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 06:40:02 -0800 (PST)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [COMMITTED] glibc: Update meeting minutes and next office hours.
Date: Wed, 18 Feb 2026 09:39:51 -0500
Message-ID: <20260218144000.2620129-1-carlos@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4FGJS6SneL9ob9OnHcDqegw-YREiSmefL6qmLVLUfxQ_1771425604
X-Mimecast-Originator: redhat.com
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the CY26 migration status for glibc.

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/projects/glibc.rst | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/source/projects/glibc.rst b/source/projects/glibc.rst
index 2fee94a..4032cb2 100644
--- a/source/projects/glibc.rst
+++ b/source/projects/glibc.rst
@@ -8,11 +8,9 @@ We will be hosting weekly Office Hours for CTI to discuss developer questions an
  * Please `sign in to BBB first <https://bbb.linuxfoundation.org/>`_.
  * Video conferencing link: `Office Hours for CTI <https://bbb.linuxfoundation.org/rooms/gq0-ndw-gku-r2e/join>`_
 
-The first meeting will be on Friday January 30th from 10am to 11am EST5EDT.
+The next meeting will be held on Friday February 27th from 10am to 11am EST5EDT.
 
-The second meeting will be on Friday February 6th from 1pm to 2pm EST5EDT (supporting later timezones).
-
-The third meeting will likely be very early to support earlier timezones.
+Meetings move between time slots to support APAC, NA East Coast, and NA West Coast participation.
 
 Migration plan includes:
 
@@ -27,6 +25,12 @@ Future steps in the migration plan include:
  * Migrating the website.
  * Migrating the wiki.
 
+Meeting minutes for Office Hours for CTI:
+
+ * `2026-02-13 <https://inbox.sourceware.org/libc-alpha/41a4d52e-e890-4a12-9046-92f1a6f51eaf@redhat.com/>`_
+ * `2026-02-06 <https://inbox.sourceware.org/libc-alpha/803a7a2a-c324-46a9-bbc1-8d892f08b3ca@redhat.com/>`_
+ * `2026-01-30 <https://inbox.sourceware.org/libc-alpha/252c1170-ffba-4dc7-9331-49b46a2deaed@redhat.com/>`_ (first office hours)
+
 Current Status
 --------------
 
-- 
2.53.0

