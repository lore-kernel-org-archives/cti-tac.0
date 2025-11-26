Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391892E5405
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Nov 2025 22:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764194845; cv=none; b=oVLNjW0CXf1zyrBWHXotDLVzdGFhk0Ywq2nYXVG7S9fzTYOHuHuaTd77cghGfGlPvssuxygnUQckmzsSa0HQndmLH7I54JK1JlqU424Z0EyHL+F+ItyqSpOt0JwdcHw0qEWrvYn1ctkFnRVBaMNiQInXkXDYnkfLcNbnLXtkQO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764194845; c=relaxed/simple;
	bh=Nat/FM81LFja5pA54572VoxlE/zCQ7ieEo49jJqoozw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=eSxwat3esiZsBfHC6X6FvXGNAgce2DVVRIwAvW31IOcv7ayJHflLHvdAjTSUCVSUDAy0KfsvwI2iJ4Txs7FvMGEg67klyxleCpGKQs7ps7qxcafVYd8apKxfF8MbaCRZ7CRgyj7k0t3+PkJMJISg8g67ZR3vVPYntVFupSUSJLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R3VtsW8q; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R3VtsW8q"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B452F40219
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Nov 2025 22:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcO-xjYFexkq for <cti-tac@lists.linuxfoundation.org>;
 Wed, 26 Nov 2025 22:07:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A9A2E4006D
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9A2E4006D
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R3VtsW8q
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A9A2E4006D
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Nov 2025 22:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764194841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L4Rz+puV0ZiWJQ52qJKYSaNlETlKrK9JgD2aFgspB0I=;
	b=R3VtsW8qGcR/vUbjaSJbhT9NepxncSAJTFXs/NdMPWsf+8QYM58F5zk6b1wwILlxAKP0he
	ln+WLJRvHVjCF+Id8mKAzy9hv+yoD5z1GkU4IBYcB8n0X0qJwfaQC1p+7rtl64mWkoZ0n0
	NguTlG3I76Ar/iMw+ASbKNtl4Wnq8JE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-A85oU0dZODOCHnr4muYcMw-1; Wed, 26 Nov 2025 17:07:20 -0500
X-MC-Unique: A85oU0dZODOCHnr4muYcMw-1
X-Mimecast-MFC-AGG-ID: A85oU0dZODOCHnr4muYcMw_1764194839
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88233d526baso6358376d6.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Nov 2025 14:07:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764194839; x=1764799639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L4Rz+puV0ZiWJQ52qJKYSaNlETlKrK9JgD2aFgspB0I=;
        b=eT+0LjKL0baC0/xcPgKYTHmTRdPmCeE7fbHTnOGcmxCElmVcX6Ydy7ZM7XmnX3pe2m
         /ylSQ4Fo+6Gta//qmJSxpyuD9O1llaOu1qnlTAqbw2UcqpqXfpCsxTCaDwO2sU/t3Wr6
         7i3J2V/vto5IU3ektrqhdJC76bbLtGgZWpZdDrxCrqylN/tkIyWTVSQH2Eta3y0kCbir
         iJ5D3s6tcm74LV4UbVp7j+OZgQt2PgYuU0SCxGiA1K2bnxv60jF2oOW7dA/HoNu/isbL
         aXr8RUXJgecR2tW3RQObHTK+9mfFZ2pzvJ7mTtI22hro583oWnDG1anuWy04HowVy6E2
         +IaA==
X-Gm-Message-State: AOJu0YxvQ4oX5iSqknzC/SOVM+2EnDyQ4gztvmgaThe6KptUmUQBGJZO
	uGMGF0F/SYFHdf7SToCq49UwqD+z+z4R5R1kHYqyh5Ng+bdjRA+wu9pg95fXVvJLoc5kGfiNGG/
	FUjA2KvXq5X6gcCE7I097PN8SXoKJGdmtV4nPrqlio1cT0LdwF2AOJrQimqSHKyjXvn8AfHND9o
	bnP1SzJafHtEILOV+iEwSWiXVr7Y2hqKR6XL/mADvvtQtFSaejJ9f92w==
X-Gm-Gg: ASbGnctI238qYfpHdNaoN5AEswZEbMqSPQcNZoSGL+dPOR2WeQKqF72GrQjn1LqCqv5
	FO2l/sQfKLElXx6hDV/Hv1RG7KZTsYHvG4btMeEl1VCm6AtiHruEVa2EN89TISsx/TX692ajJJk
	Ls+quDnY1+X8vJejiVuP3JIuWCiTMoKX7pySOPFvv/jB0bZIOyzrPo59QtySkiBVl17thSyLZPx
	Gv2Gv2rARwyjJKOIWYM7M/1FYWZyIj37hGTnUttZRGUO7F4W7q4f9i1a/hw/sUXk5eD4syKVk99
	2fbly2h+E3nnpudj9c57iMSRE12HMX/yt/2mGSPyPS1tjkGCPCd1esrW7me0epVbdF1wDnpj3kE
	r4L8ItYyV2v/o
X-Received: by 2002:ad4:5b83:0:b0:882:4fc3:5f1f with SMTP id 6a1803df08f44-8847c515aa0mr297924846d6.38.1764194838982;
        Wed, 26 Nov 2025 14:07:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGIbAIOI6gXx3lsYEuprCERLYkFz9RjJtxDY9GqT7JHMwfIxMc5MlgD4TVLQE7F+jtE9eJFg==
X-Received: by 2002:ad4:5b83:0:b0:882:4fc3:5f1f with SMTP id 6a1803df08f44-8847c515aa0mr297924356d6.38.1764194838480;
        Wed, 26 Nov 2025 14:07:18 -0800 (PST)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e445bd4sm152414256d6.10.2025.11.26.14.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 14:07:17 -0800 (PST)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [PATCH 3/4] projects/glibc: Update git to gitolite migration status.
Date: Wed, 26 Nov 2025 17:06:48 -0500
Message-ID: <20251126220707.2596367-3-carlos@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126220707.2596367-1-carlos@redhat.com>
References: <20251126220707.2596367-1-carlos@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eglq_jpU0p_eYvEJTZRRUiSTKNtrTMQwuP23tyXo2O4_1764194839
X-Mimecast-Originator: redhat.com
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/projects/glibc.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/source/projects/glibc.rst b/source/projects/glibc.rst
index 726f658..c3a01b7 100644
--- a/source/projects/glibc.rst
+++ b/source/projects/glibc.rst
@@ -6,8 +6,11 @@ In 2025, as with 2024, the goal is to migrate the glibc project to use CTI servi
 Current Status
 --------------
 
+As of 2025-08-19 an `evaluation of glibc moving from git to gitolite is in progress <https://inbox.sourceware.org/libc-alpha/4e9f65ea-a1bf-4d69-9dd5-63aa301f0b42@redhat.com/>`_.
+
 As of 2025-08-11 moving to new infrastructure is on hold as we discuss the core reasons for the migration.
 
+
 CY25: Define a SSDLC for the GNU Toolchain
 ==========================================
 
-- 
2.51.1

