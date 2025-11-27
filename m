Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C631C54A9
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Nov 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764247774; cv=pass; b=aWACmE41+TCL40/NJGJ7lq8BQ/idKmlKE9KstGQ8Pp8asZx1fNNFLH8evgRiZFWjwphvMQQ1TUdIYMu7z3IsBOSlg0Hh7Ud6gBWa/5X2IFPwPzKebKmA13R1pVgDkbO9vSXY+4ZCWrhGWGmudPN/4aUponFYTWM14I8XPrbH/ZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764247774; c=relaxed/simple;
	bh=iVx1AqlEJs4/UvU+LiWai+0WPQ8yWt6qVgyDRtiAkfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=h/0gsTvK0SccRuaLxxqIykbH7H02iDYhanS+tuarZZOnyetpmqH6mLLbhsBtvyCXrgBPNlIICQPNgYBXZYW+JeXe0lJJFYVqr3CMxxYpml52WjJ4ozvizRIW+oiCiQOkiJqZErkL2/XXgWeutjX7nhTfHIsH9afj+t0gkh+0SAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=UEgGVr19; arc=pass smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="UEgGVr19"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36CAD60ABB
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Nov 2025 12:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.789
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZqsKIFA1gsW for <cti-tac@lists.linuxfoundation.org>;
 Thu, 27 Nov 2025 12:49:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.222.57; helo=elephant.ash.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4534460AA6
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4534460AA6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=UEgGVr19
Received: from elephant.ash.relay.mailchannels.net (elephant.ash.relay.mailchannels.net [23.83.222.57])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4534460AA6
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Nov 2025 12:49:32 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 695AA221AD3;
	Thu, 27 Nov 2025 12:49:30 +0000 (UTC)
Received: from pdx1-sub0-mail-a252.dreamhost.com (100-101-186-244.trex-nlb.outbound.svc.cluster.local [100.101.186.244])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 0D9342219BC;
	Thu, 27 Nov 2025 12:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1764247770;
	b=9mK1ORueyCVLYQ3iIj/s8Jg/F85oiQzypbDjYgASW8cxucPFP5N1VT25CnKf5sjxHoBvwL
	Y/iyBKWWCHPYGOlNju2J64adFp7WgDEcW2FVpUvqus7b5U1VSwfKJO00vSkqmk+o3atlzO
	eyubT/sHLcBh2kpcOF2qCgUQBEICg6I/aEvtjDqzuruf0SOsD5G88mxiOUVPym4IiiKYwz
	ABrNbrW8FcI7bsn3Gs9J65TFSHpnPgaDVzW28Bq5tGpTUlo9nOuilcFSdX8w3iHpj/Vyys
	MNWkYn30N5QSAtOvjWW+Hj1xX9Na3G4rDdqA95sZ8oLgdZcy/R45m00r/yUqAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1764247770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=yACfhMraAoaxGq1rINnvc/GxHj+3CLnL4x1OMCgQhoQ=;
	b=a1ERMWgAxfZ7Fp5pen26SK1xqCoXn0QD8Il3xjYz0UERv9O+b2NiOMw+D2jlQYZ+Mav4UJ
	VyXyYV0jctl7SL2g4teEJI6twjlMwq2reAUpcAeUOqqssZp2cNjAdIxufJIFWhLvb4+GCM
	v7B1eSyBefegnPPiNGkU09s9TMkRXCrj7vHHJ0Zx9GJ9p4cUIP2Y3pqVDG0oQRt/WS/ow1
	tv6rTzKgoVvDSRovTAfY3LoiohpQhYLAYOqd/YzBX6HUT+Vi2a5L6iveda7mpBAzVvLrWE
	TCNWybUQbsO0U08nRvwiIXOtag/i6p85tQEuXJhHhd0AjLXwvYdfMesqZHAdpg==
ARC-Authentication-Results: i=1;
	rspamd-7bff5db4cb-mbcm2;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Wipe-Sponge: 2b768b171e5d27fd_1764247770282_594773450
X-MC-Loop-Signature: 1764247770281:527871350
X-MC-Ingress-Time: 1764247770281
Received: from pdx1-sub0-mail-a252.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.186.244 (trex/7.1.3);
	Thu, 27 Nov 2025 12:49:30 +0000
Received: from [192.168.0.135] (unknown [38.23.181.90])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a252.dreamhost.com (Postfix) with ESMTPSA id 4dHGTj4YBDzyrB;
	Thu, 27 Nov 2025 04:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1764247769;
	bh=yACfhMraAoaxGq1rINnvc/GxHj+3CLnL4x1OMCgQhoQ=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=UEgGVr19N/2d7XuxE+nxXGl5YjBj9Ovb/YjjNbmLEBDKayNB3WsDttS99GosbECVE
	 PJnVL3uMT1j46Lb8eMCRukzzgDgYAVn6KuGc1sdB5LJm8BcKm1yKvspIRl9jv9uO3n
	 yZri9Y1oOVQP7u8Yk/cSO7rbGNpd41SAs82Y0sRqf/d8TjXy8q1amyrpitDUPyu6K0
	 SYyDWFGxvWbL5yrVZ7aAySsgY0umuhOaRW6OVFxPgy5jD36HeABxBVnXBKl5SDLoKn
	 gZs61DhO70plTCTmJbC1t0FmDm9W8o+gAMW8YYHVqnRZCqpfi720i9FOnxlCHCTQYS
	 S8p0z7CPg62EA==
Message-ID: <2776ab72-6d1d-4a0c-970e-2a46fcdf8d04@gotplt.org>
Date: Thu, 27 Nov 2025 07:49:28 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] projects/glibc: Update git to gitolite migration
 status.
To: Carlos O'Donell <carlos@redhat.com>, cti-tac@lists.linuxfoundation.org
References: <20251126220707.2596367-1-carlos@redhat.com>
 <20251126220707.2596367-3-carlos@redhat.com>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
Content-Language: en-US
In-Reply-To: <20251126220707.2596367-3-carlos@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-11-26 17:06, Carlos O'Donell wrote:
> Signed-off-by: Carlos O'Donell<carlos@redhat.com>
> ---
>   source/projects/glibc.rst | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
