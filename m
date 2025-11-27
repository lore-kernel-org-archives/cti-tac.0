Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E4516F265
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Nov 2025 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764247534; cv=pass; b=VPsUYL/OqOmCybeqrEJjNt4UbaX6w3q83c59OS77ZreCqdIpeeyZMC6xCjnyRJBtplW2Fuswu0hcfhECsyA+2248r1+OxaIxtM19fKWNDsjn2xPoJ2A6HrCdfsUHsWhFudaI+WKd6rPKQ8fQhON4+HUhot+SfJcZMgWEuezmMhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764247534; c=relaxed/simple;
	bh=mruuVj2YqTInrlIqOdPm+LMfwTQiQqQAadCY/UZFqUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GovLfsa9BhuPPKIrnMkegXyR3MsPKGSQi+Rm8m4quSVwOnb5IokgrKaAQ4L4/yYEZnUkU22Ur7n8Vbn9AG90vjQ5VOR04eZ7XgRbdFZjgutbvU/ZnnmCbMuC5PG+e1oKV1zbc9aCoMp4ViP427JfNbBSl9piQE8JKFKL2xS0zvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=svoeP6r1; arc=pass smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="svoeP6r1"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DFB181F2C
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Nov 2025 12:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfDfzeV7eEGy for <cti-tac@lists.linuxfoundation.org>;
 Thu, 27 Nov 2025 12:45:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.223.161; helo=seahorse.cherry.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2CA3281EBD
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CA3281EBD
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=svoeP6r1
Received: from seahorse.cherry.relay.mailchannels.net (seahorse.cherry.relay.mailchannels.net [23.83.223.161])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2CA3281EBD
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Nov 2025 12:45:29 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 47CD754246B;
	Thu, 27 Nov 2025 12:45:29 +0000 (UTC)
Received: from pdx1-sub0-mail-a252.dreamhost.com (trex-green-7.trex.outbound.svc.cluster.local [100.96.77.42])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id DCFD654264D;
	Thu, 27 Nov 2025 12:45:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1764247528;
	b=mBZs4joyRlI6GHKQMevETPWnbmkwKXBH2DWRebU3v7gAu/QtH/hySLB/94AbNkNNANClbZ
	eE1YDdtNAbSYjGV+5xuwuaP1Hczhy1Qf1H6j7aSQab6CslBVCcjRvvzogt1J9hXNk2dpUH
	rBrULjyuUiD+RoWdoUtv4ZulFPDqAsxYUedGgS+Wah6L45uzATY/bSBvmobPtBQWAs/xwg
	DZLmi4fDiVkMXVR+CjLcoRMsy+XoVEfbM2cD03sCliJIfaBneHAVbLhKFe/Wk8bqGVRbR7
	WqB3sN4sLVzkKRls/uodnJZqLR8ADTywtXFWRs1x8a2us3yO0+vCzIlZrbnf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1764247528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=95qEP6GnYCxSRa6PgMJgPSc8dCXnRq9KV/iSyXNHESo=;
	b=XH9zk9fV4q5AZLHgJC5zlfEwi/2KYh5+0G0dSjqiitZ0XJdthATkcqtsjBQJTmOqmnUwru
	UxnMdhB8aqCpbHBQ5TAqlMn8RICfvZF63wBG+l2GrK2CwhFgLD4QA3dz+Z9Mca4lV84Dx+
	DVgFMl/C0vTMzDr8WOyrFd/Qgag9s/FkjHsX0q6kYmBltIqgCgQN88aRj7FiiF7A7GvA9G
	G1J9nbu0se7qzt3v2xnm3Kvfh6WE2NSdzUg3l/ibKnm7Ac7ueDgjg38B/5st8eQr6Ig2JS
	sIpOyyg+7HoL3PsxDtSV6fMU6C9sYblaeFfvlCACLDL/Lv2OesRp7rek0t6uqg==
ARC-Authentication-Results: i=1;
	rspamd-7bff5db4cb-mbcm2;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Illustrious-Thoughtful: 69c8c0e261cf8b51_1764247529112_3100265312
X-MC-Loop-Signature: 1764247529112:3491487805
X-MC-Ingress-Time: 1764247529112
Received: from pdx1-sub0-mail-a252.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.77.42 (trex/7.1.3);
	Thu, 27 Nov 2025 12:45:29 +0000
Received: from [192.168.0.135] (unknown [38.23.181.90])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a252.dreamhost.com (Postfix) with ESMTPSA id 4dHGP42lhfzyr8;
	Thu, 27 Nov 2025 04:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1764247528;
	bh=95qEP6GnYCxSRa6PgMJgPSc8dCXnRq9KV/iSyXNHESo=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=svoeP6r1yq3NAkjzbv1Usea0p7tRpBqiJia0bkvYMWEHJA2/Ik7fb+zQW6rNxeFe2
	 Ua1d5sQ4eDuPn24HbFQ6jzi11ntTg0rQQPRzoX7VUcnEbHbExpEAltgTmg1lgpAbZK
	 7ACnVqUCGU+JBkARtBuC7D8FhPz8g4KNgZYxLatgSL278VYEAsBhmyWblX2xvTrUCE
	 ua2knnfJFTouagJOYXuTd5ZL2AAW+R0Duh43GtiyaW5enAhPJjZb5eNRm0Oh4zqcXP
	 YLtlugLf19m+jQ2PPuWijxCJlrf1XTMhnJKLpprQgkVHefAHNVVFHBegvMsmkq23N0
	 cnElViUXUNmqw==
Message-ID: <0e6e6765-b31f-4611-8861-feb479a9ebb7@gotplt.org>
Date: Thu, 27 Nov 2025 07:45:27 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] tac/minutes: Add additional meeting links.
To: Carlos O'Donell <carlos@redhat.com>, cti-tac@lists.linuxfoundation.org
References: <20251126220707.2596367-1-carlos@redhat.com>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
Content-Language: en-US
In-Reply-To: <20251126220707.2596367-1-carlos@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-11-26 17:06, Carlos O'Donell wrote:
> Signed-off-by: Carlos O'Donell <carlos@redhat.com>
> ---

Reviewed-by: Siddhesh Poyarekar <siddhesh@gotplt.org>

>   source/tac/minutes.rst | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/source/tac/minutes.rst b/source/tac/minutes.rst
> index 454d6ec..0c0a27d 100644
> --- a/source/tac/minutes.rst
> +++ b/source/tac/minutes.rst
> @@ -9,6 +9,19 @@ The CTI TAC meetings minutes are sent to mailing list for archival: https://lore
>   
>   Recent meeting minutes are linked to here:
>   
> +  * `CTI TAC Meeting Notes 2025-11-26 <https://lore.kernel.org/cti-tac/3b1aaa90-9b46-4ce3-9209-4b9c358107d9@redhat.com/>`_
> +  * `CTI TAC Meeting Notes 2025-10-29 <https://lore.kernel.org/cti-tac/efca566d-6826-44d5-a599-240e0d1353d1@redhat.com/>`_
> +  * `CTI TAC Meeting Notes 2025-09-24 <https://lore.kernel.org/cti-tac/a0e12467-d54c-405d-a398-3463572729b9@redhat.com/>`_
> +  * `CTI TAC Meeting Notes 2025-08-27 <https://lore.kernel.org/cti-tac/4c7f3274-1c2d-4ae6-935a-5ceb656d71c4@redhat.com/>`_
> +  * `CTI TAC Meeting Notes 2025-07-30 <https://lore.kernel.org/cti-tac/1147e939-c6f0-4ae5-a0e0-a38fc05455e2@redhat.com/>`_
> +  * `CTI TAC Meeting Notes 2025-06-25 <https://lore.kernel.org/cti-tac/89406554-8527-4c63-b863-e8af530d4a1f@redhat.com/>`_
> +  * `CTI TAC Meeting Notes 2025-05-28 <https://lore.kernel.org/cti-tac/e7cf22c4-664e-4fd9-9933-b6b1eb6e4954@redhat.com/>`_
> +  * `CTI TAC Meeting Notes 2025-04-30 <https://lore.kernel.org/cti-tac/b949fd82-c704-4fd1-949d-28f5b0b42e50@redhat.com/>`_
> +  * `CTI TAC Meeting Notes 2025-03-26 <https://lore.kernel.org/cti-tac/5ebb8fa6-22ce-4224-be5b-6977b0bef8a2@redhat.com/>`_
> +  * `CTI TAC Meeting Notes 2025-02-26 <https://lore.kernel.org/cti-tac/3e2d354a-5366-42c9-8083-0596fafe23fa@redhat.com/>`_
> +  * `CTI TAC Meeting Notes 2025-01-29 <https://lore.kernel.org/cti-tac/50dd80af-7b74-41f8-b3b1-48bb1b9b483d@redhat.com/>`_
> +  * `CTI TAC Meeting Notes 2024-11-27 <https://lore.kernel.org/cti-tac/370f83d9-f771-4327-811b-049d74efe0fe@redhat.com/>`_
> +  * `CTI TAC Meeting Notes 2024-10-30 <https://lore.kernel.org/cti-tac/1d7c45d0-0587-4ae9-98b4-2b8997236b79@redhat.com/>`_
>     * `CTI TAC Meeting Notes 2024-09-25 <https://lore.kernel.org/cti-tac/e3551841-0427-49da-8cb0-833a335daeca@redhat.com/>`_
>     * `CTI TAC Meeting Notes 2024-08-28 <https://lore.kernel.org/cti-tac/4d22bea8-9a01-43d7-9579-b6c877154e10@redhat.com/>`_
>     * `CTI TAC Meeting Notes 2024-07-31 <https://lore.kernel.org/cti-tac/5e90ba39-d301-4ce3-bfab-d663864cb627@redhat.com/>`_

