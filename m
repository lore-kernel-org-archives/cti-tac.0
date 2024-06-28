Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134891CCCB2
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 18:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719597991; cv=none; b=iR93PLQKL5XTKl9rRzZA29zFV2X1yIumjq+GcFFQPlIpdGpBY18Jz30dQh8Bc3kR1PL75W0VKZFZLQ3L8/U4HXWO3GZMGigrW3dscIhZ3q3Q2vcL45JC3U6++kpPROELFm9DVzuYOpDE65XVx828Vjlaeh5XNIt1MIbO/AN7YDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719597991; c=relaxed/simple;
	bh=b3i4yRsrTew3f8NmAAO5mD6/3YueXFI8115P18qHyjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=Z63iJv/uTK/DlQMkIyOulhezcxhxGulta3AvBgf+iTA/PqXFr8NuIt8uQVq5SgaXHwjYDL2mFPxG2YBD9P9jfeQBmu9cW0/Zavtw/wICGd0AcqnCAaCCYrnM1vB5mfK/qZnTNG8LvmkMdavxkFEEsXWH/GbMhl15i/yAQ+XRrbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YQBY1m0g; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YQBY1m0g"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2F80400E4
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 18:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUTcoO_L6obU for <cti-tac@lists.linuxfoundation.org>;
 Fri, 28 Jun 2024 18:06:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD5AB400C7
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD5AB400C7
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YQBY1m0g
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BD5AB400C7
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 18:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719597986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FKrEq6OoXvaG49flACMSuRgRlSMYcznU/D4HCsT62Ns=;
	b=YQBY1m0gsYDBDfp8FBLXDptZW0SIGf873vcQGDF5oEncdIjKIL4X0pVRK58QfwWaxv+SBR
	5z0VaYc96kOyZWwej8O5DQeMAZkYOy4/1Vez0xdte781BZeNVPsI0QgktMD/htspFiUasG
	SjaKUQ+l2kqxBiE6PE7BNB4xRn1Scn4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-v-HrfeK8O9GqkoIykgIlMQ-1; Fri, 28 Jun 2024 14:06:25 -0400
X-MC-Unique: v-HrfeK8O9GqkoIykgIlMQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6b5912466dcso10910226d6.1
        for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 11:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719597984; x=1720202784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKrEq6OoXvaG49flACMSuRgRlSMYcznU/D4HCsT62Ns=;
        b=okw0AhbNMyIrT7I0GNvzbOtveKMuS0+UwX0rhPSM6ZabbChK+WvbmcD9Ohf/Qi+lgM
         iFMASWLv+mh1Tn1gyQD65hqY29isZYHFUdSkoY3VGwaCeampYbTFkXYn28/dqPBk5qKh
         aH8UK4ytlK+nHdiNiEA3ySGo+xB/MVjIIIrKNdwJUDj3SlrLTzJQZgdZm3n5pOShe7+j
         /Pc8TCZuaXdoHQ5lyFnvsOja+FBO0h2lQ2Bmu8lKGF/3Tzv2mPj/p1DRre1DXs6Zp4EP
         kWJCvnDGh3PnHbtCvyfsnkN14TTag0WIqfF4yqMtO/Xq63b8nNkeS3hxwCyZkSZLK+gH
         bUCQ==
X-Gm-Message-State: AOJu0YwNBHNr7IVnmti8MZk84bAoKX2fKeT1EZ936L0141/b/Wnh+MvC
	evnF8MOaVp8YFzyFQ4CuHvEjExguCtcXA9vfm5bB0USo69H/YMYmTv+CpQhcp1xNdG/jFgXKdiI
	wkoK8r8K74/0R4NEQqCtirLIIp/Jc6j/3IElVTwF8OIuv/AnwX1ZiK1GmoBZExwBDuZEAiN+Bbw
	2WRJI1fT/AZF/98iuoKUjjuqE2GTlmk5YnOYRVh2HQ0IB7b2WYAA==
X-Received: by 2002:a05:6214:286:b0:6ad:67d3:af2f with SMTP id 6a1803df08f44-6b54099db58mr178135616d6.13.1719597984209;
        Fri, 28 Jun 2024 11:06:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaIBUwNu240jCMAKdNsm26X0zKd53qPj4Aawt3/Mib3IQ4/3Iz1PjE5NhRfOyE/cJqbgblRg==
X-Received: by 2002:a05:6214:286:b0:6ad:67d3:af2f with SMTP id 6a1803df08f44-6b54099db58mr178135356d6.13.1719597983710;
        Fri, 28 Jun 2024 11:06:23 -0700 (PDT)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b59e5f262asm9812646d6.89.2024.06.28.11.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:06:22 -0700 (PDT)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [PATCH] projects/glibc: Update status.
Date: Fri, 28 Jun 2024 14:05:40 -0400
Message-ID: <20240628180618.427113-1-carlos@redhat.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the status of the glibc project to use CTI resources.

As part of that update also update the following documents:

tac/minutes: Add the additional minutes from recent TAC meetings.
tac/audit: Include a link to the CY24 technical audit.
tac/cy24audit: Include Ian Kelling's comments on the BBB service.
tac/index: Include a link the CY24 technical audit.

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/projects/glibc.rst | 53 ++++++++++++++++++++++-----------------
 source/tac/audit.rst      |  2 +-
 source/tac/cy24audit.rst  | 43 +++++++++++++++++++++++++++++++
 source/tac/index.rst      |  3 ++-
 source/tac/minutes.rst    |  4 +++
 5 files changed, 80 insertions(+), 25 deletions(-)
 create mode 100644 source/tac/cy24audit.rst

diff --git a/source/projects/glibc.rst b/source/projects/glibc.rst
index 27e6b09..9d1bf32 100644
--- a/source/projects/glibc.rst
+++ b/source/projects/glibc.rst
@@ -3,37 +3,44 @@ CY24: Migrate glibc to CTI services
 
 In 2024 the goal is to migrate the glibc project to use CTI services.
 
-The community feedback was collected from July to August 2023.
-
 Current Status
 --------------
 
-The `GNU Maintainers for the glibc project 
-<https://sourceware.org/glibc/wiki/MAINTAINERS#Project_stewards_.28GNU_package_maintainers.29>`_
-were asked to make a decision on switching to the services provided by
-CTI and currently the following support has been tallied:
-
- * Ryan Arnold - Yay
- * Paul Eggert - Nay
- * Jakub Jelinek - Abstain
- * Maxim Kuvyrkov - Yay
- * Joseph Myers - Yay
- * Carlos O'Donell - Yay
- * Alexandre Oliva - Nay
- * Andreas Schwab - No statement
-
-As of 2024-02-28 feedback from the stewards was being incorporated into
-this document to provide assurances that FOSS would be used to provide
-services and that there was a checking mechanism in place for services
-to remain FOSS.
+As of 2024-06-28 we have finalized a statement of work with the service
+provider, Linux Foundation IT, and `recorded it here on the CTI TAC
+mailing list <https://lore.kernel.org/cti-tac/2186f48a-12cd-4630-8944-26b9042e924a@redhat.com/T/#u>`_.
 
 Next steps
 ----------
 
- * Revisit discussion with Paul Eggert and attain resolution in March 2024
-   to move forward.
+* Plan for CTI Board meeting to approve budget spend for SOW.
+
+* Start transition planning with Linux Foundation IT team.
+
+Notes
+-----
+
+* Revisitied discussion with Paul Eggert and attain resolution in March 2024 to move forward. Posted originally `here <https://inbox.sourceware.org/libc-alpha/45e98807-908f-0968-b6fe-5dbb0af265b1@redhat.com/>`_
+
+ * 2024-03-08: CTI website launched on March 8th 2024 to attempt to resolve requests for documenation from Paul Eggert.
+
+* The `GNU Maintainers for the glibc project <https://sourceware.org/glibc/wiki/MAINTAINERS#Project_stewards_.28GNU_package_maintainers.29>`_ were asked to make a decision on switching to the services provided by CTI and currently the following support has been tallied:
+
+  * Ryan Arnold - Yay
+  * Paul Eggert - Nay
+  * Jakub Jelinek - Abstain
+  * Maxim Kuvyrkov - Yay
+  * Joseph Myers - Yay
+  * Carlos O'Donell - Yay
+  * Alexandre Oliva - Nay
+  * Andreas Schwab - No statement
+
+* As of 2024-02-28 feedback from the stewards was being incorporated into
+  this document to provide assurances that FOSS would be used to provide
+  services and that there was a checking mechanism in place for services
+  to remain FOSS.
 
-Posted originally here: https://inbox.sourceware.org/libc-alpha/45e98807-908f-0968-b6fe-5dbb0af265b1@redhat.com/
+* Community feedback was collected from July to August 2023.
 
 Service migration
 -----------------
diff --git a/source/tac/audit.rst b/source/tac/audit.rst
index 6398ef0..163eedb 100644
--- a/source/tac/audit.rst
+++ b/source/tac/audit.rst
@@ -18,7 +18,7 @@ that will be noted in the public report and actions will be taken
 by the TAC to discuss these with the community and current service
 provider.
 
-The CY24 audit has not yet been conducted, but the audit will review
+The :doc:`CY24 audit<cy24audit>`: has not yet been completed, but the audit will review
 the current :doc:`services being used <../services/index>`:.
 
 -----------------
diff --git a/source/tac/cy24audit.rst b/source/tac/cy24audit.rst
new file mode 100644
index 0000000..d8f556e
--- /dev/null
+++ b/source/tac/cy24audit.rst
@@ -0,0 +1,43 @@
+CY24 Technical Audit
+======================
+
+The CTI TAC will conduct an annual technical audit of the services
+provided to ensure that the services in use continue to meet the
+technical requirements of the community.
+
+The audit will cover:
+
+  * Reviewing that services cover the current requirements, including any security requirements.
+
+  * Reviewing that the services are being provided using FOSS.
+
+  * Reviewing the cost of all services currently being provided.
+
+If prices have increased or services are not being provided by FOSS
+that will be noted in the public report and actions will be taken
+by the TAC to discuss these with the community and current service
+provider.
+
+Service Audit
+=============
+
+* Video conferencing services
+
+    * Service uses `BBB <https://github.com/bigbluebutton/bigbluebutton>`_
+      which is FOSS and LGPL-3.0 licensed.
+
+It was raised by Ian Kelling that the current BigBlueButton conference service
+currently has a `dependency on the non-free MongoDB <https://lore.kernel.org/cti-tac/87v846a1zi.fsf@fsf.org/>`_.
+The upstream BigBlueButton developers intend to remove the dependency on this
+non-free component, but that work has not yet completed. As part of the CY24
+audit we should discuss what actions CTI will take regarding this issue since
+we require that all services should be implemented with free software. The
+best outcome would be to remove the dependency on MongoDB, but that needs to
+be discussed with the broader FOSS community to see if we can help prioritize
+or support that work.
+
+-----------------
+
+* :ref:`genindex`
+
+* :ref:`search`
diff --git a/source/tac/index.rst b/source/tac/index.rst
index 876b8c3..d19ac58 100644
--- a/source/tac/index.rst
+++ b/source/tac/index.rst
@@ -6,8 +6,9 @@ Core Toolchain Infrastructure - Technical Advisory Council
 
 .. toctree::
 
-   Meetings Minutes <minutes>
+   Meetings minutes <minutes>
    Annual technical audit <audit>
+   CY24 technical audit <cy24audit>
 
 The Core Toolchain Infrastructure Technical Advisory Council is
 currently made up of the following community member (alphabetical):
diff --git a/source/tac/minutes.rst b/source/tac/minutes.rst
index b279cfb..2606abb 100644
--- a/source/tac/minutes.rst
+++ b/source/tac/minutes.rst
@@ -7,6 +7,10 @@ The CTI TAC meetings minutes are sent to mailing list for archival: https://lore
 
 Recent meeting minutes are linked to here:
 
+  * `CTI TAC Meeting Notes 2024-06-27 <https://lore.kernel.org/cti-tac/a1e31779-b3c3-4016-ae69-27aced5971e9@redhat.com/T/#u>`_
+  * `CTI TAC Meeting Notes 2024-05-29 <https://lore.kernel.org/cti-tac/69862ea2-d7e2-4fdc-91a6-a80525ecf423@redhat.com/T/#u>`_
+  * `CTI TAC Meeting Notes 2024-04-24 <https://lore.kernel.org/cti-tac/4dc7d706-f6fc-4494-b24c-b1a38fc98810@redhat.com/T/#u>`_
+  * `CTI TAC Meeting Notes 2024-03-27 <https://lore.kernel.org/cti-tac/d8b26d0d-7a68-4dcb-a7c7-1776c5cbbde2@redhat.com/T/#u>`_
   * `CTI TAC Meeting Notes 2024-02-28 <https://lore.kernel.org/cti-tac/ea82c272-9bdf-4685-bc72-9fa6da83e6be@redhat.com/T/#u>`_
   * `CTI TAC Meeting Notes 2024-01-31 <https://lore.kernel.org/cti-tac/6b433955-2865-232a-44c0-59682cbac446@redhat.com/T/#u>`_
 
-- 
2.45.0

