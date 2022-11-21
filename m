Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0AD7FE
	for <gti-tac@lists.linuxfoundation.org>; Mon, 21 Nov 2022 03:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5430560B10
	for <gti-tac@lists.linuxfoundation.org>; Mon, 21 Nov 2022 03:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5430560B10
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=adacore.com header.i=@adacore.com header.a=rsa-sha256 header.s=google header.b=Hk8/jzL7
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VhHTV7Pd3ovx for <gti-tac@lists.linuxfoundation.org>;
	Mon, 21 Nov 2022 03:32:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CEA560655
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2CEA560655
	for <gti-tac@lists.linuxfoundation.org>; Mon, 21 Nov 2022 03:32:27 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id cl5so17977817wrb.9
        for <gti-tac@lists.linuxfoundation.org>; Sun, 20 Nov 2022 19:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adacore.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CjW4nExcIdZqjNBI9vwoIqNk82vmtjmF2FLH7SUxj1Y=;
        b=Hk8/jzL7gFTlTeXTR6JrCInC2rQoI4jGdO/CLedorIGVJjkwcpfEC4ZU+S8cFfFoCo
         qozE45lYMJoUfK+pW/K9PHV9jwQ9/wG5VQRowwxCSxueBS6tuID/p93nYXWsvppyVEld
         S1lQ8KDe/4AoUCYLSEBKlY0h21bxsd9Z2iC3vTGP7pC/Og8sHZ1yVJ0zUVmtXs730R3y
         Tieggg99tm1T/dVnAJM0gnFEO0gYqUX/TvCkRh2eBLg0ekj3pGTflb2b0kvUVALS89qQ
         AtpVe56oehy6kpC/JJl03YWJga/yBeuob2pEZfYX3tVu8Gm87HtLncvV1TlASRbG9xCz
         Gq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjW4nExcIdZqjNBI9vwoIqNk82vmtjmF2FLH7SUxj1Y=;
        b=Qj2jSS7eTISfNRB4BKOEYGLha2ramEBvL8WC54CDBXfbId5WB+IfeUEq5aIGs30YZE
         bRozcbAwKP96fw2WrQ9CAtaX20SMFZ+4E5HlGTXj/V9DBL/uz/quiPCT4gAywMh+C4ZR
         OUzcM4q4tBSUw7zj7xgFCZ8HsiMV9eLV0aU7O9NSSLKVySKPxf/8HQAcPxwxq4PKoIG7
         GFgeI+hIgde6xB3sVEm8p/BCFshyL90+XlA+TohAByETfsAwnXvwlxHacLwjdFyNH/PZ
         uKKD7kIrOlqOYaSF+70sMIg1eqoq5x3oVBGQOKcYsoPU83pvY53D0BB8/hx+ERk4ZapI
         bwwg==
X-Gm-Message-State: ANoB5pnzAByZTXlfvPoWIfuJoHvC8ql4T+WWI188m5gzPQom8u9k3d0q
	i20/nHZeSyLBCOuZeGjYjS5O
X-Google-Smtp-Source: AA0mqf7WVXuKHt1lY9SArRv9YldUhlG8vx5Xb3cB510sHmGfemejgHfKJPoRzwfkcUBZUcvsG3yzOg==
X-Received: by 2002:a5d:6807:0:b0:241:a2a6:d205 with SMTP id w7-20020a5d6807000000b00241a2a6d205mr9630147wru.46.1669001545326;
        Sun, 20 Nov 2022 19:32:25 -0800 (PST)
Received: from takamaka.gnat.com ([2a01:cb22:1d5:1100:532e:3a44:e715:b01b])
        by smtp.gmail.com with ESMTPSA id fc10-20020a05600c524a00b003cf9bf5208esm18174303wmb.19.2022.11.20.19.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 19:32:24 -0800 (PST)
Received: by takamaka.gnat.com (Postfix, from userid 1000)
	id D280681B5A; Mon, 21 Nov 2022 07:32:22 +0400 (+04)
Date: Mon, 21 Nov 2022 07:32:22 +0400
From: Joel Brobecker <brobecker@adacore.com>
To: Carlos O'Donell <carlos@redhat.com>
Cc: gti-tac@lists.linuxfoundation.org,
	Joel Brobecker <brobecker@adacore.com>
Subject: Re: Action: Setup working group for the GNU Toolchain proposal to
 migrate to LF IT managed services
Message-ID: <Y3rxRmca6K5enhTv@adacore.com>
References: <3a81d482-c952-d501-f495-485f00400e85@redhat.com>
 <Y3rxAYa/oc5s/R/7@adacore.com>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3rxAYa/oc5s/R/7@adacore.com>

I forgot one item that Simon pointed out to me (sorry!)

> Here is what Simon and I could think of for GDB:
> 
> * Git Repository
> * Web-based navigation of the Git repository
>   https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git
> * git-hooks
> 
> * Website
>     - Handwritten pages (in a CVS (!) repository)
>     - scripts generating website contents (doc, ARI, etc)
> 
> * [methodology can be rediscussed, but for now, we have the following
>   workflow]
> 
>   SSH access to the machine hosting the website, as the scripts above
>   generating website contents are run by the release manager, after
>   having ssh'ed onto sourceware.org.
> 
> * Wiki
> 
> * bug tracker (bugzilla)
> 
> * Not sure if we want to change this or not, but sourceware.org
>   also offers FTP download of releases, pre-releases, and snapshots.
> 
>   Releases are made available on ftp.gnu.org as well, and I do not
>   think we want to change that part.
> 
> * Some scripts spawned from the git-hooks, due to the binutils-gdb's
>   git-hooks config:
> 
>   - /[...]/binutils-gdb.git/hooks-bin/commit-extra-checker.py
> 
>     Verifies that we do not have this issue:
> 
>         # With commits created using "git am" of patches sent via the gdb@ or
>         # gdb-patches@ mailing list, it's possible that the author information
>         # gets changed into "xxx via xxx@sourceware.org". Catch and reject those,
>         # so the person doing the push can fix this before the push is allowed.
> 
>   - /sourceware/infra/bin/email-to-bugzilla
> 
>         Sends a copy of commit messages to bugzilla if commit
>         has a PR number in it.
> 
>   - /git/binutils-gdb.git/hooks-bin/post-receive
> 
>         Calls the irker (IRC notification of new commits)
> 
>   We'll need a way to get those installed on the machine hosting
>   the git repository, and hopefully also a convenient way for us
>   to allow testing before deployment (right now, we SSH to
>   sourceware.org).
> 
> * patchwork
>   (https://patchwork.sourceware.org/project/gdb/list/)
> 
>   Simon reports that this instance doesn't get much use at the moment,
>   because it gets filled so quickly and is impossible to keep up to date.
> 
>   I (Joel) think that the project really needs to have a proper
>   review system. It's too time-consuming and ineffective to have each
>   maintainer do its own tracking. So having a review system that GDB
>   Maintaniers are willing to adopt is very important, IMO. Maybe
>   patchwork can fit the bill, or maybe it might be another system.
>   Something for Simon and I perhaps to discuss with the other GDB
>   maintainers?

* buildbot
  (https://builder.sourceware.org/buildbot/#/builders?tags=gdb).

-- 
Joel
