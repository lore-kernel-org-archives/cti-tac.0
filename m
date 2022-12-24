Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29C71844
	for <gti-tac@lists.linuxfoundation.org>; Sat, 24 Dec 2022 05:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 448D182149
	for <gti-tac@lists.linuxfoundation.org>; Sat, 24 Dec 2022 05:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 448D182149
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=adacore.com header.i=@adacore.com header.a=rsa-sha256 header.s=google header.b=gXunU7BF
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TR5TH4Edb2WU for <gti-tac@lists.linuxfoundation.org>;
	Sat, 24 Dec 2022 05:31:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFC1182147
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CFC1182147
	for <gti-tac@lists.linuxfoundation.org>; Sat, 24 Dec 2022 05:31:45 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h16so6152001wrz.12
        for <gti-tac@lists.linuxfoundation.org>; Fri, 23 Dec 2022 21:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adacore.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FnM7RQFNhkybUNdmdrGaApjpn8wbEYzquJU3F70Arvo=;
        b=gXunU7BFerDC0NcTjvYmni1NQXBdQkifd9L0i0Cb08fUuLcu0AC71fzOnp11vaqcUe
         m2wV9zt7wwD8hbDellNObv6a3875rdEhiCs94Bu2IvjtIg7ttun8XfF5wT2EL36QdyhN
         FBQBSBVThTB76SvP5M8MbAk/2iPYRUV70fe6q8GPzqB82wKW9VjAivSuCVjaksH7Zo4Y
         vsniNQlZAVPBc9ZDKFDSJJWUgQjHo9ovn/uQz8DRbGiPP+fnsm47AuptoKoqORpnR+He
         iy3Vn7NRvOwNtZ0D3/4CIktgjMo2neYttmwqsdqS4K4I9BlHRXd2jhAw+J9xV9jPs7s/
         Ph7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnM7RQFNhkybUNdmdrGaApjpn8wbEYzquJU3F70Arvo=;
        b=yugQ1sX7scPJ5i1AOM5eaZkjmsPLUI5hx94guNqMWhX+D5HpmRXYh/6AK4X8y7acDI
         d+NWcMJUM+/f1uMYmkr48J0nWLdfSVWd3UV28rJUq9H63ZuIiXHcMXKaYtYzpjYDrGAK
         CCnDP75wNZwTQfhwCltHhCnzJFn7T/dk8DOiCWVH4AnUIsOGcA9eQAyaq8VBJWVVA2z/
         7xZrLH/pJI+cqYdUcvM/zIRcdePT6PbYZmTfrWvAleYU894cDXT9GQn1wYldYqtk/YFd
         zwEpOj2FcYbs/x9D+sOSe7akBOCXRmWrSNGaFkCfymsS+De31f9rbqQkxpuLtPJeHq7x
         8IZA==
X-Gm-Message-State: AFqh2kr79ilYXLOieu09mBauIskpWSopRg7f5QvmStF5oG8D6w2PFJqz
	0Tbucc3gpc7DkKuBWo4cjQH+
X-Google-Smtp-Source: AMrXdXsfAOcT3X05mvrIZGS+m0RoVB7AQYwWgwqgx+ZI5AdOkVAAFL0Uwxk5IMhxfuzkfVl1mbZJfg==
X-Received: by 2002:a05:6000:16cb:b0:242:1b0d:9c58 with SMTP id h11-20020a05600016cb00b002421b0d9c58mr8674937wrf.69.1671859903851;
        Fri, 23 Dec 2022 21:31:43 -0800 (PST)
Received: from takamaka.gnat.com (lfbn-reu-1-488-54.w92-130.abo.wanadoo.fr. [92.130.77.54])
        by smtp.gmail.com with ESMTPSA id h6-20020a056000000600b002423dc3b1a9sm4453835wrx.52.2022.12.23.21.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 21:31:43 -0800 (PST)
Received: by takamaka.gnat.com (Postfix, from userid 1000)
	id 0580B81AE6; Sat, 24 Dec 2022 09:31:41 +0400 (+04)
Date: Sat, 24 Dec 2022 09:31:41 +0400
From: Joel Brobecker <brobecker@adacore.com>
To: Simon Marchi <simon.marchi@efficios.com>
Cc: Joseph Myers <joseph@codesourcery.com>,
	Joel Brobecker <brobecker@adacore.com>,
	Carlos O'Donell <carlos@redhat.com>,
	gti-tac@lists.linuxfoundation.org
Subject: Re: Action: Setup working group for the GNU Toolchain proposal to
 migrate to LF IT managed services
Message-ID: <Y6aOvWPYmFXgyva5@adacore.com>
References: <3a81d482-c952-d501-f495-485f00400e85@redhat.com>
 <Y3rxAYa/oc5s/R/7@adacore.com>
 <da126be7-475f-e2ed-fb4f-4493271db5f3@codesourcery.com>
 <62439dc1-1bb6-76b2-d1be-e7d3a2b64522@efficios.com>
 <b755774c-3912-2dac-957c-91f659c95119@efficios.com>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b755774c-3912-2dac-957c-91f659c95119@efficios.com>

Hi Simon and everyone,

> Here's a revised list for GDB, I added some user-facing / functional
> requirements I would think of.  It's probably still lacking some of the
> implementation details that you are looking for, but I probably don't
> know them, and it's hard to know what you don't know.

I think Simon actually did a great job on that second pass, and
I found in doing my own pass that I didn't have very much I could
add, just some details here and there. Here is the updated version
of the document.

* Git Repository
  * Need push access
  * Ability for project maintainers to request push access for new
    contributors (or to do it themselves)
  * Ability for users to create user-branches (e.g. users/simark/foo),
    which will be ignored by the notification-sending script.

* git hooks

  * git-hooks (https://github.com/AdaCore/git-hooks) installed in
    the binutils-gdb.git repository.

  * binutils-gdb.git's git-hoks configuration pointing to the following
    scripts locally installed on the machine hosting the repository,
    to which the binutils & GDB admins need access (currently done
    via SSH access)

      - binutils-gdb.git/hooks-bin/email_to.py
        Small python script which determine which mailing-list(s) to use
        when sending commit email notifications. No special requirements
        other than a Python3 interpreter.

      - binutils-gdb.git/hooks-bin/commit-extra-checker.py

        Verifies that we do not have this issue:

        # With commits created using "git am" of patches sent via the gdb@ or
        # gdb-patches@ mailing list, it's possible that the author information
        # gets changed into "xxx via xxx@sourceware.org". Catch and reject those,
        # so the person doing the push can fix this before the push is allowed.

        No special requirements other than a Python3 interpreter.

      - /git/binutils-gdb.git/hooks-bin/style_checker

        An empty script at the moment (set because the git-hooks require
        it to be set).

      - /sourceware/infra/bin/email-to-bugzilla

        A perl script whose maintainorship is unclear. Comments at
        the beginning of the script mention David Hampton <hampton@cisco.com>
        as contributor and Greg A. Woods <woods@web.net> as having "greatly
        hacked" it. Beyond that, don't know.

          . The goal is that when a commit is pushed to the git
            repository, we check for any mention of a Bugzilla bugs, and
            post a message to those bugs
          . It accesses the Bugzilla database directly to check if a given bug
            number exists (could easily be changed to use some HTTP request)
          . It posts to bugzilla by sending an email to a local email account
            (Joel: I think sourceware-bugzilla@localhost)

        Joel's note: If I understood the script correctly, then there
        must be a handler in the local MTA to catch those emails and
        send them to bugzilla for further processing. Don't know how
        that works, though.

      - binutils-gdb.git/hooks-bin/post-receive

        Bash wrapper scripts which essentially calls the following
        script: /usr/local/bin/irkerhook.py. I suspect the origin
        of this script is this github repository:
        https://gitlab.com/esr/irker

        If not, ISTR that it was Tom Tromey who got it installed,
        so we could ask him.

  * The git-hooks themselves send emails about commits to the gdb-cvs
    mailing list (each repository configures the destination, and for
    binutils-gdb, this this a "dynamic" configuration via the email_to.py
    script mentioned above allowing the destination to vary depending
    on which files got modified, whether they are binutils fils or GDB
    file, or both).

* Web-based navigation of the Git repository
  * Need to be able to browse the git repository online
  * https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git
  * If it exists, a more featureful git web frontends would be nice, one
    that allows searching files by name for instance.
  * URLs to a given commit in the Web UI should be easily computable
    using their SHA1; e.g.
        "https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=%(rev)s"
    We use those in the commit emails being sent by the git-hooks.

* mailing lists
  * Those I know for sure are used / useful:
    * gdb@
    * gdb-announce@
    * gdb-cvs@ (now misnaed, but can be used to follow commits to the repo)
    * gdb-patches@
    * gdb-prs@
    * gdb-testers@
  * Not sure about these:
    * gdbadmin@: seems useful for whoever is responsible for snapshot
      generation or other GDB-related automated task.  It seems a bit
      spammy to send an email every day when the task succeeds.

      The daily commits in binutils-gdb that bump the date are made using
      this email address as the From, not sure if it matters
  * Pretty sure we can ignore these:
    * gdb-testresults@
    * gdb-patches-prs@:
    * gdb-webpages-cvs@

  * We also have a "global maintainers" list hosted at AdaCore.  It could
    make sense to move it to the main infrastructure.  Maybe Joel knows if
    there's a reason it's separate.

    No reason to keep it separate. It just started as an email alias
    on my own home server, then moved to being hosted by AdaCore to
    avoid having me maintaining a working email configuration on my
    server. Agree it might make sense to move, but I would say email
    discussions between Global Maintainers should remain private,
    or at least closed.

* Mailing list web interface
  * The original one, which I find not so useful now that we have
    public-inbox: https://sourceware.org/pipermail/gdb-patches/
  * However, old links need to keep working
  * public-inbox or something equivalent is necessary:
    * have a way to browse easily message threads that span multiple
      months / years
    * have a way to download raw messages, to apply patches locally

* daily snapshot generation

  * We have a script that generates daily tarballs:

    This is currently a collection of shell scripts stored on sourceware
    at /cvs/gdbadmin/ss, and tracked in a (ahem) CVS repository in
    /cvs/gdbadmin/ss.

    These are incredibly over-engineered, with poor error investigation
    support. But the technology used is simple bash scripting.

* daily bump

  * We have a gdbadmin user crontab entry which calls a script in
    the ss repository mentioned above daily, once for the master branch,
    once for the current binutils release branch, and once again for
    the current gdb release branch.

    Simple shell script.

* Website
  * Handwritten pages in a couple of CVS repositories:
    - The gnu.org copy is maintained on https://savannah.gnu.org/;
    - The sourceware.org copy is maintained on sourceware.org itself,
      in /cvs/gdb/htdocs
    - It used to be that both versions were kept in sync by duplicating
      all the commits in both repositories. But this was recently changed
      in favor of installing redirects from the gnu.org website to
      the sourceware.org. This was the first step towards a possible
      transition of the web-pages to Git.
  * scripts generating website contents (doc, ARI, etc), also part
    of the "ss" repository mentioned above.
  * SSH access to the machine hosting the website is used, as the scripts
    above generating website contents are run by the release manager, after
    having ssh'ed onto sourceware.org.

* Wiki
  * Currently, anyone with write access can give someone else write access.
  * At the very least, we need a way for project maintainers to request
    write access for a new member, or do it themselves

* bug tracker (bugzilla)
  * Sends notifications of new bugs and comments to gdb-prs
  * Sends notifications of comments on a bug to users who are watching
    that bug
  * Accepts replies by email, both from users and from the
    email-to-bugzilla script.

* Release hosting
  * Releases, the release manager must be able to upload there
    * ftp://sourceware.org/pub/gdb/releases/
    * http://sourceware.org/pub/gdb/releases/
  * Snapshots, the daily script needs to be able to upload there
    * https://sourceware.org/pub/gdb/snapshots/

* patchwork (https://patchwork.sourceware.org/project/gdb/list/)
  * It receives emails from the gdb-patches mailing list
  * This instance doesn't get much use at the moment, because it gets
    filled so quickly and is impossible to keep up to date.

-- 
Joel
