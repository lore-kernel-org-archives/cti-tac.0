Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FEA13665C
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709840249; cv=pass; b=N7IROW6SVBfbb4XosuIVmR4LxJHUF4/7QpHx6yqVt36Tecdi5mO0mIcSiJEd7TGIUm25tZ2D2LG6hFCl0kENUnhX0w6JNBKO6tlNonYaHXhNsyQZyacAqK5zsrClodJf0WJLdNn/qPvRdTgXfXJUx40fbInWwQpyyMEnFDGltAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709840249; c=relaxed/simple;
	bh=mert/zXW4Xla3ZPDExwWBjDYGTiNi+FlvSLr6uXvN+M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qjn34cNzpvcQ9qFGXevxDZV3pHh51ZKQ3U1KMyUSU6xIMxPfB4SKYsWGsd1Td2613VH+3amp/c0QcwYu1vWVO0WSBUy5zXofI4518xwdtj/fYzLOU0iO5rmhdpQbsDzx/oeqNOsUcqZ9Y+30h30AdwDDbyKCtUtlZ1VrTEhkBmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=rKvycdbz; arc=pass smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="rKvycdbz"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EE4E41BF0
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9CWs6tGXHisn for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 19:37:26 +0000 (UTC)
X-Greylist: delayed 417 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 07 Mar 2024 19:37:26 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 896EE41BEE
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 896EE41BEE
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=rKvycdbz
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.218.24; helo=buffalo.tulip.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
Received: from buffalo.tulip.relay.mailchannels.net (buffalo.tulip.relay.mailchannels.net [23.83.218.24])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 896EE41BEE
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:37:26 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1FDEF81780
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:30:29 +0000 (UTC)
Received: from pdx1-sub0-mail-a289.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 9E02481AFB
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:30:28 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1709839828; a=rsa-sha256;
	cv=none;
	b=uYRfzYqaZv/QZyogNYTQbqFKacvPTzz8DZdc6JBiIS2qcIEJRlVHUw3CsQBeygVzGFAdrA
	07MuhHTEi8GeJvca+DwHtEtPgoBgrjOIPMnBFxRk9c/nqiL6LVymvQJETGnnc0TzR38/1v
	42FCDAC6+HC8mQ2Dg88kt145BoKcNF+0IR4IH9TSfnjEusDvEjzmCaT2TaAkgkuMd9eWAy
	ndHgLnYyemYd9S/Eiwpk0QMBvzBlPgOM5OLxZG+IQSwbUCyI71Erg+CBALC15JNlZPwi/F
	zPYUA1ye2BXyqSLfsJyYDM4fd2hzjZWBatSiw838zHpzXGcymsPeddcOsSQtpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1709839828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=EqZfdRfrubgc/c2hYiavJPqncLF4a0gPmaKYnsTTlZw=;
	b=0NdPBDhcaEWl3SaVfLoSNWgYobo4RX48UD4YZWIeCWSdMPSJ6tX4jQOmUowEsyHGtQWkbZ
	d+CWq69Fc7oK+xilF2xZSJo0d0mOPoBUDdsApvTj9SjgJsx8AcLrRU3yBxTS4g0fC5ztzc
	PKjXowO29iKwknpdIjwwOTTQqsGbfiJDEY+v3hj5NJTOr2YAaZ6mSdUTyUFbg6+7CfSfXV
	eFZOBJmTOQPKEg5TANYDeB8epfgCMQ2O1x7a7wt9krTfDoej9N2LoGNhZbuYlzpgCPm/a3
	LW4fdNaYNV0X4flijpK/0CGN2vv0BgH0mJME0PJKAqFSfHNPSkmi0wtfCHuApw==
ARC-Authentication-Results: i=1;
	rspamd-7f9dd9fb96-z7xpk;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Whimsical-Whispering: 57ae5cca730d1326_1709839828875_955645263
X-MC-Loop-Signature: 1709839828875:3008900260
X-MC-Ingress-Time: 1709839828874
Received: from pdx1-sub0-mail-a289.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.116.93 (trex/6.9.2);
	Thu, 07 Mar 2024 19:30:28 +0000
Received: from fedora.redhat.com (bras-base-toroon4834w-grc-23-76-68-24-30.dsl.bell.ca [76.68.24.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a289.dreamhost.com (Postfix) with ESMTPSA id 4TrKC828PqzZQ
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 11:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1709839828;
	bh=EqZfdRfrubgc/c2hYiavJPqncLF4a0gPmaKYnsTTlZw=;
	h=From:To:Subject:Date:Content-Transfer-Encoding;
	b=rKvycdbzjWU39AfgcABetvhAnbNGMgwlDpqcJKCxaUYoQ5FkecIT1kOuwaIIAMvum
	 WAjEakcFmZ+kvuc5G4F3bIaHqTLwnNTJ9Nf39Ns4NZCPu3WA15MwYov+edt7cku+rW
	 7dFhdp5AXXHZbPKItUl9p+aM8lRLsOEg1vciOLeMOm9ONhKcrerQu3VOq3adCd9Ovd
	 PD9SG9pminRDBIQPLtk4SQfXLavqdDbQswYV2hnxOEtsDwMOhjagFUpGOd80Uo2w/6
	 W5ygbxGTEqmeqei16bL4BPel3CwqzfdN5HWtB2c+QbkiQBaOyYOHUUl6xm1bGT3Ych
	 NbhJGgHMS6ojQ==
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
To: cti-tac@lists.linuxfoundation.org
Subject: [PATCH 3/5] services: Clean up links to projects
Date: Thu,  7 Mar 2024 14:30:17 -0500
Message-ID: <20240307193019.4028812-4-siddhesh@gotplt.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240307193019.4028812-1-siddhesh@gotplt.org>
References: <20240307193019.4028812-1-siddhesh@gotplt.org>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use links on project names instead of putting them in bulleted lists.

Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
---
 source/services/index.rst | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/source/services/index.rst b/source/services/index.rst
index 84cb02b..34eba77 100644
--- a/source/services/index.rst
+++ b/source/services/index.rst
@@ -11,21 +11,18 @@ The following services are currently being provided by CTI via the Linux Foundat
 
 * Big Blue Button servers
 
-    * Service uses BBB which is FOSS and LGPL-3.0 licensed.
+    * Service uses `BBB <https://github.com/bigbluebutton/bigbluebutton>`_
+      which is FOSS and LGPL-3.0 licensed.
 
-      * ``https://github.com/bigbluebutton/bigbluebutton``
+    * glibc: Used for weekly `patch triage meetings <https://sourceware.org/glibc/wiki/PatchworkReviewMeetings>`_.
 
-    * glibc: Used for weekly patch triage meetings.
-        * https://sourceware.org/glibc/wiki/PatchworkReviewMeetings
-
-    * GNU Toolchain: Monthly office hours for the GNU Toolchain.
-        *  https://gcc.gnu.org/wiki/OfficeHours
+    * GNU Toolchain: `Monthly office hours <https://gcc.gnu.org/wiki/OfficeHours>`_
+      for the GNU Toolchain.
 
 * gitolite servers
 
-    * Service uses Gitolite which is FOSS and GPL-2.0 licensed.
-
-      * ``https://github.com/sitaramc/gitolite``
+    * Service uses `Gitolite <https://github.com/sitaramc/gitolite>`_ which is
+      FOSS and GPL-2.0 licensed.
 
     * Core Toolchain Infrastructure project documentation repository.
         * ``git clone gitolite.coretoolchain.dev:cti/cti.coretoolchain.dev``
-- 
2.43.0

