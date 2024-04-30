Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AA517107D
	for <cti-tac@lists.linuxfoundation.org>; Tue, 30 Apr 2024 12:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714480926; cv=pass; b=Q/fRsUgXnAugSj5D/GMP1zgiiD81BxvchP/iQIY5qtHwPThSTe1Ht9ydnXQ8nxCxCyrshPHKHGRkDoT0+ENhTM9WhkrdXBz0oHCyhWYIYmwIOe6snPJEn7mR/PUTXTb0R1vJTm5dRdzam4s1BVblCFPv2A3sEaPD7u0r8hxtrIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714480926; c=relaxed/simple;
	bh=LEP+ZUxord0PMcY5XcUc9jr/ogGaT/ZZoaK8i5VMiwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bj8MNLp7vCe1wNA91jRdMaXOZsirUG5NeXLQ9tGjOMf9pWpx07vEY7T06vhFNyeXpMc0/286p/KPf9JS0lRiQgRpO2J08f3g3MGWQLEcCVGKJAp/ZtY0UYuOE4GyVMXVP2dDjTVsnhbSQPEKq7o4aI1dNsOAxwl0tethR01p1oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=aVcPwdQt; arc=pass smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="aVcPwdQt"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9B1260A37
	for <cti-tac@lists.linuxfoundation.org>; Tue, 30 Apr 2024 12:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J93G0u_bFxTL for <cti-tac@lists.linuxfoundation.org>;
 Tue, 30 Apr 2024 12:42:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.209.151; helo=quail.birch.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 44A8F605BB
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44A8F605BB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=aVcPwdQt
Received: from quail.birch.relay.mailchannels.net (quail.birch.relay.mailchannels.net [23.83.209.151])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 44A8F605BB
	for <cti-tac@lists.linuxfoundation.org>; Tue, 30 Apr 2024 12:42:00 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 0FFDA813D3;
	Tue, 30 Apr 2024 12:41:56 +0000 (UTC)
Received: from pdx1-sub0-mail-a249.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 80767802F1;
	Tue, 30 Apr 2024 12:41:55 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1714480915; a=rsa-sha256;
	cv=none;
	b=gsFSdnkd8oqfYfdLCZpDnLNwPrER9zIbw+Ify6LWBsRvVbAuk8fqzHM86kudbIpWKcsNEt
	nFsdd1tXBMzaHZc+AADuKL5GT0Hv/reRbNzEY8gCRtJuf5WM3SxjNUO125abO42l3OIBGw
	Qj+sWEp405K1uQVI4WKWZABy49ROa3qTR20f0xvh/tHqil7kHFcdT/6OfIYl8P7WahWddS
	bmKX1x8NZyugmOtAy1PZM0h3t0bj+6d/LzSNC9DXiC7S5bVkLtgqzmFegvR/YEUoRz0du2
	U8UwhQOVm2M3fzuX7vicawSVlOuAseDH+3nVvBRqU6o2G4dI7NiMAq5oC1uB3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1714480915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=3xMywuVVLqX++e9wBRUrF3AaNCY5g/BBhkNtOIfbUoM=;
	b=kD65RIGEgm6e4FnWA3pPDCQb8GhTs4HcFnvad25Yoe8nr7iFD+YpKBbr04CKrCGznRANCz
	DMk82tXYaZTxq468CbCnbo16BGnSOF7wBf+iRvaqULCFyRIxQbgOCFi3Xh2yb0p4VTnlyY
	8li8MdIa8b22jqcoOAA6uZAumw+VSnaXx6ebrVYUiHS/uQ2hv29xDas5FzO82L3KBqCrGh
	tyhgBrDabTuQw4DLoDrLCRo3mdq4T3OxaAlkew7+31QdsRndRp5X6jMv+LaQpsSofiX34E
	gJuS+yNpWTqDs5l5AKpFeTA5TnOjwFOhjJXpoh8+iec7zfDu7zWYM+GE4cEeYQ==
ARC-Authentication-Results: i=1;
	rspamd-67db6f49c6-dzcnc;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Skirt-Spot: 222986b875348bc6_1714480915863_1052026325
X-MC-Loop-Signature: 1714480915863:2018158252
X-MC-Ingress-Time: 1714480915862
Received: from pdx1-sub0-mail-a249.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.105.11.149 (trex/6.9.2);
	Tue, 30 Apr 2024 12:41:55 +0000
Received: from [192.168.0.182] (unknown [142.198.113.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a249.dreamhost.com (Postfix) with ESMTPSA id 4VTKZq0xgHzCY;
	Tue, 30 Apr 2024 05:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1714480915;
	bh=3xMywuVVLqX++e9wBRUrF3AaNCY5g/BBhkNtOIfbUoM=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=aVcPwdQtZ3PP9ttnMS74D+dDM9c8mKF3Q42/L/UefJY9LYUouycT4id+RWDGIjVXD
	 dGtKvEirm5EQHyRCGSLnvYSlH2BscDhC9pO0txytvlmyooiNWQzO/6z8CxpuwtNNzP
	 cPjj6aGoA5401+GmH5K9aPaq6F5PyXOTrsAmKQWz7i6s0yhNeZc4sL/hfanZfwD9cr
	 /Mg7qTM5BL711aqoNw0wzXBMeypCK6CtjM0UKYoW8LF2DjNG7fqZTkH3rNkSvCXNJ5
	 LqOpyrYu+Rsh7KT8bD9dt5ZaeaNVDVde2zledZj8KBKCzcYf8WdVKpnxxAbDesUKFU
	 uxTA/ExLGIaeA==
Message-ID: <6bcada32-c63f-4906-9fea-3daf53966b03@gotplt.org>
Date: Tue, 30 Apr 2024 08:41:44 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hashing out the scope of work
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Joseph Myers <josmyers@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
 <2293a3bb-5780-ec5a-ca72-e19671dccb51@redhat.com>
 <20240429-proficient-pastoral-whippet-bcc376@lemur>
 <6d25ccc7-ef3e-a885-b085-51185c23c91@redhat.com>
 <060ff9e5-785a-4963-8d92-2638db3228da@gotplt.org>
 <de67e18-d847-717e-a8d-dbfe7d2044d7@redhat.com>
 <20240429-rousing-mamba-of-improvement-cabefb@lemur>
 <30dc33a-69de-39e6-fe7d-bd21c99ccecf@redhat.com>
 <20240430-polar-jaguar-of-debate-04ddba@lemur>
Content-Language: en-US
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <20240430-polar-jaguar-of-debate-04ddba@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-30 08:30, Konstantin Ryabitsev wrote:
>> I think it's the details of what patches / patch series still need
>> review that's the most valuable part to preserve and migrate.
> 
> I think we can accomplish this without having to touch the DB. We can
> identify the patches that are still open and replay them from the
> mailing list into the new system. This would be a lot simpler than doing
> database surgery.

That would also allow the trybots to run a second time, flagging patches 
that no longer apply.  It'll be a decent way to weed out outdated 
patches too.

thanks,
Sid
