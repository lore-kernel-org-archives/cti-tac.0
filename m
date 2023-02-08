Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A6C7481
	for <gti-tac@lists.linuxfoundation.org>; Wed,  8 Feb 2023 19:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B781140338
	for <gti-tac@lists.linuxfoundation.org>; Wed,  8 Feb 2023 19:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B781140338
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=tYXnYRhL
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pcY4WkFK86rF for <gti-tac@lists.linuxfoundation.org>;
	Wed,  8 Feb 2023 19:49:34 +0000 (UTC)
X-Greylist: delayed 00:15:37 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B444E400C4
Received: from antelope.elm.relay.mailchannels.net (antelope.elm.relay.mailchannels.net [23.83.212.4])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B444E400C4
	for <gti-tac@lists.linuxfoundation.org>; Wed,  8 Feb 2023 19:49:33 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 7D99B881F3C;
	Wed,  8 Feb 2023 19:33:55 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id D24B3881FD2;
	Wed,  8 Feb 2023 19:33:54 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1675884835; a=rsa-sha256;
	cv=none;
	b=NEs1GbK5awB/hQqi7ZaRb28Jo8QBSG6ENJgwGNrftaBADY9QaCob4Gwuhl4BinX4jtjQMO
	yV6WQfvE2alIgq078m7LC2bUKH3ma7lhr3nAT1ZRkN9+j8p3+ejhwNp2AMXsKtsLNydCjB
	fSgvlmOEG1ch/qqP6WFaJHSj8bEDnl4uYImNtU1ITDN4tDsOwdSwkJ1Snv5tpXdEfYY4P+
	Jck549KFUbm/McHBcuHG46Qv9sysc8btdFgUBdD7pJkIyoIroKROnLVys43YHV7X6vKKas
	4rAP2HeHOr5FVveWbW1iK49CAPThreadQ0nLWVvSgsJBzjhK54PBDDfWPqT0kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1675884835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=g2X46QwtAYE0NiUIA3ZRBpWu+2SkEuyDWZy7JZyoM7o=;
	b=b/8Z+bmOqBF0D2iTrs+8rRpu3nhNpuE1cdoVu0QYhZOmwfIEO+Yiob1gjRmNfi/5OwiW05
	NBm2Cch1ziSG/h+zB7QBW8+y2x6oYaXjszslbutqfbzjS4VXOGA7I8htHbXXFArU2wZgjb
	UdvajtZkfWiKiOXXxNCcIb27jBDm2M27Lq4wz15q8oG1kFZjp+oEu3HypNOumCS/wdnH71
	yvWrEs72NHkkUfYZdMvJHmIJ5jrazkQgSaZdq9i+3loLEqmvBbP7EA/vXy+S0Y1Xzleevs
	9WLWVApl2Pah+SRnnOTiL3P+6s+GYeVlft1xUKIR+bIv4hDwBhAUpFmSxbD//A==
ARC-Authentication-Results: i=1;
	rspamd-8d84bcd9f-vzsfz;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Illustrious-Befitting: 670809647656e6cd_1675884835251_3497466294
X-MC-Loop-Signature: 1675884835251:2138408691
X-MC-Ingress-Time: 1675884835251
Received: from pdx1-sub0-mail-a306.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.120.227.134 (trex/6.7.1);
	Wed, 08 Feb 2023 19:33:55 +0000
Received: from [192.168.0.182] (bras-vprn-toroon4834w-lp130-07-174-93-43-36.dsl.bell.ca [174.93.43.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a306.dreamhost.com (Postfix) with ESMTPSA id 4PBqtV0SYtzDb;
	Wed,  8 Feb 2023 11:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1675884834;
	bh=g2X46QwtAYE0NiUIA3ZRBpWu+2SkEuyDWZy7JZyoM7o=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=tYXnYRhLRE054PogrWt4K9Ln5GBOgCHceBj06OdSL1r+TUyXi6bldMOfMAyrNiZuq
	 I4b1+LmYuRIRl40PfxuO5oQt2plS2suamVOBfWpnBkWlzalLFZVdw7kqc4Bf4KvAtV
	 DjWpHOGcqv7xCcYPcse3MM9yxf+T+yjh2HIA46MNt+fB8LuL2zfQQxJSfin1m2l988
	 gnMoLV+0b9nUnJejYvqwUh+DyQUHAR/mZMMDD4YDuQh2OUgfE3fSaRbsRyKmvheULk
	 7BQqP8LjRZrX495hnb57jnLjLRFOMHLuUA1/joWhNUyOVJ2LHByZBJjb/tnPHjbuYQ
	 SOD2ow9wVH5zw==
Message-ID: <bf067980-f164-eb04-c70a-e1b80a336fac@gotplt.org>
Date: Wed, 8 Feb 2023 14:33:52 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Planning the next GTI TAC meeting for February 2023?
Content-Language: en-US
To: Carlos O'Donell <carlos@redhat.com>,
 Joseph Myers <joseph@codesourcery.com>
Cc: gti-tac@lists.linuxfoundation.org
References: <e7563276-8d8a-7cb2-0da5-f838969d9c2d@redhat.com>
 <bd4ea1b-3a78-f04b-3c82-7eb5829962b@codesourcery.com>
 <1344a6ae-15a4-f2c3-1abb-ced0caed9e59@redhat.com>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <1344a6ae-15a4-f2c3-1abb-ced0caed9e59@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-02-07 12:34, Carlos O'Donell wrote:
> On 2/6/23 17:35, Joseph Myers wrote:
>> On Mon, 6 Feb 2023, Carlos O'Donell wrote:
>>
>>> With the binutils and glibc releases out of the way for January,
>>> I would like to schedule the next GTI TAC meeting and possibly
>>> setup a recurring monthly meeting to discuss progress.
>>>
>>> Suggestions for dates:
>>> Wednesday February 15th 11am EST / 4pm UTC
>>> Thursday February 16th 11am EST / 4pm UTC
>>> Friday February 17th 11am EST / 4pm UTC
>>
>> Unless next week's WG14 meeting processes comments much faster than
>> January's, I won't be able to do any of those.
>   
> Is the week after that week a better week?

I'm out the week after, but I can catch up on minutes, recordings, etc. 
and also help with any prep if needed.

Thanks,
Sid
