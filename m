Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A42E343207
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Nov 2025 22:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764194848; cv=none; b=Bx8O4zMhOBxqoWdMaszxht3uZ29HOOrPceCCMgVqFAOWL7KJS8G49sPA7w8AHF5M12jCSUc6C1GjrC/PC3Y/vock9HqTc04li39CC1cTrulSTvvldzZmJ5czXj9cMwX19p/p+tsAY6twv3zQosUeFuGIB4m5vqwOJ6retyRHy84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764194848; c=relaxed/simple;
	bh=M+mVecTM1tyG9AjwEmnl30EYxj9semjVInA4BkdWziM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=Fj4IdMe+UmXNc3oZ1tGIeMbN261hDFvjFU9bjXRRNlDry7vdq8ymHe8Cq7quU5WUl01Qo7ePHORI4RLASeAzqHns5787C22incvzW+RsBgVHZP7Jf6hrU9EqLSCvTYtk+n4JBmvyjiG9ReSz1FsJik2PDfZyK+5smVq43LizVk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zp6z/M5g; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zp6z/M5g"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1864484120
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Nov 2025 22:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.795
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klKFVlSjkZbZ for <cti-tac@lists.linuxfoundation.org>;
 Wed, 26 Nov 2025 22:07:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D13184066
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D13184066
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zp6z/M5g
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0D13184066
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Nov 2025 22:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764194844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h87/vKH/TjJrTZ43ehKw3RpnPpIakJ1EFv71dTeT8Zw=;
	b=Zp6z/M5g/v4gURQzfoDJ7SzEF8TMcwbFIWKaUeKJCsQilZongTgBjOS2L/2sHNOfA6ADnl
	b+wpNL0b3+kWWGDhi0We3aWVEI4kggsh+zz9w0lZu3JHo1RgSApDQrZJmwZZV9s5s6LHJd
	gjleQqU0+0WB7kMin+J6ZS1r+o0bIcQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-0ZhZUx8iN2yzlVnslE4QvA-1; Wed, 26 Nov 2025 17:07:21 -0500
X-MC-Unique: 0ZhZUx8iN2yzlVnslE4QvA-1
X-Mimecast-MFC-AGG-ID: 0ZhZUx8iN2yzlVnslE4QvA_1764194841
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88050708ac2so4651146d6.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Nov 2025 14:07:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764194840; x=1764799640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h87/vKH/TjJrTZ43ehKw3RpnPpIakJ1EFv71dTeT8Zw=;
        b=PFjfUGJlVnqYKxAeZN2P+egyLebXa7Fw8yzIoPUBv9IF0NhfZk3qu86Cf2NzwFR2Uw
         1US4+qIrZpPEE6IDb0NqUVJ/xADfDDBiR6ZR34RbW4aTH3sEOAIv+IG8ZEqCHTDF5QB9
         rpO7WcgOs0/xbtoM8h2nQyTi1o3Rz05cXSF26mSXcYLhSxA9YZmBVf0LZXFRPVWjcW2e
         /OfQ37L5z13H8VP8/WvkryfttaLLydB6Lib91fwOXSZmkDtsI5ryVErUMOnN1skY7rtl
         bqSsVAFpiuHqW19tdsnIqvZ3Lsige7F8jyjKmKr/6Ce11EuTiaSrG5g1rijaEpgers3k
         BL0w==
X-Gm-Message-State: AOJu0YznMwTp3LtzZq6Dsi2jr5gtbPiNZLFG2+TcCkbPuz/cn7ntVgk+
	FwCmk/8aGa34EYYLTV3Q+IjYX+WSIoi33T8Nr8O7rQJQ9QAj8HJLgd9gfGC+i/iKLxFh5B7NMv5
	lf8Sj3Ui1vADwkI2EPqC+PR5FmVKtCQl80aC7AVBp/IbRUq5UV74TS90MpSktiKqSbLrsUPnly/
	jCdj4x0ZaK+wMx8qfi2eVTTTzPrNeOsLgC0SgDHcVldLuhCYuikSnUew==
X-Gm-Gg: ASbGnctaLPkwq/FWljCw5Y1DX6bHzJrTUOPCT6ZHyuM+FSUbtfKp2RfheJPgOV+UovR
	JptcL2QnCecvFvG8HJCK9SN5HpjdCuLxfQDBV5Rz26uZHLFCm94i6EZ8LwoZTqwTOD45Jk1joVs
	PU16DyJmbCOmm1l0yVrp8wCRF42JSbX7NXLQEyK2DZBP8akrnheCLNlV5yOuD2hkixZHM5tBLDJ
	z+90W6pP6Oh8iXl1xUJzDa5Cg1DoPpVQ53rUwCGfZguTrs2lFareGLJPwAcnfnfgiaZ0RKettWy
	cnOZ5TfLw1RQPgGBGt3lUILnLyy3JZ3Zukt4xc8NZ5xaupUoR0I8H4BkFxcUMvw8ZvKmoSlR48j
	tykMVdaMYZGpZ
X-Received: by 2002:ad4:5cce:0:b0:880:4f33:4666 with SMTP id 6a1803df08f44-8847c4e3f97mr320980826d6.20.1764194840059;
        Wed, 26 Nov 2025 14:07:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5OdGCPXxvMNP9LAkm46ljiGIp8PFVnWaQyode/NRE8LnWFCOKJW85HO+kzRdTUtVSy10RXw==
X-Received: by 2002:ad4:5cce:0:b0:880:4f33:4666 with SMTP id 6a1803df08f44-8847c4e3f97mr320980406d6.20.1764194839605;
        Wed, 26 Nov 2025 14:07:19 -0800 (PST)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e445bd4sm152414256d6.10.2025.11.26.14.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 14:07:19 -0800 (PST)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [PATCH 4/4] Update spelling wordlist with "MiB".
Date: Wed, 26 Nov 2025 17:06:49 -0500
Message-ID: <20251126220707.2596367-4-carlos@redhat.com>
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
X-Mimecast-MFC-PROC-ID: PpwTgtYuQF-FVs3Dl2Tkhtg2O6VVrn7u-27dcNue6SM_1764194841
X-Mimecast-Originator: redhat.com
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/spelling_wordlist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/source/spelling_wordlist.txt b/source/spelling_wordlist.txt
index 4bc5caa..ac68c02 100644
--- a/source/spelling_wordlist.txt
+++ b/source/spelling_wordlist.txt
@@ -2,6 +2,7 @@ Cron
 Cyber
 Cybersecurity
 Django
+MiB
 Pipermail
 Sourceware
 TAC
-- 
2.51.1

