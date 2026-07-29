Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C373839BE
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Jul 2026 15:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338225; cv=none; b=Oeg4P5Ig9EXhjY4EHWXk1iMArTYuPbKLKjypANN8Yi3qSV+o7iR6NZB2MsQJpZban5oTzPny6v888J0WkdrR1mlGr8emjpZZxRDFolp4t2JLKzegUD547kW67R1xN2yByiD4y2iLHWhGOOxCWWhelkVH0IbTkOwBIExoa6EW4QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338225; c=relaxed/simple;
	bh=KKETY9s4nhL95AcXZwzPpzxKflVWctQ+RsTjk2Z48Y0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=KO6o/8vMhpZQL92M4HrZ2fq78W8CFPM5JIMhciQXifrNCH1BGz0wKBIPR3NFxOC3bbGQGMm/MZO35R0Kc3nXdkyMcjCxurn4G6sNNGunX+2M9LVTQftc92QOcVh/xQ01MzOkwV9nUWnu9tpdQU1RNPTbliFjsm2F2a2CgoHl+uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=lesyarSL; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="lesyarSL"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0222860602
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Jul 2026 15:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.789
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LK21vH5I6Xcu for <cti-tac@lists.linuxfoundation.org>;
 Wed, 29 Jul 2026 15:17:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.222.57; helo=elephant.ash.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02403605FD
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02403605FD
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=lesyarSL
Received: from elephant.ash.relay.mailchannels.net (elephant.ash.relay.mailchannels.net [23.83.222.57])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 02403605FD
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Jul 2026 15:17:01 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id BDF4B7A3BDE
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Jul 2026 15:16:58 +0000 (UTC)
Received: from pdx1-sub0-mail-a209.dreamhost.com (trex-green-5.trex.outbound.svc.cluster.local [100.111.253.9])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 81E547A45F5
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Jul 2026 15:16:53 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Reaction-Stretch: 3eaf3d554cbda56b_1785338218604_2725464363
X-MC-Loop-Signature: 1785338218604:3370378291
X-MC-Ingress-Time: 1785338218604
Received: from pdx1-sub0-mail-a209.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.111.253.9 (trex/8.0.2);
	Wed, 29 Jul 2026 15:16:58 +0000
Received: from [192.168.8.195] (unknown [38.74.41.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a209.dreamhost.com (Postfix) with ESMTPSA id 4h9GC91hbNz33
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Jul 2026 08:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1785338213;
	bh=aVMbors8CICURF4sZ1cJtVEgzfS2I0i5y40a0BbiVGQ=;
	h=Date:To:From:Subject:Content-Type:Content-Transfer-Encoding;
	b=lesyarSL7bTwknr7Ap6gX3HPABextdnu6BI5+0LkiP3EpGf9AlJMriahAfFt0JGr1
	 VzaA0vJ4OXxgwD/CF+KtKiNWSOFwoqh/KGrtrFW77GbRbcehdYgIurZTawp4Ik+Xf6
	 /vSL1eYiNitT2KRvLt8zJ7w9KaLjX+QhLRTUAAsiYsjWCx/vM6M/jHtrmtb3whFYu3
	 affx+zeVyOckLhqVK1voHREt2KK8KZ+48/6YVUk2rrkR4JlRtxx9G6nfzDa3XaHe6/
	 uvi836c4L10PXjC0OmAIC+MRJMYuu/gpt0m0eJjBl6Qv2iLaX4r0SQFplZbUg6PsFI
	 VFJyjG4Q11Jvw==
Message-ID: <3d3f02a0-6bdb-4313-868f-6e17ebc43680@gotplt.org>
Date: Wed, 29 Jul 2026 11:16:42 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: cti-tac@lists.linuxfoundation.org
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
Subject: CTI TAC Meeting Notes 2026-07-29
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Attendees:
  * Joseph Myers
  * Siddhesh Poyarekar
  * David Edelsohn
Regrets:
  * Carlos O'Donell
  * Kris Borchers

Agenda:
* Service transition plan: 
https://sourceware.org/glibc/wiki/service-transition-plan
   - Delays in planning due to vacations, should resume by mid-August.
   - September is likely a more realistic target date.
* No one available to host the CTI Office Hours on Friday (31st July), 
so that instance is cancelled.
