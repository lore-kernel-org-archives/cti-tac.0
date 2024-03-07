Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F36D136677
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709840256; cv=pass; b=KhiYNg/LQNucj9Pe0BS4JjPFydzS6/tNY1NuSDPqvthy0Ep/p+RwdHVamG7aYBaTyvkkY15ov22pEvAQ4tT56nFPzBEJm3hxlHFHOfm3uaMA0VKgk3AyC9ASOsqgUhRxnO/5IuPfioxmRHT/rRWIj8wi72/fgsPxsJPSc04OyvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709840256; c=relaxed/simple;
	bh=HkkO6Xt3AcXLV3vC1mNr6pWijUYrFkPU+bYXUF5VPVM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GHTdh0ir65PS9jBpISsuiM9odxpnES5o3vPGAZb96RgVIvEePbsAHWjBfsROxVNjAZx+K0Eal6wSmUPMgwY1tF27oTFlFtU/V3qjpi0AFyqY2p3qonaSILvqSPxtwzyQ8Fs9EiZls0Gopa5ffM2AT4ImWyMEHuHAmy+qhb+IAiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=Kiyma7ZC; arc=pass smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="Kiyma7ZC"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93E7341BCD
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfvJ4wzg27bV for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 19:37:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.218.248; helo=tiger.tulip.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 450AC41B42
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 450AC41B42
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=Kiyma7ZC
Received: from tiger.tulip.relay.mailchannels.net (tiger.tulip.relay.mailchannels.net [23.83.218.248])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 450AC41B42
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:37:30 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C64A0812AC
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:30:29 +0000 (UTC)
Received: from pdx1-sub0-mail-a289.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 66F6C820AC
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:30:29 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1709839829; a=rsa-sha256;
	cv=none;
	b=l2ydyA+Vecb/mF4HWs+Pj4AEWlx+iUz3byQNP8JwQUPz84ASZxmrm8Y4m15i3EDsG4aEkH
	SUgpd4Ke11AinTjY1FWC1nbuw92BPG+3t8SbzgPLHgKo1mZviIudrwoU7wJH1gspjvw3Id
	XtOH6zwT61VgHPRRZFSk9RKaJ/3vfFb6CZoYnlCLV/TbIZHEFQf9EbFzsP0T53nc7pQN4n
	dszu6/gPJSt4O8eiQU5d5uI9x/XnXXR0/GsUrLNobTIJLPYRYofH5TKJZLjTtdL93o/Nh0
	CgakAtBxvNrAwddIJyjp6V8iiLdDGRPT/LN/mbkH+rl8HFEOWDLjjNqw/p+pkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1709839829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=pzxT7gYsvYj4yhIeAkdW+lyGYMAa7b3+b9qs+X0UX0o=;
	b=gcdUil66nVx1Fj5FlfvwB0bk7spQKDxj6n9g84ochqZd/jg1QSuTbvbZHAw/VGlazILBob
	B7zof87/yOYe8CKB+bDq+HAL+ItLrEn+Gi/3CWGUSB/APEleoSpE+pmb28uLTcEdCiahR/
	cGJv+QlyckFM2bUGim5nmhInTQ4JV9OQygk2ur2ic3y6nv7MvGHSSB+oFhMBiyoht924by
	O6Jm96SeKShIxvMzL1uvjt0wQjiCWdOqGpPZwHruErEh0/rus7g1bbgD0ivGgRNGu+hYuL
	xkRHY0LEBoepLSK1ZXrzlMJN834ep3DKqEcql/z31uwdEgOS2mQCA/h4zbrAlA==
ARC-Authentication-Results: i=1;
	rspamd-7f9dd9fb96-jq75p;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Army-Wiry: 0f4dcfd35e6e6767_1709839829686_2576987160
X-MC-Loop-Signature: 1709839829686:3272530884
X-MC-Ingress-Time: 1709839829686
Received: from pdx1-sub0-mail-a289.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.102.40.22 (trex/6.9.2);
	Thu, 07 Mar 2024 19:30:29 +0000
Received: from fedora.redhat.com (bras-base-toroon4834w-grc-23-76-68-24-30.dsl.bell.ca [76.68.24.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a289.dreamhost.com (Postfix) with ESMTPSA id 4TrKC90Fvwz6s
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 11:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1709839829;
	bh=pzxT7gYsvYj4yhIeAkdW+lyGYMAa7b3+b9qs+X0UX0o=;
	h=From:To:Subject:Date:Content-Transfer-Encoding;
	b=Kiyma7ZCndva/5Xb9EVZ5DbS8Sc5q1gmsLhAxlgtB6UzXpIFGyilzJ3auSDjoyTro
	 HU7BQQ+1kCQQENgjmAfMXoKCgUsDNX59jx8r5v8dsWgsWyfPEyNMoCnPnpQL4GPjYe
	 ig4+rCur0b+6qb9uiqjsy7XTfFPiH6vtr1sKzAJ1sr5odA8fgejRHn+EX7KYXJa62N
	 U40MqdXqsz38i2CxavLZkGNvZL+dK6PHcmpEUKI/pWalLOzdjR4KA2LPMCcgWO9e9M
	 kvk8fyWQ+Esi/BHb5sqbYjOR8UNZececfH78txtK4TTto/Vg0PR4y+NU+pslPRdLeA
	 Fl0KA5tOdr+wg==
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
To: cti-tac@lists.linuxfoundation.org
Subject: [PATCH 5/5] faq: Reformat so that it's not a list
Date: Thu,  7 Mar 2024 14:30:19 -0500
Message-ID: <20240307193019.4028812-6-siddhesh@gotplt.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240307193019.4028812-1-siddhesh@gotplt.org>
References: <20240307193019.4028812-1-siddhesh@gotplt.org>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Making it into subheadings and content instead not only makes it cleaner
looking, it also gives us a nifty bar on the right to scroll through
questions.

Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
---
 source/faq/index.rst | 223 ++++++++++++++++++++-----------------------
 1 file changed, 106 insertions(+), 117 deletions(-)

diff --git a/source/faq/index.rst b/source/faq/index.rst
index cb8a458..84ff30f 100644
--- a/source/faq/index.rst
+++ b/source/faq/index.rst
@@ -6,123 +6,112 @@ FAQ
 
 You have questions we have answers!
 
-* Q: Can we keep deploying services as we have? 
-
-  * A: No. The GNU Toolchain is a critical foundation of trust for the GNU/Linux 
-    ecosystem and the demands on its infrastructure, services, and security
-    requirements have grown over time. The trend of increasing complexity to 
-    support its development and associated financial demands will not abate.
-    Different projects have different risk tolerances and the GNU Toolchain
-    must meet more stringent expectations to maintain the trust of the 
-    ecosystem. It is with this context in mind that CTI has been formed.
-
-* Q: What concrete steps will CTI help with?
-
-    * A: Some of the major goals include:
-
-        * Isolating all services in VMs or containers to increase service
-          security and reduce service resource interference. 
-
-        * Allow volunteers to focus efforts outside of core infrastructure
-          maintenance.
- 
-        * Prepare for additional software supply chain requirements from
-
-* Q: Why are you currently using Linux Foundation IT as the service provider?
-
-    * A: The CTI TAC recommendation is to use Linux Foundation IT services
-      for core infrastructure. The LF IT team already supports many of
-      the same services for the Linux kernel and at scale. The migration
-      would involve moving services from Sourceware.org to LF IT servers.
-      We continue to be thankful and appreciative of the time spent by
-      Sourceware.org volunteers in support of the current services.
-
-* Q: What is the urgency vs what is the timeline?
-
-    * A: The GNU Toolchain community should be making consistent forward 
-      progress to improve our infrastructure and cybersecurity position.
-      Showing progress is important for the ecosystem to trust us as a
-      secure and critical part of the software supply chain. We should
-      not wait until there are Cybersecurity regulations that are beyond
-      our ability to comply with as the FOSS ecosystem of tooling and
-      infrastructure. Projects of similar scope and importance have been
-      deploying significant resources for the use of the development community.
-
-* Q: Sourceware volunteers have fielded requests and organized volunteer 
-  efforts that have worked well. Does LF allow volunteers to administer 
-  the servers together with them? Have they in the past?
-
-    * A: The CTI TAC is the point of contact for volunteers.  CTI can fund 
-      multiple activities, by multiple entities, and the way in which the
-      volunteers engage may differ between them.
-
-* Q: How does this project relate to the GNU Project or the Free Software
-  Foundation (FSF)?
-
-    * A: Many of the GNU Toolchain components are a part of the GNU
-      Project, and contribute to the development of the GNU system.
-      The FSF supports the GNU Project, and in turn supports the GNU
-      Toolchain. The GNU Toolchain community works with the FSF via a 
-      working together fund (https://www.fsf.org/working-together/fund)
-      to support the development of the GNU Toolchain directly.
-      The Core Toolchain Infrastructure project is distinct from the
-      GNU Project and the FSF.
-
-* Q: How does this project relate to the GCC Compile Farm Project 
-  (https://gcc.gnu.org/wiki/CompileFarm)?
-
-    * A: The GCC Compiler Farm is a unique resource for the GNU Toolchain
-      and provides interactive systems for developers to manually test on 
-      a wide variety of hardware and software configurations. This is not
-      exactly the same set of requirements that the community might have
-      for securing a supply chain, or using modern CI/CD workflows.
-
-* Q: How will the composition of the Core Toolchain infrastructure project
-  reflect the communities it supports?
-
-    * A: Members of the GNU Toolchain community will always be invited to
-      become members of the technical advisory council for the project.
-
-* Q: What is the composition of the project steering committee?
-
-    * A: The project steering committee will be composed of sponsoring 
-      members of the Linux Foundation and members of the GNU Toolchain
-      community.
-
-* Q: What does the project TAC do?
-
-    * A: The TAC takes input from the GNU Toolchain community and works 
-      with the members to, implement, and resolve prioritized requirements.
-
-* Q: Is the GNU Toolchain development model going to change?
-
-    * A: No. The aim of the project is to provide additional infrastructure
-      for the community that is being made available to support the 
-      GNU Toolchain. All development changes will always be driven by the
-      community.
-
-* Q: Is Sourceware (https://sourceware.org/) going to be deprecated?
-
-    * A: The GNU Toolchain Infrastructure project is distinct from Sourceware.
-      The intent is to move critical infrastructure from Sourceware to the 
-      Core Toolchain Infrastructure project to provide paid services.
-
-* Q: Who can use the new infrastructure?
-
-    * A: That depends on the requirements given by the GNU Toolchain community.
-      The requirements from the community are input to the steering committee,
-      and so the answer depends largely on exactly what was the intended purpose.
-
-* Q: What can the new infrastructure be used for?
-
-    * A: That depends on the requirements given by the GNU Toolchain community.
-      The requirements from the community are input to the steering committee,
-      and so the answer depends largely on exactly what was the intended purpose.
-
-* Q: Are there any presentations covering CTI?
-
-    * Yes, in October 2022 the CTI TAC gave an FSF hosted community Q&A:
-      https://media.libreplanet.org/u/libreplanet/m/the-gti-project-a-conversation-and-community-q-a/
+Can we keep deploying services as we have?
+""""""""""""""""""""""""""""""""""""""""""
+No. The GNU Toolchain is a critical foundation of trust for the
+GNU/Linux ecosystem and the demands on its infrastructure, services, and
+security requirements have grown over time. The trend of increasing complexity
+to support its development and associated financial demands will not abate.
+Different projects have different risk tolerances and the GNU Toolchain must
+meet more stringent expectations to maintain the trust of the ecosystem. It is
+with this context in mind that CTI has been formed.
+
+What concrete steps will CTI help with?
+"""""""""""""""""""""""""""""""""""""""
+Some of the major goals include:
+
+* Isolating all services in VMs or containers to increase service security and
+  reduce service resource interference. 
+
+* Allow volunteers to focus efforts outside of core infrastructure maintenance.
+
+* Prepare for additional software supply chain requirements from
+
+Why are you currently using Linux Foundation IT as the service provider?
+""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
+The CTI TAC recommendation is to use Linux Foundation IT services for
+core infrastructure. The LF IT team already supports many of the same services
+for the Linux kernel and at scale. The migration would involve moving services
+from Sourceware.org to LF IT servers.  We continue to be thankful and
+appreciative of the time spent by Sourceware.org volunteers in support of the
+current services.
+
+What is the urgency vs what is the timeline?
+""""""""""""""""""""""""""""""""""""""""""""
+The GNU Toolchain community should be making consistent forward progress
+to improve our infrastructure and cybersecurity position.  Showing progress is
+important for the ecosystem to trust us as a secure and critical part of the
+software supply chain. We should not wait until there are Cybersecurity
+regulations that are beyond our ability to comply with as the FOSS ecosystem of
+tooling and infrastructure. Projects of similar scope and importance have been
+deploying significant resources for the use of the development community.
+
+Sourceware volunteers have fielded requests and organized volunteer efforts that have worked well. Does LF allow volunteers to administer the servers together with them? Have they in the past?
+""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
+The CTI TAC is the point of contact for volunteers.  CTI can fund multiple
+activities, by multiple entities, and the way in which the volunteers engage
+may differ between them.
+
+How does this project relate to the GNU Project or the Free Software Foundation (FSF)?
+""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
+Many of the GNU Toolchain components are a part of the GNU Project, and
+contribute to the development of the GNU system.  The FSF supports the GNU
+Project, and in turn supports the GNU Toolchain. The GNU Toolchain community
+works with the FSF via a `working together fund
+<https://www.fsf.org/working-together/fund>`_ to support the development of the
+GNU Toolchain directly.  The Core Toolchain Infrastructure project is distinct
+from the GNU Project and the FSF.
+
+How does this project relate to the `GCC Compile Farm Project <https://gcc.gnu.org/wiki/CompileFarm>`_?
+"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
+The GCC Compiler Farm is a unique resource for the GNU Toolchain and
+provides interactive systems for developers to manually test on a wide variety
+of hardware and software configurations. This is not exactly the same set of
+requirements that the community might have for securing a supply chain, or
+using modern CI/CD workflows.
+
+How will the composition of the Core Toolchain infrastructure project reflect the communities it supports?
+""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
+Members of the GNU Toolchain community will always be invited to become members
+of the technical advisory council for the project.
+
+What is the composition of the project steering committee?
+""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
+The project steering committee will be composed of sponsoring members of
+the Linux Foundation and members of the GNU Toolchain community.
+
+What does the project TAC do?
+"""""""""""""""""""""""""""""
+The TAC takes input from the GNU Toolchain community and works with the
+members to, implement, and resolve prioritized requirements.
+
+Is the GNU Toolchain development model going to change?
+"""""""""""""""""""""""""""""""""""""""""""""""""""""""
+No. The aim of the project is to provide additional infrastructure for
+the community that is being made available to support the GNU Toolchain. All
+development changes will always be driven by the community.
+
+Is `Sourceware <https://sourceware.org/>`_ going to be deprecated?
+""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
+The GNU Toolchain Infrastructure project is distinct from Sourceware.
+The intent is to move critical infrastructure from Sourceware to the Core
+Toolchain Infrastructure project to provide paid services.
+
+Who can use the new infrastructure?
+"""""""""""""""""""""""""""""""""""
+That depends on the requirements given by the GNU Toolchain community.
+The requirements from the community are input to the steering committee, and so
+the answer depends largely on exactly what was the intended purpose.
+
+What can the new infrastructure be used for?
+""""""""""""""""""""""""""""""""""""""""""""
+That depends on the requirements given by the GNU Toolchain community.
+The requirements from the community are input to the steering committee, and so
+the answer depends largely on exactly what was the intended purpose.
+
+Are there any presentations covering CTI?
+"""""""""""""""""""""""""""""""""""""""""
+Yes, in October 2022 the CTI TAC gave an `FSF hosted community Q&A <https://media.libreplanet.org/u/libreplanet/m/the-gti-project-a-conversation-and-community-q-a/>`_.
 
 -----------------
 
-- 
2.43.0

