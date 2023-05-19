Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05108186E
	for <cti-tac@lists.linuxfoundation.org>; Fri, 19 May 2023 22:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AAD240242
	for <cti-tac@lists.linuxfoundation.org>; Fri, 19 May 2023 22:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AAD240242
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -3.954
X-Spam-Level:
X-Spam-Status: No, score=-3.954 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_PASS=-0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tu9ewUBpDVbc for <cti-tac@lists.linuxfoundation.org>;
	Fri, 19 May 2023 22:54:25 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECCEF401A1
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
	by smtp2.osuosl.org (Postfix) with ESMTPS id ECCEF401A1
	for <cti-tac@lists.linuxfoundation.org>; Fri, 19 May 2023 22:54:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.00,178,1681200000"; 
   d="scan'208";a="6615155"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 19 May 2023 14:47:16 -0800
IronPort-SDR: fx+awa1+xVs+f8yPxLkubf/aOjQfzcu3n8NH/IU466ocPCmZIqi9cGXRFLLlUSXF65tmE7+w7I
 qo0GkOid7ef1OTnOUH4gI2fSrdME1G5Kbm+VQJJs8rz+nBTvZ5xLrC6xn/tzsPVUAUbcEZovEn
 TE/9gxWMReLG7ONewCM6x468NxB8klSYfFz7HaR3zaLYrwDRjqRbqGuXL6yOJs8RSbjPZN9hz2
 7GBNlFuXNE6O8+aN0j1gZGhXbnDRCYB2VZTxFn7l8FZnAFWP4DXMePcn5EBLGW+8pWZvi9POym
 JPo=
Date: Fri, 19 May 2023 22:47:10 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: <cti-tac@lists.linuxfoundation.org>
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost
 of glibc migration.
Message-ID: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-14.mgc.mentorg.com (139.181.222.14) To
 svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10)

On Fri, 19 May 2023, Konstantin Ryabitsev wrote:

> Our mailing list infrastructure is uniquely tailored to public-inbox users,
> with messages being written to the archives *before* they are even sent out to
> subscribers, which helps speed up access for users who aren't using the

There is a certain advantage there regarding the problem we currently have 
where messages sent as HTML are missing from public-inbox archives, if the 
process that strips HTML parts takes place before feeding to public-inbox 
(whereas at present it takes place after that, I think).

(I consider it important that we do *not* insist on contributors meeting a 
shibboleth of sending plain-text email before they can interact with our 
mailing lists, especially for user lists such as libc-help - we should be 
friendly to people sending email in the ordinary form they are used to 
using today even if we might rather they didn't send HTML email - we 
shouldn't impose that view of proper email on them.)

> The major improvement of this vs. bugzilla's native email interface is that
> bugs can be created from mailing list discussions, not just the other way
> around. The bugbot will need to be slightly adjusted for CTI needs, but
> otherwise I think it would be a better solution than Bugzilla's native email
> integration. For example, when bugmail is sent to the mailing list and someone

Note that people can send email to Bugzilla in reply to a message they 
received directly from Bugzilla - not just in reply to a message on 
glibc-bugs.  I think it's important that both cases of replying should 
work automatically, however that's implemented.

(If someone replies to a glibc-bugs message and forgets to remove 
glibc-bugs from their reply, the list gets two copies of the message at 
present - one that the user sent directly, one forwarded by Bugzilla.  
Avoiding that duplication somehow would be nice to have, but entirely 
optional.)

Note also that Bugzilla is one of the hardest migration issues (for 
non-GCC projects), because (as I mentioned in one of the meetings) 
Sourceware Bugzilla is used by many different projects, most of which are 
not part of CTI.

> * Sending per-commit email to mailing lists -- this seems like a vestigial
>   feature from the pre-git past. Does it really serve any purpose? I am
>   fighting to kill a similar feature used on the kernel.org side, because I do
>   not see any remaining legitimate use for it -- it just creates a lot of mail
>   traffic that nobody really reviews.

I think it's extremely useful to have those messages for watching out for 
commits that shouldn't have gone in or went in in an unintended form (this 
is for human-determined "shouldn't" or "unintended" - not anything 
expected to be covered by automated checks).  And also to have a message 
ready-made to reply to when something was committed without being posted 
to the mailing list.

> * We do not currently allow direct hooks on the server side, because running
>   arbitrary scripts with the permissions of the git server is a very bad
>   anti-pattern when it comes to repo security. It also tends to make pushes
>   super slow and frustrating to developers, especially those working on slow
>   or unstable connections that can go rapidly stale, resulting in failed
>   pushes.
> 
>   So, we will need to wrap our collective heads around what your hooks are
>   doing now and implement them via alternative means. For example:

Certainly some kind of system for proxying / containing checks to limit 
what they can do if buggy makes sense - they don't need to run with the 
permissions of the git server, they can run in some kind of isolation, as 
long as they prevent bad commits from getting into the history.

>   * denying force-pushes to specific branches (rebase/non-fast-forward
>     updates) is a native feature of Gitolite

What about denying merge commits on master and release branches?

Note that GCC has its own custom set of namespaces for branches (under 
refs/users/ and refs/vendors/) and rules about what branch names may be 
created at all etc.  (Unfortunately there seem to be some missing checks 
for the case of lightweight tag creation, resulting in some improperly 
named tags being present.)

>   The only thing that would require more work is style checkers and other CI
>   functionality that really should not be happening on-push. I suggest that
>   this moves entirely to patchwork CI, discussed below.

I think those things *should* be happening on push - to prevent obviously 
bad history getting onto master or release branches (at least) in the 
first place.  For glibc, that's (apart from the non-fast-forward checks 
and rejecting merge commits on branches meant to have linear history):

* Disallowing lines with trailing whitespace in certain files.

* Disallowing commits with a mailing list address as the author email 
(even if your mailing list setup is designed to be DKIM-safe so author 
emails don't need rewriting, people might still use "git am" with old 
messages, so this remains relevant).

* Disallowing commit subject lines that look like a ChangeLog header.

* Disallowing single-word (or empty) commit subject lines.

For GCC there are several extra checks that I enumerated - including, in 
particular, the fairly complicated checks for ChangeLog format to avoid 
the nightly cron job updating ChangeLogs falling over.  (The check to 
avoid From-SVN: lines is similarly to prevent a commit that would cause 
subsequent problems for automation that relies on those lines only being 
present in commits converted from SVN in order to look up such a commit by 
SVN commit number.)

> ## Release tarballs
> 
> There are multiple ways of getting this done, including completely automated.
> For example, stable kernel releases are generated server-side by using and
> verifying the PGP signature found in a git note attached to the release tag.
> This doesn't work if the tarball is not directly generated from a git
> repository (for example, if config scripts must run first).

Is "git archive" output or similar actually stable enough that the server 
can reliably generate (at any time in the future, with a future git 
version) a tarball matching the tarball signature the release manager 
generated at release time, or is that not what you meant?

I'd certainly expect the tarballs served as release tarballs to be 
byte-for-byte identical to the ones at https://ftp.gnu.org/gnu/glibc/ (and 
the signatures likewise to be identical).

-- 
Joseph S. Myers
joseph@codesourcery.com
