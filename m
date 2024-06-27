Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D5F19B58A
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Jun 2024 19:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719517581; cv=none; b=pZKk95gcgaIqOR9jcaRoVVs32aZsVt0FhGA0Ybzbt0YAJAOHysDVAwuAjDoasMyWaq/6zOlhjgJnhe8r5TvPFzLTt5jvuwemsHPok5TWHpjxlDpqeoQlwiblgek+TOcDVU2zrsOP/PlNwdKw9EWZZhcp5lNBaNd92MvX68sZOz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719517581; c=relaxed/simple;
	bh=JK1D0oQ+yxclscQAGfOhcAisISSEz7sKE/1qFIsoXqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=iq8j9OUgtdVQjwit0cCchguB0OJhMOAnKefjugglrzETTqU16+k0+gOXiP4P6feGj9Xh7GcLCrJh+Zthk6Y+kqYCsMu/zNFteLDqFwVJIDhNrxyYHu6bFUQnBtvgP258ybnN+7zOxZjUQX+NTmhfBFwjdXeaUR3I2mOXTfimLNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D83qu5JX; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D83qu5JX"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82E30820DB
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Jun 2024 19:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zqn9O7KttV60 for <cti-tac@lists.linuxfoundation.org>;
 Thu, 27 Jun 2024 19:46:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0CB2820D2
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0CB2820D2
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D83qu5JX
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A0CB2820D2
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Jun 2024 19:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719517576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P+bOIA5kgiPuq8c7Ete5BQA38nMEZCZL9KN8pqyg11A=;
	b=D83qu5JXsAqoG84VHqKdVaepZ8i+coFPx9LzoPYMvmoiV5XuLZ9wggPu9kdWiZ4ZJfCtgo
	UZUtf2VDQq1TWqQhpN3m7WTjQq5exURbjfVmA78i/jXYQMywj6qAJgg/+N1YuuTBubp0aI
	duwQxKu34kvfRIY4fiWFoSzARHHy8HA=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-_qjYMbj7OxqgBgrlWc3bGQ-1; Thu, 27 Jun 2024 15:46:14 -0400
X-MC-Unique: _qjYMbj7OxqgBgrlWc3bGQ-1
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-4ef7cfc3dc4so2667058e0c.1
        for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Jun 2024 12:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719517573; x=1720122373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+bOIA5kgiPuq8c7Ete5BQA38nMEZCZL9KN8pqyg11A=;
        b=lQ3a9qTyvNG5pRRmNBNr3P6qRMSTKVJ45vaSd5Tq7Og4v8Xvu5FtyeoszCoVLZB4z8
         34VWMveMsCTFW81DHWD8gsqCduR+SstNWj0eYT6EeXCstso0F6zxtOS+sK3PCYVZboC6
         6iRk2HHcEn78lr5hBsshKLs8jLz5L8ckFsNNckK9bjUYxhkEjhgV3GMb98pNAb+fmCfj
         0NCF3WJyc66JHDLz+ZJ8fft7DsbbRbYZu857LUkTV+UVZ/P14Xs8l/ZP+0nbkfOpn2ip
         g/ni9ie0wxJOjn5UbD5EsZLj7JoqVfFQyFh8x3sePmwjSM4RJTBpRNJeUT0Urfb1Pf43
         zAIQ==
X-Gm-Message-State: AOJu0YxDj7WZMaZ991wp7DF/IhKIyjCTGwdP0euwKiZOCit38yeFxImw
	kDZT06A3GiGKvbDC3lky0IA8jXTfrsmwJcxS8VpuVJgELdZnjwwoxoT3hIdR87CQI/7knBfCkDE
	BXK/j1wNZTXcnOAlIBF6EOCFiLosQZvWnfpLhnTfCOzhtyGZUN/Y3eIsx0sR9ivb40N+W656D36
	UEXrwErXhMstEIQ/xiwQ1QsXqZnRk3Paf8QS1Uq5j3/jPm84q1Bw==
X-Received: by 2002:a05:6122:1799:b0:4dc:d7b4:5f7d with SMTP id 71dfb90a1353d-4ef6d8295dbmr13500408e0c.8.1719517573591;
        Thu, 27 Jun 2024 12:46:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENBryT37A/TSXgLAcSC4S7fUVlmuGRQd4u40o+xERySL9Ley4hPRtrBsGNdHhkE7/JqJaDow==
X-Received: by 2002:a05:6122:1799:b0:4dc:d7b4:5f7d with SMTP id 71dfb90a1353d-4ef6d8295dbmr13500381e0c.8.1719517573134;
        Thu, 27 Jun 2024 12:46:13 -0700 (PDT)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b59e5f2653sm1497206d6.76.2024.06.27.12.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 12:46:12 -0700 (PDT)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [COMMITTED] services/index: Fix grammar in first two sentences.
Date: Thu, 27 Jun 2024 15:45:51 -0400
Message-ID: <20240627194611.198616-1-carlos@redhat.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/services/index.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/source/services/index.rst b/source/services/index.rst
index 978e07a..5e5140a 100644
--- a/source/services/index.rst
+++ b/source/services/index.rst
@@ -1,9 +1,9 @@
 Services
 ========
 
-The CTI project requests that all services providers use FOSS to provide the
-services that project uses. The use of FOSS for the services is a mandatory
-requirement.
+The CTI project requests that all service providers use FOSS to provide the
+services that are used by the projects. The use of FOSS for the services is a
+mandatory requirement.
 
 The IT service provider is the LF IT core projects team.
 
-- 
2.45.0

