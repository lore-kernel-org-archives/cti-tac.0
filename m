Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ADE19BC1
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 16:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2835642533
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 16:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2835642533
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=WkIEu1d7
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
	with ESMTP id EKH3g3G1QAyp for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 16:29:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC06B42532
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EC06B42532
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 16:29:42 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-62382e86f81so6091956d6.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 09:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684945782; x=1687537782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wcOe3imBEv7/ytBO7FwDojhn+QWB2DIa7mCOWTgMfZU=;
        b=WkIEu1d7l66JQhaia9BGdzx4RtePrkCXsCrzN2f1sBXF8RJtppxuBm31KRirgjS57X
         YeFf20ISoFcexOewx5sJxdZ5MZBVcNNcvnfBn9K3vhkSfavzXfATPkOGsucJszGYeycc
         NEu3RxptxLsBTW4iQOlCb1CrPaRZz7ukiQsvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684945782; x=1687537782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcOe3imBEv7/ytBO7FwDojhn+QWB2DIa7mCOWTgMfZU=;
        b=QXukuqKlo/WGPl8KPcFM3te4pBk5EymDASa3fCQa23l/Ow/DczSABFPsVV5QHvJewF
         5m+v/2LYNqwceXjmYxgx2FMbOULh4PY7UD+boImpo19bX2AyGejeGAqEl7vNBtKfESId
         WfEsOok2FLm2EUKMtwgIlc/gYi3SGqox2QguYthyAXGwNMfqw2kBQRyr38yazfbOiCcC
         +hO6THF5aAvv5cWiIe5LIi3Rge93REIspNOur4buHyTRHL2tPgwCLv60+SbL26WwT1w+
         QBGeeAkqhNsWHAA1EfqHjPsclySl8Xv/hAyUSW3ER9q45R0xaS+50dw3dJTHwu+gqrPT
         0Qug==
X-Gm-Message-State: AC+VfDxe6dVANMcgUIYyrGspdakP8T0HqVtQA0VQmKBkZRM/hmD13u8g
	C4tg26TtwU6SmL82rvY+YhPI6WFHuxYKZR76rE7olg==
X-Google-Smtp-Source: ACHHUZ7N5X8iX6HWPvUfIFoWOUp3gYYqi4gUBmDF/CMxNxcHi4Ul7wkUy6AWCkyf1MjPgg1CF/h9Fw==
X-Received: by 2002:ad4:5dcd:0:b0:620:a1be:c74d with SMTP id m13-20020ad45dcd000000b00620a1bec74dmr24539110qvh.37.1684945781677;
        Wed, 24 May 2023 09:29:41 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id ph2-20020a0562144a4200b0061b67ae2ff9sm3688481qvb.121.2023.05.24.09.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 09:29:41 -0700 (PDT)
Date: Wed, 24 May 2023 12:29:39 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Joseph Myers <joseph@codesourcery.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost of
 glibc migration.
Message-ID: <20230524-december-goon-09e728@meerkat>
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
 <20230523-ankle-infer-spurs-55ac6f@meerkat>
 <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com>
 <20230523-banks-calve-rio-844c98@meerkat>
 <7f11ed34-9529-9b3a-e720-64bd3a85542c@codesourcery.com>
 <20230523-cease-candle-debase-dd7485@meerkat>
 <cd8ad55d-38c5-72f1-3464-b5968d1f8fde@codesourcery.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cd8ad55d-38c5-72f1-3464-b5968d1f8fde@codesourcery.com>

On Tue, May 23, 2023 at 10:12:20PM +0000, Joseph Myers wrote:
> > Can you please describe the lifecycle of a patch and how it gets from "user
> > sends a change to the mailing list" to "that patch becomes a commit in the
> > official project repository where it lives forever."
> 
> A patch is sent to the list.  There are some number of review / revision 
> rounds, ending with a reviewer or maintainer saying it is OK to commit (or 
> OK after some specified changes, or OK in the absence of objections within 
> some given period, etc.).  If the person posting the patch has commit 
> access, they commit it; otherwise they should ask the maintainer to do so 
> for them.  Maintainers of parts of the compiler may commit their patches 
> without someone else reviewing them.

This workflow has one important problem -- you must ultimately trust the
integrity of your infrastructure. It would be very easy for a malicious actor
with access to backend infrastructure to insert a commit into the repository
without it being discovered:

1. they can override any server-side validations
2. they can disable email notifications
3. they can forge the Committer identity of the commit

With your current workflow nobody would find out that such commit has been
inserted into the history because everyone must rebase their commits anyway,
so having a push rejected due to newer remote commits is a routine situation
(as opposed to a being a huge red flag in a repository where only one or two
committers are allowed to write).

Similarly, since most commits end up being rebased, there can be no post-fact
validation to find out if there are any commits that did not go through
review -- their patch-id would likely no longer match the mailing list
submission anyway (at least, there would be too many false-positives).

This situation could be partially mitigated if commits were cryptographically
signed, but they don't appear to be.

GCC and other projects are sufficiently high targets that we should not trust
the infrastructure to be secure or admins to be above being bribed or forced
under duress.

> Anyone with commit access can create their own branches in their 
> refs/users/ namespace if they wish, and use them without needing review 
> for commits going there.  Shared development branches under 
> refs/heads/devel/ have whatever rules are established by the people 
> setting up those branches.

From the git backend perspective, this is not optimal, because the resulting
packs contain extra objects that aren't interesting to most cloners. For
example, if I only leave refs/heads and refs/tags in the gcc repository, I get
rid of over 1.1 million extra objects (from 3.9 million to 2.8 million) and
the pack shrinks from 1.8GB to 1.1GB.

To me, it makes more sense to separate this into multiple repositories and
relegate vendor/user branches to their own trees. They still share objects
behind the scenes, but packs and cloning is much more optimized.

-K
