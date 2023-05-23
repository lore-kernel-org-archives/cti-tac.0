Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7268A1F934
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 19:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0729341FAE
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 19:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0729341FAE
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=A4YFiIs0
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
	with ESMTP id viyC_NHH5ceT for <cti-tac@lists.linuxfoundation.org>;
	Tue, 23 May 2023 19:53:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E1A541FAA
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8E1A541FAA
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 19:53:02 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-3f690149f13so1014971cf.1
        for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 12:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684871581; x=1687463581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IQxliDUHC0wZPbVvtveLV33ShQJhnztMJg791n4gduA=;
        b=A4YFiIs0XW63n9xHZgtQZIta/jBiBQ75Im1sEtiesEo2Qg8WzG6mtFHzO6pD0QAOv/
         pvX5O9/2ASncrlPfzlp2aGM9EvjYEWE9J3KJ4noE+LL/PsVdqrwijx/iInooCOjl0pN+
         y0kaTi9F/+mpWQihNzYZbHYxX31ZoTo+hvEAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684871581; x=1687463581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQxliDUHC0wZPbVvtveLV33ShQJhnztMJg791n4gduA=;
        b=foq1lNtFIXSjIAfd6aAZ9+sgysHLN4PRYerOL6/SgnPMD9cBR5nbo4bGOKD4NH4xOb
         RGJixVYri87XBpheoxUdBofocEFEqWRZESpkcPtDOszACdYsBATVfCzKViRrk7dE4mZl
         631hMFsLABaTTOV69TqBxOaT/Z/ygXqhwulKQnGl6i6Jg4gXqhqCxX98EjRia4w2+Wcc
         IjH9NUkpPJDYy0SMe1wuPY8j40SICVjiHgpcER+WyPjdkOVv8b3TTAYzGgBuJKsTWrCY
         HxwY9WCMA0+AJ4M8jNVzKMl4GQ3RizBclVqyw0wRzJKcl4kxflywLMAQQVEwlT++4MHC
         9/gA==
X-Gm-Message-State: AC+VfDxx8lDf4v7/pUvU43KJ5zl4G1xzR3R2aD0jNlprBlCo0q9mehNa
	rsmL/yo+UBsQxMRmqhaDYMm/Uv000X3LebV88SsZmA==
X-Google-Smtp-Source: ACHHUZ6VOesYm/S2oob6XS6Rw3PK+0mBXWWDd/am4GNDHbKNVLHzteYhpDwCvnrUFFviMXi0tTVr5w==
X-Received: by 2002:a05:622a:1898:b0:3f4:e0cc:739c with SMTP id v24-20020a05622a189800b003f4e0cc739cmr21953920qtc.27.1684871581348;
        Tue, 23 May 2023 12:53:01 -0700 (PDT)
Received: from nitro.local ([204.48.95.153])
        by smtp.gmail.com with ESMTPSA id k5-20020ac81405000000b003ee4b5a2dd3sm2377572qtj.21.2023.05.23.12.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 12:53:01 -0700 (PDT)
Date: Tue, 23 May 2023 15:52:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Joseph Myers <joseph@codesourcery.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost of
 glibc migration.
Message-ID: <20230523-banks-calve-rio-844c98@meerkat>
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
 <20230523-ankle-infer-spurs-55ac6f@meerkat>
 <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com>

On Tue, May 23, 2023 at 07:34:52PM +0000, Joseph Myers wrote:
> > It's possible, but it is an empirical fact that permitting HTML messages
> > raises the amount of spam that goes through by several orders of magnitude.
> > Allowing it per-list is okay and normal (e.g. the list aimed at newbies and
> > people seeking occasional help). However, I think it is perfectly normal to
> > disallow it on development lists where one is already expected to follow a
> > fairly rigid set of rules.
> 
> The toolchain lists universally allow mail from non-subscribers, and I 
> think most can expect sometimes to be included in discussions involving 
> people who are not particularly active developers of that particular 
> project (but may still be relevant to include in that individual 
> discussion).
> 
> When allowing HTML through to the lists (with or without any form of 
> moderation) we should make sure public-inbox properly archives those 
> messages that include HTML.

Yes, that's always been the case -- public-inbox does not do any filtering, it
just archives whatever the mailing list allows through.

> > If you insist, though I still think this is the case of "everyone assumes that
> > someone else is paying attention to it." I am highly critical of setups that
> > fire messages into the ether in hopes that someone checks them. 
> 
> People do in practice monitor the commit emails.

Okay, if you insist -- after all, we do the same thing for all kernel commits.
I just find it a pretty terrible waste of resources, as I'm pretty sure 99% of
everyone who subscribes to that list has set things up to go to a folder that
they never check.

> > > I think those things *should* be happening on push - to prevent obviously 
> > > bad history getting onto master or release branches (at least) in the 
> > > first place.  For glibc, that's (apart from the non-fast-forward checks 
> > > and rejecting merge commits on branches meant to have linear history):
> > > 
> > > * Disallowing lines with trailing whitespace in certain files.
> > > 
> > > * Disallowing commits with a mailing list address as the author email 
> > > (even if your mailing list setup is designed to be DKIM-safe so author 
> > > emails don't need rewriting, people might still use "git am" with old 
> > > messages, so this remains relevant).
> > > 
> > > * Disallowing commit subject lines that look like a ChangeLog header.
> > > 
> > > * Disallowing single-word (or empty) commit subject lines.
> > 
> > In my view these all should be happening on the client as pre-commit checks,
> > not on the server. Any reason why they can't run on the client, e.g. via a
> > framework like https://pre-commit.com/ ?
> 
> A server can't ensure that the user's clone has any particular custom 
> configuration.

Okay, perhaps I'm not fully grokking the picture. How many people are able to
push to master/release branches? I was expecting it to be 1-2, maybe a handful
of people, but perhaps it's a much wider set of developers?

-K
