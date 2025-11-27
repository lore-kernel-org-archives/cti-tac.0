Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305FA1E5B64
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Nov 2025 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764247742; cv=pass; b=Aukz+yiRTMzQG9iO9Jowo9CoVpZeNYh/wn0WRt4mPUH9G+mtsk82WfuS5Kun9rxj0muDqFf9wc0dsToHO+evdMppgFkjcQE4ACjMbwy4oRT98fHAjZMd600tkYgqVBfCTasHkEH0UKqg1T5d3diMi/DIvvRZ8OfLZX7MUZqVzVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764247742; c=relaxed/simple;
	bh=v+f4uzE/Xu8yikfvpRGdboQtP6sq1bBfsXlMh/WkTUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dcqTr7ReBldjztNky0xv9r9/UFdwl5ql00hiMsTADOmPNiy+/RngPPFRyhgqiCeAQVuPCgeZHB3CewtTuno5akNvlmxOl5h+LYN4SscAtIi/S73I+rVgb6Sr8SqkBeMbajk6NhX9gm7dC+kuIcZryQnc2SG/pLILA2MT6i59GjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=oQGeDAQE; arc=pass smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="oQGeDAQE"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA62B40296
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Nov 2025 12:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.789
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PtpZOfvjXIxl for <cti-tac@lists.linuxfoundation.org>;
 Thu, 27 Nov 2025 12:48:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.222.42; helo=crab.ash.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3EE04019A
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3EE04019A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=oQGeDAQE
Received: from crab.ash.relay.mailchannels.net (crab.ash.relay.mailchannels.net [23.83.222.42])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E3EE04019A
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Nov 2025 12:48:58 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 62A49461984;
	Thu, 27 Nov 2025 12:48:56 +0000 (UTC)
Received: from pdx1-sub0-mail-a252.dreamhost.com (trex-green-5.trex.outbound.svc.cluster.local [100.99.13.166])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 0171F4618D2;
	Thu, 27 Nov 2025 12:48:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1764247736;
	b=BjN/Ws0zWXu1Yyvax3op/sYhr61ZSqKkp6dmRa2bvu6Rvp2OkLddjlWy0Y9GaRVuFzT39R
	N7MM6wv4JrfBBiX73lH/rOakxIZ9AJYmuFoiChIpQz5uVGt0deVwX0mpHus/fudJ94RWEi
	FP2s+645HE0szHTwlps8NXHHXKJr7yGg6pWJ/gFl9WsWIGKJYq7cFWb9neMTqBGsWpNjC9
	KOGGPPIUcY9p44Tj/wbrpcbCjvpMLyy3+RiR1uJ0uzQPUP2sCo7TI7eqPxYpkhTzB+Jb8q
	79bXO22mDly8EcETuaqnqPLOyN0aP9TCUimuUfLuY3xTzH1olJ4HVHrtkvpF1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1764247736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=oTO//wghOLuZfXjE2qDH2HmJTwG0mpVq66zKvHFzVzE=;
	b=dCKsKnQduBGi1Z+GZB+jGRFralaiB0M4gj/0FOfcB8to5nRq7w+oCGhyLVp98T2Sqm0JbT
	pd/0h+QpL+jLfcC/c8578bc3Cr3594XpWZEyLcYN9KPZ8qYtNpJC7KSvigeafQgVK32sOq
	ho/iRksHStOvgjwclGP38V6JQUX8h+Y1yq5JWQjKg5q17PyMbz5jpu2HHoICy7Qx5UQBuz
	Ea5LfM4KBTS6sFCSJyScpz4FBduzK2rrprtroeGIJsHnmTFH+hc2XTJvnLBjKVxSwNjz6a
	DtyJ/K5PRBKwrLVgoKXkyHfXfFE35PQg0a40SEzCLwIPEZAVGGREVXpCfqL0yA==
ARC-Authentication-Results: i=1;
	rspamd-74f6bfdf88-f994l;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Stop-Fearful: 3cd78b5a5c3fbc8b_1764247736215_2284373663
X-MC-Loop-Signature: 1764247736215:1126241157
X-MC-Ingress-Time: 1764247736215
Received: from pdx1-sub0-mail-a252.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.13.166 (trex/7.1.3);
	Thu, 27 Nov 2025 12:48:56 +0000
Received: from [192.168.0.135] (unknown [38.23.181.90])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a252.dreamhost.com (Postfix) with ESMTPSA id 4dHGT34RClz107T;
	Thu, 27 Nov 2025 04:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1764247735;
	bh=oTO//wghOLuZfXjE2qDH2HmJTwG0mpVq66zKvHFzVzE=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=oQGeDAQEert/4rqAk8SZ1x78+5l841ctntY821gVfUf6krrpv0SEYP29CdDDyN4xe
	 ICX+2/LDJus0t2EkgW1g3fgvZMYAGezbxPgS7rP3uZuN60tKesINoST1DMPeCrcchz
	 TW9dP4ks4xqo5WAOIOXTNkxgMD0SC3oPNrNf6C5M5F3XXe/S1eOvdOoyAyuYbqKwGB
	 H9WThMdtOw4LEHoDZ5ncSRSoIskhmQEJ3T+weoihjykQDl4OdsmI/18P78/A9gmCX9
	 32Fp5Bd+lXk9cXOqh2fQmMT6VeGyyldTUQFBtTsDYIcQlKlmn0eH+9UrBzojGIlvcE
	 gJLwg4ZGICBOA==
Message-ID: <4805c96d-780c-48cb-8e8e-efef4bac0b7c@gotplt.org>
Date: Thu, 27 Nov 2025 07:48:54 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] index: Update GNU Tools Cauldron photo to 2025.
To: Carlos O'Donell <carlos@redhat.com>, cti-tac@lists.linuxfoundation.org
References: <20251126220707.2596367-1-carlos@redhat.com>
 <20251126220707.2596367-2-carlos@redhat.com>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
Content-Language: en-US
In-Reply-To: <20251126220707.2596367-2-carlos@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-11-26 17:06, Carlos O'Donell wrote:
> Signed-off-by: Carlos O'Donell<carlos@redhat.com>
> ---
>   source/_images/GTC2025.jpg            | Bin 0 -> 806298 bytes
>   source/_images/cauldron2023_photo.jpg | Bin 1471181 -> 0 bytes
>   source/index.rst                      |   4 ++--
>   3 files changed, 2 insertions(+), 2 deletions(-)
>   create mode 100644 source/_images/GTC2025.jpg
>   delete mode 100644 source/_images/cauldron2023_photo.jpg

Reviewed-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
