Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44EC1BF2B
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 May 2024 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716990687; cv=none; b=lOv6ZHVozEbVtaPJJw4GmiFfM0ETWlwcNvTw4MFjeW7r8Ayn6unvpWN+B5z7sDSBg6FB74vOQ0WjfAMHYrHTd2iDQuuVHLRvE6XgFqO3SNnTRQhNJtCoVOEUi2pM1SDaz9SFz47YQE/FTOSPMn6FEfCHbspbjgvxSzAtLj2TJRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716990687; c=relaxed/simple;
	bh=7SNitj48l3dxuK11j+NG/16tpJAGQdOtLe9KBGS2dpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=dtejAKj/5ryIOwifNmWiCgVbiHFlodq1NmdftsC9j40Wc2KLFHRTuxF3TpHPkaD6chC8jK20AoVd6/+B2JGRsi1b0GFoRGSlpTIS7ILKFP39cJRe41DWcDJlTmu+4uswKC0WylBRua/5Yw06JB5TPyN/58uJMTszKMSm33378Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SZFQ0uEG; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SZFQ0uEG"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5068181400
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 May 2024 13:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62Kcn-Zj3PpK for <cti-tac@lists.linuxfoundation.org>;
 Wed, 29 May 2024 13:51:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19E75813D8
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19E75813D8
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SZFQ0uEG
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 19E75813D8
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 May 2024 13:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716990682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LfRCojBQwPsfhJPIQsUYqMNg2g+BTxJ33Ida+GnS6Hg=;
	b=SZFQ0uEGmeS71XPISAiWUK1MR6i3vB0a74mqnxAp7lRGE4MRBiSjQReG4XYhguK+I7Ilc+
	+dlSCAnVxbs25QbS1o6pGJYMf9Ge701UULRTzpB2g3AfAqHKQ9kLbmDIi4hhWiKNsK9obA
	UoNmZNeRmyj0yufiGFuowdVK/nmJXIY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-qGVlPE83N2OLbK8Hln9oCg-1; Wed, 29 May 2024 09:51:21 -0400
X-MC-Unique: qGVlPE83N2OLbK8Hln9oCg-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ada58d2d50so6058866d6.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 29 May 2024 06:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716990680; x=1717595480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfRCojBQwPsfhJPIQsUYqMNg2g+BTxJ33Ida+GnS6Hg=;
        b=QPmzNxG5fjjXIoimRIB8iG1oI9fQRlAh7QdBSGxIIGhqK7NHFuuc6Bb6F0ja2AhA12
         +E23DhesQ4TKZoRo65Ekc+r4xWFUK9mh+amQo9IAhKNwsK0uaOpWlQidPIZ9wchRWjJX
         sw37/pUQKO/uk5dMgEYn+ORlZJThVpMk/1fS0TtdWsTjgw/I21Ji2Lj8r1MzVr+pInHQ
         rTr6grnWAmem18jcloUtGgMlTIxNrLiviB1MUjU3vlpNhw/j4l09sYUOF1It3L6lDN1f
         x/ByXO52ruhfqT7K2nbz9Wm9jx5Fs2Etq5ArOrvbADsL2h8HSSCgI12cq/B6Ukb6pGDo
         tvvA==
X-Gm-Message-State: AOJu0YyIkHZKA1H46aiTvXJZjIA68fSZwS9rb1X7FAB8srdOiIXO6Hmi
	/5+luMDKiiqgGRecTvImoaa3D+rUsm5xKQBgkQFELHGFK2QsXq47xMe8u22GEyLtnz+2j8z8O8i
	KWoPcdbZF5wHpfDa9lm6gNd0uR2DZtGxU6lU/Lh7yzb5Uj7R6skjzgpGgo5vzm1F5rVo+0MnFmD
	FWMk4B3qRxlJHs808cmJuXaoIzimfNFaAsUGRMqxqLjjUUzNHkWg==
X-Received: by 2002:a05:6214:5d93:b0:6ab:756c:83e0 with SMTP id 6a1803df08f44-6abc7b936b9mr174388616d6.13.1716990680405;
        Wed, 29 May 2024 06:51:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmBT+VIkpu0ZG7ps+/UOPp82GC3+AnLzYhyF8+uy/B4731JWZXtq6VwLIzoL378IrHXHypMw==
X-Received: by 2002:a05:6214:5d93:b0:6ab:756c:83e0 with SMTP id 6a1803df08f44-6abc7b936b9mr174388246d6.13.1716990679598;
        Wed, 29 May 2024 06:51:19 -0700 (PDT)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ac162f2907sm54496506d6.99.2024.05.29.06.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 06:51:19 -0700 (PDT)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [PATCH] source/faq/index: Update FAQ.
Date: Wed, 29 May 2024 09:48:40 -0400
Message-ID: <20240529135110.3917584-1-carlos@redhat.com>
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

Update the FAQ with additional entries as requested by CTI TAC
review.

Add information about relevant national standards and why we want
to advance the state of our current infrastructure.

Add information about service bringup and how to achieve that.

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/faq/index.rst | 60 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/source/faq/index.rst b/source/faq/index.rst
index 66458c1..81bdc3c 100644
--- a/source/faq/index.rst
+++ b/source/faq/index.rst
@@ -8,7 +8,7 @@ You have questions we have answers!
 
 Can we keep deploying services as we have?
 """"""""""""""""""""""""""""""""""""""""""
-No. The GNU Toolchain is a critical foundation of trust for the
+The GNU Toolchain is a critical foundation of trust for the
 GNU/Linux ecosystem and the demands on its infrastructure, services, and
 security requirements have grown over time. The trend of increasing complexity
 to support its development and associated financial demands will not abate.
@@ -16,6 +16,38 @@ Different projects have different risk tolerances and the GNU Toolchain must
 meet more stringent expectations to maintain the trust of the ecosystem. It is
 with this context in mind that CTI has been formed.
 
+The global focus on security is clear and present and in direct relation to
+the effective functioning of economies and societies. The GNU Toolchain plays
+a hugely important role in companies and communities of all sizes, providing
+tooling for compilation, assembly, linkage, running and debugging of
+critical software.
+
+In order to continue to support these communities we must start to adhere to
+the modern cybersecurity principles including moving towards zero-trust
+architectures with strong application sandboxing for all provided services
+e.g. NIST SP.800-207, separate and protect each environment involved
+in software development e.g. NIST SP.800-218A PO.5.1, and use multi-factor,
+risk-based authentication and conditional access for each environment.
+
+Governments around the world have increased their focus on Cybersecurity and
+resilience in the face of cybersecurity attacks. In the European Union with
+the creation of the Network and Information Security Directive (NIS 2016/1148,
+NIS2 2022/2555), the Cybersecurity Act (2019/881), and now the Cyber Resilience
+Act (2022/0272). In the United States with the publishing of the Executive
+Order 14028 "Improving the Nation's Cybersecurity", with NIST's
+Secure Software Development Framework (SSDF SP 800-218A), Cybersecurity
+Framework 2.0 (CSF 2.0), and Software Supply Chain Security Guidance.
+
+Several of the components of the GNU Toolchain meet the definition of NIST's
+"critical software" since they underpin ICAM (Identity, Credentials and
+access management), network control (DNS stub resolver), and key operating
+system components. We want to expand and continue to support FOSS in all
+of these use cases we should strive to meet the increasing cybersecurity
+best practices.
+
+The purpose of CTI is to help meet these requirements now and into the future
+to ensure FOSS and the GNU Toolchain can be used by these users and communities.
+
 What concrete steps will CTI help with?
 """""""""""""""""""""""""""""""""""""""
 Some of the major goals include:
@@ -109,6 +141,32 @@ That depends on the requirements given by the GNU Toolchain community.
 The requirements from the community are input to the steering committee, and so
 the answer depends largely on exactly what was the intended purpose.
 
+How are services validated prior to migration?
+""""""""""""""""""""""""""""""""""""""""""""""
+Services are validated on a per-service basis, with per-service functionality
+being tested. Given the focus on strong service isolation and resilience the
+inter-service integration pieces can and should be added in stages e.g.
+email to bugzilla, git send-email to mailing lists, as services that can
+communicate are brought online.
+
+The intent is not to stand up a monolithic integrated set of services, but to
+start small and create well-isolated services that can operate independently
+with loose coupling.
+
+Are all services migrated at the same time?
+"""""""""""""""""""""""""""""""""""""""""""
+There are no plans to construct a prototype of the entire constellation of
+enumerated services for a project that is to be migrated to CTI services.
+
+Instead the approach taken is to stand up well-isolated services that can
+operate independently of each other and with high resilience, and then add
+the inter-service integration functionality.
+
+Since many of the services being provided are known to already be deployed
+in production for other projects there is a lot of existing experience
+to support deployment. What needs to be done is to ensure stronger isolation
+between services as part of improving the project's cybersecurity position.
+
 Are there any presentations covering CTI?
 """""""""""""""""""""""""""""""""""""""""
 Yes, in October 2022 the CTI TAC gave an `FSF hosted community Q&A <https://media.libreplanet.org/u/libreplanet/m/the-gti-project-a-conversation-and-community-q-a/>`_.
-- 
2.45.0

