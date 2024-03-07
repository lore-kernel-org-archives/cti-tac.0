Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8661012DDB6
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709840374; cv=pass; b=QB93qeRlBgC9fZIimTpiqkyWHimd0eMxSsakY6e9aUDD5B3grPuWF8vKJ822AI2AWPUNS551Nt9Xvmbd8nyJzEopp20FO6RiU2W/JO6TVpxuezEHkSy5fCETV3RMIC5xyMaelmJB+K2d2CsyAEIePUQFJJizqgIJ/y6OyCxztQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709840374; c=relaxed/simple;
	bh=UyxObd/Ul/O+gJ4f5KpaygJwLdoirbbIZdUOsjlQA7I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5PGMy0xzQqDc3gEy26YuI5APDssLBaq98E9cJ6g6uzPxlW01Ws5ajSHocr68MxoTMRE4ceENeV2A4o8sVuNs8ggLJg93bp1IUoNtQsScxs1TZhVU7VMNtcwjyWnyHlan+Nr7BpegLJ+5f4vLZVXkE8iCylPIXc33D1LUmE12J8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=bnD7CIbU; arc=pass smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="bnD7CIbU"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1448B40A6D
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JDyhUqrxR4Sj for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 19:39:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.218.24; helo=buffalo.tulip.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D52F40A55
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D52F40A55
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=bnD7CIbU
Received: from buffalo.tulip.relay.mailchannels.net (buffalo.tulip.relay.mailchannels.net [23.83.218.24])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4D52F40A55
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:39:32 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id DCF14541DBC
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:30:28 +0000 (UTC)
Received: from pdx1-sub0-mail-a289.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 666D65410CD
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:30:28 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1709839828; a=rsa-sha256;
	cv=none;
	b=2Z2QxtjI3Ej/SHHQeqsfLN1GPd91TUgZo8nGw6QCcL/t/IicIo3YTAvLB/seHxlba4T/dR
	FqeN9DHAEanUM8ncBp3v0jIShUVMrStaa/PUCcHy//vcqZfriUIDn8xERZyUDH8LEkF+p4
	Dtu8qA18ki6yv2fgqht7vLGwdFrzbULUT8VSaOYh9FFPXxzYtJ35rBY5Ym5zDeqwqDc0Xg
	jxZ3lNFJgOA6ZsPCjZgA4jvaO1f4FxAksun8Dvqsj12vIWp9f9qAPC6oJ+FnvbrE80L1/x
	K+vXi8IZmkVWev7/8RbOLsGnv1R5OSiEYE0q3PZ4Q4UlUM03lLJVYxWcnIFlqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1709839828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=j87jHLO/eWaTNnYwv+nkoH6WCWJ5z0WgFcHIohWc+Iw=;
	b=joiRMX4wLCXWN5rkkGsNT2DHJOZ5g5VRTbM7fCsVUbt9clQmAx9yfGN35JpPyhlJsGVAhQ
	3ghYsqsA6n1a/xmhJdzUbVidrMHFZAZGBjlJMiSrYtwvHIUKw+PQrhO3xBeiOpj2S7z1dQ
	GZEvlEnrUUrRwGYG+Vh/pUXfQvjklpaQ5/zLi1OEETvArdmv7tVRXTMNH/y9IdWbQLXFxY
	0ipbaoo2cpyz7ENzSK0pJG9L97rlBS0AH42mwmQ1BL8C5Va3BUKKjZyrt4OhUwhKhRPwaD
	6Nnr2dRpUMYH0D3m89WsLaeqPOss0gmPfCjqNwChABR3tRez8mc5biYDAYFwWA==
ARC-Authentication-Results: i=1;
	rspamd-55b4bfd7cb-rhpqs;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Reign-Stop: 1a77c30a5859b953_1709839828714_4090239115
X-MC-Loop-Signature: 1709839828714:661801947
X-MC-Ingress-Time: 1709839828714
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
	by pdx1-sub0-mail-a289.dreamhost.com (Postfix) with ESMTPSA id 4TrKC771mDzGm
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 11:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1709839828;
	bh=j87jHLO/eWaTNnYwv+nkoH6WCWJ5z0WgFcHIohWc+Iw=;
	h=From:To:Subject:Date:Content-Transfer-Encoding;
	b=bnD7CIbU+sYfyADXuG7l1UAqo32MAHig1hMPh23UMI7bM/ynEgibtOJrBKtwXKf3F
	 4ocw10bi3sTL6NI6lnUUoX/dDlFlc8mhgovuH78omUy2/qoUAmk0ktRwLdUXKRBoQP
	 c6V1Bbz6T5RxULoJrgtUG65AC3orz8xOy/mItmu5wReIK+CekbhddYVBD0sDmZGBm+
	 kf4DqxG4pQYbOySpRCyYMcaSzSG+Qv9QHG6Hg0STtl56n9Zx1LW2Y1Gjy+ywFJ3fI/
	 lkNB4ep7i6jjr0eHvuW0uWr04b9wI74iMaP1bDjOQlxobxeqN1h3LbTwaO43MB2k4t
	 bZJlQk6NlM7FA==
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
To: cti-tac@lists.linuxfoundation.org
Subject: [PATCH 2/5] Add a toplevel README
Date: Thu,  7 Mar 2024 14:30:16 -0500
Message-ID: <20240307193019.4028812-3-siddhesh@gotplt.org>
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

Add basic instructions to allow one to test and later submit changes for
review and inclusion.

Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
---
 README | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 README

diff --git a/README b/README
new file mode 100644
index 0000000..f0a7f64
--- /dev/null
+++ b/README
@@ -0,0 +1,15 @@
+CTI documentation portal
+========================
+
+You need sphinxcontrib-spelling and piccolo-theme to build html pages
+from the rst sources, both of which are available through pip.  Once you
+have them, run
+
+  make html
+
+To build the html pages for testing.
+
+Submitting changes
+------------------
+
+Send your patches to cti-tac@lists.linuxfoundation.org.
-- 
2.43.0

