Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD83313AA3B
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 19:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714417318; cv=pass; b=QNieyGjwn3v09PrDNkqJwJolhPf/e8PROyDBPEO5gg6zXrxlsTbJGQoRtRG8ENmVJxCOWHd419y99mnm00jqwQ+9pWgp3Jhihwl0RO6DqHhSTMmJAul3i8fHGrKL8QCi1ReCD57eFatrIohycXO1diwZON7BCbHX1F+KlTnRmRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714417318; c=relaxed/simple;
	bh=lYQf0A+t/r+NivoHzV13O875oHWSsxRTdSaGixH8YMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ti3Y9DCR9/QRJd2WZCsSCZFuXnwIoYgKHIxlsKceHn93R3owArMqhA3Rs0tN+NpYkcvhnfy6gNYHMwjG+d78UF6vVK3my9uVOIigrTd08gWIxI2dr4HOxgiUgxg/MtLwE4NIIz4/OeA3G059trkXG2b8Rkg7Nb2dMXqwRiJ1RHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=Qni0FgJE; arc=pass smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="Qni0FgJE"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 532B44055D
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 19:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHalX8S_HSml for <cti-tac@lists.linuxfoundation.org>;
 Mon, 29 Apr 2024 19:01:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.223.160; helo=seagreen.cherry.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B93F24055E
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B93F24055E
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=Qni0FgJE
Received: from seagreen.cherry.relay.mailchannels.net (seagreen.cherry.relay.mailchannels.net [23.83.223.160])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B93F24055E
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 19:01:53 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 8DCDA101F46;
	Mon, 29 Apr 2024 18:52:44 +0000 (UTC)
Received: from pdx1-sub0-mail-a222.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 208B21019EA;
	Mon, 29 Apr 2024 18:52:44 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1714416764; a=rsa-sha256;
	cv=none;
	b=s9iFkYEdZHvgCTPIJLfd9Wgb17KkPCxQj9GOco/2Zywf5lFyTKRIdDmfkx7w7vhfWM1e6Q
	AcS4BToNjjNYxvVr4SJqSgYFH/PFQ/07mofrEHkC3Oq0rbWQU2UPImkBjma732aQVgfh/s
	5IWmfDMP0oYY4VZHlxiRO66CH0ql60mCHQLuKKesmOaSwXG2fm9M0GQ68eswryUQoNY/iY
	zrWfVpwcOpRrS+CJ73B95MBKG4hT1aUfSQa01t+QprcRDegPpYCoGotRxtJ0PcZ+f5OrJW
	MNMzMTEuqDZ0x7YjWE6PmYSzunOEg/tnFJnbyE1SI3wNv+RtEltDPqykdlEPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1714416764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=l2jK7PqIt/YmHoFJHKdr4cB/sWtpO8qPdMZ4fNzx3S4=;
	b=pPqhzyX9Xfo0CqxD2yANPfEZlic0jS6E26cbl+oR+tGjxMpXnQ88G/7/WXSOMKwuKObwRA
	NkM4x3MyqnLo5yus8FSAfgey9FoS8f4Tr0Hu7XkpFenNdU3lsgBRKtMDpuCsP3nJIgE+2Y
	sk6xBcTOmtOq3M1t5odcMUXWwcqnt9+hiw0YLc/msnJtHo8SKzh1VeVMylQ82PvyePx792
	e0M75ax1bAE+pzogTYAZHqcBbT6gxgftbMsjGeCG8UT7QDd45owM/TnRcz3btOADxq1OlA
	EwKdiWZRN2AGbMAcqjYCNjq0AyurrijuJpGrvP6EdjDybAfsdXqeR2ujDb5OrQ==
ARC-Authentication-Results: i=1;
	rspamd-5c97bbd7c5-768wc;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Thread-Society: 482fba384f34e90b_1714416764378_3006589612
X-MC-Loop-Signature: 1714416764378:1868565947
X-MC-Ingress-Time: 1714416764377
Received: from pdx1-sub0-mail-a222.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.114.150.8 (trex/6.9.2);
	Mon, 29 Apr 2024 18:52:44 +0000
Received: from [192.168.0.182] (bras-base-toroon4859w-grc-71-142-198-113-116.dsl.bell.ca [142.198.113.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a222.dreamhost.com (Postfix) with ESMTPSA id 4VSss754kbz84;
	Mon, 29 Apr 2024 11:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1714416764;
	bh=l2jK7PqIt/YmHoFJHKdr4cB/sWtpO8qPdMZ4fNzx3S4=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=Qni0FgJEnYU4m9HhCRjwJC0VrUR8nR1mdXP6VspqlFG3ISnf/QZ27j4Aop6vqN4uP
	 6s9aw01yef5itlGfMOptJUY/eHCmqSatVjkEE0KxBncRcjtulNcwWVQR0xOSVux3Si
	 KYHVTewYcj72zoJEeEsYOCdnF8ccTs6DE7dlKDc2VhiRwai4Vb54yJo9/5MuQ3Vt9I
	 ETjwBhDxJV8h4V8Mx3Hp782vNeW1IEuABndkYuU6Ys4lkFc0/cItJDD9shDIjJXPvB
	 WP/LkoR9jKqdXDGkx7EQXznQ1woXMv2LbEW5GKZPq74atLAKC/yRrOdemwyaIiWn+7
	 fvfxhunjQWmBg==
Message-ID: <060ff9e5-785a-4963-8d92-2638db3228da@gotplt.org>
Date: Mon, 29 Apr 2024 14:52:41 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hashing out the scope of work
To: Joseph Myers <josmyers@redhat.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
 <2293a3bb-5780-ec5a-ca72-e19671dccb51@redhat.com>
 <20240429-proficient-pastoral-whippet-bcc376@lemur>
 <6d25ccc7-ef3e-a885-b085-51185c23c91@redhat.com>
Content-Language: en-US
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <6d25ccc7-ef3e-a885-b085-51185c23c91@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-29 12:35, Joseph Myers wrote:
>>>> 6. Patch tracking services (Patchwork)
>>>>
>>>>    a. LF will deploy the latest version of Patchwork patch tracking software
>>>>       under patchwork.coretoolchain.dev.
>>>>    b. LF will set up automation and integration services between mailing lists,
>>>>       patchwork, and git repositories (using [git-patchwork-bot][8]).
>>>>    c. LF will work with the glibc community to set up projects and access as
>>>>       appropriate.
>>>
>>> The existing glibc Patchwork database should be transitioned across.
>>
>> Can you give more information why this is desired? This is uncharted
>> territory and I'm not sure how much effort this would require.
> 
> The same reason as anything else.  Patches from before the transition are
> just as much in need of review as those from after the transition, so the
> state of review of those patches should be maintained across the
> transition.
> 
> I don't really think of moving patch review state or bug database state
> across as substantially different from moving the existing git repository
> - these are all key parts of the development process and shouldn't have an
> artificial divide based on the details of when hosting changed, once the
> transition happens developers should only need to interact with the new
> system, for tracking state of old or new patches, for updating state of
> old or new bugs.

I believe we had explicitly agreed in a previous CTI TAC meeting to 
start over with a clean slate for patchwork and not bother with 
migrating the previous database.

If the active patch backlog is a concern then maybe we could refer to 
both instances for a while in the patch review call and move over 
completely at the end of that period.  I don't remember ever managing to 
actually run through the full backlog (that currently stands at 469 
patches) during any review session.

Sid
