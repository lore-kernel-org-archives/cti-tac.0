Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2208D393
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Apr 2024 16:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713977120; cv=none; b=lepwgi+q8G1+tWobdsyAVtC6gWHVqkUKwF93iuO8GXZliNkEfo9sv+WXRuo9zD8rnrI2lL5vDYBuEsOhss8P3P90VWQk/0nT2f2fcs2hidxtm0DR2mt2WzLGUSfRzOmRcjaZPFZn7EybG6EUNVfPeANMAzYL/xkoSQwR8H0A6bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713977120; c=relaxed/simple;
	bh=qU8+kuUqjFz34umShJXYdZ86VC5UiySL1GYM+Fs4Pg0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EOmY9zp/gJ1oFaqfXXu+Hk20yvGcY3ur5xzP9DpNYyJWG15x+3arBQha494V4OX1QCAD1uAetAi34ExaFwa0S/XDuMFMDv//gKgOv3XCwTjs1XCaJzNZizsrIOLpaM5a4dL9rImm5DOjcMORJeimea9sszWxZWF7ZxFnrix0LGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gAfMI2Kj; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gAfMI2Kj"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5BCA60730
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Apr 2024 16:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4JYGiLOqGSC for <cti-tac@lists.linuxfoundation.org>;
 Wed, 24 Apr 2024 16:45:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8ABBA60A6A
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ABBA60A6A
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gAfMI2Kj
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8ABBA60A6A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Apr 2024 16:45:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92B736182C;
	Wed, 24 Apr 2024 16:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139EFC2BD10;
	Wed, 24 Apr 2024 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713977116;
	bh=qU8+kuUqjFz34umShJXYdZ86VC5UiySL1GYM+Fs4Pg0=;
	h=Date:From:To:Subject:From;
	b=gAfMI2Kjwf+xEhh4DHHbrmnXkP6A868iIUzxXn66tlwI0UUiYLZm13qz4V0gwN2wz
	 D3dJQR5aTszLhaVDvPdue9ZjP8ResOxb98NezCL3jFaC+7S6eqGAsnewaOGrV6kDwD
	 AjOpw/7LxJ2IbT4ZnVVGDAPY4TZKoRPPZRaO7ZSU=
Date: Wed, 24 Apr 2024 12:45:14 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: cti-tac@lists.linuxfoundation.org
Subject: Hashing out the scope of work
Message-ID: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This is the Scope of Work section of the larger Statement of Work document.
Please send any comments, adjustments, additions, or clarifications you would
like to see.

This SOW focuses on the migration primarily, and the tentative time frame is
through mid-2025.

Regards,
Konstantin

---
When choosing solutions and deploying services, the guiding principle is to
remain compliant with the [GNU Ethical Repository Criteria][1], Grade B. This
mandates exclusive use of Free Software and promotes open platforms over
proprietary hosting environments.

1. Mailing lists for decentralized patch-based development

  a. LF will set up mailing list hosting under the lists.coretoolcain.dev
     domain, using the following technology stack:

    - postfix
    - mlmmj
    - public-inbox

  b. For scalability and IP reputation reasons, LF will reuse its current
     mailing list platform already deployed for Linux kernel development
     (subspace.kernel.org).
  c. Individual glibc mailing lists will be created on request and do not
     require to be enumerated in this SOW.
  d. Mailing list archives will be available either via lore.kernel.org, or a
     dedicated coretoolchain.dev domain name, depending on project preferences.

2. Bug tracking software (Bugzilla)

  a. LF will set up a bug tracking system using [Bugzilla Harmony][2]. This
     will be a new, dedicated installation in the bugzilla.coretoolchain.dev
     domain.
  b. LF will work with the CTI leadership to properly configure the software
     for use with the glibc project.
  c. LF will work with the glibc community to offer the tooling to integrate
     git repositories, mailing lists, and the bugtracker (e.g. using the
     [bugspray][3] project).

3. Git repository hosting (Gitolite)

  a. LF will set up the necessary glibc repositories reusing the existing
     gitolite.coretoolchain.dev service.
  b. LF will work with the CTI leadership to migrate existing repositories and
     grant the necessary permissions.
  c. LF will work with the glibc project community to analyze, port, and adapt
     the existing set of [AdaCore][4] post-commit hooks to ensure that they
     are functioning after the migration, or are replaced with suitable
     alternatives if existing implementations cannot be used directly due to
     security considerations or duplicating functionality provided in
     Gitolite.
  d. LF will set up mirroring and replication using [grokmirror][5] to offer
     multiple redundant sites for git repository access.

4. Documentation repository and website (Sphinx)

  a. LF will work with the glibc community to help migrate the wiki site from
     [MoinMoin Wiki][6] to a set of restructured-text documents (e.g. using
     [pandoc][7]).
  b. LF will provide a publishing framework to automatically build and deploy
     documentation to the dedicated docs website (exact domain name to be
     established).

5. Static website (Sphinx)

  a. LF will provide hosting for a separate static website for glibc (exact
     domain name to be established).
  b. LF will provide a mechanism to publish release tarballs and offer
     downloads via the mirrors.kernel.org system of worldwide mirrors (already
     provided via mirrors.kernel.org/gnu/glibc/).

6. Patch tracking services (Patchwork)

  a. LF will deploy the latest version of Patchwork patch tracking software
     under patchwork.coretoolchain.dev.
  b. LF will set up automation and integration services between mailing lists,
     patchwork, and git repositories (using [git-patchwork-bot][8]).
  c. LF will work with the glibc community to set up projects and access as
     appropriate.

7. Video conferencing (BigBlueButton)

  a. LF will provide video conferencing to the project using [BigBlueButton][9]
     (BBB), either with a 3rd-party provider or as a fully self-hosted service.
  b. LF will work with the glibc project to set up conference rooms and access
     as required.

[1]: https://www.gnu.org/software/repo-criteria.en.html
[2]: https://github.com/bugzilla/harmony
[3]: https://git.kernel.org/pub/scm/utils/bugspray/bugspray.git
[4]: https://github.com/AdaCore/git-hooks
[5]: https://git.kernel.org/pub/scm/utils/grokmirror/grokmirror.git
[6]: https://sourceware.org/glibc/wiki/HomePage
[7]: https://pandoc.org/
[8]: https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/git-patchwork-bot.py
