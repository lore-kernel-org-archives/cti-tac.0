Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9071514CC
	for <cti-tac@lists.linuxfoundation.org>; Fri, 26 Apr 2024 16:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714147980; cv=pass; b=aQwzEqFHSTJgbbe+mrnire+KzmLY9iyZXd5vkY5yT7aermbWN+3G9O9PiOxu6WaqJ/IcBGt3c4pvdGOzyTlLZ6kkxDLrHDkTAmWqWrTQ+HA50Mt3tU6CSEXiOv7JEXJ2JH5BrHc3X3xXH6HT5G72229AADMpPLPxPT0ha1Zz9FE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714147980; c=relaxed/simple;
	bh=9zmZCdGUzw4MzGK64VST1ofa/NrLzRI5xzZedTqzBZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WmoRC4M/3rcJl//ISP8jhdTthcB/pa+M8muMwg4cxAfSEjuWsKyQymUwbzLsyYo7EpOY+QPweMLjj/oRhdlwQS0oFMe79NunW5wewviI7pJt8iL+GzFYALlsSOLXqxRGsvTFiwG8CiLwqbtP1bzvhdeOP1O2Hlzb9uCoQX7pQfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=Ij4KaeHJ; arc=pass smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="Ij4KaeHJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C098D41C66
	for <cti-tac@lists.linuxfoundation.org>; Fri, 26 Apr 2024 16:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_S-N6aOPg-w for <cti-tac@lists.linuxfoundation.org>;
 Fri, 26 Apr 2024 16:12:56 +0000 (UTC)
X-Greylist: delayed 357 seconds by postgrey-1.37 at util1.osuosl.org; Fri, 26 Apr 2024 16:12:56 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 76FD740124
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76FD740124
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=Ij4KaeHJ
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.209.24; helo=buffalo.birch.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
Received: from buffalo.birch.relay.mailchannels.net (buffalo.birch.relay.mailchannels.net [23.83.209.24])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 76FD740124
	for <cti-tac@lists.linuxfoundation.org>; Fri, 26 Apr 2024 16:12:56 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 6AB7D2C2771;
	Fri, 26 Apr 2024 16:06:54 +0000 (UTC)
Received: from pdx1-sub0-mail-a296.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id F1CE02C2910;
	Fri, 26 Apr 2024 16:06:53 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1714147614; a=rsa-sha256;
	cv=none;
	b=+AyVDYQM/y5OJeMrNCKwyMmH1vfvVSBuesnJMB9JLr/qo/zjKSnF2rhYaG0xSPi3y7rU/V
	u3PkMg4FI26eBw9fjXqXTj7xXlJsZ6bp13r3sn6R55GWerRyrXjY8befBMwGeUTTegADct
	/C955mkjX8/lHUwkAcPH+ASQ6zkSLYPrBeolRpQVU9XWC9w8rOtRQoJJNQzpQkBa+ICEUw
	ZLRaVJSBLbgxoHLHDx9su4wUqoAYYxWLGO+fvKsE19xS4ty2Vlp3w4YRy64GESVMeenWY6
	1Me4ZtOiMU4cpRpZnTaE+HiAdHQUchOckAN0dxbc86xjxrbmQTn7ZFMUtLY7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1714147614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=VayhVNkrmzlITC8v5ygECkGalgohpxYR4XEH6Isb7u0=;
	b=M/RnL7zjNSaJz6bqk/uj026D7aOzL84uPgPIeF5nyy1y6tpykyBCi6OL7MnFyZhkaoHNbR
	gIg0hTmvjsptFtTOOBltobzuUupbcryxLs7cZT9dOGpGQEbLBDoEUEJwSBZVpJuKtL6v6Q
	iYwTSpeTgFxPmxOKfwVM3yHN0iQPAMfwOVrlpXpS7TVRXTFwN4hOUVOcL8+2P7p0Sn+UBd
	hGtgUi/f0MYl1drk+5ioRwCxZHkFM+mybE99YG/1RTiB+mB8pS4zIqEGw5nJKoXcsbGkcq
	Mh++EPxTwuwSeYh+wk1rIxc1hr1AXh/jwBvVvjjTdDV0OJJXs7SOZi2IXFgcjA==
ARC-Authentication-Results: i=1;
	rspamd-5c97bbd7c5-xzn8s;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Gusty-Whimsical: 72efcc421e2da7f7_1714147614240_2350035033
X-MC-Loop-Signature: 1714147614240:850742606
X-MC-Ingress-Time: 1714147614240
Received: from pdx1-sub0-mail-a296.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.123.115.10 (trex/6.9.2);
	Fri, 26 Apr 2024 16:06:54 +0000
Received: from [192.168.251.119] (unknown [24.114.77.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a296.dreamhost.com (Postfix) with ESMTPSA id 4VQyK93MbPz64;
	Fri, 26 Apr 2024 09:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1714147613;
	bh=VayhVNkrmzlITC8v5ygECkGalgohpxYR4XEH6Isb7u0=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=Ij4KaeHJq/lnNZ+wvo6lxh6HcfGiEWttTWOxeQlWN3K8FevAG3ihpC91C5Sw88AqV
	 rcSZptDiRoU04GB+Xg8C8x94ZRVpsxmKLDhiYmfgpfCXXGW3OKlaihkmQGuxJNaBEh
	 /CMu0d8ME3751TYbQYFvJ1h4th0tjuLnxH98v2dPJvp1IIB68oSZ67toTdPq0jLWXk
	 7FgJduAty13Mkl5ltYfKg7e9mYPWh+Y/veF3JVYne4wFywj6k4HUZoGfcUIty2XDVl
	 4l5WhXCuig6UTKQ47JItnc+6t0e4UZJOnC9GzqPpqRVQUeNtSJxO+nVMK+rZo4kIsG
	 6WFfYTsCVJSvw==
Message-ID: <d5b7c14d-dc87-4361-bf04-fcbd8fd9dc38@gotplt.org>
Date: Fri, 26 Apr 2024 12:06:51 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hashing out the scope of work
To: Ian Kelling <iank@fsf.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
 <87v846a1zi.fsf@fsf.org> <20240424-funny-lemon-starling-8b1aae@lemur>
 <87ttjpurtr.fsf@fsf.org>
Content-Language: en-US
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <87ttjpurtr.fsf@fsf.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-25 16:06, Ian Kelling wrote:
>> Okay, thank you for bringing that up. Another video conferencing system
>> which we've previously deployed is Jitsi. Are there any similar
>> objections to that platform?
>>
>> -K
> 
> Jitsi should be ok. At FSF, we've had some occasional usability problems
> with Jitsi, but no software freedom problems.

Ack, to respond to the usability aspect, we struggled with the FSF Jitsi 
instance in the earlier days when we started the glibc patch review 
meetings.  However I remember someone pointing out back then that it's 
quite easy to misconfigure Jitsi, so maybe it's possible to get it 
performing well enough as a workaround (typical GNU toolchain calls 
don't exceed 10-15 participants at the moment, maybe slightly more for 
the office hour) until the bbb non-free dependency issues are resolved.

Thanks,
Sid
