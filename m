Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A9312B9E
	for <cti-tac@lists.linuxfoundation.org>; Fri, 19 May 2023 21:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61AA242694
	for <cti-tac@lists.linuxfoundation.org>; Fri, 19 May 2023 21:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61AA242694
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=LdSqLn7r
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCvkxKlkCmvP for <cti-tac@lists.linuxfoundation.org>;
	Fri, 19 May 2023 21:00:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82E7642692
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 82E7642692
	for <cti-tac@lists.linuxfoundation.org>; Fri, 19 May 2023 21:00:39 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-75939de402dso201803585a.1
        for <cti-tac@lists.linuxfoundation.org>; Fri, 19 May 2023 14:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684530038; x=1687122038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NWlhqIlp2A9cdP338AOoHsnRoXtloUiEoYhVybVN630=;
        b=LdSqLn7ru6z0NF0XWpNNVzajTLpHa9jRrhyy4vl0caX9+oGvJEUjVKduniBKLiOu9x
         PmLxKtfSKQQl1Xif+br1i5sg4Sr46RI1paG2+e+AkW3ln9rYzvO/0aQ8mTgFP506qN/A
         W5ULoQVLSSMOZjLnT6XE3Z+fOMHgFcSKMQHEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684530038; x=1687122038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWlhqIlp2A9cdP338AOoHsnRoXtloUiEoYhVybVN630=;
        b=EnNMpup7ThIHuB5xu/GRqcu5H/DLwowO0f+wyyN8xwgMZtydvPH1MY3RxhtXzA9gKD
         rmitrqLLEbASTie/A/cvpL4bupN4cqIjpURO0YbsFxJ/spdv1kojNPLt8ZinyHVInldl
         lu0DEZLZqV+Ok+LIrEE5bxsERIrQSR5vcuMT5cCBYj4u0uFjagnkj7PpDC+Dh4+DXWTx
         jULSFQ/99IVvAsngVzIi/KtWtPN2O8MeuADQmJCtlX8sMiGGC0BJCp8ci5vv2snPeKj9
         Pm2REjO3+dgXgUa7zB3zx4JyIfnSwmKY6XWdBwaSvhw6E9x6efFsgdMCXcXDX32oGghl
         n3vA==
X-Gm-Message-State: AC+VfDwE39GqUwjZqGbmyfUycCoXMwzFW3pe1eDtHAumHzBESDr1cqcd
	w/AHrSQmpcrDbPP0s2eJ2+iYohad
X-Google-Smtp-Source: ACHHUZ4t6wp6hs0B482qmItOw7yCMTDaOHXwQkYLhcUMCpst9GkDBYPnEQZwY8lJ9GMPr8mz3FeVzw==
X-Received: by 2002:ad4:5d48:0:b0:621:564a:27a0 with SMTP id jk8-20020ad45d48000000b00621564a27a0mr8525369qvb.34.1684530038117;
        Fri, 19 May 2023 14:00:38 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id g1-20020ad457a1000000b0061b60afe381sm64720qvx.85.2023.05.19.14.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 14:00:37 -0700 (PDT)
Date: Fri, 19 May 2023 17:00:35 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org, 
	Khahil White <kwhite@linuxfoundation.org>
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost of
 glibc migration.
Message-ID: <20230519-rebate-guru-b0528e@meerkat>
References: <13b3266b-a410-77fd-5dfc-4e4994b630cd@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <13b3266b-a410-77fd-5dfc-4e4994b630cd@redhat.com>

On Mon, Apr 03, 2023 at 01:24:21PM -0400, Carlos O'Donell wrote:
> That means the the next steps likely look like this (needs further discussion):
> * Iterate over the services below and discuss how and what to migrate them to.

Hello, everyone:

Sorry for continued delays -- I had a few false-starts and plenty of
usual distractions, but I am finally able to move on this task with a
clearer picture of what I am doing. I know you asked for costs, but they
are going to depend on the finalized set of services, so I am going to
set this aside just for the moment and focus on the technical aspects of
the migration. It's not really that I am keeping anything close to heart, it's
just that a lot of this infrastructure will be using shared deployments, and
it's as not straightforward to easily assign dollar figures to cycles as cloud
hosting setups would like us all to believe. :)

# Service enumeration

## Mailing lists

The number of mailing lists doesn't really matter -- they are all managed via
mlmmj and public-inbox and we're only really looking at the general volume of
messages and size of archives.

Looking at your list, the only thing we don't do is clamav, because it's
mostly security window-dressing. Your client-side antivirus and end hosting
provider is much more likely to do a good job catching any malicious content
than clamav.

The mailing lists will be using shared infrastructure (subspace.kernel.org)
for the actual mailing lists, and for the public-inbox archives we can either
host them as part of lore.kernel.org, or deploy a separate service just for
your own list -- your preference. There are upsides and downsides to either
choice here.

Our mailing list infrastructure is uniquely tailored to public-inbox users,
with messages being written to the archives *before* they are even sent out to
subscribers, which helps speed up access for users who aren't using the
traditional "push" subscription module, but are pulling search-based results
instead (using lei). This proves to be a much more reliable mechanism for
patch-based workflows than traditional SMTP push subscriptions.

## Bugzilla

Everything on your list looks fine, and we can certainly replicate these
features. We have also recently released our own experimental bugbot that
allows us to much better integrate public-inbox managed mailing lists with
bugzilla and git:

https://lore.kernel.org/workflows/gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q/

The major improvement of this vs. bugzilla's native email interface is that
bugs can be created from mailing list discussions, not just the other way
around. The bugbot will need to be slightly adjusted for CTI needs, but
otherwise I think it would be a better solution than Bugzilla's native email
integration. For example, when bugmail is sent to the mailing list and someone
responds who does not have a Bugzilla account, their account would be
auto-created. Our approach does not require this and will happily allow fully
two-way bridging between Bugzilla and mailing list discussions.

## Git

We are using Gitolite for all our projects, and we strongly suggest doing the
same here. It would be straightforward to migrate from Unix user/group
permissions to Gitolite authN, so I do not expect this to be complicated or a
showstopper.

The rest of it will need some work to figure out the best way forward:

* Sending per-commit email to mailing lists -- this seems like a vestigial
  feature from the pre-git past. Does it really serve any purpose? I am
  fighting to kill a similar feature used on the kernel.org side, because I do
  not see any remaining legitimate use for it -- it just creates a lot of mail
  traffic that nobody really reviews.

* We do not currently allow direct hooks on the server side, because running
  arbitrary scripts with the permissions of the git server is a very bad
  anti-pattern when it comes to repo security. It also tends to make pushes
  super slow and frustrating to developers, especially those working on slow
  or unstable connections that can go rapidly stale, resulting in failed
  pushes.

  So, we will need to wrap our collective heads around what your hooks are
  doing now and implement them via alternative means. For example:

  * denying force-pushes to specific branches (rebase/non-fast-forward
    updates) is a native feature of Gitolite
  * our bugbot is able to integrate git commits with bugzilla better than
    sending out mail to an bugzilla ingestion point, and this doesn't need to
    happen on commit (we use git log queries)
  * the same can be done for IRC/Matrix notifications, if that is still
    desired

  The only thing that would require more work is style checkers and other CI
  functionality that really should not be happening on-push. I suggest that
  this moves entirely to patchwork CI, discussed below.

## Patchwork

Everything described under "Patch management" we can do, with some tweaks. For
example, we feed patchwork from public-inbox archives instead of directly
piping incoming email. We also have our own git-patchwork-bot that is able to
auto-close patches and series when it seems them show up in git repositories,
with follow-up messages to authors and to the mailing list.

We also have multiple projects using patchwork CI integration (e.g. see
https://patchwork.kernel.org/project/netdevbpf/list/), which is our
recommended way of doing pre-commit checks on patch series.

## Wiki

I strongly believe that wikis are quickly fossilizing creatures of a bygone
era. If at all possible, we will not migrate any wikis, instead migrating them
to readthedocs-style documentation (e.g. using pandoc for migrations). We have
done it with a number of projects now and will be happy to assist in this case
as well.

There are multiple obvious upsides:

* Fast pre-rendered documentation
* Sane site organization
* No more dealing with wiki spam
* CI integration for actual style-enforcement

I do not believe there is any reason to continue to run wikis in 2023.

## Project CI

I am side-stepping this for now, because CI was outside the scope of our
discussion. If that has changed and we're now making CI a core part of the
migration, then I will need to loop in our Release Engineer team for their
analysis and suggestions.

## Websites

Any static-site generator solution will do, including readthedocs as with the
suggested wiki migrations. We have previously used Jekyll and Pelican.

## Release tarballs

There are multiple ways of getting this done, including completely automated.
For example, stable kernel releases are generated server-side by using and
verifying the PGP signature found in a git note attached to the release tag.
This doesn't work if the tarball is not directly generated from a git
repository (for example, if config scripts must run first).

In the case when we can't use the git tag note process, we can also do tarball
uploads using our own "kup" tool that is done over ssh and uses the gitolite
permission framework. I'm quite shocked that someone in the world still uses
FTP for any uploads. :)

## IRC

We don't run our own IRC servers, but LF may potentially offer Matrix, which
we may bridge to an IRC server of your choice (and if needed).

# Bird's eye infrastructure overview

To implement everything as discussed above, we would deploy a small subset of
VMs:

- gitolite VM, which is the primary of all your git repositories and tarball
  releases
- bugzilla VM, which hosts the bugzilla itself
- bot VM, which runs all the integration bots, such as bugbot,
  git-patchwork-bot, patchwork mail ingestion bot, site/documentation build
  bots, etc -- basically all infra "CICD"
- SQL VM for bugzilla, patchwork, and bot databases
- patchwork container (since it's a Django app, we don't need a VM here)
- public-inbox archive frontend VM (if not using lore.kernel.org)

The price footprint on these VMs and containers is fairly small, especially
because we will try to shift most high-traffic services to shared
infrastructure:

- public git repositories will be replicated to multiple worldwide frontends,
  same as git.kernel.org
- all static sites will be served from shared infrastructure
- tarball releases will be replicated and served via mirrors.kernel.org

Furthermore, once other toolchain projects start migrating, we can reuse all
of this infrastructure for that purpose.

# Next steps

Before we go any further and start talking concrete VMs and costs, we need to
figure out the CI part that I side-stepped, and the complete rework of git
hooks that I suggest needs to happen before we can consider switching over. I
do feel very strongly that none of it should be running on git push -- but
without a deeper understanding of your needs, I cannot rule anything
completely out. Should we start a separate thread to make sure that I'm not
suggesting anything that isn't workable because I'm not fully grasping your
needs?

# OpenSSF

Lastly, I do believe that CTI migration is already partly or fully covered by
OpenSSF grants. I am in a separate conversation with folks from the Alpha
Omega group at OpenSSF to better understand their goals and the longevity of
their grants -- but this will probably also impact the financial side of the
equation (I just don't know to what degree, yet).

Again, apologies for the continued delays. Please know that CTI is currently
front and center in my focus, so I hope to catch up on a lot of tasks that
have been on the backburner.

Best regards,
Konstantin
