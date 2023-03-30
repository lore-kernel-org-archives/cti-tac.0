Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F777E3
	for <gti-tac@lists.linuxfoundation.org>; Thu, 30 Mar 2023 00:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BF83841B0
	for <gti-tac@lists.linuxfoundation.org>; Thu, 30 Mar 2023 00:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BF83841B0
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -3.953
X-Spam-Level:
X-Spam-Status: No, score=-3.953 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oFqSH7qBuc2E for <gti-tac@lists.linuxfoundation.org>;
	Thu, 30 Mar 2023 00:36:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B99AB841AA
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B99AB841AA
	for <gti-tac@lists.linuxfoundation.org>; Thu, 30 Mar 2023 00:36:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="951708"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 29 Mar 2023 16:36:19 -0800
IronPort-SDR: 5JyIFdFTvz7m9bhhuK8JlBEM08WcQZ9buBRB6qKX9SmtHDV8NA3gtXQu5nuBDB6+xMAeYaWpBv
 PQxrA7CQyRJjCl2vG4zrhjtgfdwV5YnI+Qy5JXG7sXhKWfBFkh9ZOY71xUr+UYlPwkp2MqnqgB
 wbxFothrctaIWjojq68w96CvgfGQYiLPa4TwkuzeYu1pTYbKmFbSrrcc94zLMefsP7dUFrIgMw
 dj26LJv3suoLcuO3FPQL3drRWuukEI1H48YTkz5TTy53mKbe+0iVZ4no1YQ5qS6mW8T/ZGPwmx
 ye8=
Date: Thu, 30 Mar 2023 00:36:14 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: <gti-tac@lists.linuxfoundation.org>
Subject: GCC service enumeration
Message-ID: <7e59d8db-7b26-1249-ad5c-67b7f3411e1@codesourcery.com>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10) To
 svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10)

Here are some notes on services used by GCC.

* git:
  * Three repositories.
    * /git/gcc.git (main GCC repository)
      * AdaCore git hooks.
        * Older (Python 2) version of those hooks, commit
          1f9082567e82788e4da748fe13ddd0b230166faf.  Should move to
          current Python 3 version, but will require careful review of
          hook configuration to update for any incompatible changes
          since the version currently used.
        * See refs/meta/config:project.config for hook configuration.
        * Hooks generate commit emails, 524288 byte size limit.
          Various custom configuration for the contents of those
          emails.  Emails are not sent for commits already in the
          repository being merged to certain development branches.
        * Merge commits rejected on master (including the trunk
          symbolic-ref) and release branches.
        * Commits referencing Bugzilla bugs update Bugzilla
          automatically.
        * Custom refs/users/ and refs/vendors/ namespaces for
          user/vendor branches and tags.
        * Branch deletion and non-fast-forward merges rejected, with
          custom message, outside the refs/users/ and refs/vendors/
          namespaces.
        * Hooks use scripts in ~gccadmin/hooks-bin.
          * commit_checker makes various checks.  Author email as
            mailing list address disallowed (to avoid problems with
            "git am" when the email address was changed automatically
            for DKIM purposes).  Subject must not look like a
            ChangeLog header, or be a single word.  Commit message
            must not contain a From-SVN: line that could confuse it
            with commits actually converted from SVN.  Commits
            disallowed to closed release branches.  ChangeLog format
            checked (with code from the main GCC repository) for
            commits to master / trunk and release branches.
          * commit_email_formatter does various custom formatting of
            commit emails.
          * email-to-bugzilla-filtered sends messages to
            /sourceware/infra/bin/email-to-bugzilla for master / trunk
            and release branch commits.  Note that latter script
            currently relies on direct SQL access to the Bugzilla
            database.
          * email_to.py determines which mailing lists to send commit
            emails to: gcc-cvs, possibly together with libstdc++-cvs.
          * style_checker does nothing.
          * update_hook disallows creating or updating refs to be
            based on the old git-svn history and branch creation
            outside the expected branch namespaces.
      * /git/gcc.git/config has custom [pack] configuration to use
        delta islands, to avoid inefficiency on default clones that
        don't fetch many of the over 6000 refs in the repository.  It
        also has repack.writeBitmaps = true.
      * On occasion, there may be changes to refs done manually on the
        server that aren't permitted by the hooks; for example, moving
        an inactive branch from refs/heads/devel/ to
        refs/dead/heads/.  Such a move should be followed by
        "git repack --window=1250 --depth=250 -b -AdFfi"
        to keep the delta islands configuration efficient.
      * The bitmaps configuration would apparently be most efficient
        if "git repack --window-memory=500m --window=250 --depth=50 -b
        -A -d -i" were run weekly, though this is not currently done.
    * /git/gcc-old.git (old git mirror, different refs / commit IDs)
      * This repository is read-only, enforced by a pre-receive hook.
    * /git/gcc-wwwdocs.git (GCC website)
      * denyNonFastforwards = true.
      * Simpler hook configuration, not using AdaCore hooks.
        * Only a post-receive hook.  That post-receive hook is a
          symlink to a file checked out from this repository itself.
          It calls /sourceware/infra/bin/post-receive-email to send
          commit emails to gcc-cvs-wwwdocs and also automatically
          updates a checkout and then runs the preprocess script on
          that checkout.
  * Write access to git over SSH.  606 users in the gcc group have
    access, as of 2023-03-23 (some may no longer be active; some might
    be disabled in /etc/passwd or have no active ssh keys and so not
    in fact be able to commit).
  * Read-only public access with both git:// and https:// protocols.
  * Web-based browsing access for all three repositories:
    https://gcc.gnu.org/git/; want URLs there to be stable.
    * RedirectMatch ^/g:(.+)$ (for g: URLs for commits)
    * RedirectMatch ^/r[0-9]+-[0-9]+-g([0-9a-f]+)$ (for URLs for
      commits in "gcc-descr" format).
    * Similar redirections also for such URLs using SVN revisions to
      map those to corresponding git commits.

* SVN:
  * One read-only repository, /svn/gcc.
    * Read-only enforced by pre-commit hook.
    * Would probably be reasonable to replace by a downloadable
      tarball (repository is 45 GB) or repository dump.
    * URLs pointing to SVN revisions are automatically redirected to
      corresponding git revisions, see above.

* CVS:
  * One read-only repository, /cvs/gcc.
    * Includes various separate pieces (CVS modules); the part for GCC
      itself stopped being used for new GCC changes when GCC moved to
      SVN, long before the part for the GCC website stopped being used
      when that was migrated to git.  Some directories such as
      benchmarks/ may never have formally been migrated to another
      version control system, but those are not in active use.
    * Would probably be reasonable to replace by a downloadable
      tarball.
  * Also repositories /cvs/java and /cvs/libstdc++ for early history
    of projected integrated into GCC a long time ago.
    * Downloadable tarballs of those are already available:
      https://gcc.gnu.org/pub/gcc/old-releases/old-cvs/

* rsync:
  * See https://gcc.gnu.org/rsync.html
    * rsync access to CVS repositories, SVN repositories, FTP download
      areas, websites, mailing list archives.  Server claims rsync
      access to GNATS databases but the configured directories don't
      appear to exist.  Note list provided by the server includes many
      non-GCC projects.

* ftp / downloads:
  * Download area available as https://gcc.gnu.org/pub/gcc/ and
    ftp://gcc.gnu.org/pub/gcc/
  * Release and snapshot processes place things there automatically.
    Snapshot process also updates LATEST-* symlinks (i.e. it doesn't
    just add new files / directories).  I'm not aware of any
    automation for removing old snapshots, but they do get removed
    from time to time.
  * New versions of host libraries (as used by
    contrib/download_prerequisites) are placed manually in
    infrastructure/, some form of access to add new files there is
    needed.

* cron jobs run from the gccadmin account:
  * The actual scripts run for these are checked into the
    maintainer-scripts directory in the main GCC repository; the
    checkout used on gcc.gnu.org needs to be updated manually.
  * Nightly update_version_git (updates DATESTAMP and ChangeLog files
    in git for master and active release branches).
  * Nightly update_web_docs_git and update_web_docs_libstdcxx_git
    (update online documentation for master on gcc.gnu.org).
  * Weekly snapshot jobs for master and active release branches.
    These make snapshots available in the download area (including
    updating the LATEST-* symlinks) and send emails to the gcc list
    announcing them.  They may be temporarily disabled while release
    candidates are being created for a given branch to avoid
    confusion.  These jobs also maintain state (.snapshot_date-*
    files) in ~gccadmin, that's used by the next run of a snapshot job
    to know what the last snapshot from a branch was.

* Bugzilla:
  * This has various local changes and uncommitted files, and parts of
    the checkout in /www/gcc/bugzilla are only root-accessible, so I
    can't fully assess what all the local changes and configuration
    are.  However, extensions/GCC/ probably contains the main local
    code.
  * Used for gcc and classpath products.
  * User account creation is restricted for users in a large list of
    blacklisted domains; users in such domains must email
    gcc-bugzilla-account-request (a mailing list) to get someone (with
    addusers permission, which might be a local change) to create them
    an account.  This is necessary because previously spam was added
    faster than the REST API could be used to remove it.
  * The REST API may be used for both anonymous and authenticated
    operations.
  * Bugzilla sends email for various actions on bugs.
  * Bugzilla receives incoming email to gcc-bugzilla@gcc.gnu.org and
    processes it to add to bugs.
  * Commit messages also get appended to bugs (see discussion above
    under git for how this uses SQL access at present).
  * When a new GCC release branch is created, it's necessary to update
    bug summaries so e.g. "13 Regression" becomes "13/14 Regression".
    This has at least sometimes been done with a script using direct
    SQL access, see e.g. /home/gccadmin/11changer.pl.

* Mailing lists:
  * Many mailman mailing lists, some but not all described at
    https://gcc.gnu.org/lists.html - names include gcc*
    gnutools-advocacy fortran java* libstdc++* jit.  gcc-sc is a
    mailing list on the sourceware.org domain rather than on
    gcc.gnu.org, don't know why.
  * Most but not all are public.
  * Some announcement lists are moderated.
  * Configuration for e.g. message size limits may vary between lists.
  * Lists may set sender address to the list where needed to avoid
    DKIM problems.
  * It's important that people can post to lists without being
    subscribers to those lists, and that they are not prevented from
    posting in HTML (although we'd rather they didn't) to avoid
    placing excess barriers to contributing to discussions.
  * There is some level of spam filtering applied to incoming email
    before it goes to lists.
  * Three sets of list archives, all need to keep stable URLs for
    existing messages:
    * Older MHonArc archives (no longer updated),
      e.g. https://gcc.gnu.org/legacy-ml/gcc/2020-01/ (with /ml/
      redirections).
    * Pipermail archives,
      e.g. https://gcc.gnu.org/pipermail/gcc/2023-March/thread.html -
      note we've deliberately disabled most email address munging that
      Pipermail might do by default, to avoid messing up patches,
      especially those containing Texinfo code.
    * public-inbox archives,
      e.g. https://inbox.sourceware.org/gcc-patches/

* User email:
  * Email to @gcc.gnu.org addresses available for users with write
    access; users can configure where it forwards to (via a special
    command run over ssh).
  * @gcc.gnu.org addresses also have special access rights in GCC
    Bugzilla (maybe also in Sourceware Bugzilla).
  * User gccadmin is both a user and a mailing list at present (that
    is, when cron automatically generates emails to
    gccadmin@gcc.gnu.org, it goes to a mailing list of the same name).

* User account management:
  * There is a system for accounts to be created (with approval from a
    global or subsystem maintainer, not someone with
    write-after-approval access), giving ssh access to write to git
    (and thus the ability to have @gcc.gnu.org email forwarded, and
    thus to set up an @gcc.gnu.org account in Bugzilla with
    corresponding privileges).
  * Most users do not have shell access over ssh.
  * Users can change their own SSH keys and forwarding email address:
    https://www.sourceware.org/sourceware/accountinfo.html

* Wiki:
  * MoinMoin wiki.
  * User accounts have no write access by default because of spam; an
    existing user must add someone to the EditorGroup page before they
    have write access.
  * Accounts without write access get created by spammers anyway and
    are periodically deleted automatically because MoinMoin slows down
    when there are too many users.

* Website:
  * Website https://gcc.gnu.org/ (plus http://) (plus
    gcc.sourceware.org name).
  * Static content from gcc-wwwdocs.git, passed through limited
    preprocessing from git hooks.
  * Documentation for master and releases (served as static content,
    after the initial generation process).
  * Various redirects, some using complicated rewrite rules.
  * Mailing list archives, as discussed above.
  * Bugzilla, as discussed above.
  * Repository browsing, as discussed above.
  * Wiki, as discussed above.
  * Download area for releases and snapshots, as discussed above.
  * Mailman interface for subscribing / unsubscribing to mailing lists.

* Non-sourceware services:
  * Releases also made available from ftp.gnu.org.
  * Translation Project used to handle translations.
  * There is a version of the website on
    https://www.gnu.org/software/gcc/ - not sure how that's kept up to
    date in sync with the https://gcc.gnu.org/ version.
  * The gcc.gnu.org name is part of gnu.org DNS so any updates are
    handled through that.
  * IRC at irc.oftc.net/#gcc

-- 
Joseph S. Myers
joseph@codesourcery.com
