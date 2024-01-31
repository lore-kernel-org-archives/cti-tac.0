Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2D939AF0
	for <cti-tac@lists.linuxfoundation.org>; Wed, 31 Jan 2024 22:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706740509; cv=pass; b=ZkbAdKeN+ce5Fn19jzYO1Cl3C4VbC8kIMGKQhL49nBCUhECcrDyunlQIPv/kcjiXXtf9LTqcDVVEsRXpCN2bWtvTWZYcSvpv5Uwzc7kuQglSBsIXBesQ7GrFloa3fGQ4uLqzf928TCEpuF8G0OWFJUxpoxrDLTwVdY4esewob/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706740509; c=relaxed/simple;
	bh=wUUXA4VmZk8u+jNcKyp2btFveyN68dkz2D4C8zEpADc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dBUL0D0tvSeJV9InAdCOCQ/rusjKMZbFdDwJtcxz1xJSIen1yl7LlmSsBbLC6QQxnrEPxUSTE3Jgi20V/Tr5Olol2ps0dQpe9BSwufYeVfChOyYFB/GVptHV7/7X1tEh7vpKhn6o1pDIAtC9AjW+uhBhg9XY1lPO9bY2GVjqtQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=mlpmly0q; arc=pass smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="mlpmly0q"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE0E183D13
	for <cti-tac@lists.linuxfoundation.org>; Wed, 31 Jan 2024 22:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE0E183D13
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=mlpmly0q
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.751
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z3gquFfQvet3 for <cti-tac@lists.linuxfoundation.org>;
	Wed, 31 Jan 2024 22:35:06 +0000 (UTC)
Received: from crocodile.elm.relay.mailchannels.net (crocodile.elm.relay.mailchannels.net [23.83.212.45])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A9C6883852
	for <cti-tac@lists.linuxfoundation.org>; Wed, 31 Jan 2024 22:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9C6883852
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 6825E4C294B;
	Wed, 31 Jan 2024 22:35:04 +0000 (UTC)
Received: from pdx1-sub0-mail-a276.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id E910E4C32A6;
	Wed, 31 Jan 2024 22:35:03 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1706740504; a=rsa-sha256;
	cv=none;
	b=rOfzQlMACgld2DUpA4iVaVLB6J+7gik924L1/IK4MIGXdh4bL9OJKzZTUv4szn7cS0gUhU
	9ntTndt1tDPaQlt7tThHdcCsAd60c8EjYdki+2ugzFtZyWMTbO1uu/B8WVpSD2nj0zGv1U
	DjeNP6ehiZXw0/0gJhBS0/y4Y78pXWj+491vL4Ytdd6N9mSJf5wKFO1ZBSkpurqlzbQ87+
	LjsfgmvOec1C7WR0Sw0lY5MMzliheS2NIwgELpzq3ENIDRM71IJBrYIvAX9n2IRHg9I8tx
	CnmyUmLTeNeOnYRZ/T/Mc0MXtHzoirH8iubEWyx5hZW3uomwxiMyJkJXwkYxZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1706740504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=4S7DKgoKChPVLgX0te6VVquE2/Z8KLtZve0MxbzO5Y8=;
	b=6ACnvBAv+D9tInyeXMdMw1tcd5x8vpyl0nWA9iNXkso29u+sJ/MwNP8WumwL8J1rb/aHAS
	uTlqMvrw+L6tOj/Zn2AjATxtwb87gaz43etnx7MlVe8Z1rlSfBISd/B8eZRs61Wcq/WasM
	SHxJKnKQP0CNfXtrcnP9Xg+t/atQCyj6AM0OE9Nz8nDijl97Gv2miiDq34YMqHKYJTTMig
	96jf0JCyw2fL5EsECKTfp+KOqfwD0jsg5aPjhmsoFASlDpEacwb3/Z58Hh1kkxZSjM7A3j
	AA3x+ly1vOWT97MFIXDLjV7ZJ+c68ON7wssWd6/Q+t4dbXcqr9vzKIYBW/50Dw==
ARC-Authentication-Results: i=1;
	rspamd-55b4bfd7cb-9xvnf;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Tart-Trail: 38faa3d65443471b_1706740504262_836479328
X-MC-Loop-Signature: 1706740504261:1379722793
X-MC-Ingress-Time: 1706740504261
Received: from pdx1-sub0-mail-a276.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.100.20.149 (trex/6.9.2);
	Wed, 31 Jan 2024 22:35:04 +0000
Received: from [192.168.0.182] (bras-base-toroon4834w-grc-23-76-68-24-30.dsl.bell.ca [76.68.24.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a276.dreamhost.com (Postfix) with ESMTPSA id 4TQH0l41zhzLM;
	Wed, 31 Jan 2024 14:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1706740503;
	bh=4S7DKgoKChPVLgX0te6VVquE2/Z8KLtZve0MxbzO5Y8=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=mlpmly0qgTenLrT+5MWFCTvjkYG09rBytmu21jS0Ciu1Ehbv/Boef1B40N+wCjRUG
	 RqOZSRN0szkmQmsHEX9b69e1oR4nOD4HHXLI3Nz8HMeUa0ylsZ+jE6oYzbSyy+HDTq
	 E1oQ1I6WuJu2pk4AgPKG4leG5rGlzvvici5fxOvCA80XQt0TzwUNkBgbG93O8D4mFY
	 UZQKFyzMdvnBC/q+a+IXdvAbfFbcFxGIUgUwYlGXmKpuDnFvmfTw4UB//XJ/1ce+mY
	 prBd+y8e1DlL7MiPAbGPjdF8ZhG60q756viUGpYQvP1C6puoOIKjvISDCfwfZkh3Xv
	 5BDnpnXPR9xNw==
Message-ID: <bd9a1d59-b4a8-4ebd-8ca5-80ae6c0fd84f@gotplt.org>
Date: Wed, 31 Jan 2024 17:34:59 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Gitolite access
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 cti-tac@lists.linuxfoundation.org
References: <20240131-angelic-positive-goshawk-ca6e87@lemur>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <20240131-angelic-positive-goshawk-ca6e87@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-01-31 16:26, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> I have completed the initial gitolite setup. I have the keys for the following
> users:
> 
> - carlos
> - josmyers
> - siddesh

Would you be able to fix the spelling for my username? :)

Thanks,
Siddhesh

PS: sid is also fine, if 3 letter usernames are allowed.
