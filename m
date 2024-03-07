Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43272135A56
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709840179; cv=pass; b=k529u08VoyDIdiAjgIVRnR79w5n6JkmrsCRlMayqXFrilfvCSorFWTCk4H6/n3at7Zu+bB58aoRKDGZVYZETL290NyLVTN2Y95iOOTy7+U0LrlP3mUCYQjYXWGY47yWNrAp5Jl2LZRw8NDeqbdSxTwJm/DvQ0PcwC8k6eZ9Igh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709840179; c=relaxed/simple;
	bh=Dk3cxEGPtg9Q7esKWtgvd8vcsxZ1IDni5Ne1ZOnDWGs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/Pc2/Heeiem0dLk+OXDQGY220El52XZrdkbz07asbjuU7il+4dCI4MBjHaE2Fu0JJI6+L/etglYS7XT4vsSaelz8itIBmA3sCofhvR+bL+UnfhCYWUtl0HEYkd9zWe0brc6DcJtyHHbjiRsCdySVm0fiW5VfadU05hGdgiSPec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=P59IzioT; arc=pass smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="P59IzioT"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD4EF40A55
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tUIvzgGvhohU for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 19:36:16 +0000 (UTC)
X-Greylist: delayed 346 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 07 Mar 2024 19:36:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB01B40A54
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB01B40A54
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=P59IzioT
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.214.40; helo=cornsilk.maple.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
Received: from cornsilk.maple.relay.mailchannels.net (cornsilk.maple.relay.mailchannels.net [23.83.214.40])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EB01B40A54
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:36:15 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A9B2C503734
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:30:29 +0000 (UTC)
Received: from pdx1-sub0-mail-a289.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 13BEB50283A
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:30:29 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1709839829; a=rsa-sha256;
	cv=none;
	b=4Ie5H7BCG6/4+bEbK1KfErYq7R8RpPUbgs8YXdOJF78j9SN2fOrvIEdi/UEAK3cbN0u1/G
	p4bb5nP2dGvU25/5i0BhEXVLuPHyMQ6WP+xSr4STzUvMph64RWKHh2m623GApv5GozTHqQ
	8QRPvMeiop1/an5UxjWjq7Kjeg/fKNZr8+UNz9edkOgq1J1fBnWGMvpWsn/PXg3mR1S94b
	JSLPd5oM+bUtk+xDBCyJgEeNvB2xmfvJDVHuT82BGDC/92QE2j4glrRyYRTM+6Vwv0hUqT
	sVMmoG1TlJb7FKvGws1KSWPfb7kQgCOHR6Un5G8AdLKTWSnybcYS0kIFuap8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1709839829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=fIiJDD9qa/ds2UBLVr7WvmDPirvDsYzqbKqCo6SqChk=;
	b=SQ2KkGcqqUx90VMfLnooBEL+uUAJ1M1/MaBTTwMdJ0N27zdSnF5D2FQDRtksVRhxaIxfRz
	rw76mBTIFzcyVK5kuoJuhUBwqjZXrS4wGoO02xpHpUiS7ucNP13cGt71oluLVvrqj5cF4k
	gXllZZyByHFVZlBt+QyXlCdEYqArVxcFMQTkqAkPoB66snsk7uQfGaXuvwSr5eM/WPmczk
	e8Y873hqMQoW1m83vnfKibJMwofnb/0DW3yckUgwd2gPFBVGS34aM/+kiX9SaeskBUuc4q
	Mq5+u2XTYgspVXKcelXgPaD3AAHMeeTmqQlgt1Adeq2mKYb9Mg88zz6uaJcY/Q==
ARC-Authentication-Results: i=1;
	rspamd-7f9dd9fb96-2kv8k;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Cooperative-Thread: 7c2077e01ddfa081_1709839829478_3274187834
X-MC-Loop-Signature: 1709839829478:2107732264
X-MC-Ingress-Time: 1709839829478
Received: from pdx1-sub0-mail-a289.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.116.93 (trex/6.9.2);
	Thu, 07 Mar 2024 19:30:29 +0000
Received: from fedora.redhat.com (bras-base-toroon4834w-grc-23-76-68-24-30.dsl.bell.ca [76.68.24.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a289.dreamhost.com (Postfix) with ESMTPSA id 4TrKC857F5z6b
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 11:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1709839828;
	bh=fIiJDD9qa/ds2UBLVr7WvmDPirvDsYzqbKqCo6SqChk=;
	h=From:To:Subject:Date:Content-Transfer-Encoding;
	b=P59IzioTqrHrzAMjVwnYNiysb1w5aoEmHgMw9yu0E3JSh7uj8hEL8NW+YdYITAJ7x
	 1skPOotqObSNDzWj3GPncN8x6cn2XAscZgVKaRd9w4HMCV7eDTsKp4iCYV3+mRjK3b
	 gqG+5GUpgk10mHvyCJn224LeLwmo4xaHQ8Je7fetXP/ODzNgtWrPLSsFFEocBG1PnU
	 f/pQJGR5/eENIWO7RVYdkM9RZVwO1iqYn9Rnie+CkNIAirqy8mtVFWpYCzOp80zeFq
	 /5qCJyCJWgGNJJL9IGW9lxMArvFkuyda1r5WrTubKrpZWMoWUEL2gHwpC/X3neEgiF
	 +4jN/0+9pSpVQ==
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
To: cti-tac@lists.linuxfoundation.org
Subject: [PATCH 4/5] tac/audit: Minor cleanups
Date: Thu,  7 Mar 2024 14:30:18 -0500
Message-ID: <20240307193019.4028812-5-siddhesh@gotplt.org>
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

Subsume the sub-bullet into its parent and fix a dead link.

Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
---
 source/tac/audit.rst | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/source/tac/audit.rst b/source/tac/audit.rst
index a47e4e3..119f7c6 100644
--- a/source/tac/audit.rst
+++ b/source/tac/audit.rst
@@ -7,9 +7,7 @@ technical requirements of the community.
 
 The audit will cover:
 
-  * Reviewing that services cover the current requirements.
-
-    * Includes security requirements.
+  * Reviewing that services cover the current requirements, including any security requirements.
 
   * Reviewing that the services are being provided using FOSS.
 
@@ -21,7 +19,7 @@ by the TAC to discuss these with the community and current service
 provider.
 
 The CY24 audit has not yet been conducted, but the audit will review
-the current `services being used <../services/index>`_.
+the current `services being used <../services/index.html>`_.
 
 -----------------
 
-- 
2.43.0

