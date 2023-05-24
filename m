Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3967418014
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 12:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B02FB83F11
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 12:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B02FB83F11
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=CjJ1OYrE
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxsCiUGe4dEb for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 12:20:59 +0000 (UTC)
X-Greylist: delayed 00:09:31 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7BBB83EEC
Received: from insect.birch.relay.mailchannels.net (insect.birch.relay.mailchannels.net [23.83.209.93])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B7BBB83EEC
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 12:20:58 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 7B7CE3E16EA;
	Wed, 24 May 2023 12:11:25 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 12A303E15C8;
	Wed, 24 May 2023 12:11:25 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1684930285; a=rsa-sha256;
	cv=none;
	b=2I9LA4wE5R07p+rM5B+a6BpzIzurTkjTXbZeMbuvC9EAVQ59MUGoQ4z/bRrkplHUeOXeWu
	xw5G3z7oI7sbhl3ZT6tOIJlLrjOPUzDTC0hN4SRC9lwnM4OMnF8MB6ZgBJYVu7qHAQCiNY
	s8L6djOdNpIevN2Gyr4VX+gRyPWKab2Oc2lrcgl4LbcyJRH/++T0fJL+JhDpHK6xPRenpA
	Bqm1zPCMbVsb0MmTimWoifxZbbgTZTQjB7PyXGLx0ZGigqAnO5G48p9xl072rwwxkLFF9d
	JUluagWmRC8gzrig1XwDv/7CTNj5RcLpuzrHFELC+5IvI+YWLlqqA01NOIg4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1684930285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=c1TV/cSq2asjtLWnUCwFyxPvPB18p2i0SzdqKt9W5BU=;
	b=IHD8BUmVUh5ghB9o0VQVibGS35pJa0PCXE6ev+Ip+nktKc7ZEx3pLA0UFiJloMfxufQtEK
	E+R9kCK7E7DcQ+5N3KiMPj0+M9ABUHUiduM+EfbYU0oG7ZN6DwVaVnnvOqB6UJ96zcBM/K
	zZh05Z6pd8idHUpizzr1hXmwQezckVt5fsBZQDa7pZs8Prx/5P9InkJOXS/u+NcNo5lIY2
	j4Tl4VYGRbwwzexWoIEzKrAK3ENLYUgDXMhA0cToXEKjGE9fvU68Mx634xD0bLvjfaqkbc
	ftx6/JRW9TkQx+fMgh5V+JDwmcbjZaQJ/rYC0kqRpw3w1m7+lFWcXDG0JcSVaQ==
ARC-Authentication-Results: i=1;
	rspamd-79bb5575d7-zvfpx;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Broad-Callous: 448b10e41987c667_1684930285322_1781636904
X-MC-Loop-Signature: 1684930285322:3610644192
X-MC-Ingress-Time: 1684930285322
Received: from pdx1-sub0-mail-a305.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.49.218 (trex/6.8.1);
	Wed, 24 May 2023 12:11:25 +0000
Received: from [192.168.0.182] (bras-vprn-toroon4834w-lp130-02-142-113-138-85.dsl.bell.ca [142.113.138.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a305.dreamhost.com (Postfix) with ESMTPSA id 4QR95S4YWDzK2;
	Wed, 24 May 2023 05:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1684930284;
	bh=c1TV/cSq2asjtLWnUCwFyxPvPB18p2i0SzdqKt9W5BU=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=CjJ1OYrEdqnDv+RuPC0eclYmUDqfpWUHM4FmcG+kkGkL39kkCD1pOJYob+QKJqk+E
	 8QP6BWXbFRRnRVcEQCMXbzAw+g87/xf3vJQwvPZ7lzIqL2wiCFCDSSnwOsCnjr3YIb
	 FXIfTkBq0vvI71BwuiHVDQUtsGL7NbY4DNN+x4XQPnijnPM2ZMjjl8fXCEeHLBCO5Z
	 xOis2J4MUqB9hRHwWZumo2duQLX4dwWlmH63Wy9hB7lRGsnHxtNW+U2d2vKbdFOO7h
	 mylaEocHgboHn97mneT3W+yuOtD00+enBPwxIEHrQUPaYFImZh/J/c/R42y+S12zN4
	 S/PMwGPb/khPg==
Message-ID: <1d8d7313-515f-2811-a710-5eca2ed42e39@gotplt.org>
Date: Wed, 24 May 2023 08:11:23 -0400
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
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <20230523-banks-calve-rio-844c98@meerkat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-05-23 15:52, Konstantin Ryabitsev wrote:
>>> If you insist, though I still think this is the case of "everyone assumes that
>>> someone else is paying attention to it." I am highly critical of setups that
>>> fire messages into the ether in hopes that someone checks them.
>>
>> People do in practice monitor the commit emails.
> 
> Okay, if you insist -- after all, we do the same thing for all kernel commits.
> I just find it a pretty terrible waste of resources, as I'm pretty sure 99% of
> everyone who subscribes to that list has set things up to go to a folder that
> they never check.
> 

There's probably a viable middle ground here for glibc, where commits 
that don't have an entry in patchwork get sent to the list.  Given the 
current traffic for libc-alpha, it won't add much overhead to libc-alpha 
and also meet auditing requirements.

For the release/* branches, it probably makes more sense to send the 
commits to libc-stable, thus removing the need for developers to send 
[committed X.Y] to the list.  This should then limit the utility of 
glibc-cvs to private branch pushes.  I doubt if anybody cares about 
pushes to private branches, do they?

Thanks,
Sid
