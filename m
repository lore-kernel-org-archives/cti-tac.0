Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A587180A9F
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 May 2024 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716985772; cv=none; b=byT0/RnvoFp56VH26N++weZjsTNdqnAh68BFORnLQXFRSa0RazA6gs7ZFx3N211BNZHYVjMCzPqu8cr9oJEM0fdF+ltOPl3UzLmuw++oWyGJ2KgroHp77LUq1yrBoVEMErNV8eYfRkGVmpmnVX/aLjo3guLOWCSfFBL/9YHR9Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716985772; c=relaxed/simple;
	bh=gPChJWspS2nxYFD3KnGF4+crDDHliRY81IcpX5J1DKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=VvVqGz+FdncIx7oYtx8o9GCJwU2fgRUVKrtRkXVBNN36c2cSxajrwKkt4zT7b5uoD5u27EqaALyTi/IqkHSerx2qjLeJ5CFC6ajxGVdGcwc9Ld8j7VeR4lAoZ3nDoVyiyM5YBfJCzXNoWFgD6QMF9hykRsXehTaU5fmzTKalybQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GH7/15J4; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GH7/15J4"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDD1840806
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 May 2024 12:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4uYMSZHRm-7g for <cti-tac@lists.linuxfoundation.org>;
 Wed, 29 May 2024 12:29:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5CBF940905
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CBF940905
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GH7/15J4
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5CBF940905
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 May 2024 12:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716985767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r45auKqnq8iv/mob6H5i1HuVYic1esu0sUwwDlS6wiM=;
	b=GH7/15J4OjVetP9ywTnTnFGr/89JKC9RWFuX/4Q6VzKMcPNFdKDWv5+5HTnT3NCpkn2qPo
	32o5YuvWYHrYeFjBXWF1o0hEcMj2FlEqN2ghlEIR+3IQNF6cRXi4sEdAqfRk3o+9wm4kkn
	JdYhRQkSW9/LyZSWG/PvTjNWg1OnjnA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-p1txZx3SPvKkxBp1BOUL3Q-1; Wed, 29 May 2024 08:29:26 -0400
X-MC-Unique: p1txZx3SPvKkxBp1BOUL3Q-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-794e752ff0dso126785a.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 29 May 2024 05:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716985765; x=1717590565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r45auKqnq8iv/mob6H5i1HuVYic1esu0sUwwDlS6wiM=;
        b=a3ZEBbJCgfL6gzOxI19g5N6zwaqyh4W/KmctFbQjdk6ZwTO0b8Jkcj5eGMtZN1Nd0Z
         hr8nSj+X5tzX1P19BQl5inVdsfNJKxXu7g49R2dIdUrcsRJucUd+Np1u8xBXV7fIng5s
         SyO5dG/Zeh4fbSbhCeze9/dpk9gyf0LdIscEiJtz14H/9FNTOLg9nrt2DaqkCjbJpFNW
         tb4ijieDrhUlHpX9iCNZLKppAeCaPpS5575EegXDW0d8RUZlh59pY02Pl4LahWw80moA
         3LElVehFTxxo0lS9AodVI8mCXZaRsJfPVx+ZnYBppeW67NKYxyb7CvvEDOJq3Rrn7EoD
         G8wA==
X-Gm-Message-State: AOJu0YxC9vDIVGCY0GmwKYKayVoqkOZNEpUAyth8pPzjiuEM0ubSGk9s
	b6ZN4vsUkl3Ac6e+8DBgCY7O8nbn0BWpdodizh2yTDx2UNCWsx239frTleRGcOy2mCkhRksiwjT
	a0HCJ4ImoyfYeH+ZRyQrTHAvYrIy+gvHPxu9RpueU+Lkg1qEDQatcGpnZxU3qIj6BnRW0k6a1/m
	ad4rJ24KrhQFvFK/s7CeHLmrW10tJDGdVX5mLb07h6i3y9a/6ybg==
X-Received: by 2002:a05:620a:4116:b0:794:e4b6:65d3 with SMTP id af79cd13be357-794e4b66af8mr134107385a.55.1716985765214;
        Wed, 29 May 2024 05:29:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESwD2CXHu0ra31sCLvSJ9vQZhfD1Z+JVwrUCxyd5sbPCPJ/OQGwbRYvFUj8m0SUR14MPRA8g==
X-Received: by 2002:a05:620a:4116:b0:794:e4b6:65d3 with SMTP id af79cd13be357-794e4b66af8mr134103585a.55.1716985764559;
        Wed, 29 May 2024 05:29:24 -0700 (PDT)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abd064b8sm462246285a.74.2024.05.29.05.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 05:29:24 -0700 (PDT)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [COMMITTED] services/index projects/enum: Update spelling.
Date: Wed, 29 May 2024 08:29:00 -0400
Message-ID: <20240529122921.3902195-1-carlos@redhat.com>
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

Update the services and enumeration spelling words to allow
`make spelling` to pass cleanly.
---
 source/name_wordlist.txt     |  1 +
 source/projects/enum.rst     | 41 +++++++++++++++++++++++++++++++++++-
 source/services/index.rst    |  2 +-
 source/spelling_wordlist.txt | 13 +++++++-----
 4 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/source/name_wordlist.txt b/source/name_wordlist.txt
index 25eecdb..593473e 100644
--- a/source/name_wordlist.txt
+++ b/source/name_wordlist.txt
@@ -34,3 +34,4 @@ Poyarekar
 Schwab
 Siddhesh
 Simon
+Tromey
diff --git a/source/projects/enum.rst b/source/projects/enum.rst
index 34f11aa..b036660 100644
--- a/source/projects/enum.rst
+++ b/source/projects/enum.rst
@@ -439,7 +439,7 @@ GNU Binary Utilities
      mailing list (each repository configures the destination, and for
      binutils-gdb, this this a "dynamic" configuration via the email_to.py
      script mentioned above allowing the destination to vary depending
-     on which files got modified, whether they are binutils fils or GDB
+     on which files got modified, whether they are binutils files or GDB
      file, or both).
 
 * Web-based navigation of the Git repository
@@ -1024,3 +1024,42 @@ Originally posted to the CTI TAC mailing list here: https://lore.kernel.org/gti-
 * :ref:`genindex`
 
 * :ref:`search`
+
+.. spelling::
+   htdocs
+   Pre
+   computable
+   irker
+   irkerhook
+   gdbadmin
+   gccadmin
+   addusers
+   gnutools
+   fortran
+   libstdc
+   wwwdocs
+   pre
+   py
+   usr
+   libstdcxx
+   classpath
+   symlink
+   symlinks
+   redirections
+   descr
+   formatter
+   writeBitmaps
+   devel
+   AdFfi
+   denyNonFastforwards
+   passwd
+   contrib
+   www
+   sc
+   Texinfo
+   preprocessing
+   oftc
+   maintainership
+   pw
+   prs
+   ssh'ed
diff --git a/source/services/index.rst b/source/services/index.rst
index d5c565e..978e07a 100644
--- a/source/services/index.rst
+++ b/source/services/index.rst
@@ -30,7 +30,7 @@ The following services are currently being provided by CTI via the Linux Foundat
 
     * `Top level website <https://subspace.kernel.org/>`_ uses
       `Sphinx <https://www.sphinx-doc.org/en/master/>`_ which is FOSS
-      and BSD licesned.
+      and BSD licensed.
 
     * `Mail delivery <https://subspace.kernel.org/software.html>`_ uses
       `Postfix <https://www.postfix.org/>`_ which is
diff --git a/source/spelling_wordlist.txt b/source/spelling_wordlist.txt
index e5662b8..1975aab 100644
--- a/source/spelling_wordlist.txt
+++ b/source/spelling_wordlist.txt
@@ -1,4 +1,5 @@
 Cron
+Cyber
 Cybersecurity
 Django
 Pipermail
@@ -32,26 +33,28 @@ gnupload
 gpg
 html
 https
-irkerhook
+irc
+jit
 libc
 mlmmj
+namespaces
 ncftpput
 networkless
+perl
 postfix
 pre
-prs
-pw
-py
+preprocess
 rabbitmq
 rebasing
 repo
 rst
+rsync
 runtimes
+sandboxing
 simark
 sourceware
 spamassassin
 spammy
-ssh'ed
 svn
 testresults
 toolchain
-- 
2.45.0

