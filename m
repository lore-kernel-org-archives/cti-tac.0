Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4150C136995
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709840141; cv=pass; b=BoUUwFQbGF+Qgz8NKsArQ8zwry9F+fVOotK4QQmPxQtwUc0OljonzUCHoACbGHdtkMs10M9q3JSev8YsLu+KJhrIyqeGOBNXJ2MKL+xfv8P2XpHFltmOalDkina9idYDNxzc1gyjrcROG+DLi4g51XjzNsjyOp/6kKsKY5Zad2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709840141; c=relaxed/simple;
	bh=RMKoT3P/GbcXbSdcXvcuDhxFMSNMnkUTaiKGDz730l4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0Qv1MU20qWZBMgl3l7lIklA2wQbUdaSWU4laX6vbXYSK+VvCX0xz2dDzxh29yKz859432smy6SJp8jNVWLL9W+tqndR2bqN/swKKhI96lKR3jmOfOScEPIuqoQkw4ZKfzOYXGYGRHCy7AFFfGCngqNlDb4YV1bZZ7AsrJaVIPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=UU9SXKXT; arc=pass smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="UU9SXKXT"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8C3E605FB
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.751
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WPZjAAh3KzUy for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 19:35:38 +0000 (UTC)
X-Greylist: delayed 310 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 07 Mar 2024 19:35:38 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8AF74605A5
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AF74605A5
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=UU9SXKXT
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.223.168; helo=slateblue.cherry.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
Received: from slateblue.cherry.relay.mailchannels.net (slateblue.cherry.relay.mailchannels.net [23.83.223.168])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8AF74605A5
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:35:38 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id BF50A363C1F
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:30:28 +0000 (UTC)
Received: from pdx1-sub0-mail-a289.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 360E0363838
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:30:28 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1709839828; a=rsa-sha256;
	cv=none;
	b=ajo315f8beUukLtmFIEHjDETSrO3hrNR0Ka2EDU6mwYCKL1gJPrnHCG1Qt83zIBW1nyqBv
	tPdqY3+2FsjpM4YFvwk3O37L7zXUjWONDfQYYXIJnPgcuIjTsLMb0dF0Db0SZNzezfJ24t
	Fwjn3KaNyos3Y14opRfvhr3VxiMpesJOvx3QgnTZkdIOXbNho3ll3OLrJHUUuoNeIVRYA5
	KuIIcxp0ODzUK7D8FGuXkTfDXxNT2+rAMPJnvghO/n5KCTSz6jceqpIRY5rHu+7a+e2RCO
	xU7qsSWsLZObm2+heWgI8LBwjIwdTMw6jzuVuzRm+5aGN8WPFs+o/U1td5WtKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1709839828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=TNqj1kCzTgIhijaR1etK8kq6wbJOZ75QSAsJwzCVstA=;
	b=Hj7MsrmPRHNZNtIQP2SrqsAOHW5JLlYx4jESSygqo9X+dMfFKNLC0tAJXqjep1KhXByFH/
	G/j2C4sAFeDqjbEX092VC1wfs0+2j6cN/wLUIgi9MuYCjMsJ61vnuklOBKg5tMZk1FuYRv
	Wr4KuSYt3sKymDEZilSk+Cn9JQKK/nqzPgHFzGpsHMqkPlvzuTQJ2xXji5x4AF3SBry/KC
	DjScVxw1+l8zSmrSRrtqbbOQvmG3OIikeudOp7KnvDtFX2M+PJX4PsncaZXZCzoVuryqfi
	4FShuP8RzIcui9Q87gzIDcTO0/MwHlqtkssg06zfn9HjwtkXaQ5yseQ/n2ElRg==
ARC-Authentication-Results: i=1;
	rspamd-55b4bfd7cb-nwlbl;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Well-Made-Attack: 1009caeb0f471e69_1709839828488_790729790
X-MC-Loop-Signature: 1709839828488:691318938
X-MC-Ingress-Time: 1709839828487
Received: from pdx1-sub0-mail-a289.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.111.52.199 (trex/6.9.2);
	Thu, 07 Mar 2024 19:30:28 +0000
Received: from fedora.redhat.com (bras-base-toroon4834w-grc-23-76-68-24-30.dsl.bell.ca [76.68.24.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a289.dreamhost.com (Postfix) with ESMTPSA id 4TrKC74nn5zJ7
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 11:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1709839827;
	bh=TNqj1kCzTgIhijaR1etK8kq6wbJOZ75QSAsJwzCVstA=;
	h=From:To:Subject:Date:Content-Transfer-Encoding;
	b=UU9SXKXTb3g0p+ZQqGckTiWQJM6oIORIPb1TccuKi+lgzJmycnkSOLB4Jj0SZe/B/
	 Vf4VPP1dCvJaSFsNcaJmvLwwiWm4J3u0I0yzphmuwWKHSoTMQ1PcNfv99hvj0DLjP+
	 skPMUEVCDNJX1L4dZIoBwDL02CcfbiZX+9PiWeb6iMmcrOMaUDVmxEOJBKkA87Uj/O
	 b4tcdydAPoqtKqkOUgDg/6F/iQJBA2vVofRziCyGUYb0dOrQQvn9iSNfveInucL5dn
	 /wlqEvZBoBgJF75pRPClb8A1g4al6VT+3yS57Rbb1jMDP6Vl5kbPMj+8mHiieeCwEU
	 MLeBuFzyfpvzQ==
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
To: cti-tac@lists.linuxfoundation.org
Subject: [PATCH 1/5] projects/glibc: slightly adjust the structure
Date: Thu,  7 Mar 2024 14:30:15 -0500
Message-ID: <20240307193019.4028812-2-siddhesh@gotplt.org>
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

Add some subheadings and fix a broken link.

Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
---
 source/projects/glibc.rst | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/source/projects/glibc.rst b/source/projects/glibc.rst
index 7e6604a..a400dab 100644
--- a/source/projects/glibc.rst
+++ b/source/projects/glibc.rst
@@ -5,6 +5,9 @@ In 2024 the goal is to migrate the glibc project to use CTI services.
 
 The community feedback was collected from July to August 2023.
 
+Current Status
+--------------
+
 The `GNU Maintainers for the glibc project 
 <https://sourceware.org/glibc/wiki/MAINTAINERS#Project_stewards_.28GNU_package_maintainers.29>`_
 were asked to make a decision on switching to the services provided by
@@ -24,13 +27,17 @@ this document to provide assurances that FOSS would be used to provide
 services and that there was a checking mechanism in place for services
 to remain FOSS.
 
-Next steps:
+Next steps
+----------
 
  * Revisit discussion with Paul Eggert and attain resolution in March 2024
    to move forward.
 
 Posted originally here: https://inbox.sourceware.org/libc-alpha/45e98807-908f-0968-b6fe-5dbb0af265b1@redhat.com/
 
+Service migration
+-----------------
+
 The following is the suggested list of services to be migrated (with notes):
 
 * Mailing lists
@@ -81,7 +88,7 @@ The following is the suggested list of services to be migrated (with notes):
   * Isolate BBB from other services.
 
 The current list of glibc services were put together as part of the
-CTI TAC `glibc service enumeration <./enum>`_.
+CTI TAC `glibc service enumeration <./enum.html>`_.
 
 -----------------
 
-- 
2.43.0

