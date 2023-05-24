Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6EC1FDD
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 13:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C3D240C1B
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 13:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C3D240C1B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=nwQFADAq
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xswmJP39gHkg for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 13:43:59 +0000 (UTC)
X-Greylist: delayed 01:32:33 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CCE940386
Received: from antelope.elm.relay.mailchannels.net (antelope.elm.relay.mailchannels.net [23.83.212.4])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5CCE940386
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 13:43:59 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 63A398C2039;
	Wed, 24 May 2023 13:43:58 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 233398C1321;
	Wed, 24 May 2023 13:43:57 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1684935837; a=rsa-sha256;
	cv=none;
	b=pTATv5fMnsPxB40Ks7XVZ014rI4Cquqq6QAXGfYeCHUg3erph20Z2frJnH8aiFlLWBRj6E
	F0ucz68G96XqCOnvGaKYIuJR22BJ0YA1gA79b3zVp/1lPfPEURx90LO4eiCDMu/sVAcCOe
	QxCU8dGn60bEKN7xVNWvVvP3/u6aJjN7GWOiro/8YukZA8qyAftOPKukhPKwtaP83Q3v1n
	2YLjTgFIlC4Avdu3Lauk2U9gLWATzTIvrirGXX3vNnYOVNSSr5VFQCeTl0cgVNiIox0mgJ
	koSqcXvUBRiPwo1XHRb0dOJ7TEV8Lt9ubP05TaK9H4gvMb8dPs7DJYk0+ka/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1684935837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=92XZiSXuhadlKgQ1egA8CFapgBYlKWqB9vJ5sUUHAw4=;
	b=kpjTtGiVOaTeFnr/+7iC/exnxK95oqoe/sJFu4vlsMzqCt35GpPTUopnJSHNqJr2Db1cOt
	o9IJOLVH8vD7V3F7d3Bu2gMWPDuHJEsxPtSoZCFE2dgLpcjTfDKrBRbw2pksMWdJBmNaBd
	Df4wOEmsHM+Tt8qmLWqvBbUG/MqpdXwnEeBi4J4AHUIv+GlUE+bz6hhg7JxOOBqYMP86DP
	4+IUcmHhQWXDr6XbleG0HlB1PQYCQ6HlxXJJ5C3r3/Np4L3TNYt6AHm246bkvXSplcEKCz
	xPXb98rG2DCXErp7y68KU90kCm+t1BQzYcTYMYnY+MEyIb45z66xpCzykkK1Ig==
ARC-Authentication-Results: i=1;
	rspamd-79bb5575d7-lqgwk;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Eyes-Tart: 2839881e582346a8_1684935838212_873234240
X-MC-Loop-Signature: 1684935838212:2229288283
X-MC-Ingress-Time: 1684935838212
Received: from pdx1-sub0-mail-a305.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.106.146.233 (trex/6.8.1);
	Wed, 24 May 2023 13:43:58 +0000
Received: from [192.168.0.182] (bras-vprn-toroon4834w-lp130-02-142-113-138-85.dsl.bell.ca [142.113.138.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a305.dreamhost.com (Postfix) with ESMTPSA id 4QRC8D41KNzB8;
	Wed, 24 May 2023 06:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1684935836;
	bh=92XZiSXuhadlKgQ1egA8CFapgBYlKWqB9vJ5sUUHAw4=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=nwQFADAqjE+KAuJwHMSx7wLhBRskGDZjaPFpreBQ8UUNo/FcB/syCF+3MahuDSjlj
	 FqZtjNHlQwhkDTPVLmPZCr7MhLbPoDEtL1+FvfqbOcxZxu+X9hVsiyAhK3yU6TQmlw
	 UzPsXBE3GKJdmIVg/HBX7D6Q4PRRygc2S0XGDn5i4PzHwiSI1HFM3jFANuaXF5HQkA
	 jPuuI2hJMGRHi9NJg7NIrsJ54DIt5QnZIsq5kOOmdotFR3zfx2yNNGmOOJcTzi+eHm
	 fdYC0oZWfOcovNaCFb/XTYz+FNOrPD/Thm6DHWeu9idHUAgeGKhT+YTBpghYMgg19S
	 56uPCQezAsr1Q==
Message-ID: <d7c12b61-70d1-150d-e4ae-d6b2bdc62419@gotplt.org>
Date: Wed, 24 May 2023 09:43:55 -0400
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
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <e40b659a-6479-56a3-6ad3-d7a0e34433b9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-05-24 08:44, Carlos O'Donell wrote:
> Likewise, I do post-commit review using the per-commit emails.
> 
> Even if we had an advanced process to review and merge code that process still needs
> a belt-and-suspenders review from senior maintainers, and I do that by reviewing and
> often responding to the per-commit emails to loop in the people that committed the
> code.
> 
> The question for me is "What is lower cost?"
> 
> (a) Walking the git commit history, making a note of where I stopped and started,
>      and then writing net new emails when I see something that needs correctly.
> (b) Reviewing an mbox, deleting as required, and reply-all when I see something
>      that needs review.
> 
> I like the per-commit emails because it lets me have some post-commit discussions
> easily e.g. (b).

Couldn't you use patchwork for this, filtering on Committed state?  If 
we have 100% coverage (sending non-matching commits to the ML will 
achieve that), you would be able to look through committed patches and 
then start the conversation in the patch thread instead of a separate 
one through glibc-cvs.

If noting where you stopped/started is cumbersome then you could add 
another Audited terminal state in patchwork to track that.

Thanks,
Sid
