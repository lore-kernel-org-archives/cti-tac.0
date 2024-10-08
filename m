Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2390A1DE8AA
	for <cti-tac@lists.linuxfoundation.org>; Tue,  8 Oct 2024 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728392137; cv=none; b=mbIwfJ+/YrNgS9f9boAjogQHLTZ7qFjQvM6qKf3JYWkj9ovyG7Pk3YGQUjSMeq6LrHQKdMohpz9zAIiESe20gvPkmZbqCtHoi/DftQJpSN2o3sMq3reYCTXwQ0ZrZzwzk4o5KOfuGifDusaYt3GNHjYn6u8Zp3u6sXSEAGWJ7u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728392137; c=relaxed/simple;
	bh=+11uQA2YnVTXWNlC6wM7gICZBd+CBMvE+Ve42B01Nu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=J6sXNokNlr91mAJfoSC0KuDeKuN3GoiQr/C9oslpthpxjlRxRwJv29T75ia/0OAcl9c9BCCEqX5kXag/9/p7aPHpBCPpiScNAuA7gTX9AXAfhTti6PtnxIHGFRptrrxm1oGC5IyTKG5zJ9+bgbDPFhUc/72lLwq15FcRIvZo1MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KQq9fg5L; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KQq9fg5L"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1E9440A6C
	for <cti-tac@lists.linuxfoundation.org>; Tue,  8 Oct 2024 12:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXnenQJk8ztJ for <cti-tac@lists.linuxfoundation.org>;
 Tue,  8 Oct 2024 12:55:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7335540273
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7335540273
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KQq9fg5L
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7335540273
	for <cti-tac@lists.linuxfoundation.org>; Tue,  8 Oct 2024 12:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728392132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kRrWf3wqXSurom0Rl1Y7Zc0PTwRAYUbvD03aRct7cJM=;
	b=KQq9fg5L1nzWnJ0/S/fJ8eox7httRvs94ZPZTkn+IXlKu37VZOgUHHf8odfIt4vN4SpRrj
	VHukjL970eXdWgWoC5QkPpsTG/+RDRgujqEtUQUARYtsa2kS+sn5L4/kNveDHeUywzIQtg
	FTrNcrvlTDQ2lGGsZQ0AZlTLaEhtKkQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-PmKwd66qMEiTY604prxgGQ-1; Tue, 08 Oct 2024 08:55:31 -0400
X-MC-Unique: PmKwd66qMEiTY604prxgGQ-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbc7185f75so1806986d6.3
        for <cti-tac@lists.linuxfoundation.org>; Tue, 08 Oct 2024 05:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728392130; x=1728996930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRrWf3wqXSurom0Rl1Y7Zc0PTwRAYUbvD03aRct7cJM=;
        b=lUUQrw1d8cAKGWsa04/pqcCGwagCKGsjcyqTAT/+IPops22ue6FXIgmCIgrIw82fNk
         hIpQBWbMhdPzE3OVdrehalHvkrBMkTnp5dos3W/nX6J7OQDCwDa9o07acpXnnPwmu303
         Ig1tlgRJsOxZITHQQICNrRDHNG2xOFc585WSbvA7mnklK1SM5rdIAH6w6tgNcmBh4q/c
         13N1IOEmlyCeltNblV+wgY8lVPHca3+lmbbLHOURppQ6QP/W2sy2evO8j2Iepwvh23JT
         nQQjRBHK9luOrm6LEdiYffJcjULz5aXcc3xQ/pZklchAX0SS8IJbryxMixV0ihXuzDqs
         qmCg==
X-Gm-Message-State: AOJu0Yyblfs+if05+4lwCZEyG+lyNjf2koJoNGk5jN7S6bVCihHWyOl9
	77MT25uuST9au0kit0urwRdwTutNwXTcU20Q3rDfInFonI899awMi9KT7p4wlyXTgvSSu6h0he/
	x0Gayt5Ha6Hfhv8nT/T1WIe1Yrr/evBqL6o+oA+n1neYObHjIuYHp3jTBOcykXPdrRUuqyePnqu
	ehzEd4eeEa7F3T/nM/e0jGhb3cbFQctjKkD3lfgnq/aa72Mw4Q3aot
X-Received: by 2002:a05:6214:4507:b0:6cb:4b6e:9162 with SMTP id 6a1803df08f44-6cb9a454fa6mr197896216d6.33.1728392130361;
        Tue, 08 Oct 2024 05:55:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvDGXZuKnTmp9n8DsUCYTdJU9cCv/n41QaKhQcZUNUzZVTON72CJma+g0sDy/OavB+A3tEdA==
X-Received: by 2002:a05:6214:4507:b0:6cb:4b6e:9162 with SMTP id 6a1803df08f44-6cb9a454fa6mr197895946d6.33.1728392129950;
        Tue, 08 Oct 2024 05:55:29 -0700 (PDT)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cba47513ffsm35283366d6.85.2024.10.08.05.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 05:55:29 -0700 (PDT)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [PATCH] tac/minutes: Add additional notes and links.
Date: Tue,  8 Oct 2024 08:55:13 -0400
Message-ID: <20241008125526.3984433-1-carlos@redhat.com>
X-Mailer: git-send-email 2.46.0
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

Include the meeting minutes from recent meetings.

Include the meeting link.

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/tac/minutes.rst | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/source/tac/minutes.rst b/source/tac/minutes.rst
index 2606abb..454d6ec 100644
--- a/source/tac/minutes.rst
+++ b/source/tac/minutes.rst
@@ -3,15 +3,20 @@ Meeting Minutes
 
 The CTI TAC meets on the last Wednesday of every month at 11am EST5EDT.
 
+The CTI TAC uses BBB for the meeting: https://bbb.linuxfoundation.org/rooms/adm-iuc-px7-mk1/join
+
 The CTI TAC meetings minutes are sent to mailing list for archival: https://lore.kernel.org/cti-tac/
 
 Recent meeting minutes are linked to here:
 
-  * `CTI TAC Meeting Notes 2024-06-27 <https://lore.kernel.org/cti-tac/a1e31779-b3c3-4016-ae69-27aced5971e9@redhat.com/T/#u>`_
-  * `CTI TAC Meeting Notes 2024-05-29 <https://lore.kernel.org/cti-tac/69862ea2-d7e2-4fdc-91a6-a80525ecf423@redhat.com/T/#u>`_
-  * `CTI TAC Meeting Notes 2024-04-24 <https://lore.kernel.org/cti-tac/4dc7d706-f6fc-4494-b24c-b1a38fc98810@redhat.com/T/#u>`_
-  * `CTI TAC Meeting Notes 2024-03-27 <https://lore.kernel.org/cti-tac/d8b26d0d-7a68-4dcb-a7c7-1776c5cbbde2@redhat.com/T/#u>`_
-  * `CTI TAC Meeting Notes 2024-02-28 <https://lore.kernel.org/cti-tac/ea82c272-9bdf-4685-bc72-9fa6da83e6be@redhat.com/T/#u>`_
-  * `CTI TAC Meeting Notes 2024-01-31 <https://lore.kernel.org/cti-tac/6b433955-2865-232a-44c0-59682cbac446@redhat.com/T/#u>`_
+  * `CTI TAC Meeting Notes 2024-09-25 <https://lore.kernel.org/cti-tac/e3551841-0427-49da-8cb0-833a335daeca@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2024-08-28 <https://lore.kernel.org/cti-tac/4d22bea8-9a01-43d7-9579-b6c877154e10@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2024-07-31 <https://lore.kernel.org/cti-tac/5e90ba39-d301-4ce3-bfab-d663864cb627@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2024-06-27 <https://lore.kernel.org/cti-tac/a1e31779-b3c3-4016-ae69-27aced5971e9@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2024-05-29 <https://lore.kernel.org/cti-tac/69862ea2-d7e2-4fdc-91a6-a80525ecf423@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2024-04-24 <https://lore.kernel.org/cti-tac/4dc7d706-f6fc-4494-b24c-b1a38fc98810@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2024-03-27 <https://lore.kernel.org/cti-tac/d8b26d0d-7a68-4dcb-a7c7-1776c5cbbde2@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2024-02-28 <https://lore.kernel.org/cti-tac/ea82c272-9bdf-4685-bc72-9fa6da83e6be@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2024-01-31 <https://lore.kernel.org/cti-tac/6b433955-2865-232a-44c0-59682cbac446@redhat.com/>`_
 
 Older meeting minutes can be found in the list archive.
-- 
2.46.0

