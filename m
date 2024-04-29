Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF30F8172A
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 15:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714404233; cv=none; b=uf/usPcZx1AgMqUNgQiA9YC5uir4RaQO2PxR9H+ezMKsXefZHAWlpznfGrx747AcuooYiTL2/P828V7idEbGAk1PQubW2hTBKXGUOQZPFbFMJjhTF8t8qup7vodkeaTw9/jUGRzqQtS2cafJ19pwbWRlx1opHy8h1CzCnVo+IvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714404233; c=relaxed/simple;
	bh=/NZrpPvB2EEpF1nvoFPSSmUr1nvqVQ3zBiM5/5004y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YaXzCU0mZ2FZ9gOkC5qzH1jSe2IDwBx9XyJhgbyWPgjTiHJMdiL3oVSu/qeJRk+Brzer4Y4lOQNLsCcDJflpSBZioWtE/szfg3/LizSXXChZsNY4UBvPSgQo4HY5TppQwLpTPURshLFVhApidjXES9WCLKQR4n/B5wPxllTWDkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CqeJkQCl; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CqeJkQCl"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50D5740370
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 15:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eAXVgeFnvjqL for <cti-tac@lists.linuxfoundation.org>;
 Mon, 29 Apr 2024 15:23:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D58DD4015A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D58DD4015A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=CqeJkQCl
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D58DD4015A
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 15:23:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 067B960DCF;
	Mon, 29 Apr 2024 15:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E86C113CD;
	Mon, 29 Apr 2024 15:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714404228;
	bh=/NZrpPvB2EEpF1nvoFPSSmUr1nvqVQ3zBiM5/5004y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CqeJkQCl/yho4BupseXZCoi7yEAiVreLnZG+sl9cM/FzjkUY/T9qVuIXdJtXdJTBK
	 cTVgx7viWydscsz+WpMKsqo4jWBLdw/s4sSFtv4jWlM7HhtHXNwwJtPY2wGwAjZpsM
	 SxzP3RuQaP7nOApaRzgF7Otq1zqZzSfB5Yt6r1C4=
Date: Mon, 29 Apr 2024 11:23:47 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Hashing out the scope of work
Message-ID: <20240429-proficient-pastoral-whippet-bcc376@lemur>
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
 <2293a3bb-5780-ec5a-ca72-e19671dccb51@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2293a3bb-5780-ec5a-ca72-e19671dccb51@redhat.com>

On Mon, Apr 29, 2024 at 02:09:33PM GMT, Joseph Myers wrote:
> On Wed, 24 Apr 2024, Konstantin Ryabitsev wrote:
> 
> > 2. Bug tracking software (Bugzilla)
> > 
> >   a. LF will set up a bug tracking system using [Bugzilla Harmony][2]. This
> >      will be a new, dedicated installation in the bugzilla.coretoolchain.dev
> >      domain.
> >   b. LF will work with the CTI leadership to properly configure the software
> >      for use with the glibc project.
> 
> There will be lots of review needed of the existing Bugzilla configuration 
> and local changes.  Some of those changes may simply be to have more 
> appropriate contents on the bug submission form / other HTML templates, 
> some may involve actual logic changes.  Hopefully the new upstream version 
> is suitably configurable without needing too many local changes.

Definitely, and I would even go further and say that any changes that 
require actual code modifications beyond writing extensions would 
require multiple levels of review before we accept them. In our 
experience, a modified version of bugzilla is a version of bugzilla that 
will never get updated because nobody wants to touch it out of fear of 
breaking something -- so it just ends up unmaintained.

> We need some form of (fully free software) spam protection, whether the 
> existing scheme where new accounts need to be manually requested and 
> approved, or any other sufficiently reliable spam protection scheme 
> available upstream.

There isn't any. \o/
We run bugzilla-junker that goes through all recent comments and lets 
the admin review all URLs for spam content. It's pretty effective at 
keeping our bugzilla instance spam-free.
https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/bugzilla-junker.py
 
> There may be an unresolved question about migrating existing glibc 
> bugs (all of them, or at least the open ones) from the Sourceware 
> Bugzilla (keeping their numbers); I think such migration is valuable, 
> including for closed bugs (then adding a comment to all the old bugs 
> that they are frozen and future discussion should take place at the 
> new location), but I think there have been suggestions that such 
> migration is hard.  (Bugs for other products in Sourceware Bugzilla 
> would not of course be included in such a migration, since the new 
> database would be glibc-only.)

This would be super hard and may introduce unwanted side-effects. To my 
knowledge, it's impossible to lock a bug -- so you may have a 
split-brain situation where a bug is still updated in the old location, 
but not in the new location.

> > 6. Patch tracking services (Patchwork)
> > 
> >   a. LF will deploy the latest version of Patchwork patch tracking software
> >      under patchwork.coretoolchain.dev.
> >   b. LF will set up automation and integration services between mailing lists,
> >      patchwork, and git repositories (using [git-patchwork-bot][8]).
> >   c. LF will work with the glibc community to set up projects and access as
> >      appropriate.
> 
> The existing glibc Patchwork database should be transitioned across.

Can you give more information why this is desired? This is uncharted 
territory and I'm not sure how much effort this would require.

-K
