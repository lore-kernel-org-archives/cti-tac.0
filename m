Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0921F2260D
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 21:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B0A684199
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 21:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B0A684199
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=Lea0kwSs
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qTeNnaoIAf0U for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 21:12:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03FD58419A
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 03FD58419A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 21:12:32 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 2F8FD8C1458;
	Wed, 24 May 2023 21:12:32 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id B8DD78C1548;
	Wed, 24 May 2023 21:12:31 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1684962751; a=rsa-sha256;
	cv=none;
	b=Qnhekalyc1i3Z6lgLpl2nQ5gmGyu+KuLJfXE6aqoNpKLqeFrrka3aeBUioLflM8qUXveRH
	tygXrQ+93fmwl+O+rj0fH6QKJ6aAcTvqqYRQOKg5zbjHmQKA0Ag8LVvk0S3ojkQVhooOhM
	jQm5ugZfjnuMCjt/zz3tv5d8vJ+hY8jxKMyIHAU4Me6zJdN5wgLIjYmHqtCJ7Pqb6Z9His
	hRrs96PqoQky0WgetFATgg63+wg9pd0b7uc27f60Wj80dULzT2caN7Np7rpYCRLtNQcHcr
	+DTnGyz1xOVgr00UfVsH4cK08Rs1F9ZzNFVd2C9u6I7oOZZT5PFNYLnzPC5qnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1684962751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=JeSZWRSDEKSkCBMP6oapBNBQRw6OimrGRpFZsbroBbQ=;
	b=gn949mfg6tgOk+A5KADK1m0XzKlCokStgpLOI8hb08OxtydYACRMonzrP5k1M+zLY2zJXs
	mcWLBwoS2jSQ+4SkHSceagnje/6/ZL7SRYMVmY349XkOWa5BeQQM4E5T7dgnJuQszU/HCu
	fLzNUggsLeyy9Knvqcu8sFM6VJlb3VrBKFOPUc9gJBAPN2KTFky1PsoTeDC3Z9Cb3Xuroq
	1rvZ+lLFP9NUy76b1r+o8CN1DHdWbjOXnSb8wPNGOqvlLm/uzjOiIJ7A8kNJnyaBi9JoZK
	60grWBrp04qU2kXdqi+SZlfMwPfagaKbGeJbSRFUq4Yd6YsGbLh0vbvDGqgPbA==
ARC-Authentication-Results: i=1;
	rspamd-79bb5575d7-nhjl6;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Irritate-Illustrious: 0c3aa5013ed0c0e6_1684962751981_2640431051
X-MC-Loop-Signature: 1684962751981:339703744
X-MC-Ingress-Time: 1684962751981
Received: from pdx1-sub0-mail-a305.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.104.253.217 (trex/6.8.1);
	Wed, 24 May 2023 21:12:31 +0000
Received: from [192.168.0.182] (bras-vprn-toroon4834w-lp130-02-142-113-138-85.dsl.bell.ca [142.113.138.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a305.dreamhost.com (Postfix) with ESMTPSA id 4QRP5q1GHCzRG;
	Wed, 24 May 2023 14:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1684962751;
	bh=JeSZWRSDEKSkCBMP6oapBNBQRw6OimrGRpFZsbroBbQ=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=Lea0kwSsiBKAtZ7RY5IAF5fxGFze3UPBblQvIn8Dsgz3d706nGo97mqrBdP1XNHhG
	 IIvPKQt84dY1Hee1xKcXE5X+eajnNbQ4pOyL4WoECsQAB/86VVF1OmHPkmvbYWPK+D
	 NZa/pBQ+k7A2sGuA3iLF/MWfVIpdWokzUoJQcNVVv2ujJu1L1mL2Igrw4El5T4wvpO
	 5AtHjY2kdg2pFBjJAtq/5NjS9lBU9JniQwGYbwIFurcgVgPVZSrPOoZrFniOrKy5g3
	 UtOdYQpbzbJBYQJtpLfUHi5eWBi+CwJPOkaWs/Lrq98AqCvsy3QuraxkcS3tGPb0e2
	 XyDH8w2grMS0w==
Message-ID: <0f264640-83ca-18da-9b8f-e04e7e0fc960@gotplt.org>
Date: Wed, 24 May 2023 17:12:30 -0400
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
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Joseph Myers <joseph@codesourcery.com>, cti-tac@lists.linuxfoundation.org
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
 <20230523-ankle-infer-spurs-55ac6f@meerkat>
 <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com>
 <20230523-banks-calve-rio-844c98@meerkat>
 <7f11ed34-9529-9b3a-e720-64bd3a85542c@codesourcery.com>
 <20230523-cease-candle-debase-dd7485@meerkat>
 <cd8ad55d-38c5-72f1-3464-b5968d1f8fde@codesourcery.com>
 <20230524-december-goon-09e728@meerkat>
 <a4c8b242-7ab1-a0da-fbe0-19cffe1a6054@gotplt.org>
 <20230524-gloating-diocese-cde658@meerkat>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <20230524-gloating-diocese-cde658@meerkat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-05-24 15:06, Konstantin Ryabitsev wrote:
> On Wed, May 24, 2023 at 02:13:53PM -0400, Siddhesh Poyarekar wrote:
>> It looks like the question of who to ultimately trust, either the gatekeeper
>> committer (or two) who is the only person to have write access to the
>> repository, or the admin who manages the box.
> 
> The maintainer's action are in the public, while the admin's actions are
> hidden.
> 
>> The gatekeeper committer could also fabricate commits and push to the
>> central repository in the same way.
> 
> 1. Not with nearly as much impunity, especially if non-fast-forward pushes are
>     disallowed.

If an admin makes a change that needs a fast-forward, anybody trying to 
sync their repos would see the forced update.  I'll admit though that 
it's arguable how many would actually notice the message.

Thanks,
Sid
