Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1106F1DA23
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 16:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714408568; cv=none; b=WAe/yK1pEY56TmPAn28IQ/J+J44Ay5hI0JooG7Btg/Gqct1fcOsOE0BUyhQcrU4/6M0aGNx3+EpP0O0sbILuyghl6DVrHwo+JusZDsmEZfnWM+hYq9UFaXJf+Ysal65XHKDux7J4YMUGObnaQlU+6je4n3F1c8DhfufHhwrEpXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714408568; c=relaxed/simple;
	bh=SVNb1WEZskHFU/wZdRWTpWSqodGh7Me4TMhbO4knC4s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Hk8HA+Xnq1q0en9+uirh0/C30A+7GZiYWBLVOlQLE8GqXGYBaNGUTSyFuBWeKxgQy5/UaiVgbNsP+zGGgKEWwt24nmkfGIF/a43pbADYqVKiS9fB5YSwL4rTbBUPCri+nhaxr54cdbeFDZOlje50zC3abIqhLvEjQ+TG5K92KuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c9uHILBO; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c9uHILBO"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D3E360830
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 16:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLzwSNDcjLq2 for <cti-tac@lists.linuxfoundation.org>;
 Mon, 29 Apr 2024 16:36:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=josmyers@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 166206063C
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 166206063C
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c9uHILBO
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 166206063C
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 16:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714408563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ONd4Auw8I1lBp09X04gSMRNpBDKkbGpkdEEAZRC2K4w=;
	b=c9uHILBOC33ZVbTTlkHojE/PERBWeNp+5snu1pPJ8ESROpFuekoe8Huho5r0KwyIByxqup
	5+1iJmZac/EWJVi8bUdyv8c/FZgdAgnY+LWA/QGCqIaIuTfjIJPnwpCeAwN1KAGv+WOaEo
	7m++Uh1FtYgQKjSSKi5S4L3yTEgCPrU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-toLJfdPaMUa5xH2rO1Q4-Q-1; Mon, 29 Apr 2024 12:36:02 -0400
X-MC-Unique: toLJfdPaMUa5xH2rO1Q4-Q-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2dd05014390so42355741fa.3
        for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 09:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714408560; x=1715013360;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONd4Auw8I1lBp09X04gSMRNpBDKkbGpkdEEAZRC2K4w=;
        b=eA6sxhgC69P/5cOplZR0BxCEu1cvwk37dfPlcIwjqSj0zLyPJjRynuY6NHW7Ezjujm
         h8H7Bm1Hhf8aSIYxpTIz/CnOA0e7lzKKfVltqDAf0lAwzCWbtOTG4inXMs3jvYLZTxaR
         8tw+T/BD2LxdPd+8ES6LIPjzE5IQRWaOw1dxiwsLbugrt0TKvaK/TpGlQRlG/jbNJnGM
         todfgi8bc+V/BF7vwxLIMX6ldPX1mUf/9puSvsn0Q7Ov4ETOjqDx5BA40qBPI61gYb6l
         zKmqjyQE+QiCpwjRn0lScbXRgFI8XAbXHJtb/2LqLSdcAkNegsicYcs298JEe8H3XWeL
         DoPg==
X-Gm-Message-State: AOJu0Yw2uBjhdQliUNf80y9LaLyI0b7Pexp/R6ePWSIdMHZFsSRcPRqz
	7O3u0wYZ0Ecy+9CJZ5bMjjnjFq7w2rA9CGRi1edZHTow+CGuWSmcErfm3izlCFGakaXS2KuM92S
	DWVbOhVPyXpDyJRaG1NTMB/kW/Sz83WD2FuU8+mZlGmjtm2hM/WAnrmrUE6dZszfDfS2J
X-Received: by 2002:a05:651c:510:b0:2e0:22e4:a589 with SMTP id o16-20020a05651c051000b002e022e4a589mr3714003ljp.14.1714408560675;
        Mon, 29 Apr 2024 09:36:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2PYGTJqzKqa+jvgKLDtm/mJkTpN3XNoH3OKI1tS+InZIsQ2ktYR3y3rl5s/hCo7+dV0nwiA==
X-Received: by 2002:a05:651c:510:b0:2e0:22e4:a589 with SMTP id o16-20020a05651c051000b002e022e4a589mr3713988ljp.14.1714408560257;
        Mon, 29 Apr 2024 09:36:00 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id c9-20020a05600c0a4900b0041b43d2d745sm17319316wmq.7.2024.04.29.09.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 09:35:59 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.95)
	(envelope-from <josmyers@redhat.com>)
	id 1s1TyO-003Jiw-Rw;
	Mon, 29 Apr 2024 16:35:24 +0000
Date: Mon, 29 Apr 2024 16:35:24 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Hashing out the scope of work
In-Reply-To: <20240429-proficient-pastoral-whippet-bcc376@lemur>
Message-ID: <6d25ccc7-ef3e-a885-b085-51185c23c91@redhat.com>
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat> <2293a3bb-5780-ec5a-ca72-e19671dccb51@redhat.com> <20240429-proficient-pastoral-whippet-bcc376@lemur>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Apr 2024, Konstantin Ryabitsev wrote:

> > We need some form of (fully free software) spam protection, whether the 
> > existing scheme where new accounts need to be manually requested and 
> > approved, or any other sufficiently reliable spam protection scheme 
> > available upstream.
> 
> There isn't any. \o/
> We run bugzilla-junker that goes through all recent comments and lets 
> the admin review all URLs for spam content. It's pretty effective at 
> keeping our bugzilla instance spam-free.
> https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/bugzilla-junker.py

Before we restricted account creation, at one point GCC Bugzilla had 
spammers opening new bugs faster than the REST API could mark them as 
spam.  While I think Sourceware passes comments through SpamAssassin, my 
expectation is that we need manually reviewed account creation (i.e. 
people sending emails to create accounts, with enough information to 
convince people they're not a spammer) to avoid very high spam volumes.

> > There may be an unresolved question about migrating existing glibc 
> > bugs (all of them, or at least the open ones) from the Sourceware 
> > Bugzilla (keeping their numbers); I think such migration is valuable, 
> > including for closed bugs (then adding a comment to all the old bugs 
> > that they are frozen and future discussion should take place at the 
> > new location), but I think there have been suggestions that such 
> > migration is hard.  (Bugs for other products in Sourceware Bugzilla 
> > would not of course be included in such a migration, since the new 
> > database would be glibc-only.)
> 
> This would be super hard and may introduce unwanted side-effects. To my 
> knowledge, it's impossible to lock a bug -- so you may have a 
> split-brain situation where a bug is still updated in the old location, 
> but not in the new location.

A local patch on the Sourceware side (to disallow new changes to bugs in 
the glibc product) could surely have the effect of such locking.

By way of examples of other projects that did issue tracker migrations (to 
GitHub Issues), both LLVM and Python migrated existing issues as part of 
those migrations.  Both those were also changing from one issue tracker 
implementation to another; a migration from Bugzilla to Bugzilla surely 
ought to be simpler because of a closer match between the underlying data 
models (even if the Bugzilla versions are different).  While both were 
able to make the old tracker entirely readonly after the move - they 
didn't have the complication of the old tracker mixing bugs for multiple 
projects - I think that's more of a small detail, not something to make a 
conversion excessively hard.

> > > 6. Patch tracking services (Patchwork)
> > > 
> > >   a. LF will deploy the latest version of Patchwork patch tracking software
> > >      under patchwork.coretoolchain.dev.
> > >   b. LF will set up automation and integration services between mailing lists,
> > >      patchwork, and git repositories (using [git-patchwork-bot][8]).
> > >   c. LF will work with the glibc community to set up projects and access as
> > >      appropriate.
> > 
> > The existing glibc Patchwork database should be transitioned across.
> 
> Can you give more information why this is desired? This is uncharted 
> territory and I'm not sure how much effort this would require.

The same reason as anything else.  Patches from before the transition are 
just as much in need of review as those from after the transition, so the 
state of review of those patches should be maintained across the 
transition.

I don't really think of moving patch review state or bug database state 
across as substantially different from moving the existing git repository 
- these are all key parts of the development process and shouldn't have an 
artificial divide based on the details of when hosting changed, once the 
transition happens developers should only need to interact with the new 
system, for tracking state of old or new patches, for updating state of 
old or new bugs.

-- 
Joseph S. Myers
josmyers@redhat.com

