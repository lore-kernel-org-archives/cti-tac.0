Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0491D15BF
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 18:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AC45404F1
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 18:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AC45404F1
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
	with ESMTP id pmI6idOIPFr7 for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 18:44:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96C15403C9
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 96C15403C9
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 18:44:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.00,190,1681200000"; 
   d="scan'208";a="7146862"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 24 May 2023 10:44:19 -0800
IronPort-SDR: WXvCrfo0TeO//KKXvnKzht63tOjmkqKQF8cw5EF0LYcXRy+Ws8axFPb9G61Q1bsRe6CALJqmDG
 hTfALxlcSW+KtnWYI1XKk5iSq4MOJ+AmtT3+/qCk4Ex7MLL2NRR3wJ39ZYS1BMIbh8AVuVwCeg
 KnkKP151ePzIfHiabo9hsDJT6QipjI4R45YmBx2gmuyYP15HANBhTO7fJ3WXSxKLNa6m36xfkB
 QWhRv3Yx96FFvNMYQ+5jZD/VYUL+uZt/3tsI+ZOndo7QvGZxQ5lWC9CD6z75sjT0ns1x2On3oN
 HTw=
Date: Wed, 24 May 2023 18:44:12 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: Siddhesh Poyarekar <siddhesh@gotplt.org>
CC: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	<cti-tac@lists.linuxfoundation.org>
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost
 of glibc migration.
In-Reply-To: <1d8d7313-515f-2811-a710-5eca2ed42e39@gotplt.org>
Message-ID: <d1a3b6ca-0a3-374a-9a52-e2839b9b6f1@codesourcery.com>
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com> <20230523-ankle-infer-spurs-55ac6f@meerkat> <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com> <20230523-banks-calve-rio-844c98@meerkat>
 <1d8d7313-515f-2811-a710-5eca2ed42e39@gotplt.org>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-11.mgc.mentorg.com (139.181.222.11) To
 svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10)

On Wed, 24 May 2023, Siddhesh Poyarekar wrote:

> There's probably a viable middle ground here for glibc, where commits that
> don't have an entry in patchwork get sent to the list.  Given the current
> traffic for libc-alpha, it won't add much overhead to libc-alpha and also meet
> auditing requirements.

I think this is overly complicating things.  (Though it would be good for 
glibc to have the check done for GCC that once a commit is in the 
repository, emails aren't sent out again for a merge of that commit into a 
user / vendor / development branch.)

> For the release/* branches, it probably makes more sense to send the commits
> to libc-stable, thus removing the need for developers to send [committed X.Y]
> to the list.  This should then limit the utility of glibc-cvs to private
> branch pushes.  I doubt if anybody cares about pushes to private branches, do
> they?

I think commits to user / vendor branches can be of interest.  They may 
suggest things that would be worth adding to master (even if the original 
author didn't think of them as appropriate for master, or loses interest 
in them), for example.

-- 
Joseph S. Myers
joseph@codesourcery.com
