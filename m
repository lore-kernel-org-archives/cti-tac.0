Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B637D60849
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 20:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B35A403A9
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 20:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B35A403A9
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -3.953
X-Spam-Level:
X-Spam-Status: No, score=-3.953 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 83_Xg1nvW1oD for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 20:48:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F6A54026F
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2F6A54026F
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 20:48:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.00,190,1681200000"; 
   d="scan'208";a="7121412"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 24 May 2023 12:48:25 -0800
IronPort-SDR: 8iR5nq9bRSBa8dKj8cvUsn8DZAQhAYLrRT4XuaQ3Wg3oQSz+8frTyBibTZvklbmIgUG11khLqG
 RF4tvH0JEmC8FdD3aoMOOib4Nef0yt1AA3TxFIkOcy5Gdm6g8R8kz7/eXKfQg3L/WxLI9kZHI3
 MWRYRd+9fTIfG4f33KLcN4CjksnwPR6WAZKIln9K5LoX0g/Hjcm3eXf+7CbZPA9mTm6bXjB7EI
 fNLv7EgAoRqh1bqbbP+T8g7ujP+BD1K/DGrpp2mI1ZKTPLWqlf0E+CLNZ/dsoZtF4+TOcI4DJA
 BLg=
Date: Wed, 24 May 2023 20:48:19 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: Carlos O'Donell <carlos@redhat.com>
CC: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	<cti-tac@lists.linuxfoundation.org>
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost
 of glibc migration.
In-Reply-To: <926be414-95da-8d4c-c407-816701ac48b6@redhat.com>
Message-ID: <b1fa024-2144-2645-bdc5-96588a529cf0@codesourcery.com>
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com> <20230523-ankle-infer-spurs-55ac6f@meerkat> <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com> <50134537-f7ad-e618-cf86-937d185f3e4d@redhat.com> <a9ba2c32-c46b-24fa-d0ea-9471717ed242@codesourcery.com>
 <926be414-95da-8d4c-c407-816701ac48b6@redhat.com>
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

On Wed, 24 May 2023, Carlos O'Donell wrote:

> (1) CVS/SVN read-only repositories.
> 
> If the GCC community decides not to keep the read-only CVS and SVN 
> repositories in favour of the git repository with all the currently 
> converted history, then does this remove some of the more complex git 
> hooks?

No.  The point of logic that looks for From-SVN: (and thus requires no new 
commits to have a line in the commit message starting From-SVN:) is 
precisely to convert from an SVN commit reference in e.g. an old email or 
bug report to a corresponding git commit, *without* referring to the 
read-only SVN repository.  I'm expecting the read-only repository to be 
made available as a downloadable tarball/dump rather than continuing to be 
served with the SVN protocol.

> (2) Changelog invariant checking.
> 
> ChangeLog generation as I understand it is a concatenation of the commit 
> message ChangeLog snippet (Nightly update_version_git), and already 
> would need manual editing if someone makes a mistake e.g. 
> 32582c190b91287a0d1239162333f5ad0ac81e72 in gcc where Jakub adjusts the 
> entries? Does dropping this hook create more work for you and Jakub and 
> Richie to udpate malformed ChangeLog entries for the day? Who gets email 
> if the update fails?

Manual work is rarely needed, generally only if there is a bug in the hook 
that means the hook fails to reject a commit but the nightly ChangeLog 
generation falls over (see the total of seven commits listed in 
git_update_version.py:IGNORED_COMMITS that resulted in such issues).  
Almost all the time when someone makes a mistake in the commit message 
formatting that would affect that nightly generation, it's caught by the 
hook and never gets into the repository.

-- 
Joseph S. Myers
joseph@codesourcery.com
