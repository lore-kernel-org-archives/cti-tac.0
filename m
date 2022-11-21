Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B949D7FE
	for <gti-tac@lists.linuxfoundation.org>; Mon, 21 Nov 2022 03:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ECE460B10
	for <gti-tac@lists.linuxfoundation.org>; Mon, 21 Nov 2022 03:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ECE460B10
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=adacore.com header.i=@adacore.com header.a=rsa-sha256 header.s=google header.b=DcP9DzLz
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
	with ESMTP id 8JT-cL9VeKwR for <gti-tac@lists.linuxfoundation.org>;
	Mon, 21 Nov 2022 03:31:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2528C60655
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2528C60655
	for <gti-tac@lists.linuxfoundation.org>; Mon, 21 Nov 2022 03:31:19 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i12so14110536wrb.0
        for <gti-tac@lists.linuxfoundation.org>; Sun, 20 Nov 2022 19:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adacore.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X5VAiXxJDEm7BngQQtXTbBa7f6WT+E6YR4SKgn7htxk=;
        b=DcP9DzLz/U1ZTCQLu8i3Ooppr1+I2Q/BKALcBwSv7Kd/fmK2a1PJJ1DhF3Kr8trtwE
         ENyYu9x+GIGZx+9VvPZ6L0DxVhWmWKi4WF/HPFyrtKumwIWIilj1fBhMQm6O6Alhd9re
         SgCiMb9tfVZZLjpnnjjukvTa54xILMZrCImXDL69IEpA4DqCumaqd9SMUI5K5fldbIcF
         AHessLasUNaCoh9EQbjsxLsTeYcjob/sl9W2axpEZPz+kkysI4XAcGjkyaRiLoWTzJ0y
         j667XtySw/uOG2jd5OqdPFYok3bi+/2qREguqSjihi2a8awDU67hsKAYDOprRLjleN2Q
         /U1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5VAiXxJDEm7BngQQtXTbBa7f6WT+E6YR4SKgn7htxk=;
        b=OILZM3KHGKmaYGjqwTW+WdzEa3bt4K3v275QUQu2/9uhdS4tF0qw4C99+NOXKgM/CP
         /20/fqnmjobPvfI4yhAukaPcT7NiOOaeey9aEmLMUaIPQEiH0DquKFcCsheQeYLHkshS
         ogSv1M9KhylQk1DEWUSmEfCAEb8Ig6zyXsQGeMaK/knRnyozjz31fbwd/pb+bC9vWruf
         AVSYAF1RHy6FiJJovq1IMfhq8iowQmx+FlmTdVrbWrVQvg4XA6Z8auk9xZImsRS6J7Ne
         ktAviVo+sUXn/gF2WQRTNJZ8DfFGICU3oK8dDhbcjIVAiIG5j3vxLunitz2snSFGk+LH
         olDQ==
X-Gm-Message-State: ANoB5plAf0AyUipUyN8FGd64JMIr26MVIEFmlFzVP1/S7UsoTP7SoUJX
	fq22P4BTZ0SsPyGWIFBlEdFn
X-Google-Smtp-Source: AA0mqf7Zuo/qYggsr8xm51Ys2Y+z4CFOfrTUlb6sjQpr2rKlj6eqIQzoCpNRneKLKYRn0s60caCeBg==
X-Received: by 2002:a5d:6110:0:b0:22c:dd11:7cac with SMTP id v16-20020a5d6110000000b0022cdd117cacmr9338304wrt.205.1669001477162;
        Sun, 20 Nov 2022 19:31:17 -0800 (PST)
Received: from takamaka.gnat.com ([2a01:cb22:1d5:1100:532e:3a44:e715:b01b])
        by smtp.gmail.com with ESMTPSA id i3-20020adffc03000000b00241b2b23cd5sm11968189wrr.54.2022.11.20.19.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 19:31:16 -0800 (PST)
Received: by takamaka.gnat.com (Postfix, from userid 1000)
	id F3B8D81B5A; Mon, 21 Nov 2022 07:31:13 +0400 (+04)
Date: Mon, 21 Nov 2022 07:31:13 +0400
From: Joel Brobecker <brobecker@adacore.com>
To: Carlos O'Donell <carlos@redhat.com>
Cc: gti-tac@lists.linuxfoundation.org,
	Joel Brobecker <brobecker@adacore.com>
Subject: Re: Action: Setup working group for the GNU Toolchain proposal to
 migrate to LF IT managed services
Message-ID: <Y3rxAYa/oc5s/R/7@adacore.com>
References: <3a81d482-c952-d501-f495-485f00400e85@redhat.com>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a81d482-c952-d501-f495-485f00400e85@redhat.com>

> Details:
> 
> - Working group will enumerate in detail the GNU Toolchain project services
>   for the projects including gcc, glibc, binutils and gdb.

Here is what Simon and I could think of for GDB:

* Git Repository
* Web-based navigation of the Git repository
  https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git
* git-hooks

* Website
    - Handwritten pages (in a CVS (!) repository)
    - scripts generating website contents (doc, ARI, etc)

* [methodology can be rediscussed, but for now, we have the following
  workflow]

  SSH access to the machine hosting the website, as the scripts above
  generating website contents are run by the release manager, after
  having ssh'ed onto sourceware.org.

* Wiki

* bug tracker (bugzilla)

* Not sure if we want to change this or not, but sourceware.org
  also offers FTP download of releases, pre-releases, and snapshots.

  Releases are made available on ftp.gnu.org as well, and I do not
  think we want to change that part.

* Some scripts spawned from the git-hooks, due to the binutils-gdb's
  git-hooks config:

  - /[...]/binutils-gdb.git/hooks-bin/commit-extra-checker.py

    Verifies that we do not have this issue:

        # With commits created using "git am" of patches sent via the gdb@ or
        # gdb-patches@ mailing list, it's possible that the author information
        # gets changed into "xxx via xxx@sourceware.org". Catch and reject those,
        # so the person doing the push can fix this before the push is allowed.

  - /sourceware/infra/bin/email-to-bugzilla

        Sends a copy of commit messages to bugzilla if commit
        has a PR number in it.

  - /git/binutils-gdb.git/hooks-bin/post-receive

        Calls the irker (IRC notification of new commits)

  We'll need a way to get those installed on the machine hosting
  the git repository, and hopefully also a convenient way for us
  to allow testing before deployment (right now, we SSH to
  sourceware.org).

* patchwork
  (https://patchwork.sourceware.org/project/gdb/list/)

  Simon reports that this instance doesn't get much use at the moment,
  because it gets filled so quickly and is impossible to keep up to date.

  I (Joel) think that the project really needs to have a proper
  review system. It's too time-consuming and ineffective to have each
  maintainer do its own tracking. So having a review system that GDB
  Maintaniers are willing to adopt is very important, IMO. Maybe
  patchwork can fit the bill, or maybe it might be another system.
  Something for Simon and I perhaps to discuss with the other GDB
  maintainers?

-- 
Joel
