Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB13206A8
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 17:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17F4681F4A
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 17:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17F4681F4A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=LJexakby
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6OzLoI8JKlZ9 for <cti-tac@lists.linuxfoundation.org>;
	Tue, 23 May 2023 17:38:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAD5981EAC
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BAD5981EAC
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 17:38:44 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-75b0b2eb9ecso7619785a.2
        for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 10:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684863523; x=1687455523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LR4cmrE6jy9YZvWhTuSEBJpOcI4SCHmzcaBb8ywTd7w=;
        b=LJexakbytuMKkyTfaR1DPN3Wh9h7G9S32F+EndNVWEL2NewhPAiDIsxYnKw1YuiFJQ
         W/PBrQDka7C16GiprhT39+/AMQuUg9oVATPlAx7icL5BFiqU22jRV2K09qeLIM453DAD
         n5afi8BXvwdFC/DZimo8Ffd9hBtR9jaa5+/as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684863523; x=1687455523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LR4cmrE6jy9YZvWhTuSEBJpOcI4SCHmzcaBb8ywTd7w=;
        b=jmix/wrmyR67cA7XGBnItFWsSyHNE9+Bxym70WAx+i4o5aGGgmTnytXWqoMnyCw/9A
         G3AQu4BF+7EUZRBEBmgEx5NfDC6+2goDyMs43mlXfKEVBeI507mMn6nUmT/RbrOHIpPY
         WyO//qoEYFbL17xjAaBBXtgIJtQrv6v2X3AQTXqIfr7nAKngOFEJeqdEdsT+G+KBooPU
         vbGY+/JEry1gCCK9T5q3E5z1vUdWA+VIdUdRWDB0pBFzOJPFtARnYYwkheCXZHp5EWQZ
         KNHLYlDgC6+HpvPZk5k3Upp+i04Y/YY7d+LazjIVhbBJSjbx4uvILykT0gFl+i7eDCCo
         8Wzw==
X-Gm-Message-State: AC+VfDxo804Xg1NtarmRXqwqmaFPBc9CS9WC7zYD6qM3nqmXZwyO624y
	dRLC5cf/ikBVJsDvD2IjxwaH6O29auhvETs4YjetXA==
X-Google-Smtp-Source: ACHHUZ7YzwDtxI0Lwkqn+5asnylzzdVTbnlUF9R8svUtnMJdJ+eECM2S7njEyhviLCzvZKRuZ7OZ0g==
X-Received: by 2002:a05:620a:bd4:b0:75b:23a1:436 with SMTP id s20-20020a05620a0bd400b0075b23a10436mr5586131qki.76.1684863523441;
        Tue, 23 May 2023 10:38:43 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id f28-20020ad4559c000000b006238c53744dsm2892854qvx.62.2023.05.23.10.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 10:38:43 -0700 (PDT)
Date: Tue, 23 May 2023 13:38:41 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Joseph Myers <joseph@codesourcery.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost of
 glibc migration.
Message-ID: <20230523-ankle-infer-spurs-55ac6f@meerkat>
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>

On Fri, May 19, 2023 at 10:47:10PM +0000, Joseph Myers wrote:
> > Our mailing list infrastructure is uniquely tailored to public-inbox users,
> > with messages being written to the archives *before* they are even sent out to
> > subscribers, which helps speed up access for users who aren't using the
> 
> There is a certain advantage there regarding the problem we currently have 
> where messages sent as HTML are missing from public-inbox archives, if the 
> process that strips HTML parts takes place before feeding to public-inbox 
> (whereas at present it takes place after that, I think).

Hm... no, there is no "stripping of HTML parts" (that would invalidate DKIM).
It is certainly possible to configure a mailing list so that HTML messages are
pre-moderated.

> (I consider it important that we do *not* insist on contributors meeting a 
> shibboleth of sending plain-text email before they can interact with our 
> mailing lists, especially for user lists such as libc-help - we should be 
> friendly to people sending email in the ordinary form they are used to 
> using today even if we might rather they didn't send HTML email - we 
> shouldn't impose that view of proper email on them.)

It's possible, but it is an empirical fact that permitting HTML messages
raises the amount of spam that goes through by several orders of magnitude.
Allowing it per-list is okay and normal (e.g. the list aimed at newbies and
people seeking occasional help). However, I think it is perfectly normal to
disallow it on development lists where one is already expected to follow a
fairly rigid set of rules.

> > * Sending per-commit email to mailing lists -- this seems like a vestigial
> >   feature from the pre-git past. Does it really serve any purpose? I am
> >   fighting to kill a similar feature used on the kernel.org side, because I do
> >   not see any remaining legitimate use for it -- it just creates a lot of mail
> >   traffic that nobody really reviews.
> 
> I think it's extremely useful to have those messages for watching out for 
> commits that shouldn't have gone in or went in in an unintended form (this 
> is for human-determined "shouldn't" or "unintended" - not anything 
> expected to be covered by automated checks).  And also to have a message 
> ready-made to reply to when something was committed without being posted 
> to the mailing list.

If you insist, though I still think this is the case of "everyone assumes that
someone else is paying attention to it." I am highly critical of setups that
fire messages into the ether in hopes that someone checks them. 

There are better ways of doing it that don't generate email, e.g.:

- compare commits against patchwork and alert when there is no match
- write all pushes to an audit log and have someone monitor it
  (e.g. see https://tlog.linderud.dev/)
- monitor the RSS feed of all commits (e.g.
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/atom/?h=master)

> > * We do not currently allow direct hooks on the server side, because running
> >   arbitrary scripts with the permissions of the git server is a very bad
> >   anti-pattern when it comes to repo security. It also tends to make pushes
> >   super slow and frustrating to developers, especially those working on slow
> >   or unstable connections that can go rapidly stale, resulting in failed
> >   pushes.
> > 
> >   So, we will need to wrap our collective heads around what your hooks are
> >   doing now and implement them via alternative means. For example:
> 
> Certainly some kind of system for proxying / containing checks to limit 
> what they can do if buggy makes sense - they don't need to run with the 
> permissions of the git server, they can run in some kind of isolation, as 
> long as they prevent bad commits from getting into the history.

That would take even longer to execute, and be more fragile, no? I usually get
lots of push-back from developers when their pushes don't return within a
second or two, so having a push take many minutes to complete seems like bad
user experience.

> >   * denying force-pushes to specific branches (rebase/non-fast-forward
> >     updates) is a native feature of Gitolite
> 
> What about denying merge commits on master and release branches?

I'm not sure I understand -- you mean, all commits must have a single parent
and have a fully linear structure? Doesn't that make it super difficult to
resolve conflicts?

Sorry, I'm coming from the opposite world where merge commits are encouraged
-- the cover letter of the series goes into the merge commit, and therefore
carries changelogs and links to all previous revisions of the series that got
applied.

> Note that GCC has its own custom set of namespaces for branches (under 
> refs/users/ and refs/vendors/) and rules about what branch names may be 
> created at all etc.  (Unfortunately there seem to be some missing checks 
> for the case of lightweight tag creation, resulting in some improperly 
> named tags being present.)

As long as it works with git, that's not a problem -- but I believe a lot of
visualization tools (like cgit) won't display anything that's not under
refs/heads.

> I think those things *should* be happening on push - to prevent obviously 
> bad history getting onto master or release branches (at least) in the 
> first place.  For glibc, that's (apart from the non-fast-forward checks 
> and rejecting merge commits on branches meant to have linear history):
> 
> * Disallowing lines with trailing whitespace in certain files.
> 
> * Disallowing commits with a mailing list address as the author email 
> (even if your mailing list setup is designed to be DKIM-safe so author 
> emails don't need rewriting, people might still use "git am" with old 
> messages, so this remains relevant).
> 
> * Disallowing commit subject lines that look like a ChangeLog header.
> 
> * Disallowing single-word (or empty) commit subject lines.

In my view these all should be happening on the client as pre-commit checks,
not on the server. Any reason why they can't run on the client, e.g. via a
framework like https://pre-commit.com/ ?

> For GCC there are several extra checks that I enumerated - including, in 
> particular, the fairly complicated checks for ChangeLog format to avoid 
> the nightly cron job updating ChangeLogs falling over.  (The check to 
> avoid From-SVN: lines is similarly to prevent a commit that would cause 
> subsequent problems for automation that relies on those lines only being 
> present in commits converted from SVN in order to look up such a commit by 
> SVN commit number.)

Also something that, in my view, should be running pre-commit on the client.

> > ## Release tarballs
> > 
> > There are multiple ways of getting this done, including completely automated.
> > For example, stable kernel releases are generated server-side by using and
> > verifying the PGP signature found in a git note attached to the release tag.
> > This doesn't work if the tarball is not directly generated from a git
> > repository (for example, if config scripts must run first).
> 
> Is "git archive" output or similar actually stable enough that the server 
> can reliably generate (at any time in the future, with a future git 
> version) a tarball matching the tarball signature the release manager 
> generated at release time, or is that not what you meant?

It's stable enough to not have changed in a decade, but we also only need
compatibility within a short period of time. We generate the tarball from the
git-note signature once, shortly after it is pushed. We don't need to be able
to generate the same tarball years later. Once the tarball is generated, it is
put into the primary storage and kept there.

-K
