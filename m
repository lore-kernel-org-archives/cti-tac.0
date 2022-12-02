Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FA11C26
	for <gti-tac@lists.linuxfoundation.org>; Fri,  2 Dec 2022 22:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE5788218E
	for <gti-tac@lists.linuxfoundation.org>; Fri,  2 Dec 2022 22:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE5788218E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KdKUOPbQ
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSX0w0PemKus for <gti-tac@lists.linuxfoundation.org>;
	Fri,  2 Dec 2022 22:56:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D286C82182
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D286C82182
	for <gti-tac@lists.linuxfoundation.org>; Fri,  2 Dec 2022 22:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670021812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W9i4dxE8pli681MQhKUB4Q0nHj/pvESo556U/UVcDmA=;
	b=KdKUOPbQAyXLmBvhdK/tGoeHQll7mUfJ7eYftPilt56oZVsq2C8DAUUTfWasVXP1N3QoM1
	JwEZsllfX9JipWErXdzM6+x4ULzPLXaRPv5nm3mYeuFlpxmfUvfDi26V4NBY2S9TAKXAoT
	6Salg0pGeI1FJK4FNmRERFs23w94UZI=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-dLpdyJR6MGm-5AKTL31HHA-1; Fri, 02 Dec 2022 17:56:51 -0500
X-MC-Unique: dLpdyJR6MGm-5AKTL31HHA-1
Received: by mail-il1-f200.google.com with SMTP id y12-20020a056e021bec00b00302a7d5bc83so6769421ilv.16
        for <gti-tac@lists.linuxfoundation.org>; Fri, 02 Dec 2022 14:56:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W9i4dxE8pli681MQhKUB4Q0nHj/pvESo556U/UVcDmA=;
        b=aKSWOSGqUfr8loWPEvwQXnUrBxtDRCrFdQZBkE2onwvTK+S/fn6pi3tZ68e8YmEQDJ
         Y6QSu5BZWpDILZSQvBS1kOYHVHfqKo4cl3s8pMX2oEHg80s9H3NJ7ARk+SawDcgqSa44
         w6yB+gwPMnuNhyWyqg2KJQI5j/opP+0zRUwIXIe318iLibisfWd04bxdLeHbiIozvnNm
         CwOJ7Kak6ZNKRiHkXpvnXx/Vf5c00ElFj0+HkWDlpo8r2QIFuX1IQ3jKMdTYtuTY9qwh
         PUZAfYvge+p7Ed5g1dAnUZhYrVxljvVKoK/qu7FnPiOBr5GU3afFxcbV5nhG07A7UvYJ
         MULA==
X-Gm-Message-State: ANoB5pkHxqa1wG8c7yEYifMidMFr14K8WVg52V6rGsG2mYLzQPoJWXuF
	D3EjXvqlDZMHoLPUrJxH4Q1G5+3g+qt37IANyD1pdnYXnuhE9KDz7boCMsdwd9HbEGzNL3dkb3i
	APHUp68mPbJP7aMLiyTF9ViqJpXURv/JB33x/2Vah4WVQADGkzp/9O00zAUgLg22+ikh50QLiaw
	dAQHpf
X-Received: by 2002:a5e:9405:0:b0:6a1:48d3:149e with SMTP id q5-20020a5e9405000000b006a148d3149emr26047343ioj.136.1670021810205;
        Fri, 02 Dec 2022 14:56:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5eO454krAY08BUby3COUru5ca/LRtrFmUKYfu5FnEfaLRkawV8BVBJXQG2SXn9T9dEacFLog==
X-Received: by 2002:a5e:9405:0:b0:6a1:48d3:149e with SMTP id q5-20020a5e9405000000b006a148d3149emr26047338ioj.136.1670021809785;
        Fri, 02 Dec 2022 14:56:49 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id y18-20020a92d812000000b00302aa2a202dsm2874290ilm.64.2022.12.02.14.56.48
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 14:56:49 -0800 (PST)
Message-ID: <804cee43-a120-3acf-a302-b1640f2285a9@redhat.com>
Date: Fri, 2 Dec 2022 17:56:48 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: gti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: First draft analysis of services used by glibc.
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The following are my notes on the services currently used by glibc.

Not all the services need migration, but having the complete list may
be valuable in future discussions around supply chain security. Some
of the services are being provided by 3rd parties e.g. FSF/GNU, TP,
Bluejeans/Verizon, DJ Delorie etc.

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

* wiki
  * Uses MoinMoin 1.9.10
  * Must have account creation disabled due to spamming.
    * Uses EditorGroup permissions to allow any community member to add a new
      community member to the wiki e.g. human vetting another human.
  * Must be able to send notification emails.
  * Cron run to purge users not in EditorGroup to prevent wiki slowdown.

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

* Red Hat Blejeans remote meeting system.
  * Must allow remote video and audio for participants around the world.
  * Allows weekly glibc patch review meetings for patch review collaboration.
  * Meetings must operate without host needing to be present so community can host.
    * Delegating host is difficult in bluejeans.
  * Managed by Bluejeans/Verizon.

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

* Website (sourceware.org)
  * CVS hosted website.
  * Static redirect to gnu.org website.

* Website (gnu.org)
  https://www.gnu.org/software/libc/
  * CVS hosted website uploads along with manual.
    * Manuals are generated with scripts in the CVS repo and generated files committed.
  * All static content.
  * Website automatically updated after CVS commits.
  * Manged by the GNU Project/FSF.

* Release tarballs (ftp upload of gpg-signed release tarballs)
  https://ftp.gnu.org/gnu/libc/
  * Use gnupload script to gpg sign uploaded tarballs.
   * Uses ncftpput to place files into /incoming directories.
   * Network ftp access required.
  * Managed by the GNU Project/FSF.

* Translation project services
  https://translationproject.org/html/welcome.html
  * https network access to TP servers to fetch uploaded translation files.
  * Managed by the Translation Project.

-- 
Cheers,
Carlos.

