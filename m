Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E70BD527
	for <cti-tac@lists.linuxfoundation.org>; Wed,  6 Mar 2024 21:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709759859; cv=none; b=BmT8ypANlujhkeGGVCiKhikb/Gre8VMkVUHoEDDJSOyZkgNEySqQL7gs3Q9d5rpBai7aaxvtMgqs7O/+ni83H8KxjGcb2nB3pzNsqAphp0zI7B9bFCH56Kja13fXti66o9txcIlZ6u5vbEvtjsAInpE7v3PTGVc8IuPEfTeno9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709759859; c=relaxed/simple;
	bh=in5aB4gbJ2EYeNijEVwlIkqE8ulM/P5GUyoTkHccIas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISQmZskQKDm2p/cxuMiIWxXHS4JNCjQ769ELu5TGN6uSQoDXoxpkWYQ42p+vj0TV1Hosown/gFheQw6XVeC1JTF7ezftQOrMrON2UmLQql7e893YgE7WU1swsKK0+z4EAvPD0UlfOEJAwh2R6YaIQDkcvY04rgr+bmfdjMKIlQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tybZ7+6u; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tybZ7+6u"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CE808175E
	for <cti-tac@lists.linuxfoundation.org>; Wed,  6 Mar 2024 21:17:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Z5r--bDueKm for <cti-tac@lists.linuxfoundation.org>;
	Wed,  6 Mar 2024 21:17:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1A2381758
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1A2381758
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tybZ7+6u
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B1A2381758
	for <cti-tac@lists.linuxfoundation.org>; Wed,  6 Mar 2024 21:17:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7390BCE235E;
	Wed,  6 Mar 2024 21:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF32C43394;
	Wed,  6 Mar 2024 21:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709759851;
	bh=in5aB4gbJ2EYeNijEVwlIkqE8ulM/P5GUyoTkHccIas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tybZ7+6uxh1mkTcuFkX5ea60PodTQgv6qSM5zmSNkuiC18exDgCGC4N1EwifEE5NV
	 jm1F2mSVfw9Z8u8fzMnZb+MC9EamHjta+NykP/YS2ZCcaJOCtH7KZeHvK3CH7oHi7i
	 20FFyUwcKwGHQigmPZHqWZ2d4XD7pJbr/xMND42k=
Date: Wed, 6 Mar 2024 16:17:30 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Next steps to turn on https://coretoolchain.dev?
Message-ID: <20240306-piquant-witty-wrasse-eddbba@meerkat>
References: <26fa2971-f3c4-4b92-b89d-9157e21f59b7@redhat.com>
 <20240228-functional-impressive-pegasus-ee839b@meerkat>
 <6f509356-b893-40da-971f-bb0fde4484b9@redhat.com>
 <20240229-gregarious-jade-mantis-9d3df2@meerkat>
 <8c0e5054-0e34-46b8-8643-56225288de95@redhat.com>
 <4ed0a71b-65fe-43b4-9a27-b2d8d1663264@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4ed0a71b-65fe-43b4-9a27-b2d8d1663264@redhat.com>

On Wed, Mar 06, 2024 at 03:33:59PM -0500, Carlos O'Donell wrote:
> I can confirm that the updates do go live almost immediately as the remote side reubilds the
> HTML. Thank you for that! It means the edits I'm making should be visible to readers.

Right, I forgot to follow up about that. It's built on replication to a
different user (because we don't want to invoke a build script as the same
user who has access to all the backend repositories), so there is up to 30
seconds delay between push and when the site is rebuilt.

-K
