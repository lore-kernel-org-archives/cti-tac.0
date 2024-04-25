Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AA2153BF2
	for <cti-tac@lists.linuxfoundation.org>; Thu, 25 Apr 2024 20:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714078462; cv=none; b=g7ISSHPdPoE7RB1vzb+QqQsklyM9agOwV91r/xWMFCSHIrxBkCM+QADyhl97v5QclphO/qhgJ+2yhODASNxfoiqXhM40Yu7r3mO9USfeMzf3moDfTflnfUWw4fB6BJ5u4WJ5iOp/2rwEnbcn4pL30buesACHs0PvBZkUjMfgObM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714078462; c=relaxed/simple;
	bh=c3gqeJyldKla1AW9r1/c6Z/PZV5yM2z3LEx2edXVpZM=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=oq9kapO5l/HKCYbSNQ7K09F8YPb9NL6s6/h6xh8buaSUGeOBtrOWaXD+XgD71hXsDQxsI08z4U/NpouDNkIav6VuhLikRPeOMijTFPICVx4xWtN95lmGPWRKCJ/haZjyjXwm8WKZEJ/gmJs9o7Q5Dp7t7jChFXq/3Mcslv6+3gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=fsf.org header.i=@fsf.org header.b=sFZozrXO; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fsf.org header.i=@fsf.org header.b="sFZozrXO"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33B5D4033D
	for <cti-tac@lists.linuxfoundation.org>; Thu, 25 Apr 2024 20:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60JxXhXv6Kyw for <cti-tac@lists.linuxfoundation.org>;
 Thu, 25 Apr 2024 20:54:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:470:142::13; helo=mail.fsf.org; envelope-from=iank@fsf.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D0844030A
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=fsf.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D0844030A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=fsf.org header.i=@fsf.org header.a=rsa-sha256 header.s=mail-fsf-org header.b=sFZozrXO
Received: from mail.fsf.org (mail.fsf.org [IPv6:2001:470:142::13])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5D0844030A
	for <cti-tac@lists.linuxfoundation.org>; Thu, 25 Apr 2024 20:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fsf.org;
	s=mail-fsf-org; h=MIME-Version:In-reply-to:Date:Subject:To:From:References;
	 bh=/WHn+AkOHDoAxkiwfnF/csHdBA45GnTzx1tHins8Duc=; b=sFZozrXO2OJc9gvNdtngTo6zN
	whHXafPWXU1TXCShl9b4JWo4VGnzxyoo4eSmrMylijl74TwgoZsWvr48VxBfLc/bk2iHgpdL4KRne
	emru+YyNIEXomPAwfZny9Rh/IN5fnPf7gh4v/sKsdXfuCZWKNnOZpzaXEcigHajcz6DQaWoOOMGr2
	PeEQ1pbzyiBy+5RQmQxe297+b9aoOSLWobi4OkiWsPCSTqNcJA36ye94voeKdlgWsceSmD19j6LB/
	T+TrdwUL5YzdIJHXSJrlAr7BEQYEPDg03D6O/pnKrl+aoZy/KErZ2CIiUGdWe1KPB2dXqLM48PB4j
	fprNRpbNQ==;
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
 <87v846a1zi.fsf@fsf.org> <20240424-funny-lemon-starling-8b1aae@lemur>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: Ian Kelling <iank@fsf.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Hashing out the scope of work
Date: Thu, 25 Apr 2024 16:06:57 -0400
In-reply-to: <20240424-funny-lemon-starling-8b1aae@lemur>
Message-ID: <87ttjpurtr.fsf@fsf.org>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Wed, Apr 24, 2024 at 05:15:33PM -0400, Ian Kelling wrote:
>> > 7. Video conferencing (BigBlueButton)
>> >
>> >   a. LF will provide video conferencing to the project using [BigBlueB=
utton][9]
>> >      (BBB), either with a 3rd-party provider or as a fully self-hosted=
 service.
>> >   b. LF will work with the glibc project to set up conference rooms an=
d access
>> >      as required.
>>=20
>> Regarding BBB:
>>=20
>> Looks like you forgot to include the [9] link.
>>=20
>> BBB versions of the last few years have a dependency on nonfree MongoDB
>> versions. I think the LF BBB that CTI has been using is running nonfree
>> MongoDB. The upstream BBB developers announced they are removing
>> MongoDB, but that work does not have a set timeline, I hope it will be
>> done within a year. At FSF, we are migrating to Gal=C3=A8ne,
>> https://galene.org/ , which has less features but also takes less
>> resources and is much less sysadmin work.
>
> Okay, thank you for bringing that up. Another video conferencing system=20
> which we've previously deployed is Jitsi. Are there any similar=20
> objections to that platform?
>
> -K

Jitsi should be ok. At FSF, we've had some occasional usability problems
with Jitsi, but no software freedom problems.

But note, this was not an objection, it was pointing out a fundamental
defect that got overlooked.

Consider who's responsibility is it to check the freedom status of
software deployed by LF IT for CTI.

A promise to use free software is one thing, actually living up to it
needs some procedures, procedures that failed or that you don't have in
place.

--=20
Ian Kelling | Senior Systems Administrator, Free Software Foundation
GPG Key: B125 F60B 7B28 7FF6 A2B7  DF8F 170A F0E2 9542 95DF
https://fsf.org | https://gnu.org
