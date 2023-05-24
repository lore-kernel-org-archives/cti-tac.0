Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C47722627
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 21:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA6A2615FE
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 21:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA6A2615FE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=QT5I+3to
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
	with ESMTP id kqsF1bltNoil for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 21:27:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 774E1615FD
Received: from quail.birch.relay.mailchannels.net (quail.birch.relay.mailchannels.net [23.83.209.151])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 774E1615FD
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 21:27:32 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 9B3C87E200C;
	Wed, 24 May 2023 21:27:31 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 24A2B7E1F8C;
	Wed, 24 May 2023 21:27:31 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1684963651; a=rsa-sha256;
	cv=none;
	b=eXAErOwrognC/eAp2BnHm64CLW+W6HuLOl4D8M7W76PbJGtL/4CnXEZU/MYir9fnICTHDV
	ght4yrMHIRh6ricd1btBO/u+oRsxKwhaTuNoZBvlZzwNnsO34SaGLVsGSS6qnYPVw2wE7x
	/QoD/gTQHCzeRckQQGf4pNsmZaDX7avIH1QMUIRrDYd3X8OdfKyvLRPK/R8zgcYOsQRP13
	J3zpR5lVTSPYrrNqSZkD9xVpDpdiVib6yJRHA8tfjo8FKCDvVLwjmxcwa1umNjmkvmS6Xa
	44BMiCqG0b8H0EYTVNDk3TM/xaiDQnsBFUyyfv7+upGx3aFOgHBTlkGBGPmJWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1684963651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=A1CS1TdA8SIOz94monjixAnmOyf5vFiqV8vfgtwzlKc=;
	b=6C6jMaQqH83hprqNtsovhoCYrMcp/nq4LIIzoM+ZNxiSFIQLiqnu2LQajhM2cPOvEsiz53
	dT5iqIiZ6TrwPWYr2AVgYxWdO5IbI8ymv8sJgwmQGH7sG9Np3XPW0xJQafpMOqs81O7yEP
	bnmy3enVWuTaWbOUpiOcNNXFeEffbeeMKwEdHj+Ta+Imk5SLj+0ew9QCwSnoOsihcQlbQP
	syj7BxmWTHXwBUh/Q0cKFV4LuR31+UmGaI02FJ8f9iDSQ94Y5MYypJdsaKyGxVx0AMQ274
	H0xAnQQ1rCl87/I9wBTdbLwlGSq6jwmiitDWWyO76AsHjkod6PSjGzyq3vBBbA==
ARC-Authentication-Results: i=1;
	rspamd-79bb5575d7-cxkwk;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Versed-Trade: 0ef83bdd1d7d9784_1684963651431_1501692515
X-MC-Loop-Signature: 1684963651431:1486068189
X-MC-Ingress-Time: 1684963651431
Received: from pdx1-sub0-mail-a305.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.104.253.217 (trex/6.8.1);
	Wed, 24 May 2023 21:27:31 +0000
Received: from [192.168.0.182] (bras-vprn-toroon4834w-lp130-02-142-113-138-85.dsl.bell.ca [142.113.138.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a305.dreamhost.com (Postfix) with ESMTPSA id 4QRPR63r0fzRG;
	Wed, 24 May 2023 14:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1684963650;
	bh=A1CS1TdA8SIOz94monjixAnmOyf5vFiqV8vfgtwzlKc=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=QT5I+3toOoggBS9XQ0Db0G34JTPbMpHVTcwqwJKS5KhSUKaGKy69MzefJChvCdfBm
	 paD1G/QsAPZlkMNdKTBDEZOgxNE4J21/WwkuzfDQTh8eiUigLeeO3Tr8nDyHoCQpYD
	 irq/oZLd+9FNS/QMN7drsmK52NA1a9Hwem3eECLy1doL2jM3lQuOvjsQcaqzRDNgCe
	 H1k7N/+yiHMuZCDsWT/HlOq8yW4v80JwxmLxaVwvtT6LBs6ImFB0OpyPMuIbN0OcJh
	 1aYKBpVFpX/W66WIgXsJHazqX9vQugj4MyZu3GNNn+rgDv29mpnl/SVNBsr08iPMzH
	 29GhIhMHjKvdA==
Message-ID: <26a7467c-c726-9041-2157-2e0b58619b6e@gotplt.org>
Date: Wed, 24 May 2023 17:27:29 -0400
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
To: Brian Behlendorf <bbehlendorf@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
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
 <a4c8b242-7ab1-a0da-fbe0-19cffe1a6054@gotplt.org>
 <e5634ca9-57ed-c3a4-5488-1cb02f98fb72@linuxfoundation.org>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <e5634ca9-57ed-c3a4-5488-1cb02f98fb72@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-05-24 14:55, Brian Behlendorf wrote:
>> Signed commits would be nice, but we're not there yet as a community.
> 
> It's not quite as easy as "hey just add -s to your git commands" but 
> it's not far from that. I'm not a part of the TAC so I won't go further 
> than to suggest that a migration, where there will no doubt have to be 
> some adjustments to process and flow, to introduce other non-zero-effort 
> but non-blocking changes that enhance overall security/integrity.

The challenge with cryptographic signing of commits is not a technical 
one, there are folks who oppose it on an ideological basis.  It's 
probably not that hard to drive consensus in the glibc community for 
this, but that's still going to be an additional hurdle to cross.  I'm 
not sure if the initial migration is the right time to tackle this.

Likewise for a process change that requires a single trusted gatekeeper. 
  Even if it has technical merit (I'm still not a 100% convinced), it's 
going to be harder to bring in a non-trivial process change like that 
during the initial migration.

Thanks,
Sid
