Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B1F195FE8
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Nov 2025 13:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764248490; cv=pass; b=JZ1mzZ57D6JK5swckbKP3OrwHqKmNBIBwccb7yQm+gaGHuF/4Gl8F7JbUWtPOednZ+Jfj7RunboJA02axOVNJgtQhufqTUr829m+tYIsVDjmjPkHHQAJ+waFaGDulf6EzZPVxBuWYHulDx67r3ay8JXiMLaPZiqKS57ui1NhkMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764248490; c=relaxed/simple;
	bh=Chw9AvEdZREF4pfHOO4IU8faZKE8Ap+clHqmBXFkaHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KQrC865rg4ATT7XZn7aWk5uz/9qKZzx7nLMDgSNB2EHWdPHGQBhA28GkUsD1Qatco5QRO4575wNIAHglpY+z8BQlV6Vfn0+HBQVSk9eJgKVp1/X9H7aBklqkNjWT8USvnd9lOU99j1qTKZV3VgKW9siRHZFOoSexxniT7WEblrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=fOPhAfhu; arc=pass smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="fOPhAfhu"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B30DB60B9F
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Nov 2025 13:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.789
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWxcWg_u_gYd for <cti-tac@lists.linuxfoundation.org>;
 Thu, 27 Nov 2025 13:01:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.222.57; helo=elephant.ash.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EBC060AA6
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EBC060AA6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=fOPhAfhu
Received: from elephant.ash.relay.mailchannels.net (elephant.ash.relay.mailchannels.net [23.83.222.57])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6EBC060AA6
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Nov 2025 13:01:27 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 880E9922438;
	Thu, 27 Nov 2025 12:49:47 +0000 (UTC)
Received: from pdx1-sub0-mail-a252.dreamhost.com (100-96-186-111.trex-nlb.outbound.svc.cluster.local [100.96.186.111])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3452B9223FB;
	Thu, 27 Nov 2025 12:49:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1764247787;
	b=jFVpY7rltmuwieubKzXaLpNbigBecHCHRV9h2Xj1YX6NNmtcbGCqJNfgxkdZum/3wNFGco
	UBPZGW+rgz9nnFAwrxKfJk/Afoxj8waSzhF6BlCkLKL0Bdm8bE8+WT/PUcq9ZBdr2IzfAN
	DR0jZH0CqznanxT2a4Ng4lQajjjFHR5RNiWyhUDJX+qY0IsHUlZbXLhYAflkhuV4sNKion
	z4XBbZMQkNeNXvNiTsoZa+w43LkbO//w7a1Ebz2iauVaoey99AqnBVDGCRP+h9nOFKm7VL
	gLtdY/O+xQ1X3pUcaPB851AE6ECO6SBVv+s8gfm22i0nNJP8f7lP8kX0f9WBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1764247787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=oRIUwDvIpDEufrD+FYNctlyaibB6FzhYhjhJEEwN9hM=;
	b=ovC9vGke41GLmP1Gk/+do/k09VSWAa9CWJfjg9aZdCfH0gBLE4tigOB0dCBd2ybnBIHOdj
	b817s09UD3asm1Pb823blySMNFRJ2hUP3h2Y1EUi5C0uCHPB+Mn8OIWG384wjdmAYHzl9h
	rvyUjAuCIrH4CZOsor4gPyBkZuCVzeVscFXoimzGBvZCyxZOyM8FCNxExQhDljxSkCBF3z
	MHJ7aDfKL5f+wele3sdEISlYN0sU4577o8ClW7FTRUyEcDCORPECpps+86Q/9DehvuJvO3
	AFMETaQ56P8rSSCUdTIUu6uf/tnKAwShDegUoHymXEZTBg+uqyHlk7f+PoW41Q==
ARC-Authentication-Results: i=1;
	rspamd-7bff5db4cb-c72x5;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Juvenile-Stupid: 2ba1567925c225ab_1764247787432_2043015851
X-MC-Loop-Signature: 1764247787432:963113437
X-MC-Ingress-Time: 1764247787432
Received: from pdx1-sub0-mail-a252.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.186.111 (trex/7.1.3);
	Thu, 27 Nov 2025 12:49:47 +0000
Received: from [192.168.0.135] (unknown [38.23.181.90])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a252.dreamhost.com (Postfix) with ESMTPSA id 4dHGV20dzdzyrB;
	Thu, 27 Nov 2025 04:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1764247786;
	bh=oRIUwDvIpDEufrD+FYNctlyaibB6FzhYhjhJEEwN9hM=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=fOPhAfhuGS6TCAtTaAErdR83LFOdRL1OArRv01yBqCmRK+0vwTgn2aBMIbpvOy+zA
	 ynIdMU8K4CMfP6Bj3y0Acd6m6XoxeBI9C5tYJFQNp+hc86lMWyopv9BKPrdWRDkHNw
	 VclQoBewBfbarVfnOZkl0xD8aShLgN7wb+WltFIjdq7NW7OFf68ngEVoEtrVMoXsWH
	 Aa4s26IJj1cCKpuzLhzzf3QBZA7RRcndO7U7z4QJPxMuIGnVT+G1+iXyHLwh9uT6FO
	 wfrEAG9GIDsTTdDhuHSQfkfDIpJ8NnT+YwDzCHFAPPOOtzfD/Y6k1taaO2jzDLkzUd
	 8Qo9fB+Y3UhXQ==
Message-ID: <dd03bc39-1e60-4d58-8baa-005d6933e04a@gotplt.org>
Date: Thu, 27 Nov 2025 07:49:45 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] Update spelling wordlist with "MiB".
To: Carlos O'Donell <carlos@redhat.com>, cti-tac@lists.linuxfoundation.org
References: <20251126220707.2596367-1-carlos@redhat.com>
 <20251126220707.2596367-4-carlos@redhat.com>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
Content-Language: en-US
In-Reply-To: <20251126220707.2596367-4-carlos@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025-11-26 17:06, Carlos O'Donell wrote:
> Signed-off-by: Carlos O'Donell<carlos@redhat.com>
> ---
>   source/spelling_wordlist.txt | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
