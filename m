Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F02910A18
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276368; cv=none; b=h21AvoOPorNm9vXghCWWLl9fguUVQPyvp6ua0e3Rng4FSXWG5jKhpmNUvIYtIeLXDHOmm1r1r2AWxGro0qEJh0rt4rqbtQsnyPFIHT3IlDqpLt0bJcUgKt6tfhGm6c5ZqnQ+k4jOIeaUuGTpSRVF5d2ydhw3KdDiVtCYft86CoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276368; c=relaxed/simple;
	bh=DssbJNfgcY8OjHntjLMVHe+WY7T3W2CGEv30n+/HAW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=ZNTEJ3zlQ3JEO8nKgrPJCJ7S1i0z4jXZ0TqCG9badhW6dQMIZzyQfcLthQnQSvuBDZIjNx90rYxumxsm1xfG9F3kVXiX42UWA0utl2iAXav3EoJLRNN0tgVqzvXhlQo27NjxnGmeMKJiXdv1smaguX+xwLH2s/pt6q+KZH3bX6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iAHVX5+a; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iAHVX5+a"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C092184915
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 14:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGLfrTEN5gOA for <cti-tac@lists.linuxfoundation.org>;
 Wed, 25 Sep 2024 14:59:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D536F84907
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D536F84907
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iAHVX5+a
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D536F84907
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 14:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727276364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BD4SlgTdDRh7kaAT7Ailt/K7+bQRZ3nq56Tp2albzx4=;
	b=iAHVX5+aBftti8UToBAVw1DD2bWO+ZuXQLt0/tD1r1XoDoz+G72lh3QXpxsT8UxmY/YVdc
	nF+5xeSwmldhPG2sZqmxfMvpdM3Z6GerjRKg8+E9zfr5xZxMb80MerQJio/XuV8jGEvvnX
	vaa3oA/nNMOwLNoeriA6gKjZXrqYt7A=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-1hYTY8l0OjuoldRod2XQHA-1; Wed, 25 Sep 2024 10:59:23 -0400
X-MC-Unique: 1hYTY8l0OjuoldRod2XQHA-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4582a894843so118593581cf.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 07:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276362; x=1727881162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BD4SlgTdDRh7kaAT7Ailt/K7+bQRZ3nq56Tp2albzx4=;
        b=DFjSVLIQ/n9kwIZ5LKtdpT1YTT6l++BrRUfwgCNx6rr630xFOmxnUiwBFZ5yQqhxKq
         NHM46vevxiBSNzqp77hU2j/ioZuNbkikHyFDPVKTCsMwo5p8Mjpb21WkSLkUN01+s85Y
         vz+VK7aVAoIW7G9J+GC98sJmj1EAPBT24Ujud1c2xmTwZJ+APOteXn4v9a4wbdiDXgGZ
         jddxoDGaMYrAYwfLMgnQT6K8dkK3sMdRQ2+bzMa1nsCsIQ9LDsKl0z2Nc8I8AI3xP/ZX
         rqvG6eUJvzGJH9JHrWqKUzmv4SlNZxg9HxMvxoG5UdZO0PSb50kGFW/wr5V32X+mplyx
         tDAQ==
X-Gm-Message-State: AOJu0YyBhO9FaWBeRhhhSIx4CCeUuHWHXsS+9xvJIas4kZrI+ObWfpsZ
	6OVR9TaUZ8OOsYTVhwfKQ8EoEay8vtDgM0Pf1uCgNo7jpiOVAoNUzcsSxfoN8vMGZpUqR6/drBH
	YlvH/S8nkUQ61Tl4DcdpnG0zF+En2WXriHnxc4ecF6Xb7yI0dESW/o93yJXZMpuWMddN/2vBgUq
	rzDEZbt8ccwrsbbMtQ0h23Qiu2zLg30NxR5LFBgv/kmuSO/TaqG5zb
X-Received: by 2002:ac8:5a8a:0:b0:458:3154:4d0d with SMTP id d75a77b69052e-45b5e02e8femr41630501cf.37.1727276362316;
        Wed, 25 Sep 2024 07:59:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeUZ4hqhCVPGWKbBRy038jSJV4JrA4IXXruZdY1cFwNVCX9BKY1l4H8zqozfQTB5GUDkOfGw==
X-Received: by 2002:ac8:5a8a:0:b0:458:3154:4d0d with SMTP id d75a77b69052e-45b5e02e8femr41630241cf.37.1727276361838;
        Wed, 25 Sep 2024 07:59:21 -0700 (PDT)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5268a833sm16781471cf.79.2024.09.25.07.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 07:59:21 -0700 (PDT)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [PATCH] tac: Nick stepping down.
Date: Wed, 25 Sep 2024 10:59:01 -0400
Message-ID: <20240925145918.482756-1-carlos@redhat.com>
X-Mailer: git-send-email 2.46.0
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

Nick Clifton stepping down:
https://lore.kernel.org/cti-tac/67c7b140-f1fa-4598-9390-9628b3a64517@redhat.com/

Move Nick Clifton from active TAC members to previous TAC members.

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/tac/index.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/source/tac/index.rst b/source/tac/index.rst
index 796fd59..bf8e17f 100644
--- a/source/tac/index.rst
+++ b/source/tac/index.rst
@@ -18,14 +18,14 @@ currently made up of the following community member (alphabetical):
 * Frank Ch. Eigler
 * Jeff Law
 * Joseph Myers
-* Nick Clifton
 * Siddhesh Poyarekar
 
 The current CTI TAC has representatives from GNU Maintainers for gcc,
-binutils, glibc and gdb.
+and glibc, and contact with developers from all four core projects.
 
 We wish to extend a heartfelt thank you to our previous CTI TAC members:
 
+* Nick Clifton
 * Simon Marchi
 * Jose Marchesi
 * Joel Brobecker
-- 
2.46.0

