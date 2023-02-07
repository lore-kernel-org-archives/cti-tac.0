Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB6733C8
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 17:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FB3980B91
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 17:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FB3980B91
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U4htz9uk
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
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nad08M7wE18E for <gti-tac@lists.linuxfoundation.org>;
	Tue,  7 Feb 2023 17:25:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D028681426
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D028681426
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 17:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675790714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/8OxssTSgCpdKGn+Is7+UVmK11txfYYXZxRLF5BtYQ=;
	b=U4htz9ukkQVHez3CKPXwMvSq+8lB35/uhX0QLFe3e8dZiV0hJKFn2zDjJOPvYQgre1NO1V
	qmGdiESridKOeLYQ8D5kZXGTnmqZZNvqWBznF2WqwTZ8zb/Q8J7zkbcGDl1Z8iT4MiZh0E
	S1g2HZtbyv9wrDxOBlR+EfTD4UN99dw=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-443-KANAuzM3PUWK8Y5XQq9bEA-1; Tue, 07 Feb 2023 12:25:12 -0500
X-MC-Unique: KANAuzM3PUWK8Y5XQq9bEA-1
Received: by mail-il1-f198.google.com with SMTP id l5-20020a056e020e4500b00313cbbd4729so4311321ilk.13
        for <gti-tac@lists.linuxfoundation.org>; Tue, 07 Feb 2023 09:25:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/8OxssTSgCpdKGn+Is7+UVmK11txfYYXZxRLF5BtYQ=;
        b=R1jhL+Y0PEYuGPY5AkXkBwME0DPn1XiD8ulVJiIiyoa1Ygiv68zjMaELwrRpRjhi17
         /7MryIeMnbTMFKNru/D59iyOLnozhv8vHh85LQnErdHNdbmzK76g3K6osQsW8DAWyyeu
         3wY4RE8qyh3/vCfxe69R4zvPYmiKVSqfrWZLOKuHamNDOxS4lLQaIyxjN9YUvHtx85ev
         ptC4uzBukWDaYiNlZaLKqUN4kApiceFdDfLXUb5njER+dF2OAwowAp8r+4u0cdwUODt4
         SqVXIzMdrN4bZhjjY8o6BDLvkbd/aKBRboYuDTQ5c5dRpHMvgB4g/LZ7X5rp4eaqJLTw
         3L5w==
X-Gm-Message-State: AO0yUKVuxeOZSGKcdulBklVSsYtpmiyJetS4U67uuQ+1b87Ue2lMvs3B
	Pkn/wzHJrIpnSLNUhD8iyCjKPSR7BrG5x7gKOqSxpL2jInOMkvadLTiS64/zwNMQaicrQaVKH25
	ccBQMoIJFdPOKT4QZzh+LzJV/4Iy11H8=
X-Received: by 2002:a92:a810:0:b0:313:b792:3da3 with SMTP id o16-20020a92a810000000b00313b7923da3mr3228784ilh.27.1675790711510;
        Tue, 07 Feb 2023 09:25:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+Lz3XmXDdiWbAIT0nyMZNIBBgPTuXnTXzjBZ4Awl2wuUCo7iZ3vmg7hbSCtn9c3ovrOj2Fiw==
X-Received: by 2002:a92:a810:0:b0:313:b792:3da3 with SMTP id o16-20020a92a810000000b00313b7923da3mr3228763ilh.27.1675790711130;
        Tue, 07 Feb 2023 09:25:11 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id v11-20020a05663812cb00b003b77432cc37sm3538081jas.106.2023.02.07.09.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 09:25:10 -0800 (PST)
Message-ID: <e10610f2-9c15-8fa4-ddd0-d010aa72203e@redhat.com>
Date: Tue, 7 Feb 2023 12:25:09 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: CY23 - Status of service enumeration.
To: Nick Clifton <nickc@redhat.com>, Simon Marchi
 <simon.marchi@efficios.com>, gti-tac@lists.linuxfoundation.org
References: <d8790f60-483b-dfc6-dd7f-cb408334eb40@redhat.com>
 <bc978ef9-3d6e-d032-252b-3aae460c895a@efficios.com>
 <4718eb70-b843-0f46-9555-cbba58f70713@redhat.com>
 <5e2916df-018d-e591-4301-910c0ac269d1@redhat.com>
 <5bc78ab3-f8e8-c7e3-2f73-05617bbc6c6e@redhat.com>
 <679ba29a-24c7-6684-a565-0e5d5db05b19@redhat.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <679ba29a-24c7-6684-a565-0e5d5db05b19@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/7/23 09:41, Nick Clifton wrote:
> Hi Carlos,
> 
>> It would be great to have a full list similar to the gdb one :-)
> 
> Right - here we go.
> --------------------------------------------------------------------
>                Services used by the GNU Binutils project

Thank you Nick!

The list looks great.

Are there any cron scripts that binutils might be using directly?

Just trying to think of anything we might have missed.

> 
> * Git Repository
>   * Need push access
>   * Ability for project maintainers to request push access for new
>     contributors (or to do it themselves)
>   * Ability for users to create user-branches (e.g. users/simark/foo),
>     which will be ignored by the notification-sending script.
> 
> * Git hooks
> 
>   * git-hooks (https://github.com/AdaCore/git-hooks) installed in
>     the binutils-gdb.git repository.
> 
>   * binutils-gdb.git's git-hooks configuration pointing to the following
>     scripts locally installed on the machine hosting the repository,
>     to which the binutils & GDB admins need access (currently done
>     via SSH access)
> 
>       - binutils-gdb.git/hooks-bin/email_to.py
>         Small python script which determine which mailing-list(s) to use
>         when sending commit email notifications. No special requirements
>         other than a Python3 interpreter.
> 
>       - binutils-gdb.git/hooks-bin/commit-extra-checker.py
> 
>         Verifies that we do not have this issue:
> 
>         # With commits created using "git am" of patches sent via the gdb@ or
>         # gdb-patches@ mailing list, it's possible that the author information
>         # gets changed into "xxx via xxx@sourceware.org". Catch and reject those,
>         # so the person doing the push can fix this before the push is allowed.
> 
>         No special requirements other than a Python3 interpreter.
> 
>     Note - although the comment refers to gdb mailing lists, this hook also
>         catches sent to the binutils mailing lists.
> 
>       - /git/binutils-gdb.git/hooks-bin/style_checker
> 
>         An empty script at the moment (set because the git-hooks require
>         it to be set).
> 
>       - /sourceware/infra/bin/email-to-bugzilla
> 
>         A perl script whose maintainership is unclear. Comments at
>         the beginning of the script mention David Hampton <hampton@cisco.com>
>         as contributor and Greg A. Woods <woods@web.net> as having "greatly
>         hacked" it. Beyond that, don't know.
> 
>           . The goal is that when a commit is pushed to the git
>             repository, we check for any mention of a Bugzilla bugs, and
>             post a message to those bugs
>           . It accesses the Bugzilla database directly to check if a given bug
>             number exists (could easily be changed to use some HTTP request)
>           . It posts to bugzilla by sending an email to a local email account
>             (Joel: I think sourceware-bugzilla@localhost)
> 
>         Joel's note: If I understood the script correctly, then there
>         must be a handler in the local MTA to catch those emails and
>         send them to bugzilla for further processing. Don't know how
>         that works, though.
> 
>       - binutils-gdb.git/hooks-bin/post-receive
> 
>         Bash wrapper scripts which essentially calls the following
>         script: /usr/local/bin/irkerhook.py. I suspect the origin
>         of this script is this github repository:
>         https://gitlab.com/esr/irker
> 
>         If not, ISTR that it was Tom Tromey who got it installed,
>         so we could ask him.
> 
>   * The git-hooks themselves send emails about commits to the binutils-cvs
>     mailing list (each repository configures the destination, and for
>     binutils-gdb, this this a "dynamic" configuration via the email_to.py
>     script mentioned above allowing the destination to vary depending
>     on which files got modified, whether they are binutils fils or GDB
>     file, or both).
> 
> * Web-based navigation of the Git repository
>   * Need to be able to browse the git repository online
>   * https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git
>   * If it exists, a more featureful git web frontends would be nice, one
>     that allows searching files by name for instance.
>   * URLs to a given commit in the Web UI should be easily computable
>     using their SHA1; e.g.
>         "https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=%(rev)s"
>     We use those in the commit emails being sent by the git-hooks.
> 
> * Mailing lists
>   * Those I know for sure are used / useful:
>     * binutils@
>     * binutils-cvs@ (now misnamed, but can be used to follow commits to the repo)
>   * There is also:
>     * bug-binutils@gnu.org
>         which is effectively the same as the binutils@sourceware.org list,
>         but hosted by the FSF.
> 
> * Mailing list web interface
>   * The original one, which I find not so useful now that we have
>     public-inbox: https://sourceware.org/pipermail/binutils/
>   * However, old links need to keep working
>   * public-inbox or something equivalent is necessary:
>     * have a way to browse easily message threads that span multiple
>       months / years
>     * have a way to download raw messages, to apply patches locally
> 
> * Website
>   * Handwritten pages in a couple of CVS repositories:
>     - The gnu.org copy is maintained on https://savannah.gnu.org/;
>     - The sourceware.org copy is maintained on sourceware.org itself,
>       in /cvs/gdb/htdocs
>     - It used to be that both versions were kept in sync by duplicating
>       all the commits in both repositories. But this was recently changed
>       in favor of installing redirects from the gnu.org website to
>       the sourceware.org. This was the first step towards a possible
>       transition of the web-pages to Git.
>   * The documentation part of the website is created by building the
>       relevant files locally and then uploading them to the website.
>   * SFTP access to the machine hosting the website is used in order to
>       upload new or edited files and to change symbolic links.
> 
> * Wiki
>   * Currently, anyone with write access can give someone else write access.
>   * At the very least, we need a way for project maintainers to request
>     write access for a new member, or do it themselves
> 
> * Bug tracker (bugzilla)
>   * Sends notifications of new bugs and comments to binutils@
>   * Sends notifications of comments on a bug to users who are watching
>     that bug
>   * Accepts replies by email, both from users and from the
>     email-to-bugzilla script.
> 
> * Release hosting
>   * Releases, the release manager must be able to upload there
>     * https://sourceware.org/pub/binutils/releases/
>   * Pre-release snapshots are available here:
>     * https://sourceware.org/pub/binutils/snapshots/
> ------------------------------------------------------------------------
> 

-- 
Cheers,
Carlos.

