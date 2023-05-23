Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9FBBA55
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 22:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 582B64207B
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 22:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 582B64207B
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
	with ESMTP id sfMH-8UR58wa for <cti-tac@lists.linuxfoundation.org>;
	Tue, 23 May 2023 22:12:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6E3241E9C
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D6E3241E9C
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 22:12:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.00,187,1681200000"; 
   d="scan'208";a="6256995"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 23 May 2023 14:12:25 -0800
IronPort-SDR: M4ZgI7te1QIxRIyFaD4ROsXSDwVSuGsy50JjxGjUQQ4oQZsmTMiHCchenUiiliCKf0+nt1jbRx
 hpixYJ+e4/MzsM6Wujk/YxOCj39JwtufCua5j4cSaD3VmWZQkrVLZ9h09utt7ln3ZsE1SBv4+1
 5bFK/QJcTzKMtliIfJdiW23nsNJ9EoxJTDoXOGauBkvyhTLYHzjjWHaKRPocxrNSJMnxY2lxyW
 tc77qpHaunXymP5d+De0PPCQF+sTp2v9h0ZL4TDgIrRuVebWc+drCx+2V3I8k5/NawoHhZchl+
 Uy8=
Date: Tue, 23 May 2023 22:12:20 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <cti-tac@lists.linuxfoundation.org>
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost
 of glibc migration.
In-Reply-To: <20230523-cease-candle-debase-dd7485@meerkat>
Message-ID: <cd8ad55d-38c5-72f1-3464-b5968d1f8fde@codesourcery.com>
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com> <20230523-ankle-infer-spurs-55ac6f@meerkat> <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com> <20230523-banks-calve-rio-844c98@meerkat> <7f11ed34-9529-9b3a-e720-64bd3a85542c@codesourcery.com>
 <20230523-cease-candle-debase-dd7485@meerkat>
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

> Can you please describe the lifecycle of a patch and how it gets from "user
> sends a change to the mailing list" to "that patch becomes a commit in the
> official project repository where it lives forever."

A patch is sent to the list.  There are some number of review / revision 
rounds, ending with a reviewer or maintainer saying it is OK to commit (or 
OK after some specified changes, or OK in the absence of objections within 
some given period, etc.).  If the person posting the patch has commit 
access, they commit it; otherwise they should ask the maintainer to do so 
for them.  Maintainers of parts of the compiler may commit their patches 
without someone else reviewing them.  (There are also reviewers who can 
approve other people's patches in their area of the compiler but not their 
own - and global reviewers can approve patches anywhere in the compiler.)  
Once someone has had a few good patches approved and committed by someone 
else, they'll probably be asked to complete the form for getting commit 
access, naming the relevant maintainer as approver (only maintainers can 
approve commit access, non-maintainers with commit access can't do so).

Anyone with commit access can create their own branches in their 
refs/users/ namespace if they wish, and use them without needing review 
for commits going there.  Shared development branches under 
refs/heads/devel/ have whatever rules are established by the people 
setting up those branches.

Rules about patch approval are not enforced automatically, only the basic 
checks for certain kinds of problems with commits and for such things as 
non-fast-forward pushes only being allowed in namespaces such as 
refs/users/ and refs/vendors/.

The above is for GCC, but the general idea is similar for other projects, 
with differences of detail in the ref namespaces used, the checks carried 
out on commits and exactly how maintainership works.

-- 
Joseph S. Myers
joseph@codesourcery.com
