Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5016FDF
	for <gti-tac@lists.linuxfoundation.org>; Mon,  3 Apr 2023 17:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26DD9409B5
	for <gti-tac@lists.linuxfoundation.org>; Mon,  3 Apr 2023 17:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26DD9409B5
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FtOXuJuF
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9DEl8-WQX9bI for <gti-tac@lists.linuxfoundation.org>;
	Mon,  3 Apr 2023 17:24:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77FF5409B0
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 77FF5409B0
	for <gti-tac@lists.linuxfoundation.org>; Mon,  3 Apr 2023 17:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680542665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Yqt09yffETbRkahYEA3YJ7VV4u9tcb1u8/DtQTo0seM=;
	b=FtOXuJuF2sAhvsS0WCbKTPPPOuu6Ok8MYBa6ezFuXC2tWp6NsRCbDHs3APytsidZwu6O96
	5MLdSIR/FLcecBYQl6+D8eUGnkH+eOq2ZViVeUXwP5WEaq5zAV5mSkDnqcoa50GvaXxI9B
	kdEbnewZ42b47jIA2BzF4+Y+flhU1d8=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-DNtHokNHPx67YEiNjPyQDQ-1; Mon, 03 Apr 2023 13:24:24 -0400
X-MC-Unique: DNtHokNHPx67YEiNjPyQDQ-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-5446a91c40cso298589207b3.18
        for <gti-tac@lists.linuxfoundation.org>; Mon, 03 Apr 2023 10:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680542663;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yqt09yffETbRkahYEA3YJ7VV4u9tcb1u8/DtQTo0seM=;
        b=1Y+ozAuM3Xdg34Eg1fQZaXHzmFLA5GIIJO8Q4kM8TtzvNUrwcp8rJf/kC82pF52USN
         S3eBQJwEutYnZBvGY/hgMVCnU/2Gv+G+UY3JWeAZvAIjlAVP9wN5aDNA2t3NvII3YfOV
         h+B/Cf3VD6YpWIgbtCDi8i5WXxxP7QJEaHRQ00z3RKgkNcsfasqMmotvt0KGJjfcyq8O
         FoLl73RfRuCu5WFUbNtVjHrTijD7BSqLEFrjh+gC0UtpYE0kGYrV0JwwyJ6kW2bdQnVN
         gw5eC7/aRi7PnxtpBqo++Y92Nrdv2lbluFzbVH+aWs2j/Gog/F+ajP2GV618sK8gIQLM
         lrsw==
X-Gm-Message-State: AAQBX9cfzSVSIFP/bCMVfPQ9tfkw+uhGxbq27fbcQ42aNfJlNlI72emV
	uZnt8ylfDyWwgBWHoSt+UQwG6hwWK92pOGyo0DOGV7+hO7Nkk1RiSY4iJJEv5gbJ60B+kwZk7sA
	RM2GemHc+Wj21st6RUZKsvzFbITeRGs8=
X-Received: by 2002:a81:6606:0:b0:544:75c2:d4a1 with SMTP id a6-20020a816606000000b0054475c2d4a1mr36205472ywc.17.1680542663172;
        Mon, 03 Apr 2023 10:24:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350ad/V1ooVQ/N2ZQ4nyhb9eVvGBhixeyI9j+9BNFCzwgX6kZrnhPj84MFUbXXBkcQRYVKRO2VQ==
X-Received: by 2002:a81:6606:0:b0:544:75c2:d4a1 with SMTP id a6-20020a816606000000b0054475c2d4a1mr36205444ywc.17.1680542662796;
        Mon, 03 Apr 2023 10:24:22 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id e123-20020a811e81000000b00545a08184b5sm2643334ywe.69.2023.04.03.10.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 10:24:22 -0700 (PDT)
Message-ID: <13b3266b-a410-77fd-5dfc-4e4994b630cd@redhat.com>
Date: Mon, 3 Apr 2023 13:24:21 -0400
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 gti-tac@lists.linuxfoundation.org, Khahil White <kwhite@linuxfoundation.org>
From: Carlos O'Donell <carlos@redhat.com>
Subject: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost of
 glibc migration.
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Konstantin,

The GTI TAC met on 2023-03-08 (please ignore the date typo 06-08):
https://lore.kernel.org/gti-tac/b72a0c4f-fed3-7418-e9d6-7a277bf37b3e@redhat.com/

There was consensus that we should start working through the process steps one
project at a time and pipe-clean the process and learn as we go.

I volunteered glibc as the first project because I know the most about the project
and the requirements.

I am providing the full list of glibc services for review and pricing by LF IT.

When I say "review" I am looking for a critical eye from LF IT where you might
recommend a better solution that you can support in the long term e.g. wiki,
bugzilla, mailing lists, mailing list archives, etc. Likewise for things we should
drop as legacy and not convert them over.

I expect that pricing depends on the final solution and the exact work to be done
so this will take some iteration. Likewise I expect pricing is split between NRE
for the shift vs. ongoing.

That means the the next steps likely look like this (needs further discussion):
* Iterate over the services below and discuss how and what to migrate them to.
* Start socializing with the glibc project community.
* Finalize on the approximate details of the migration and ongoing services.
* Finalize on the cost and timeline.
* Get the GTI TAC to review and approve.
* Get the GTI Board to review and approve.
* Take it to the glibc project for approval.
* Execute on timeline.

Complete set of known glibc services:

* mailing lists
  * Mailman 2 mailing lists: https://sourceware.org/mailman/listinfo/*
    * libc-announce
    * libc-alpha
    * libc-stable
    * libc-help
    * libc-locales
    * libc-testresults
    * glibc-cvs
    * glibc-bugs
    * glibc-bugs-regex (limited bugs just for regex).
    * Closed legacy mailing lists:
      * libc-ports: https://sourceware.org/mailman/listinfo/libc-ports
      * libc-hacker: https://sourceware.org/mailman/listinfo/libc-hacker
      * Also the older MHonArc archives (/legacy-ml/) - no longer updated, but the 
        /legacy-ml/ URLs and /ml/ redirects to them need to keep working.
        E.g. https://sourceware.org/legacy-ml/libc-alpha/2020-01/
        E.g. https://sourceware.org/legacy-ml/glibc-bugs-regex/2020-03/
    * Mailing lists accept non-html email only.
    * Run through spamassasin
    * Run through clamav
  * Pipermail archives:
    * https://sourceware.org/pipermail/*
    * e.g. https://sourceware.org/pipermail/libc-alpha/
  * public-inbox archives:
    * https://inbox.sourceware.org/*
    * e.g. https://inbox.sourceware.org/libc-alpha/
    * Not all inboxes work correctly e.g. glibc-bugs-regex doesn't work.
  * Migration notes:
    * Only supporting public-inbox for ml archives.

* bugzilla 5.0.4+
  * Uses backend SQL database of MariaDB 10.3
  * Must be able to send email to glibc-bugs mailing list.
    * Don't know how email is routed to this list.
  * Must also send email glibc-bugs-regex mailing list.
    * Don't know how email is routed to this list.
  * Must be able to send email to all users on the bug.
  * Must be able to receive email when someone responds to a glibc-bugs
    email e.g. sourceware-bugzilla@sourceware.org.
  * Custom Administration->Groups settings for User RegExp.
    * canconfirm: Allow certain domains to always be able to confirm bugs.
    * editbugs: Likewise but for editbugs.
  * Must have REST API enabled to allow RM to generate release list
    of fixed bugs using the glibc/scripts/list-fixed-bugs.py script
    e.g. https://sourceware.org/bugzilla/rest.cgi/
    * Implies that non-logged-in users can list and view all bugs
      that were fixed for the release.
  * Must have account creation disabled due to spamming.
  * Must have someone with Bugzilla admin access to:
    * Add new users to bugzilla.
    * Add new Product components, versions, and milestones.
    * Add new Key Words
    * Remove users.
  * Migration notes:
    * https://sourceware.org/bugzilla/
    * Consider starting fresh in new BZ instance and freeze old product.
    * glibc in old instance marked "Not open for new bugs."

* git 2.31
  * Allows per-user access to commit to the glibc repo.
  * Allows per-user access to commit to the legacy glibc-ports repo.
  * Uses group access to control repository access.
  * Must be able to send email to glibc-cvs mailing list with one
    email for each commit made by a developer to any branch of the repository.
  * AdaCore hooks need more thorough audit for required services.
    * Must be able to send email to bugzilla to update bugs.
      * Done by AdaCore hook 'file-commit-cmd'
      * Configured to use email-to-bugzilla-filtered command.
        * Uses connection to SQL database to determine if bug exists.
  * Currently uses shared AdaCore hooks configured via origin/meta/config 
    * Active hooks:
      * post-receive
        * AdaCore post_receive
        * /git/glibc.git/hooks-bin/post-receive
          * Triggers irkerhook.py (see notes below).
          * Does not work today, likely due to requirement to register OFTC user.
      * post-update
	* Standard git-update-server-info.
      * pre-receive
	* AdaCore pre_receive
    * AdaCore config:
      * No max line lengths.
      * Allow UTF-8 in commit messages.
      * 5MiB max email size.
      * Max 500 commit messages for larger commit series sent to glibc-cvs.
      * Reject merge commits to master and release branches.
      * Allow rebasing only private branches (non master and non release).
      * Run minimal style checker, nominally for whitespace issue rejection.
        * Run extra commit checking to avoid source address for author being wrong.
          * /git/glibc.git/hooks-bin/commit_checker
            * From email format checker. No special requirements.
        * /git/glibc.git/hooks-bin/style_checker
          * Style chcker. No special requirements.
      * Send email to bugzilla if a commit mentions a bug.
        * /git/glibc.git/hooks-bin/email-to-bugzilla-filtered
          * Uses /sourceware/infra/bin/email-to-bugzilla
          * Must be able to connect to bugzilla SQL database.
          * Does not appear to work today. We don't get emails for commits with bugs.
      * Send IRC message to per-project configured IRC channel.
        * Involves irkerhook.py and git config information for project.
        * Hook must be able to connect to external IRC networks to post IRC notices.
  * Migration notes:
    * Allow community to manage access?

* wiki
  * Uses MoinMoin 1.9.10
  * Must have account creation disabled due to spamming.
    * Uses EditorGroup permissions to allow any community member to add a new
      community member to the wiki e.g. human vetting another human.
  * Must be able to send notification emails.
  * Cron run to purge users not in EditorGroup to prevent wiki slowdown.
  * Migration notes:
    * Preference for something git based.

* patch management.
  * Uses patchwork v3.1.1.post18-g11cf1f3
  * Must be able to receive email (as part of collecting patch data)
  * Must be able to send emails as part of account verification.
  * Uses django for administration
  * Must allow authenticated REST API access for patchwork.
    * Currently rate limited.
    * Used by SLI tools (Carlos O'Donell)
      * Run manually on developer systems.
    * Auto-close on commit patchwork bot (Siddhesh Poyarekar)
      * Run on sourceware.org via cron.
  * Used for weekly patch management meetings.
  * git-pw integration used to access patchwork directly using REST API and API token.
  * Migration notes:
    * Patchwork a strong requirement for upstream CI/CD.

* Red Hat Bluejeans remote meeting system.
  * Must allow remote video and audio for participants around the world.
  * Allows weekly glibc patch review meetings for patch review collaboration.
  * Meetings must operate without host needing to be present so community can host.
    * Delegating host is difficult in bluejeans.
  * Managed by Bluejeans/Verizon.
  * The glibc community has switched to LF BBB instance for the last 24 meetings.
    * Since 2022-12-12 we have been using LF BBB instance successfully to host weekly meetings.
  * Migration notes:
    * Already migrated to LF BBB. NOP.

* pre-commit CI system.
  https://gitlab.com/djdelorie/glibc-cicd
  * Run inside a VM.
  * Uses networkless containers for further build isolation.
  * Highest risk system because it runs mailing list posted patches.
  * Event curation system (curator):
    * Must have network access to patchwork REST API.
    * Must have access to SQL database for storing state.
      * Currently using MariaDB.
    * Must allow runners to access curatore REST API URL.
    * One curator currently hosted by DJ Delorie.
  * Event running system (runner + trybots):
    * Must have network access to curator REST API.
    * Must have local network access to rabbitmq queue (job delegation)
    * trybots must have local network access to rabbitmq.
      * Must have network access to patchwork REST API to post results.
      * Must have network access to container registries to pull modern containers.
      * Must have network git access to pull updated glibc git repo.
    * Generally the runner and trybots are on one site together.
      * Avoid passing rabbitmq traffic beyond the local network.
      * Eventual emailing of results to the mailing list will happen via another bot
        that is distinct from this system to avoid the runners needing anything but
        restricted network access.
    * One runner hosted by DJ Delorie	
    * One i686 trybot hosted by DJ Delorie
    * One "patch applies" trybot hosted by DJ Delorie
  * Migration notes:
    * Could argue no migration required. LF hosts patcwork. Community hosts try bots.

* Website (sourceware.org)
  * CVS hosted website.
  * Static redirect to gnu.org website.
  * Migration notes:
    * Need something for a static site.

* Website (gnu.org)
  https://www.gnu.org/software/libc/
  * CVS hosted website uploads along with manual.
    * Manuals are generated with scripts in the CVS repo and generated files committed.
  * All static content.
  * Website automatically updated after CVS commits.
  * Manged by the GNU Project/FSF.
  * Migration notes:
    * No migration required see previous "Website (Sourceware.org)" entry.

* Release tarballs (ftp upload of gpg-signed release tarballs)
  https://ftp.gnu.org/gnu/libc/
  * Use gnupload script to gpg sign uploaded tarballs.
   * Uses ncftpput to place files into /incoming directories.
   * Network ftp access required.
  * Managed by the GNU Project/FSF.
  * Migration notes:
   * No migration required, would continue to upload to FSF.
   * Longer term discussion to use something more advanced.
   * Though good to have a backup following kernel best practice.

* Translation project services
  https://translationproject.org/html/welcome.html
  * https network access to TP servers to fetch uploaded translation files.
  * Managed by the Translation Project.
  * Migration notes:
    * Don't expect to have a replacement.

* IRC services on OFTC and Libera.Chat
  * Using #glibc on both networks for community interaction.
  * Migration notes:
   * Don't expect to have a replacement.

-- 
Cheers,
Carlos.

