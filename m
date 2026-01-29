Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF01336C0AA
	for <cti-tac@lists.linuxfoundation.org>; Thu, 29 Jan 2026 23:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769727874; cv=none; b=ie+F9gQvzHDAlI5o2q9Nxqd+uL9ONroymcYBNcywHBpArETWrwoO+v3pVP1Nmz4y6ZlE5cpFSE17AJKnblPpg0dlNu1l2BugXLs9LGFbOWSYMexjRHBq09Ah4uZ0YDyAdBwMrpj4p54w5uVK75E/yX2bSJtdL7tqOZyusK5X3Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769727874; c=relaxed/simple;
	bh=tOmIerLNc4HjNzJAwGX9EpdFRiEmwgjrxwTSOLAZBb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=nCz/+8dbkNrV2hALRzdMOsk2NUm0iIsRJw7JrtB3HbjNaDPip5CflLLM1cVBPcaWSSUa2D4Yf9eQn9N1cFptRrQZkMGhm9qE/tPnXXKO5yJ4oftSScBlU3izwm16b0SuZUHlHnWW3M/FFhpkmnA9ENHG+g0MQ8dx6ZRhbXoA3Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PVnnaoqd; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PVnnaoqd"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C85180C6F
	for <cti-tac@lists.linuxfoundation.org>; Thu, 29 Jan 2026 23:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ap7Eib-gFL0g for <cti-tac@lists.linuxfoundation.org>;
 Thu, 29 Jan 2026 23:04:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F05080C68
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F05080C68
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PVnnaoqd
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5F05080C68
	for <cti-tac@lists.linuxfoundation.org>; Thu, 29 Jan 2026 23:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769727870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HKY+rBMxDYuvu7yxBY/vKHeNShSUJvNl9FPsPI9mjPw=;
	b=PVnnaoqdaRAff1N/U0e010qJCXKPdoPQJdQ+tnedwYI0C54h6wtPe5q8eMJT303wXEtupM
	S70U7LE909wK2+dVTarFbdO6Y+datXlI9Kr9ueJITrpWhdvAw9igONHiB+BfAYPIz5jHst
	JvKqiicpt6r0+iAkiIdPO+BdSGwPpgc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-xKESd0lZNtWCmJSMnFuMeg-1; Thu, 29 Jan 2026 18:04:28 -0500
X-MC-Unique: xKESd0lZNtWCmJSMnFuMeg-1
X-Mimecast-MFC-AGG-ID: xKESd0lZNtWCmJSMnFuMeg_1769727868
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50143b67424so40055491cf.0
        for <cti-tac@lists.linuxfoundation.org>; Thu, 29 Jan 2026 15:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769727867; x=1770332667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKY+rBMxDYuvu7yxBY/vKHeNShSUJvNl9FPsPI9mjPw=;
        b=so3ogL0E1xXLwd7af0ygdX2ymziu1PB5IPtF/rcuCZ1wuUXFwBMd1K130l99Maz5Ot
         744qENgfRhhvbEjEga7pZLebhZcIrLQBiaM27LCXkUrTCUU8jOCpGAic0kC1qpoE+HPn
         KK03rF22BQ6n0pxZPD6kdIiRESGWPAUcYyjMogcLFLz6UEktL88U51+zxr7DO4wstwgi
         ir8LOttN7n2vfH0yQ2mys6NMFWoeziHa/0VYDH6jFT1jBcw7JJBLhzTQBUQxQXddid2+
         W+ergMohY1Hqlbqj/jBhys7HTC5axX0YvwxxincJzZBZika52S3NqP7qJedNrseu/ZJt
         K6eQ==
X-Gm-Message-State: AOJu0YxsJo+loR6oLu/98QVzkOReDVSqnxNsn2IRR3ncDkjP6JrcMpYS
	RRvjD7VUSzw6CbRJH2Lw83WPU4iYQUC3THoBEH134UY20q2mPZLx1RMFJ6B15xFBf7GJ4x5DKiy
	zcY7g7TLPivzvs561Q+k52FVljmY4mt43VZKLYelyYlNmdCNn1ZoQoJ/1RzdJfvkhC+3SS+RzXP
	XP8bMdM4BdpxKCtVOl6BGRgYphUzj6zCCYRzpK/2r81vK+cFQNDP55aw==
X-Gm-Gg: AZuq6aKZEaUckuYcr1t0WRLU80uibUjlvMX4L7W9gjCK5YUwFBumIfNlKHa+GbNflLR
	LyMJqgEhFnqztjX3jO3BPFLmFJzWXMAUI2VapSm47Vz3MpJjl5KIProPbqKQ0sBC0S4U3S9SUrR
	Pmg463A4DSGAzKhuPSVlJmcmmxjnr3i3H0uPemaGUL+TeifuMr7EjtPzl004CtwjMFLP3b0h3M6
	YnVsk27JbT80NzOysXFw2Pfe5QJXLhdn5AxRuFhqgnKw6ii3/Ovy//n8LAvzu7HIe8WWxXrQ9mZ
	rWD5cwSmyqHPZBUJzPbzup9LMZOx94QRSZPEbxXOwKG+4VC7+pv6XQEV3aHVdCWVm6LnxG2bz+w
	aePElHDL3WrjfsomNl5aTUVqMXISBE87FaDGoTTUTpjk3LU3nykTO8g9xgHARtfAuxNjqMrlV+3
	CDTT7w04OsJhE=
X-Received: by 2002:a05:622a:20d:b0:503:4258:93aa with SMTP id d75a77b69052e-505d1ffc375mr16755051cf.0.1769727867114;
        Thu, 29 Jan 2026 15:04:27 -0800 (PST)
X-Received: by 2002:a05:622a:20d:b0:503:4258:93aa with SMTP id d75a77b69052e-505d1ffc375mr16754691cf.0.1769727866621;
        Thu, 29 Jan 2026 15:04:26 -0800 (PST)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5033766bb5fsm43848461cf.15.2026.01.29.15.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 15:04:25 -0800 (PST)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [COMMITTED] glibc: Update instructions to login first.
Date: Thu, 29 Jan 2026 18:04:07 -0500
Message-ID: <20260129230422.1946871-1-carlos@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sKJr7Z6gklfsNhIBpKVui5kVmABo1J0zUitu6nXWBkQ_1769727868
X-Mimecast-Originator: redhat.com
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Correct URL.

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/projects/glibc.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/source/projects/glibc.rst b/source/projects/glibc.rst
index cc5889f..f243697 100644
--- a/source/projects/glibc.rst
+++ b/source/projects/glibc.rst
@@ -5,7 +5,8 @@ In 2026 we have started the process of migrating core services for glibc.
 
 We will be hosting weekly Office Hours for CTI to discuss developer questions and the migration.
 
- * Video conferencing link: `Office Hours for CTI <https://bbb.linuxfoundation.org/rooms//gq0-ndw-gku-r2e/join>`_
+ * Please `sign in to BBB first <https://bbb.linuxfoundation.org/>`_.
+ * Video conferencing link: `Office Hours for CTI <https://bbb.linuxfoundation.org/rooms/gq0-ndw-gku-r2e/join>`_
 
 The first meeting will be on Friday January 30th from 10am to 11am EST5EDT.
 
-- 
2.52.0

