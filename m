Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE804C89
	for <gti-tac@lists.linuxfoundation.org>; Fri,  2 Dec 2022 16:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CA3341BEE
	for <gti-tac@lists.linuxfoundation.org>; Fri,  2 Dec 2022 16:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CA3341BEE
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=bsAhImPm
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwXIXO9Gk5B0 for <gti-tac@lists.linuxfoundation.org>;
	Fri,  2 Dec 2022 16:46:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3088741BDA
Received: from cyan.elm.relay.mailchannels.net (cyan.elm.relay.mailchannels.net [23.83.212.47])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3088741BDA
	for <gti-tac@lists.linuxfoundation.org>; Fri,  2 Dec 2022 16:46:04 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 8CFB83E2740;
	Fri,  2 Dec 2022 16:46:03 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1B8993E298A;
	Fri,  2 Dec 2022 16:46:03 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1669999563; a=rsa-sha256;
	cv=none;
	b=Nosl38bwvGOwGJXABuCYvPHFRdkiVMVMnotl/ViyF90Mop9giQFnDmrCBSrtiGv/wVp8F/
	zypkt8nXnZZ3/ZvTKYbigLLciPlOEMLMY9BJ9JTQbvzuooCuiAumqAzbm8CPTM7Q9kNSkg
	JhzlaZfqc4+G39idmKAaDnx/SVWsZEwyptKSeLF6QoHMN/iv3n5qNbRCgH5DwCikOIpv05
	a4Z31e5wofZ6WRSULq8o26lNuRAI/NShjE/ayu3/3dH5eWxxz6VGuQ76YuFziu57jFxSYM
	MdDpcN1hZNVEbrVrwzdcPpL1hMSSUGo/5weSphn/LD7JvWnesgxlixQVcVEBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1669999563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=hnjcOn6aSSjnrM9ZJuGbfYVsjE8FkoWnY/FF41gx7x4=;
	b=e0sicuCox0ki4Dpea7ToTrd6YcUc1zh2/3tdXqAv1I/M2MNriM2mWugwuvv0nSrwgdUypv
	z5noBOpxxcLjhaAKJTuXCC4SldXkKlbKapSxZ1ULlHuzA+5JFcfOznmafwuEgxfG3ij5jV
	SOM1tmWiWF/rTVP0GP/lvPX3sYPIqcEukF/Sc3wj6Mo/90QsoJenx5HSyikvXXp8TDOP0g
	QILIHANhbPdyZqpdZj2QBzYFr0SgnAVPfFvPAw6VyaOwzTLPaGiQRbJ/4cK44Do5kWsvEl
	KYM2owMNIHimq/PgfZKmqEjSDrMewmveIWu84SIzrV/xS0jMv6U9xXbG4vJxuA==
ARC-Authentication-Results: i=1;
	rspamd-84789cff4b-nqqg4;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Trouble-Coil: 1e1f6af8103a1cf8_1669999563370_1028990502
X-MC-Loop-Signature: 1669999563370:2661755348
X-MC-Ingress-Time: 1669999563370
Received: from pdx1-sub0-mail-a305.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.123.200.112 (trex/6.7.1);
	Fri, 02 Dec 2022 16:46:03 +0000
Received: from [192.168.0.182] (bras-base-toroon4834w-grc-23-76-68-24-147.dsl.bell.ca [76.68.24.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a305.dreamhost.com (Postfix) with ESMTPSA id 4NNzNB1J7kzFf;
	Fri,  2 Dec 2022 08:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1669999562;
	bh=hnjcOn6aSSjnrM9ZJuGbfYVsjE8FkoWnY/FF41gx7x4=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=bsAhImPmVrn9X10LlYZnswUpr8Eesn1asv0LDDuA5OZgKnUwk31NtWqbnmm2ETEPC
	 arC0iZ0Yw4c0BInnUw9yYXNKC5vJxKzaC+0iUB0K7pyZ4uUC18+PKO0uypv1kR7h34
	 pVty6uXi3SF611a1X8t6SpAdOzvaTqtXffdOFH/O15fsHftevcCs8bue2oi04sYS3S
	 dLpJZ8/ZgMK4xZ0m/NeIUh2SbNj1h0JGI+cR2Z8Z6CgrFunQ1RysX2K0ckLaD2G/X+
	 7OS06s16mcNvFzhRZ9w3ti7Cz64kTqIrOevBgo6nwcop24X6FG5fsZ7TvNw1bsso94
	 nSPlkJWnpzO1A==
Message-ID: <7827d4e3-5bad-0436-07ac-058782b01d25@gotplt.org>
Date: Fri, 2 Dec 2022 11:46:00 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Testing LF BBB instance for GTI TAC meetings.
Content-Language: en-US
To: Carlos O'Donell <carlos@redhat.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: gti-tac@lists.linuxfoundation.org
References: <957106ad-24b6-e144-1132-faa7f1714371@redhat.com>
 <20221130181102.qnteq5nvbxuiezob@meerkat.local>
 <385054cf-6062-c379-413f-052627cb1c05@redhat.com>
 <20221202160028.ese522ykukctsg3v@meerkat.local>
 <e585fa5c-b46b-ad21-6d63-9d6bcabc145e@redhat.com>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <e585fa5c-b46b-ad21-6d63-9d6bcabc145e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-12-02 11:31, Carlos O'Donell wrote:
> On 12/2/22 11:00, Konstantin Ryabitsev wrote:
>> On Wed, Nov 30, 2022 at 01:25:05PM -0500, Carlos O'Donell wrote:
>>>> FYI, the hosting provider is doing some backend work today to complete the
>>>> move, so please don't be alarmed if you get an error in the next few hours.
>>>
>>> Thank you for the update.
>>>
>>> We'll test tomorrow to give them time to complete the move.
>>
>> Carlos:
>>
>> We ran a couple of actual meetings in it yesterday for testing purposes and it
>> worked really well. Please let me know how your tests go.
> 
> Thanks for reaching out! I was about to email you about our test yesterday.
> 
> The audio worked perfectly. The video was stalled for all three participants.
> 
> We tried a combination of firefox and chrome an still had video issues.
> 
> The video in BBB is via a distinct channel, and so perhaps the Red Hat VPN
> impacts that, and all three callers were on the VPN. I'll have to try this
> again without the VPN.
> 
> We are going to try hold a bigger meeting test things out. Video is the
> one thing we think we can live without being perfect :-) Audio is critical
> and it works.

Lets host Monday's glibc patch review meeting on this bridge and see how 
it works.

Sid
