Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D11386
	for <cti-tac@lists.linuxfoundation.org>; Fri,  1 Mar 2024 00:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709252747; cv=none; b=FDLLU8gnTVIU1yrO3PWLZUPXNwzYdsZD4E+qIP+e+8oBU/VzKUGwHv59UZM+yPw29yV2MTR73JTlNUddRWyfpjPybTnZeR8FTresPVU4iYUTYtvQW6YC4uM9AlHZhT/k89PgbBsZL60O9GxJBijN34YVx/396dPe4UT8G/eDT/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709252747; c=relaxed/simple;
	bh=1W21IkwYVeqW3yMt2HD9sPLcBKfihTdtl5uT15dobuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmlsSR4mZLQVTcpwPMO9l4Ul4uQCwOLxliUFR4OkX/jg5/+5F0m6g+pHFFLOvYbIpfEny+C7imCr+rG3ALQGTJoMpm14fQXA7+VtI0MBhKCX0CI8mHYS98XEcR0UBcw9kwDXzo2e+chHfDrsHgNr5bjvSx2YtGroEf4gDJEx6W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N8TLDj49; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N8TLDj49"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 106534053D
	for <cti-tac@lists.linuxfoundation.org>; Fri,  1 Mar 2024 00:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id imB4hFNi_lte for <cti-tac@lists.linuxfoundation.org>;
	Fri,  1 Mar 2024 00:25:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A977240242
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A977240242
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=N8TLDj49
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A977240242
	for <cti-tac@lists.linuxfoundation.org>; Fri,  1 Mar 2024 00:25:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4C178CE0A0A;
	Fri,  1 Mar 2024 00:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59AE3C433F1;
	Fri,  1 Mar 2024 00:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709252739;
	bh=1W21IkwYVeqW3yMt2HD9sPLcBKfihTdtl5uT15dobuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8TLDj49C1V9TkcAK7qMmf1Ugv0oJsJ5dklfqfyN9Vwl3km9RqLQd2mfgJgQreTJH
	 abFBBq9AuhVgz/xTvWPHxoxwtqDOJwUb2u/U2BZEorpBzBza6VJ8NblazamFjuwutd
	 A4w80XcPaTztjRBWh++HMk25ZQ9rm18kaGsq5qaI=
Date: Thu, 29 Feb 2024 19:25:38 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Next steps to turn on https://coretoolchain.dev?
Message-ID: <20240229-gregarious-jade-mantis-9d3df2@meerkat>
References: <26fa2971-f3c4-4b92-b89d-9157e21f59b7@redhat.com>
 <20240228-functional-impressive-pegasus-ee839b@meerkat>
 <6f509356-b893-40da-971f-bb0fde4484b9@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6f509356-b893-40da-971f-bb0fde4484b9@redhat.com>

On Wed, Feb 28, 2024 at 06:19:42PM -0500, Carlos O'Donell wrote:
> > I will enable that in the next few days. However, I thought the site was
> > cti.coretoolchain.dev, not toplevel?
> 
> Let me check the CTI TAC notes...
> ~~~
>  * Consensus is around "coretoolchain.dev" for "cti.coretoolchain.dev" documentation.
> ~~~
> You are correct, "cti.coretoolchain.dev" was the final decision.

This site is now available:

https://cti.coretoolchain.dev/

It's not auto-building yet, but it's a small thing to enable tomorrow. There
are a few small tweaks to be done, too, like redirecting 80 to 443, but I ran
out of daylight today.

-K
