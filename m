Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E73512DDB6
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709840332; cv=pass; b=PGpF8KbPMLXAOUo8CFkxGEBGhl6j97GOoECysUiLsO81I5eQK4Iq5aefshFvNpIJSA/naZiFksVgON7m2S4WtW3Tx5iHJW9QwB0DXg/38EVyqbTM5JNTbJEhMoV3JVNILCul+Qx3Fp8KSEWsn8R5MRdCqy/HaSZcqP9wXVc4Gf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709840332; c=relaxed/simple;
	bh=LGE64bSiMtN9ZxvKkvtv9iWq4S5X3TIjtmgnH3OtJEI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=u69vElaWDs0y0FpqmHDwsxeZMwbNdpNyG3wGE5DgMdLHHg/uc4fdbs9D6uC7puEtSKDPXgZAkCLRt6M4OONmarlRmi/tjJYNe6P5e+xaRlxWeA6xMlE9YDDiLiJmFpkmOTpAP6ILMSJ/Y7OTtBhS2lXfwP5Xdks4Pa74lqcCAnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=o14RQwQZ; arc=pass smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="o14RQwQZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DEB141B42
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QsBIcMAT0Ler for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 19:38:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.223.160; helo=seagreen.cherry.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A0C041A48
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A0C041A48
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=o14RQwQZ
Received: from seagreen.cherry.relay.mailchannels.net (seagreen.cherry.relay.mailchannels.net [23.83.223.160])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1A0C041A48
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:38:49 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 0E47A94163B
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:30:28 +0000 (UTC)
Received: from pdx1-sub0-mail-a289.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id A552F9422F2
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:30:27 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1709839827; a=rsa-sha256;
	cv=none;
	b=6zhfmj3ZCIsXaKJB1M7fcVMG/lQ12U0qNtAe0A5rfXugk8mrWno7AVIYP7yMy2+ptryfkx
	LZ2UqPPG8W/UfHsRDgHf/PTTPsbHWm07cyoJLCekyseccVNpnb8gVXl7n+n/PShGVSn8Bq
	mePpJj2mActYOIEqmHx2wxSQCQ65wAV5WPe91a1qPaKbjACqMbUCTMKlrr7AIAYqMS3Pwn
	lywAz0V5YK3hfVm3KwlaJ2v6b+FM1uMbRaNkvhYBt5NzrBSvzTVVFvUyAsg87aIDM3geFb
	yc3DV+CmM/AwwbyQ45ojuaH1TmNDaBOvU5yUyfut/40OrQnivyMgHhU+Hirb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1709839827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=2UKbpOrZH+zCSufCDAYBNoHmGG9uMVNXe9IX9HksJPA=;
	b=gZa0snxsCWtYf3e0++4BfUSINAqvHzfpw0UdQdvKRw2sYr4vdg6umv6ryuBvnPFOy+MBgF
	nuJhLZ9xR9eQGfd/94rF4Alnk3Vk/UhlMdYb3QU6BdPyaiAXUjffSpvYDO29n+yiwIuD2w
	n/qfyqwOWBAJZYGXm+eRDrEYFG4jFXuMXJu0dJiQvAJzjyPkuvIIAv6OAV6ujtj0dARtGY
	BAYxdojLOgqj1IFMUL8EnK4iEw6JyOz0kIyEeTCpeF1cp81I4oRlmxqMzM3jhAk73qvwad
	I/SzSbUZ00rtX57inu/EL1IiGPdZhxi6dr0rUjhN+iaSxtZ2EDwDlLUiEnV2BQ==
ARC-Authentication-Results: i=1;
	rspamd-7f9dd9fb96-spdjg;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Duck-Turn: 45e6982a0996c505_1709839827912_3769886598
X-MC-Loop-Signature: 1709839827912:2863322565
X-MC-Ingress-Time: 1709839827911
Received: from pdx1-sub0-mail-a289.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.116.93 (trex/6.9.2);
	Thu, 07 Mar 2024 19:30:27 +0000
Received: from fedora.redhat.com (bras-base-toroon4834w-grc-23-76-68-24-30.dsl.bell.ca [76.68.24.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a289.dreamhost.com (Postfix) with ESMTPSA id 4TrKC71dr7z3j
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 11:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1709839827;
	bh=2UKbpOrZH+zCSufCDAYBNoHmGG9uMVNXe9IX9HksJPA=;
	h=From:To:Subject:Date:Content-Transfer-Encoding;
	b=o14RQwQZws2FiCpPE4jmTi7dEXbAmKue2RevmU8L1OYV/q3vEvmFNehgtRiNSbNV9
	 84x9IT5YC8N9bXblItISEZ5Yy7IE2qSIJiZdfCWAcyU/1B9f/j+hWw1X6bVSJ5jh5F
	 k+ak1+6XSdqVL0Vex//64/0LM/6PmP/ERwpgoMYOuPris9aU0QWWpLVXP+/6uSDcVQ
	 B4sw60GOGFgNycrGSRHMDIHAUTPO8xAN78wQSHphnFHp/SSV4RbL6Ufhlf5Q/CRJ0t
	 j+RCNHQDD9jFUVCFYM3qSDtVKbPKVN7tjWjeWMpLV84G71Zf93HgvaafUsiy8M0nMe
	 toZKyd+30jz8A==
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
To: cti-tac@lists.linuxfoundation.org
Subject: [PATCH 0/5] Multiple website cleanups
Date: Thu,  7 Mar 2024 14:30:14 -0500
Message-ID: <20240307193019.4028812-1-siddhesh@gotplt.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most of the changes are structural and formatting. The biggest change is
probably in the FAQ.

Sid

Siddhesh Poyarekar (5):
  projects/glibc: slightly adjust the structure
  Add a toplevel README
  services: Clean up links to projects
  tac/audit: Minor cleanups
  faq: Reformat so that it's not a list

 README                    |  15 +++
 source/faq/index.rst      | 223 ++++++++++++++++++--------------------
 source/projects/glibc.rst |  11 +-
 source/services/index.rst |  17 ++-
 source/tac/audit.rst      |   6 +-
 5 files changed, 139 insertions(+), 133 deletions(-)
 create mode 100644 README

-- 
2.43.0

