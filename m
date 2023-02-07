Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A12EBD33
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 14:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA82F60F9F
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 14:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA82F60F9F
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WlgJUrEg
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.103
X-Spam-Level:
X-Spam-Status: No, score=-2.103 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6pQLAGz4L9Mk for <gti-tac@lists.linuxfoundation.org>;
	Tue,  7 Feb 2023 14:41:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A96EA61019
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A96EA61019
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675780871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mCSMpbxUwmlccZ21tUETJr1jTDNV1hFPvS5e2+8K62Y=;
	b=WlgJUrEgLhdtfxekS/qPX3GblhkHzxymsgooOfHhN93HzvyWUMqHzlReLAlEQviQP9AWgF
	OHSackFUTTkfF9pS71LjP97W39op4SxnUAp5TNafrCz+60YY5nwAdccjfyeMAaa4xCkD2a
	YQNZ2RYthtFug4kgUy2xm9j4On7RBos=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-527-wbBauVqrPjGAQh3SqDVRXw-1; Tue, 07 Feb 2023 09:41:10 -0500
X-MC-Unique: wbBauVqrPjGAQh3SqDVRXw-1
Received: by mail-qt1-f199.google.com with SMTP id a24-20020ac84d98000000b003b9a4958f0cso8604875qtw.3
        for <gti-tac@lists.linuxfoundation.org>; Tue, 07 Feb 2023 06:41:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mCSMpbxUwmlccZ21tUETJr1jTDNV1hFPvS5e2+8K62Y=;
        b=wdbMHjsrg9m8Z4/3vtUU6O2YgB23oJiRaQ2HAfqybISwDIl9W0JCbN3FAO/Vwhtx4L
         3ZzWlLk6L0+PmrEo0+3+z4VYqAr1KSfLfLjhR1prElbxaqWA/YTLP5dAUGr5frlAAbjj
         u5N765g3QRSBX6xBEcJ4UlldK+k9YIjlVXU74f+woSBAQUZKLADKZJSO6l9lm+8roEZu
         1CGRWpg7lOqPgURbs4Y70sbREDZUaBlvyKP+Qllc9jGer64AGGSecV5FpKUdd5nehXPT
         PCTB4WW0mmIpPXxJ61zL5Y0oIoEAzx3YBG5KKLTU+wiYbxktjDFBf0Wg9X3LtPFkjzRJ
         jNtQ==
X-Gm-Message-State: AO0yUKUhCy8LQjg++bwDBXi9BCEDSo+PDkPX80ux3bhvrmTWByoHaX6k
	4wDcDJw7OnaetyEqy8G184JtKx2Tn2IF7cAWmRnTHM7yk5tXWLPQGkcKXBELcz/eQmE/r1VBmf+
	lNcjCI6JPtOuk511fVhxqqjSYTxvBu87w/m+Q
X-Received: by 2002:a05:6214:1251:b0:53b:38e:3782 with SMTP id r17-20020a056214125100b0053b038e3782mr5957921qvv.18.1675780869013;
        Tue, 07 Feb 2023 06:41:09 -0800 (PST)
X-Google-Smtp-Source: AK7set9pi5dbsC9V9m0WwMY5c5NcJGQwt4wEsAKNExkLq2jazEZjFu7LlxSv23OURpC2m14QgGPESg==
X-Received: by 2002:a05:6214:1251:b0:53b:38e:3782 with SMTP id r17-20020a056214125100b0053b038e3782mr5957884qvv.18.1675780868714;
        Tue, 07 Feb 2023 06:41:08 -0800 (PST)
Received: from [192.168.1.18] ([79.123.83.169])
        by smtp.gmail.com with ESMTPSA id 129-20020a370787000000b00729a26e836esm9546753qkh.84.2023.02.07.06.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 06:41:08 -0800 (PST)
Message-ID: <679ba29a-24c7-6684-a565-0e5d5db05b19@redhat.com>
Date: Tue, 7 Feb 2023 14:41:06 +0000
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Carlos O'Donell <carlos@redhat.com>,
 Simon Marchi <simon.marchi@efficios.com>, gti-tac@lists.linuxfoundation.org
References: <d8790f60-483b-dfc6-dd7f-cb408334eb40@redhat.com>
 <bc978ef9-3d6e-d032-252b-3aae460c895a@efficios.com>
 <4718eb70-b843-0f46-9555-cbba58f70713@redhat.com>
 <5e2916df-018d-e591-4301-910c0ac269d1@redhat.com>
 <5bc78ab3-f8e8-c7e3-2f73-05617bbc6c6e@redhat.com>
From: Nick Clifton <nickc@redhat.com>
Subject: Re: CY23 - Status of service enumeration.
In-Reply-To: <5bc78ab3-f8e8-c7e3-2f73-05617bbc6c6e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlos,

> It would be great to have a full list similar to the gdb one :-)

Right - here we go.
--------------------------------------------------------------------
                Services used by the GNU Binutils project

* Git Repository
   * Need push access
   * Ability for project maintainers to request push access for new
     contributors (or to do it themselves)
   * Ability for users to create user-branches (e.g. users/simark/foo),
     which will be ignored by the notification-sending script.

* Git hooks

   * git-hooks (https://github.com/AdaCore/git-hooks) installed in
     the binutils-gdb.git repository.

   * binutils-gdb.git's git-hooks configuration pointing to the following
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

	Note - although the comment refers to gdb mailing lists, this hook also
         catches sent to the binutils mailing lists.

       - /git/binutils-gdb.git/hooks-bin/style_checker

         An empty script at the moment (set because the git-hooks require
         it to be set).

       - /sourceware/infra/bin/email-to-bugzilla

         A perl script whose maintainership is unclear. Comments at
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

   * The git-hooks themselves send emails about commits to the binutils-cvs
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

* Mailing lists
   * Those I know for sure are used / useful:
     * binutils@
     * binutils-cvs@ (now misnamed, but can be used to follow commits to the repo)
   * There is also:
     * bug-binutils@gnu.org
         which is effectively the same as the binutils@sourceware.org list,
         but hosted by the FSF.

* Mailing list web interface
   * The original one, which I find not so useful now that we have
     public-inbox: https://sourceware.org/pipermail/binutils/
   * However, old links need to keep working
   * public-inbox or something equivalent is necessary:
     * have a way to browse easily message threads that span multiple
       months / years
     * have a way to download raw messages, to apply patches locally

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
   * The documentation part of the website is created by building the
       relevant files locally and then uploading them to the website.
   * SFTP access to the machine hosting the website is used in order to
       upload new or edited files and to change symbolic links.

* Wiki
   * Currently, anyone with write access can give someone else write access.
   * At the very least, we need a way for project maintainers to request
     write access for a new member, or do it themselves

* Bug tracker (bugzilla)
   * Sends notifications of new bugs and comments to binutils@
   * Sends notifications of comments on a bug to users who are watching
     that bug
   * Accepts replies by email, both from users and from the
     email-to-bugzilla script.

* Release hosting
   * Releases, the release manager must be able to upload there
     * https://sourceware.org/pub/binutils/releases/
   * Pre-release snapshots are available here:
     * https://sourceware.org/pub/binutils/snapshots/
------------------------------------------------------------------------

