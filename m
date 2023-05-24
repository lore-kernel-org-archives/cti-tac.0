Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF2C1FD0
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 19:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1453B41FB3
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 19:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1453B41FB3
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -3.953
X-Spam-Level:
X-Spam-Status: No, score=-3.953 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IifQ8jkMTt8c for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 19:42:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF16641E8F
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CF16641E8F
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 19:42:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.00,190,1681200000"; 
   d="scan'208";a="6394101"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 24 May 2023 11:42:09 -0800
IronPort-SDR: IaYsElhdhgqk8uKEtOCmLjsUKNDPvcRgI7YVMvZJN1CEAt92JwLsr4pUuT4/1X6fv6kxXHAUTY
 CgMV0CWOSZF9PKHav5jk3mDv6Uc72b3NHYcCLkKujDiU4lbJDipIHwk3+minfREFrDHUsL1T9x
 74Ox5T5Og8/Sa5DB1r9M7oYzun5mrozdFjU6l1ylpe/8m6+eVnnpPaxazdx926gsUagX6hZaub
 aioMj14n/b8oy6SnQ5B8WYIzu/b6E4YFR5W2ENHdh3CPdgJ/jUx6voRY/hPTEi0Fp93bN6Hc1l
 S1M=
Date: Wed, 24 May 2023 19:42:04 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: Siddhesh Poyarekar <siddhesh@gotplt.org>,
	<cti-tac@lists.linuxfoundation.org>
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost
 of glibc migration.
In-Reply-To: <20230524-gloating-diocese-cde658@meerkat>
Message-ID: <2c21256b-a9a2-77fc-33b4-7b3b735182aa@codesourcery.com>
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com> <20230523-ankle-infer-spurs-55ac6f@meerkat> <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com> <20230523-banks-calve-rio-844c98@meerkat> <7f11ed34-9529-9b3a-e720-64bd3a85542c@codesourcery.com>
 <20230523-cease-candle-debase-dd7485@meerkat> <cd8ad55d-38c5-72f1-3464-b5968d1f8fde@codesourcery.com> <20230524-december-goon-09e728@meerkat> <a4c8b242-7ab1-a0da-fbe0-19cffe1a6054@gotplt.org> <20230524-gloating-diocese-cde658@meerkat>
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

> 2. At best, a maintainer can modify someone's patch to introduce a deliberate
>    bug, not freely modify a commit somewhere in recent history to add
>    significant chunks of code like an admin can.

Modifying an already-visible commit will be very obvious when anyone who 
has the original commit tries to pull, given that there should never be 
non-fast-forward pushes (to master, release branches or shared development 
branches) so people pulling (without local changes on the branch being 
pulled to) expect a fast-forward update.

-- 
Joseph S. Myers
joseph@codesourcery.com
