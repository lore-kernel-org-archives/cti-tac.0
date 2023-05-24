Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8105CE575
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 18:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00AEB60B98
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 18:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00AEB60B98
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=vSQ8gLck
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8dd-vmcv7Ipz for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 18:14:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E69DF60B83
Received: from quail.birch.relay.mailchannels.net (quail.birch.relay.mailchannels.net [23.83.209.151])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E69DF60B83
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 18:14:02 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 226995C1AE4;
	Wed, 24 May 2023 18:14:02 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id D420E5C169E;
	Wed, 24 May 2023 18:13:54 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1684952041; a=rsa-sha256;
	cv=none;
	b=Vmp4anrawPkNIhDeqUzitRcVxWJOisxDuMF6o2N1epp2bM7OJB/Z4J5cRY32NgWQKubjrt
	4OVuKrVd8j//1bbqhl5wAARjoHvS1+Hn/JQD+vTwWHydqXTGQen4vwNqTKFhWFw61o3PKB
	iaOML43PoEQm2ypvhuNeg34CJDECFXUdgGY7jae3bsqR6WXXSMEM1QRlF5Q+YZZ9g99xov
	ah2uyBQY545WkxjECwvxLJzdJPzj5WssxobHc+p96+BgpeVd4D4uzGxUrzqTcvMHQJVcjl
	ypDFYO7UCPoFOJaFVG25o2LKbUeV7Jj/86u+lVT4wrvV+7NEucrEviVluannpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1684952041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=EC4LGiWwosu5atxD3QEOO91sNjRZMQjZyoN06jCn44A=;
	b=ELEJBMIC48v7R6qrFg4Amfvcfdl9JNNqMp8xeGemgjYvmOlHNIQYD/K4dK4LioKcnIEzHD
	T8GVR/yaowSN3NaWKeH3sB4lxCJ+0IzWEZaX48VKPgGABrUmO6Bc78+rvdMwxVCff2pDKc
	fZEEzrCNfRoHHvl8CEieg7nCBv95ERnHbr4qjDNEJB9iTtmUSvH4CRZkEwl1YNk5+bDqAG
	NCRdEwTYWhhnNevgfaQXtuahFO5TdalT+94sUmttd7FvERgKpt+K/dEJ0DWG8wempE6dCH
	xAs0gqm1CsVcfnRSpbfzNB0cJ/GO3wX7/1nybusxYLJQl0rQ+JQ6g89v+5+PuQ==
ARC-Authentication-Results: i=1;
	rspamd-79bb5575d7-lqgwk;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Spot-Lettuce: 47a2af70115930f5_1684952041886_472555511
X-MC-Loop-Signature: 1684952041886:1278196149
X-MC-Ingress-Time: 1684952041886
Received: from pdx1-sub0-mail-a306.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.106.146.233 (trex/6.8.1);
	Wed, 24 May 2023 18:14:01 +0000
Received: from [192.168.0.182] (bras-vprn-toroon4834w-lp130-02-142-113-138-85.dsl.bell.ca [142.113.138.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a306.dreamhost.com (Postfix) with ESMTPSA id 4QRK7k2fjMzlX;
	Wed, 24 May 2023 11:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1684952034;
	bh=EC4LGiWwosu5atxD3QEOO91sNjRZMQjZyoN06jCn44A=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=vSQ8gLckytt/8fRtZJGvOx5wBTwtTg98U9K4Diij//hC8hKyQqd9Rk5iOV+VUFjY2
	 2WGrHuoBCmEEY01AFvajnAX3TdJ/VNPijt9OPaBJ1D/lGG9xrFjCwqdpr3H2cR0QS9
	 5PfWMdsq0kYuSygX6U7dyP/7N3eeweiyz/CNjaAaD6yBOJtS+a4e83opIGPQ/CQ2al
	 uB/J5sO1ZY3sMgjz9apmIemWT9Ooh12W7vigv2mdIshBL/QnAo3TVtWhnYgh63z/fw
	 f73thIg4mhPL62tXCNDYTukiLnw6IhgUvkRL5ZEpcjIb3qX+p5mfwOf3OfIvJ7jqmQ
	 bD5VXmrxxoJDQ==
Message-ID: <a4c8b242-7ab1-a0da-fbe0-19cffe1a6054@gotplt.org>
Date: Wed, 24 May 2023 14:13:53 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost of
 glibc migration.
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Joseph Myers <joseph@codesourcery.com>
Cc: cti-tac@lists.linuxfoundation.org
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
 <20230523-ankle-infer-spurs-55ac6f@meerkat>
 <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com>
 <20230523-banks-calve-rio-844c98@meerkat>
 <7f11ed34-9529-9b3a-e720-64bd3a85542c@codesourcery.com>
 <20230523-cease-candle-debase-dd7485@meerkat>
 <cd8ad55d-38c5-72f1-3464-b5968d1f8fde@codesourcery.com>
 <20230524-december-goon-09e728@meerkat>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <20230524-december-goon-09e728@meerkat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-05-24 12:29, Konstantin Ryabitsev wrote:
> On Tue, May 23, 2023 at 10:12:20PM +0000, Joseph Myers wrote:
>>> Can you please describe the lifecycle of a patch and how it gets from "user
>>> sends a change to the mailing list" to "that patch becomes a commit in the
>>> official project repository where it lives forever."
>>
>> A patch is sent to the list.  There are some number of review / revision
>> rounds, ending with a reviewer or maintainer saying it is OK to commit (or
>> OK after some specified changes, or OK in the absence of objections within
>> some given period, etc.).  If the person posting the patch has commit
>> access, they commit it; otherwise they should ask the maintainer to do so
>> for them.  Maintainers of parts of the compiler may commit their patches
>> without someone else reviewing them.
> 
> This workflow has one important problem -- you must ultimately trust the
> integrity of your infrastructure. It would be very easy for a malicious actor
> with access to backend infrastructure to insert a commit into the repository
> without it being discovered:
> 
> 1. they can override any server-side validations
> 2. they can disable email notifications
> 3. they can forge the Committer identity of the commit
> 
> With your current workflow nobody would find out that such commit has been
> inserted into the history because everyone must rebase their commits anyway,
> so having a push rejected due to newer remote commits is a routine situation
> (as opposed to a being a huge red flag in a repository where only one or two
> committers are allowed to write).
> 
> Similarly, since most commits end up being rebased, there can be no post-fact
> validation to find out if there are any commits that did not go through
> review -- their patch-id would likely no longer match the mailing list
> submission anyway (at least, there would be too many false-positives).
> 
> This situation could be partially mitigated if commits were cryptographically
> signed, but they don't appear to be.
> 
> GCC and other projects are sufficiently high targets that we should not trust
> the infrastructure to be secure or admins to be above being bribed or forced
> under duress.

It looks like the question of who to ultimately trust, either the 
gatekeeper committer (or two) who is the only person to have write 
access to the repository, or the admin who manages the box.  The 
gatekeeper committer could also fabricate commits and push to the 
central repository in the same way.  In fact, the gatekeeper committer 
could choose to do worse, like delaying (or declining to merge) someones 
patches.

Signed commits would be nice, but we're not there yet as a community.

>  From the git backend perspective, this is not optimal, because the resulting
> packs contain extra objects that aren't interesting to most cloners. For
> example, if I only leave refs/heads and refs/tags in the gcc repository, I get
> rid of over 1.1 million extra objects (from 3.9 million to 2.8 million) and
> the pack shrinks from 1.8GB to 1.1GB.
> 
> To me, it makes more sense to separate this into multiple repositories and
> relegate vendor/user branches to their own trees. They still share objects
> behind the scenes, but packs and cloning is much more optimized.

That would be a nice optimization.  In fact, an interesting workflow 
hack here could be to have separate per-maintainer repositories that a 
central repository pulls from, subject to some checks passing.  It won't 
solve any of the trust problems since the repositories will all be in 
the same infrastructure, but it will add more validation in the 
pipeline, while reducing the main repository size.

Thanks,
Sid
