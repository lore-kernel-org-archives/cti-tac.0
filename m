Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8966919528
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 15:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35B3A8175C
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 15:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35B3A8175C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=BmEXbt4O
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KfArR18oIgym for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 15:18:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C8308169B
Received: from olivedrab.birch.relay.mailchannels.net (olivedrab.birch.relay.mailchannels.net [23.83.209.135])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2C8308169B
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 15:18:52 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 22017141AFF;
	Wed, 24 May 2023 15:18:52 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id A194B141598;
	Wed, 24 May 2023 15:18:51 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1684941531; a=rsa-sha256;
	cv=none;
	b=3z4Y2D77SYzB84bdKcJlMVdi7k8TMLHoZ7380gpN+gNhADraph4YoxSMB3zfgY42XM7s16
	gZeTFvnzIsp9KGJDhAL3PO5shuQ7lBf+8npejAqYfSbqiDU+GP7vp8c4DJ+APAdrfumnF5
	0mxfpUcBJpE/Ihig5VkqUkwMp9swqpamS/pxifbWjuTLB05rRselRGAX1MD22juek/X+Kc
	ufTG7MhbRriAHieW9EDnRFSEudg5Fi95UPn/75oUnfiThXDc3Icc9shhLvnvurbwfhuFqQ
	LOZWpg4H+w8ZALuhlIi0Ak61OBW/2n2iizvRuCK52v8OH+CKcHymKAxvuY36BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1684941531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=AT34DQPxtKcZq0meshzsLH/+H8axNHORfkmprYEs7Ns=;
	b=FdRt2Kof04fIJ94AMeM0xY3huIR/OwsJeCKJ63TN/wS8cn8RKVet6g0GMIt3FZqZ+VUQqN
	HTHtbCSwNsahrnOVv4Ho/mzWcU6jpPrbXbhhZXFLLSGstnOFtemtRRtJ7yRNsp/hmke6q8
	qTuYF0LvJK9b+XyB4yI6cZDpTwAzyqjx8THBUaRHoyU0j4no+mYqDc2F51XPyVMPhv10dR
	OYJYwB3SCKy1T/Hl8zwoBN3BVQlGsOW4MCNX0Xu/f/INMnG8F2fKAaxFX+fxUNnMSNC/6M
	XOWfULvDWlHmBX1t37vVKCnmBrTgIniNfxgjFtsNcwrZRBcvRaHExO02zoNeCg==
ARC-Authentication-Results: i=1;
	rspamd-5cdf8fd7d9-fw8rh;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Lyrical-Befitting: 01428af1052ae8d8_1684941531908_101526621
X-MC-Loop-Signature: 1684941531908:4183572137
X-MC-Ingress-Time: 1684941531907
Received: from pdx1-sub0-mail-a306.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.24.74 (trex/6.8.1);
	Wed, 24 May 2023 15:18:51 +0000
Received: from [192.168.0.182] (bras-vprn-toroon4834w-lp130-02-142-113-138-85.dsl.bell.ca [142.113.138.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a306.dreamhost.com (Postfix) with ESMTPSA id 4QRFFl0np5z1y;
	Wed, 24 May 2023 08:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1684941531;
	bh=AT34DQPxtKcZq0meshzsLH/+H8axNHORfkmprYEs7Ns=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=BmEXbt4O1+vasU79MX/awzMv2WiC5hS1Oyt7qxNKb9Vn10ti16JNNGkNBDQLt/J5T
	 vzaqLVJclkCp7p/TaSTxYnGWVbX9VG4Z01x38YZ6hV800eq28vESYosSgVrk0IoeA7
	 4W8lwIeeHyhttcMJ2136G95eN2UmKSsWRsk/zs1Y82T5mHeQXVZlIsflPibHjpzA63
	 PEeJQlEux1Z6sMsVPStdclAXtVfAN+GK8qDIEnY4U+cNeIBWLc/rdVnb7EdFfJP5Ml
	 Cntk5+l4LpcxryjOvOrqDN8yBbJFu6wcxFWOvjn4pbG6OOFjQIyH25sliZ9zoR813M
	 Gj86rSEAm4YTQ==
Message-ID: <6d43fd2a-7780-f6ad-bca5-6423d60b97c8@gotplt.org>
Date: Wed, 24 May 2023 11:18:49 -0400
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
To: Carlos O'Donell <carlos@redhat.com>,
 Joel Brobecker <brobecker@adacore.com>,
 Joseph Myers <joseph@codesourcery.com>
Cc: cti-tac@lists.linuxfoundation.org
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
 <ZGs/yahtWK4pholh@adacore.com>
 <e40b659a-6479-56a3-6ad3-d7a0e34433b9@redhat.com>
 <d7c12b61-70d1-150d-e4ae-d6b2bdc62419@gotplt.org>
 <3a802bd1-71f7-f845-5d29-34597368e394@redhat.com>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <3a802bd1-71f7-f845-5d29-34597368e394@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-05-24 10:12, Carlos O'Donell wrote:
> Is 100% coverage an achievable and timely goal? :-)

It's an achievable, timely *and* trivial goal if we post missing commits 
(i.e. commits in git without a matching patch on libc-alpha) to 
libc-alpha as [pushed].

> I think that Patchwork *could* meet this need but isn't quite there yet.
> 
>> If noting where you stopped/started is cumbersome then you could add
>> another Audited terminal state in patchwork to track that.
> 
> That would need to be a per-reviewer state that doesn't exist today in patchwork.
> 
> The Audited terminal state would be global, and Joseph and I notice different things
> in our reviews and apply different criteria for calling out a patch that needs follow
> up work or review.
> 
> In summary:
> 
> - Post-commit review facilitation for projects continues to be a value-add step
>    in the maintainer process and is currently mbox-based.
> 
> - The bar for post-commit review today is an mbox review-style process and a
>    replacement needs to handle multiple reviewers walking the queue at different
>    rates and applying different criteria to review (tag-based scheme?)

Wouldn't a [pushed] email to libc-alpha provide more visibility then, 
given that multiple people (I do too, albeit infrequently) tend to 
review these commits?  It shouldn't need a separate mailing list, given 
our email traffic volume.  Basically:

- Commits to the main branch go to libc-alpha
- Commits to release/* branches go to libc-stable
- All other commits (i.e. to private branches) get ignored.

Thanks,
Sid
