Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B8D142916
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Apr 2024 22:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713996013; cv=none; b=scR+ePFv1/Fwu1v9ILGoUK1oL+in6awhZ//2QXWXoz4dHywBZEVCtrDFhSShU65NA8LryZvIqJx9CEwi7EMAdIgXs77JrMKtEbLWazTeLTB8XnHcJZ95Gce5SNFaohvmyd0uKCfuQQOAwV5LXP7s+kvMJy5zSFetJY5PZUhDYy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713996013; c=relaxed/simple;
	bh=KArsjADOgf7QBEF1qlhYDF2G6JXWE0mYcCiVezb2gWw=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=lF7yXgU5AdTZa5fIDr4X/PZLNPSnsR70PkmjIiPAB9Uq94NpMWeWa7Rven0hasqx84v9lLk64W4maA022F7iVj1QmBa1tM2tZx5FuDZCcnv9Xn1D50LEC0oMNJZm/+3VXpH2sYkeoArWOBbv2u0SikOMl9a6t4kOmRgJsXG/les=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=fsf.org header.i=@fsf.org header.b=YhYgCHch; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fsf.org header.i=@fsf.org header.b="YhYgCHch"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2685A4176C
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Apr 2024 22:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMXIrzrxJl_6 for <cti-tac@lists.linuxfoundation.org>;
 Wed, 24 Apr 2024 22:00:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:470:142::13; helo=mail.fsf.org; envelope-from=iank@fsf.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86FCA41797
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=fsf.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86FCA41797
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=fsf.org header.i=@fsf.org header.a=rsa-sha256 header.s=mail-fsf-org header.b=YhYgCHch
Received: from mail.fsf.org (mail.fsf.org [IPv6:2001:470:142::13])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 86FCA41797
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Apr 2024 22:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fsf.org;
	s=mail-fsf-org; h=MIME-Version:In-reply-to:Date:Subject:To:From:References;
	 bh=Osx2Ka0aZqBO2rKSHAMiVAuoW66xg/9QWxPcBrvSZkk=; b=YhYgCHchYbbx9fAS8nnmFVsgW
	ogK/ta8sks6URtz0G697d4ACr7a5Ygv08p21HY/MByd3cSWazmZQSCvjn7YrKTWgEe+8u4PdgLKxt
	CK5b6/tqYzTn0/0zFyN0cqCcnSZ9fOqcCnhx92jp3FhrEcSmFsR5ArtixS9NqYnB5FuW1XUFkUJfs
	Nmt5Z5Z1RNCufa3bJM7Kl9/nzR7Oi3LNuPIuMgkrCSKrkEzKiqmWgblXcHdHD6S5M40Oq1XQxYxBM
	XJs1IpxBXyfEW7HbrQTgZEYGnMDqyjYRiw0/vVuvviK60K5V7vDhAmfzMHEpmusU05t8frbkB9RVP
	47lKHuOCw==;
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
User-agent: mu4e 1.10.3; emacs 30.0.50
From: Ian Kelling <iank@fsf.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Hashing out the scope of work
Date: Wed, 24 Apr 2024 17:15:33 -0400
In-reply-to: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
Message-ID: <87v846a1zi.fsf@fsf.org>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> 7. Video conferencing (BigBlueButton)
>
>   a. LF will provide video conferencing to the project using [BigBlueButt=
on][9]
>      (BBB), either with a 3rd-party provider or as a fully self-hosted se=
rvice.
>   b. LF will work with the glibc project to set up conference rooms and a=
ccess
>      as required.

Regarding BBB:

Looks like you forgot to include the [9] link.

BBB versions of the last few years have a dependency on nonfree MongoDB
versions. I think the LF BBB that CTI has been using is running nonfree
MongoDB. The upstream BBB developers announced they are removing
MongoDB, but that work does not have a set timeline, I hope it will be
done within a year. At FSF, we are migrating to Gal=C3=A8ne,
https://galene.org/ , which has less features but also takes less
resources and is much less sysadmin work.

--=20
Ian Kelling | Senior Systems Administrator, Free Software Foundation
GPG Key: B125 F60B 7B28 7FF6 A2B7  DF8F 170A F0E2 9542 95DF
https://fsf.org | https://gnu.org
