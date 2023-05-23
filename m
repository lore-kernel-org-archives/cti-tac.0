Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BA01F957
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 20:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A416A4203B
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 20:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A416A4203B
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
	with ESMTP id KVXCidNth3DE for <cti-tac@lists.linuxfoundation.org>;
	Tue, 23 May 2023 20:12:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7321E42032
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7321E42032
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 20:12:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.00,187,1681200000"; 
   d="scan'208";a="6247775"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 23 May 2023 12:12:14 -0800
IronPort-SDR: qK75XSc7UjLnB6AaMqDa2+Tpemn6pL25jMQs1FlR4ibQE0kU2IUR/qCc3md2sYqjzNyU2MNRBk
 84OCAXrJvtWpUOLMoeP/Y5I3k/ydtt8tYQLFHflaRqR1SOv7OH3P91neSe9vrOCBw08auZyjlQ
 IhPXN026cpek7KQBQLMUOeqJegPSsdQCGAtmGJDLVbCcYPSpHT+LYtX7IMldhKmOqd+2Z8XMY6
 7EWWcevVsps2jgGrt+vLz9gJWFAQ/pIRwvJlvNZBI5BRPuoEstZEX5ETgj1N0Z3hmQMvYCInVX
 SZY=
Date: Tue, 23 May 2023 20:12:10 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: <cti-tac@lists.linuxfoundation.org>
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost
 of glibc migration.
In-Reply-To: <20230523-banks-calve-rio-844c98@meerkat>
Message-ID: <7f11ed34-9529-9b3a-e720-64bd3a85542c@codesourcery.com>
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com> <20230523-ankle-infer-spurs-55ac6f@meerkat> <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com> <20230523-banks-calve-rio-844c98@meerkat>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-12.mgc.mentorg.com (139.181.222.12) To
 svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10)

On Tue, 23 May 2023, Konstantin Ryabitsev wrote:

> Okay, perhaps I'm not fully grokking the picture. How many people are able to
> push to master/release branches? I was expecting it to be 1-2, maybe a handful
> of people, but perhaps it's a much wider set of developers?

There are 612 users in the gcc group.  There are 121 users in the glibc 
group.  There are 461 users in the src group (which can commit to the 
binutils-gdb repository).  (Obviously there's a lot of overlap between the 
users in those groups - people who have commit access to more than one 
project.)  There are no technical restrictions on which users in the right 
group can push to which branch; there are of course policies on patch 
approval before pushing, but mostly they are not enforced by technical 
means.

(It would be reasonable to e.g. only set up commit access on the new 
system automatically for users who have pushed to a repository within the 
past year or two - something that could be identified most reliably from 
the archives of the commit mailing lists, converting back from the 
committer information in each commit to a Sourceware username would be 
more complicated - and wait for others to request restoration of commit 
access.)

-- 
Joseph S. Myers
joseph@codesourcery.com
