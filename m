Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424C935C6B9
	for <cti-tac@lists.linuxfoundation.org>; Fri,  4 Sep 2026 21:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=140.211.166.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557638; cv=fail; b=jYo+e6CVu6ccbD5Be1IUpV43sj7I21v1VA8102itRy3wNVA/j60xzIst0VGmgMpRIfNFTGL/RGlIv5F0xy61jhT12v6c9ADQ+xcLqxyKxBtJmzqDsFWEjBqpTphf3AMv06DRjjX8L2BxIyklSJaW0v4TBqsFxoTdhDImXUuWxBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557638; c=relaxed/simple;
	bh=Q3gmq1qUbn61uVUYKIBG47NrsysarI3gB3URFYBeufs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=BVrJwxaz8t46hi78v27BYatp4UoE18/05MHibso72DK3B5ad/mSr44QdX5XYHfv/WsXjhVuw4FFTulw7P1MsKQjUAHQhfdQ9skydSe+SioqSLCh9XwY1aJmvBouCvqCZLPQ9w6A4qxCbzkcum+Zgc9a+6UUDiZ9dz3orMETbiJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=fail (0-bit key) header.d=systemhalted.org header.i=@systemhalted.org header.b=pvrYsDM2 reason="unknown key version"; arc=fail smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=systemhalted.org header.i=@systemhalted.org header.b="pvrYsDM2"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D610E60B89
	for <cti-tac@lists.linuxfoundation.org>; Fri,  4 Sep 2026 21:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.449
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5UNe6K_2P8PW for <cti-tac@lists.linuxfoundation.org>;
 Fri,  4 Sep 2026 21:33:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E5D166070F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::730"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788557636;
	b=oPlAu277UzzscJ3Z8m9pHQmJcGHPULSU9U9cLpMG6LVUj3g47z3v9uEfmiOU/gD5XXER
	 mww6beSDT5OpYNrDjYOGW2Zmo1cvdkDSq8PuqfHlr4oI/wJwVbGBjEQ5UF0o9O1odTh9W
	 x7whrNhq0ZlN0tgzzpZt+GuZgYYJM2kMSvZaXEPk3hgGWfXKgaUyHJfnaH5a9AB9xr884
	 TLWvusd72ru5ZNdaOW984N8s89JxUtoQ+F6zX8FZzSoFBt45y285jaoQ1qxaA124ErJ66
	 lYW30AgJ6Jnv4aeoEjhNLkA7JmOP1KM/UWTcyVKQ3M6R/Fvg0cyw8TQ4HRN34aeo0ug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788557636;
	h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=kZuWJ1XUdfqhxIrBVJLoSTF2N/LCGp7oqqzRX29kFt8=;
	b=bXS7ekkrMZXzK70yA+9nB3NjogE0hf5tWr0bp1tVqycDREvoFeY7VcDi939Bny8OJo2x
	 aK2t1bvo+yCozv+cQjBxc9VMSp8HPRYGLFd8TmAPXtWYRz4evNDTRe9hFps/njbYWs9xR
	 1YKTT6WE2Z+/+u0QE0UO3tI80QQ2V9Ijzj+/5LPVON0GJM24r+mVAbim6mc5sOBGO+VYk
	 70gnEtJapE7+h5ZeJx87TPsB3M3+pjRzT1xmjdjPjEA6uUXO6n/yWHhZnSYtcOx+gCrVK
	 NOiqkScN7an3XUaieeg6GWOKt+jQozZp4LtZd2qmvCUwPwvr1vL4/bUUqtwL383nn/Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; dmarc=permerror header.from=systemhalted.org;
	dkim=fail reason="unknown key version" header.d=systemhalted.org header.i=@systemhalted.org header.a=rsa-sha256 header.s=google header.b=pvrYsDM2;
	arc=none smtp.remote-ip="2607:f8b0:4864:20::730"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com; envelope-from=carlos@systemhalted.org; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=permerror header.from=systemhalted.org
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="unknown key version" header.d=systemhalted.org header.i=@systemhalted.org header.a=rsa-sha256 header.s=google header.b=pvrYsDM2
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E5D166070F
	for <cti-tac@lists.linuxfoundation.org>; Fri,  4 Sep 2026 21:33:55 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-92e99ef0902so126572485a.2
        for <cti-tac@lists.linuxfoundation.org>; Fri, 04 Sep 2026 14:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=systemhalted.org; s=google; t=1788557634; x=1789162434; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZuWJ1XUdfqhxIrBVJLoSTF2N/LCGp7oqqzRX29kFt8=;
        b=pvrYsDM2M8YUY1Ay2eHrhDskd5M1si5GOAtF8LLUZ7rX+5LWLT41taJD0LXY3XFDOd
         EddjLLPywq+jb5whI40v1W0H64bK7fRVOyzuoeED36SkWJXksuCQcR0dUkOQEWj5fCsW
         YGbLjVMzSLsjNaVeFLZGBPOpLZasFf3JvcL+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557634; x=1789162434;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZuWJ1XUdfqhxIrBVJLoSTF2N/LCGp7oqqzRX29kFt8=;
        b=kLt8XgxPKKKydkmV9qzxCDSgjym95ds3CJOJWCX2dLNJOWZA1/bX70/QwVb+lwOe/i
         k1EI609c9ORMsp6oIirqU5ijx46yHjqUG6GvnU+aTyTjBmW4mKYACOr4wmQfPWc+aE4G
         hrFzDPf/EAPjmGW33eXddzastcllztbtE1lHrFSg5FJabkt84OhQmmLAfn1h4QHjSwAr
         6auI+ZgBTsNtcbXwWMSgeX3ETyBPN5exg9Cla3kPcvDNpitt1KRPBRCc1IHAPSFbIl6B
         FjoVT8y+25asgsVzEvt5+b2ZfNLF59MHZOqqfEvL3PXayHXGaRKNRodVBvCwAJ/uqA3q
         Jz8w==
X-Gm-Message-State: AFuF++lvLsfDWlzXDCJAzA/bF9I9/GY1OinJcnIgWsi5mVquvKpbxNOo
	28jjrgscerBHnAIeSEBmMb4hnMcGdF7oNuhOnTiBLYomOX1v1jyAX2u8/pS0Wtxp2a3EW7fSNRn
	cO9ESZKQ=
X-Gm-Gg: AYBFou3MVE1EZNa9vPVFhI+/LlWB4+e00hPYk8iqtwmNpg1B7mBuCS5rc6Ngx4PpbMG
	fEMC4XTMpoYC0mJJKhN5WWJWnF7jFl6K941lZaxu5GDjdwzx7YHxYcgzoTq9mBNg5awr/RQqFXy
	eWJI90gf9YgoGw2is9NFI1tvyrFDiECCWiqs3VTke/nrKfcW2feN1SmgpmboxKngzNqygt0zLtS
	pVwGfPs1laxrqBe86Zn3ztkJxvNzcTqPiCUq5BkiojxqUnJKKofLAKHxEiEw9mhGS+duNaxHjSV
	+s8ObJw5CAG+4PV+1Nw/Vbj65v6MabyZ9/DoIPY8Mb1exhiWYaJF41jbjsJPYM8MYQ3c35CMa+b
	54p+4GNkonj4Zh8RhWWQXf9cToiBkI0LC/yoHv1WCfJmCuMrMDHMMdYLB823CCoCGUiJQWnlKcf
	8pj7lSakSiFc8JtHCNZWHeZy/JMQooEbUykH7mEJ/ZKHapksV8KZap1c5yCbi7SEIT0fVy4xynE
	TdKwEk5Q8bY0xBbAlKKVtijzugpT8vguvXt8f4SzQ==
X-Received: by 2002:a05:620a:aa0a:b0:938:fdde:b578 with SMTP id af79cd13be357-939803286cfmr803936885a.6.1788557634071;
        Fri, 04 Sep 2026 14:33:54 -0700 (PDT)
Received: from athas.localdomain ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb33619sm306403685a.22.2026.09.04.14.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:33:53 -0700 (PDT)
From: Carlos O'Donell <carlos@systemhalted.org>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	Carlos O'Donell <carlos@redhat.com>
Subject: [PATCH] glibc: Update meeting minutes and next office hours.
Date: Fri,  4 Sep 2026 17:33:32 -0400
Message-ID: <20260904213350.1827805-1-carlos@systemhalted.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/projects/glibc.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/source/projects/glibc.rst b/source/projects/glibc.rst
index 71e80a7..f841fd8 100644
--- a/source/projects/glibc.rst
+++ b/source/projects/glibc.rst
@@ -27,6 +27,12 @@ Future steps in the migration plan include:
 
 Meeting minutes for Office Hours for CTI:
 
+ * `2026-08-28 <https://inbox.sourceware.org/libc-alpha/ea0733bd-7d03-48be-b2d5-77587540789e@redhat.com/>`_
+ * `2026-08-21 <https://inbox.sourceware.org/libc-alpha/ef616950-d7f9-4d56-bfbd-941813b5d1de@redhat.com/>`_
+ * `2026-07-31 <https://inbox.sourceware.org/libc-alpha/a9306858-0d9d-4ab6-9e89-1a36beefa435@gotplt.org/>`_
+ * `2026-07-10 <https://inbox.sourceware.org/libc-alpha/1ed184a0-9aa1-40cc-be01-46c16142f26d@redhat.com/>`_
+ * `2026-06-05 <https://inbox.sourceware.org/libc-alpha/03c54212-5f7f-4dc8-a9de-e1f3df65090e@redhat.com/>`_
+ * `2026-05-29 <https://inbox.sourceware.org/libc-alpha/2bad4ca0-ac19-4c49-98a6-eca20968ccab@redhat.com/>`_
  * `2026-03-13 <https://inbox.sourceware.org/libc-alpha/b158b348-a8e0-4b80-8795-ca926d10f14d@redhat.com/>`_
  * `2026-02-27 <https://inbox.sourceware.org/libc-alpha/eabfe0be-7e59-4484-b4bd-248f4fd3682a@redhat.com/>`_
  * `2026-02-13 <https://inbox.sourceware.org/libc-alpha/41a4d52e-e890-4a12-9046-92f1a6f51eaf@redhat.com/>`_
-- 
2.55.0

