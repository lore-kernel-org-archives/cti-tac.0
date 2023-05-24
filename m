Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3303519523
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 18:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB0F883C5D
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 18:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB0F883C5D
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
	with ESMTP id Kau_W5wy9C3c for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 18:58:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB65D83A8B
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CB65D83A8B
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 18:58:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.00,190,1681200000"; 
   d="scan'208";a="7113335"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 24 May 2023 10:58:57 -0800
IronPort-SDR: 7rb7/8E1/GF5bTd2kWUMlpqXyMDoOZq+9PH7Pbp8/guNuvmN4MRjc+VPD0g1YorqKK0PNKlCKr
 Dq5VhNAPO3b+LaFrSJywkoJL/rrEb049Xa7+lDrICFYX16JViQFKpHzmL8YvEmXgAqA6+MlSe3
 ZhNLbUGy9euANMCdLAtOtESgq0P8YcLcoirJIfF57BwH0imrlqfEYgf6ap23Not9JCWhkkgeAB
 //CEfLle3ekS7nDlTcfYpcjkz6JjlKyeX7XO2EnmcUzAFkPa6PXh5ChmCMLwtv0CFLK4NkYDGr
 aII=
Date: Wed, 24 May 2023 18:58:53 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <cti-tac@lists.linuxfoundation.org>
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost
 of glibc migration.
In-Reply-To: <20230524-december-goon-09e728@meerkat>
Message-ID: <c222c43-6cc6-954f-cfcf-885c0b140ec@codesourcery.com>
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com> <20230523-ankle-infer-spurs-55ac6f@meerkat> <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com> <20230523-banks-calve-rio-844c98@meerkat> <7f11ed34-9529-9b3a-e720-64bd3a85542c@codesourcery.com>
 <20230523-cease-candle-debase-dd7485@meerkat> <cd8ad55d-38c5-72f1-3464-b5968d1f8fde@codesourcery.com> <20230524-december-goon-09e728@meerkat>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-13.mgc.mentorg.com (139.181.222.13) To
 svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10)

On Wed, 24 May 2023, Konstantin Ryabitsev wrote:

> This workflow has one important problem -- you must ultimately trust the
> integrity of your infrastructure. It would be very easy for a malicious actor

Hence the importance of limiting access to infrastructure - and limiting 
what pieces of infrastructure have access to what others (rather than the 
present arrangements where many different services run on the single 
system with the master repository and with permissions allowing to write 
to it).

> 1. they can override any server-side validations
> 2. they can disable email notifications

A commit entering the repository without appearing on the mailing list is 
itself suspect.  (It can happen, but it's very rare; maybe about once a 
year for GCC.  The only cause I know of is a bug in the commit email 
generation that makes it fall over when the diffs are not valid UTF-8.)  
In the GCC case the commit emails include sequential numbers since the 
last release branched off; the motivation of those numbers isn't to make 
missing emails easy to spot (rather, they help with Jakub's system for 
speeding up bisection by having a large number of prebuilt compilers from 
different past revisions), but they do make missing emails easy to spot as 
a side effect.

> This situation could be partially mitigated if commits were cryptographically
> signed, but they don't appear to be.

It's quite possible commit signatures would be a useful thing to introduce 
in future.

> > Anyone with commit access can create their own branches in their 
> > refs/users/ namespace if they wish, and use them without needing review 
> > for commits going there.  Shared development branches under 
> > refs/heads/devel/ have whatever rules are established by the people 
> > setting up those branches.
> 
> From the git backend perspective, this is not optimal, because the resulting
> packs contain extra objects that aren't interesting to most cloners. For
> example, if I only leave refs/heads and refs/tags in the gcc repository, I get
> rid of over 1.1 million extra objects (from 3.9 million to 2.8 million) and
> the pack shrinks from 1.8GB to 1.1GB.

See what I said in the GCC service analysis about use of delta islands to 
make this efficient.  The configuration there is:

[pack]
        island = refs/heads/
        island = refs/tags/
        island = refs/(vendors/[^/]+)/
        island = refs/(users/[^/]+)/
        island = refs/(git-(svn-)?old)/
        island = refs/(dead)/
        island = refs/(deleted)/
        island = refs/(meta)/

(I don't think the other projects do anything this complicated with refs 
that aren't fetched by default, only GCC.)

-- 
Joseph S. Myers
joseph@codesourcery.com
