Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDE512C486
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 Jul 2024 00:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721695299; cv=none; b=tEb30toPyzN6HS2zZVDHDVkQpttOsgBXkytSvt5knxRNW4WS3YpWULt1rlAnayJeHC3N+B6WioaA7E6Cv4gwPpEL7dLIZyBCsyWdi7eypQyGyA50mrLAJUfQl48ki+8NBBm/xBGMMEes9/PCLyTb7PzvQmDQpfHUzLK92ZizITI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721695299; c=relaxed/simple;
	bh=yAq2mEwLZy000E+CMqbPdroX2oxUao+JSJs4XLoqGEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=hUq75sDg2KfBXfmWx0RDaQYURTATTQlMyjQ0p60d/ZnXwznXlco2fgQElXIorLlHRim0e7e5N9zBXuHHQwBeekGgWbYFXUdObHu2shyJBSGBKlRqWVte283zpq+mf/iN/uWgGryFRltjZU9ButYwl291uqwR60LhLE+lC8goUUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HT5xizDc; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HT5xizDc"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11FCD402F8
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 Jul 2024 00:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QA3xonpLbpyF for <cti-tac@lists.linuxfoundation.org>;
 Tue, 23 Jul 2024 00:41:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9A9C9402EF
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A9C9402EF
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HT5xizDc
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9A9C9402EF
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 Jul 2024 00:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721695295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZxLbJI3q3f/1rHQE92VUIu4TNrtsTH9Q7vfFhQgkRTg=;
	b=HT5xizDcDRQZtQUFTNVlAiYgWSls207WWVFjwkhH+cVDlWqHt/rZ2CrqfTiy7EfsbpH4nZ
	RdM916xlTktoaFGIgJkxKp1Co0PJO7PuhIkTOuvciPg95X979BZWcTnD8CARgkl6n5dww6
	yB3qpvCiM7pxvV5tza257tv2nW9OgHs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-EbqhGGVeOQelg-43rcnLEg-1; Mon, 22 Jul 2024 20:41:33 -0400
X-MC-Unique: EbqhGGVeOQelg-43rcnLEg-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6b7a50b41a4so90305216d6.1
        for <cti-tac@lists.linuxfoundation.org>; Mon, 22 Jul 2024 17:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721695293; x=1722300093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxLbJI3q3f/1rHQE92VUIu4TNrtsTH9Q7vfFhQgkRTg=;
        b=c8jjUfq8baR5EzCt2gffXmKwOJm0wpKqYazNF+bWDL2U06lsqdIe4jAxsklc0BV/W8
         x1FW7nIZ5TZaqE1Lrj/r2Sq4itQMTQkE278A5YDmkl/LgNI+RVs8RZGCwNuGGe1kFGAU
         bjNUyRj1YpBxKN6Gzz/9UV7Xx2b4zOIgHYDPNmkjw5g4xHTKAJqtdYZeCk3HmsaeTrzh
         PcJpWqodTUUei0Rx8Ve7N/PpHSsKOhQK1Q4sOK7VLxPEpwUmpDi52GYZeWkwgECx7MLU
         LdpSDjmSWZK2yEu+OTVqNLwJ1Wx6Q7PiikndEq2P9xFkAhHMUjcWvpyK3GuAN29ts76a
         a9zg==
X-Gm-Message-State: AOJu0Yx6UNfOwektKAJRvDa0OTUOOtadxFxIIedn7jbG7mqLOAohrpmV
	ou4BhrCEdEzAKdYX5dInSa5XxHpTUflWY5cvSRdK/aUne8iBN2a0caZ2VQThdqQXh4nCnpGTywW
	rivwpCEkCDYmPvQk5kC+xVHRiNPVMykSra3Aj/3gsFi38I3mGTEV6xn2HgSl9riHSwS61ezFbEv
	1f1uTdEC7eIHdV4IQgZ57xzplH8cQHAQapUOwId6mrvDTfDTBnDA==
X-Received: by 2002:a05:6214:21ef:b0:6b7:b3b8:e882 with SMTP id 6a1803df08f44-6b961092137mr114158716d6.25.1721695292903;
        Mon, 22 Jul 2024 17:41:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvqXGV0b8mH7C6wL/cA6ssVQJp7DS4WEfRiJLezS/NwafNYmyBpFrJGFS4zUc3MM47NmIe1w==
X-Received: by 2002:a05:6214:21ef:b0:6b7:b3b8:e882 with SMTP id 6a1803df08f44-6b961092137mr114158506d6.25.1721695292409;
        Mon, 22 Jul 2024 17:41:32 -0700 (PDT)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b7ac9c364dsm41177486d6.82.2024.07.22.17.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 17:41:31 -0700 (PDT)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [COMMITTED] tac: Jose and Simon stepping down.
Date: Mon, 22 Jul 2024 20:41:24 -0400
Message-ID: <20240723004130.2138660-1-carlos@redhat.com>
X-Mailer: git-send-email 2.45.2
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

Jose E Marchesi stepping down:
https://lore.kernel.org/cti-tac/871q46zed4.fsf@oracle.com/

Simon Marchi stepping down:
https://lore.kernel.org/cti-tac/725f7f38-7325-4511-a30f-4c54757bec11@efficios.com/

Move Jose E Marchesi, and Simon Marchi from active TAC members
to previous TAC members.

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/tac/index.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/source/tac/index.rst b/source/tac/index.rst
index d19ac58..796fd59 100644
--- a/source/tac/index.rst
+++ b/source/tac/index.rst
@@ -17,17 +17,17 @@ currently made up of the following community member (alphabetical):
 * David Edelsohn
 * Frank Ch. Eigler
 * Jeff Law
-* Jose Marchesi
 * Joseph Myers
 * Nick Clifton
 * Siddhesh Poyarekar
-* Simon Marchi
 
 The current CTI TAC has representatives from GNU Maintainers for gcc,
 binutils, glibc and gdb.
 
 We wish to extend a heartfelt thank you to our previous CTI TAC members:
 
+* Simon Marchi
+* Jose Marchesi
 * Joel Brobecker
 * Martin Liška
 * Chris Faylor
-- 
2.45.2

