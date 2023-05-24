Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A83C13A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 18:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2553F4061F
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 18:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2553F4061F
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
	with ESMTP id MT6tUynpaUjS for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 18:46:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B13C405D3
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9B13C405D3
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 18:46:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.00,190,1681200000"; 
   d="scan'208";a="7147045"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 24 May 2023 10:46:23 -0800
IronPort-SDR: eRdTiaKx+5JMGx7u8OVqGcC8xUJzd9DlbBkpPNSXg0xCmmHxbJHCviP1m3SJyD6ShlzHHSNzhL
 jpI2BjV6Mm1N5s3fJ2Z3A9eJjalgY5FtEIs6FJFxlxYbqALSPOCxm2sEybc9fjMKG4BGTC3JZx
 ngnyFWlLkkE79RBmzn3iX37uCb262MKazP3RTvrSisgtwxDd+wT2EsNaGMZlyBcXaA5Kb/5mCx
 h/HvNAWXk5HYSjD/xAWqxYK2XVBirf5pzy4XIZO0oBmQ51xTmPJaIbxkakyxkg8N+zWf7/qvN2
 +yw=
Date: Wed, 24 May 2023 18:46:16 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: Carlos O'Donell <carlos@redhat.com>
CC: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	<cti-tac@lists.linuxfoundation.org>
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost
 of glibc migration.
In-Reply-To: <50134537-f7ad-e618-cf86-937d185f3e4d@redhat.com>
Message-ID: <a9ba2c32-c46b-24fa-d0ea-9471717ed242@codesourcery.com>
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com> <20230523-ankle-infer-spurs-55ac6f@meerkat> <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com> <50134537-f7ad-e618-cf86-937d185f3e4d@redhat.com>
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

> If we removed all the hooks, what is the consequence of a commit that is 
> wrong? Can we just fix the sources with a subsequent commit? Add a 
> light-weight linting check in 'make check' that additionally reports 
> this?

The consequence, at least for GCC, is that other scripting that depends on 
certain invariants of commits falls over.  Mapping from SVN revisions to 
git commits relies on only a single commit matching a given From-SVN 
commit message pattern rather than such a commit message getting quoted in 
another commit message in a way that confuses the mapping.  ChangeLog 
generation falls over if there are various problems with commit contents 
or messages.

-- 
Joseph S. Myers
joseph@codesourcery.com
