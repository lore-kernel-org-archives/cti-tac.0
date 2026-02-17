Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D4134D4F8
	for <cti-tac@lists.linuxfoundation.org>; Tue, 17 Feb 2026 16:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771344540; cv=none; b=uKfWfsXiXheGO6QHrmAelHNpkXDDUX99IAU0Uz9epqa/SLXmpMQ2dGkWO9myR6xZ9kVQO1GjgnzX38cYqO7poq+F0X9NoOdaHIgNbXX+iZmtyJ1ydmdZ44XAQAXpXeufcrzWj3wJspA27wo0P+Q/tcpdqMm/rSp9gUB4JgL3I74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771344540; c=relaxed/simple;
	bh=20TqMEIUTbuslTRt+qsbZKaFKusVNS2IPPwgezS+e9g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=eT4ymcYT1SRkPITf5k89twJoSm1gAo0zBkbdIj424D1apul7xCklmHwIUQJY+cdKj0VNVcOXBfTAqvbTsX2YHhxFItHWqOUYnPsvMTsyjHHXQkm2vaeBNoHzEIQ9bVpwqiZACRFY2HnythoSAPrFrstHormdrRfQv8NR9NNiolI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PPa5CRm9; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PPa5CRm9"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC7C981501
	for <cti-tac@lists.linuxfoundation.org>; Tue, 17 Feb 2026 16:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzQ6ViBbKGgL for <cti-tac@lists.linuxfoundation.org>;
 Tue, 17 Feb 2026 16:08:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C6917814C3
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6917814C3
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PPa5CRm9
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C6917814C3
	for <cti-tac@lists.linuxfoundation.org>; Tue, 17 Feb 2026 16:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771344535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kQVScj5BHHUANsAVNk5b64ODTZtcj0mZf3U0H7e0eyQ=;
	b=PPa5CRm9GnJfZ3bDHJAHOqpS+V4zrja0RM1DawNCqehQmNTLO8lKHfuOCAM5YMa2sO1YCR
	0p8D1ewoH3d85y3zv64fReMrQkihsVOcRitSMtFDYBI+YcUxhO06fGth0nlCpbOEX6b8/z
	ZwjARFQFYAd5LmJRgNriM0jP7/K6TWU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-pLOeUp2QOo6d3uLDN0LNRA-1; Tue, 17 Feb 2026 11:08:54 -0500
X-MC-Unique: pLOeUp2QOo6d3uLDN0LNRA-1
X-Mimecast-MFC-AGG-ID: pLOeUp2QOo6d3uLDN0LNRA_1771344533
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506c0231e63so301954871cf.1
        for <cti-tac@lists.linuxfoundation.org>; Tue, 17 Feb 2026 08:08:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771344533; x=1771949333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQVScj5BHHUANsAVNk5b64ODTZtcj0mZf3U0H7e0eyQ=;
        b=uCg2baHneepWIl/QHj33wMLFiKnGhL/N+kpm/nvkv80fHN/LXk04RqaTCjxIEfg2LK
         qbbNnw2srZtArJNPN2yjGvGc8/njHJg/0LZvOYKT0/AyRxOBlUcVfRmdSSTxZJtUcVAC
         gtEM3RjdVUDGLwO/opRlvoRCy4c0+c9uCL78yB01dyb98Vkzttu/dxyQJdOuOr3Fi1GN
         u75lrch5sXaod6qhzn1ssbe7syiMY57kV5c+4jfKIFA31ZoBLx4oxAR2ZB0RjqIuK+4y
         njh6LN7MA60u7XsC0tTMq5s7UT6cGphrYqXaa+sK9PNLtq96OzZF3LhxsDZC7QEB4FXX
         QWgA==
X-Gm-Message-State: AOJu0YxjFbzOYbX7y0mRBSdct5GXXc2OsN8N1Ux7Dm1Q6hekAbGKA6V4
	AJHJiH8FhEVJNTMVZ3naO5BplK5vELVo8QXvUhaW51QuCzjiImy4I7KctFB4MDcvONqf+Njr7Es
	NJqFewlYGJjeyH/I9MtolaHr6H+fg94XfazJdpPDDzWy40OwrToZcNUVuhubsCf5adZ6lbFujKy
	pW0kAO9b3vH+ZjTpnIQERyrUm3M5uJQx+LdcJCbhHk8BCevYwXIEx7AQ==
X-Gm-Gg: AZuq6aJ79ZTs0SzvsYjK2ysIx/qNAdCGGIGeg6ouF0SBaSRUwVOQA+QAfNxq3FaxEvH
	xjxaRUb8jyAKtz0VjDu8djZvzTBtD7vAVpsHhw+0JQlMAgh1vh99gMk5BiqSw3AM8+uE7pcovmj
	qEV5jUaRLuWIKuhIVx6gAnr3PS+afe2y0gIkxFIiit4rMVtt/P2e7Ru00NKAmRDien/SffoQhn6
	YwBc7CMu4Sw0xLbeMZYqrcBnmUlRlNJsu/bxUbx/DLw6BCRmTFDQV60r/P81kZLvRU4KrukWyFE
	gB+vU5HId64rLW/KvZx+TVDDhyKWRD6VfXRqGho97KfB2efmDh1E7BI3gYL8jMZc916iMZFDy1V
	qiSSz+eiDsGSMIV8q2++yem95yXPIh5JgLxbvekW4d6sXWJ/0u2PkqHOszVpde+uUOXsmSddbBS
	Nfx9LYFawFYm9/ZMtV2DkAF+w/
X-Received: by 2002:a05:622a:4ca:b0:4ff:b0f4:c307 with SMTP id d75a77b69052e-506b275f142mr148678141cf.24.1771344533184;
        Tue, 17 Feb 2026 08:08:53 -0800 (PST)
X-Received: by 2002:a05:622a:4ca:b0:4ff:b0f4:c307 with SMTP id d75a77b69052e-506b275f142mr148677631cf.24.1771344532606;
        Tue, 17 Feb 2026 08:08:52 -0800 (PST)
Received: from athas.localdomain ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50684b94e9fsm158416651cf.24.2026.02.17.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 08:08:52 -0800 (PST)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [COMMITTED] charter: Correct the charter title.
Date: Tue, 17 Feb 2026 11:08:27 -0500
Message-ID: <20260217160850.2427373-1-carlos@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ne8eITIjF_jJIeB4o4XkgwvB-MxJKSNH430ayt0Y-4s_1771344533
X-Mimecast-Originator: redhat.com
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The charter title had the word "Initiative" when it should
say "Infrastructure." Likewise in the first two uses.
Change all 4 occurrences.

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/gov/charter.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/source/gov/charter.rst b/source/gov/charter.rst
index b72a29a..415d31f 100644
--- a/source/gov/charter.rst
+++ b/source/gov/charter.rst
@@ -1,15 +1,15 @@
 .. index::
-   single: Core Toolchain Initiative Fund Charter
+   single: Core Toolchain Infrastructure Fund Charter
 
-The Core Toolchain Initiative Fund Charter
-==========================================
+The Core Toolchain Infrastructure Fund Charter
+==============================================
 
 The Linux Foundation
 Update June 1, 2022
 
-1) Mission and Scope of the Core Toolchain Initiative (CTI) Fund.
+1) Mission and Scope of the Core Toolchain Infrastructure (CTI) Fund.
 
-   a) The purpose of the Core Toolchain Initiative Fund (the “Directed Fund”) is to raise,
+   a) The purpose of the Core Toolchain Infrastructure Fund (the “Directed Fund”) is to raise,
       budget and spend funds in support of the core toolchain projects (the “Technical
       Project”), in accordance with the provisions of this Charter. The governance of the
       Technical Project is as set forth in the charter for the Technical Project.
-- 
2.53.0

