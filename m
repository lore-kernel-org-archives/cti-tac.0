Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072D51F19A
	for <cti-tac@lists.linuxfoundation.org>; Mon,  6 May 2024 17:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715017141; cv=none; b=pHpC1QPFqJ5WlSW21hUlSiV1nVRrPi7PJtFkapX3ZSQJ9pSjU4fbhgTKNgZb0haaLbMSuKDNsprvXsySiHHMuO31CzBoqzmcvOcKMpPlWpNQT4XVj1eghXVzRAo92GXz+htBH1Mxig60J1DG131CoNjMvXN8eawtkcw7dvv/mDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715017141; c=relaxed/simple;
	bh=jzSya3mkvfeaT3UkuZx6zI1eXpVHaac0i4YNpcV808k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=ryy1gKvB7if8WJnVpAQnntjYfEuVbIrMUidqRXLHRJjHxM8u3dkaQPvFCWoykdEgwIPOF9ujTEonJRSxwd/w8vzH87ZwvfynnrxeE0HhbAYUHhqcZPbD0W1elAn4m9wHnJNpk0mwbqwRA4jrNWwSqLBL7IAP1tJjiPvLVHwEp0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U0PWGMCv; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U0PWGMCv"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93FD16061D
	for <cti-tac@lists.linuxfoundation.org>; Mon,  6 May 2024 17:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQr-dyCLifmt for <cti-tac@lists.linuxfoundation.org>;
 Mon,  6 May 2024 17:38:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CCA9760619
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCA9760619
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U0PWGMCv
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CCA9760619
	for <cti-tac@lists.linuxfoundation.org>; Mon,  6 May 2024 17:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715017137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2hYV3k7RkBejLMqouFuFyS/r+6Ld/DUwBq6tUPtmrH4=;
	b=U0PWGMCvlNFVveIkC/g41drD374i+VFe03Ri/YGzlm81rz73OO3XJr5PjXvjutiH8seWuV
	1UxW8Z4QZL40N6ZeBYf0ZTKYWrUfDRUwHa+jOUkdS4QxaE2qq0CETP8U6MPs5drGxhfdDy
	bRqVdzbRLbTbKgd+H8O39mQ1Eppw5To=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-0ITkagEQPPWE9zMSJVhuvA-1; Mon, 06 May 2024 13:38:56 -0400
X-MC-Unique: 0ITkagEQPPWE9zMSJVhuvA-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-43d2c060552so34538121cf.1
        for <cti-tac@lists.linuxfoundation.org>; Mon, 06 May 2024 10:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715017135; x=1715621935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hYV3k7RkBejLMqouFuFyS/r+6Ld/DUwBq6tUPtmrH4=;
        b=C+d5kj1prtF5jo8FmmtFUiVQnd7z1K6TeXIKdww4mYpHcH0rVzv8THBLd7/aOgarJA
         EtF0/6CFPcQKiDBLFhzxUhitYeN7EbQhStzZVu8Jvt6ZQH/XeFKA1SmwDjFrOOFuPV44
         7mpOpucm9DLi6XLZ64wX5pcHEmUdSL9kIA1A8/uNOHbQygxhcBveQ1VIWyi9ppm/HyPQ
         zvGeIVIobfLGo9eYYMpu0/7zeVO5ccVNBEkwlac+eNb9AOFRwAZQiEpo4/kZF/m4Nh2e
         pR4wxtixlaoNYaCelgBJ3VGYVA55HCYgaM4AyPrIVzoFCZOA2YDPKuxdP80cUZPUBxSY
         zzGg==
X-Gm-Message-State: AOJu0YzKgKxreq+gavrebivinQ8OFsPL+WVNMJXsefT2l/Wv9ma6N2MJ
	ZPfoOsN3+A529JU0odNbJqx2RgNfcHUyW0WEdpFmoJnSQ+2QKJDE9kDAJaK0ZJ1LlQcbScZ3N2b
	MzPQ1J9eMJSfCMy3bHkgptPADTk4JYBAzp+OPEXuHxqYdak+W+RTaAFDg57rcvjsLVR3xd4oEFR
	y3lHJ53qVT7zXs61HZf0HQZttcNi+nEFIWOSxKgvKaA1K7mLjNzw==
X-Received: by 2002:ac8:5d12:0:b0:43a:6055:5547 with SMTP id d75a77b69052e-43d8f5bc82fmr6164331cf.23.1715017135208;
        Mon, 06 May 2024 10:38:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCQxDyO1Ywxuu39aK747er1PZPEOCRYsATPuS1iqRaknJAxPrtMEMRm8wWiHy3hYu43kw8Jg==
X-Received: by 2002:ac8:5d12:0:b0:43a:6055:5547 with SMTP id d75a77b69052e-43d8f5bc82fmr6163881cf.23.1715017134631;
        Mon, 06 May 2024 10:38:54 -0700 (PDT)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id fk17-20020a05622a559100b004347627f12esm5347620qtb.11.2024.05.06.10.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 10:38:54 -0700 (PDT)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [COMMITTED] tac/index: Joel Brobecker stepping down from the TAC.
Date: Mon,  6 May 2024 13:37:53 -0400
Message-ID: <20240506173852.106433-1-carlos@redhat.com>
X-Mailer: git-send-email 2.44.0
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

Updated CTI TAC member list to indicate Joel has stepped down.

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/tac/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/source/tac/index.rst b/source/tac/index.rst
index 41238dd..876b8c3 100644
--- a/source/tac/index.rst
+++ b/source/tac/index.rst
@@ -16,7 +16,6 @@ currently made up of the following community member (alphabetical):
 * David Edelsohn
 * Frank Ch. Eigler
 * Jeff Law
-* Joel Brobecker
 * Jose Marchesi
 * Joseph Myers
 * Nick Clifton
@@ -28,6 +27,7 @@ binutils, glibc and gdb.
 
 We wish to extend a heartfelt thank you to our previous CTI TAC members:
 
+* Joel Brobecker
 * Martin Liška
 * Chris Faylor
 
-- 
2.44.0

