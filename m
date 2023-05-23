Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2E31F934
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 19:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD88883F59
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 19:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD88883F59
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
	with ESMTP id ffJgpzQpai3h for <cti-tac@lists.linuxfoundation.org>;
	Tue, 23 May 2023 19:42:04 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD14C83F51
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AD14C83F51
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 19:42:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.00,187,1681200000"; 
   d="scan'208";a="6279870"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 23 May 2023 11:34:55 -0800
IronPort-SDR: PlfX8uvpiED732gYz4bZtNFWoOPIU4V/IVFFECeNdSSfM9PK7878neLcfBruFZWjNSYPPNUxY8
 HRSzj1HlYc9pvxNwMxqto+Tm1Twdjjx6NoXwXkVsuBFUD65DOrEVEXe7Pb5MWadpEUY2LwB1Fh
 pZTP7U0+S2i31Cnorr1xCwucw22SBB0/hu+2sMxPJJF2e2bhOqN1YPlXLUIBnOPR95ntrOkMV8
 BHoNfOCOQnmYWozQGOlm+EFknnRaqcjOPPLLxk3SIOubwEgCPzPEc9qd8/hsW5dd0L85yyfwjC
 3s8=
Date: Tue, 23 May 2023 19:34:52 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <cti-tac@lists.linuxfoundation.org>
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost
 of glibc migration.
In-Reply-To: <20230523-ankle-infer-spurs-55ac6f@meerkat>
Message-ID: <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com>
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com> <20230523-ankle-infer-spurs-55ac6f@meerkat>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10) To
 svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10)

On Tue, 23 May 2023, Konstantin Ryabitsev wrote:

> > (I consider it important that we do *not* insist on contributors meeting a 
> > shibboleth of sending plain-text email before they can interact with our 
> > mailing lists, especially for user lists such as libc-help - we should be 
> > friendly to people sending email in the ordinary form they are used to 
> > using today even if we might rather they didn't send HTML email - we 
> > shouldn't impose that view of proper email on them.)
> 
> It's possible, but it is an empirical fact that permitting HTML messages
> raises the amount of spam that goes through by several orders of magnitude.
> Allowing it per-list is okay and normal (e.g. the list aimed at newbies and
> people seeking occasional help). However, I think it is perfectly normal to
> disallow it on development lists where one is already expected to follow a
> fairly rigid set of rules.

The toolchain lists universally allow mail from non-subscribers, and I 
think most can expect sometimes to be included in discussions involving 
people who are not particularly active developers of that particular 
project (but may still be relevant to include in that individual 
discussion).

When allowing HTML through to the lists (with or without any form of 
moderation) we should make sure public-inbox properly archives those 
messages that include HTML.

> If you insist, though I still think this is the case of "everyone assumes that
> someone else is paying attention to it." I am highly critical of setups that
> fire messages into the ether in hopes that someone checks them. 

People do in practice monitor the commit emails.

> There are better ways of doing it that don't generate email, e.g.:

For projects using email for development, commit emails have the obvious 
advantage of not adding yet another different system to watch.

> > What about denying merge commits on master and release branches?
> 
> I'm not sure I understand -- you mean, all commits must have a single parent
> and have a fully linear structure?

Yes.  We use linear history (on master and release branches) for GCC and 
glibc.  (Shared development branches use merge commits for merging master 
into the branch.  Ones in the users and vendors namespaces might use 
merges or might be rebased, depending on the policy for the individual 
branch.)

> Doesn't that make it super difficult to resolve conflicts?

No.

> > I think those things *should* be happening on push - to prevent obviously 
> > bad history getting onto master or release branches (at least) in the 
> > first place.  For glibc, that's (apart from the non-fast-forward checks 
> > and rejecting merge commits on branches meant to have linear history):
> > 
> > * Disallowing lines with trailing whitespace in certain files.
> > 
> > * Disallowing commits with a mailing list address as the author email 
> > (even if your mailing list setup is designed to be DKIM-safe so author 
> > emails don't need rewriting, people might still use "git am" with old 
> > messages, so this remains relevant).
> > 
> > * Disallowing commit subject lines that look like a ChangeLog header.
> > 
> > * Disallowing single-word (or empty) commit subject lines.
> 
> In my view these all should be happening on the client as pre-commit checks,
> not on the server. Any reason why they can't run on the client, e.g. via a
> framework like https://pre-commit.com/ ?

A server can't ensure that the user's clone has any particular custom 
configuration.  We have some optional configuration 
(gcc-git-customization.sh), but there's no requirement to use it.  
Checking on push is much more reliable than expecting custom configuration 
on the user's side.

-- 
Joseph S. Myers
joseph@codesourcery.com
