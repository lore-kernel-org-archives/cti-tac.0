Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1596113D899
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 20:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727295702; cv=none; b=pq1hsmA90rEAkJd2vJ0+i3E1dttqT2jwc2/krNYxPL14gp+FauSG+hWBzZ2XeBNHwGE9avXE30Of6+PjwiUTM2FToHB/6H8YDR4M9FZhhv4NjNm9+Amye03Se34YeqPsovK/3BwdeSEIv5hgRyFymnYXgCgWpmW4LOVOwfcmW9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727295702; c=relaxed/simple;
	bh=pcMjOcYGkr4/kkjOQuhOJSfkmNK9+Ns9JsDnMFzsvxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOHwRrqiBdOn60q65lKZI3OB6nuIgFYbzEAN33A+/NLwCZTl6fQ1arWOP2dMDOhEOPiaGYmHgGR9aMTLz7skkBtXUqpQUQmqCOewgK2XjhwalDr2l3D/soCHF+TquHwHU6uBKb2HdmHIp16iWpB821Dm4c2F4+V3Z5fU8vZzRzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vV4F7bLm; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vV4F7bLm"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A84BB402F4
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 20:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZeKalaGCyyK for <cti-tac@lists.linuxfoundation.org>;
 Wed, 25 Sep 2024 20:21:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9FCB54017A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FCB54017A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vV4F7bLm
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9FCB54017A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 20:21:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 367565C5492;
	Wed, 25 Sep 2024 20:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77ABC4CEC3;
	Wed, 25 Sep 2024 20:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727295697;
	bh=pcMjOcYGkr4/kkjOQuhOJSfkmNK9+Ns9JsDnMFzsvxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vV4F7bLmPRbc/b3WDOQPiccMJ8f20ylSVT1oFnbjET4Qvn3F/zeFAx3ei/pk4Uquw
	 /lCbzFcQybVQYl1m7N17XNyxQ6fETtBnXNjcWYB+oQCyTGpqCTgRs3FdZjIBH4RAgS
	 lSJLVfKHNukhmZL4W7d9Ek9LP6DzLxv5taXFpA3o=
Date: Wed, 25 Sep 2024 16:21:34 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: CTI TAC Meeting Notes 2024-09-25
Message-ID: <20240925-heretic-noisy-dingo-3c8bad@lemur>
References: <e3551841-0427-49da-8cb0-833a335daeca@redhat.com>
 <20240925-monumental-steadfast-urchin-8b1ae1@lemur>
 <caa77e84-b4a5-457f-bdc0-b03fd09c0214@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <caa77e84-b4a5-457f-bdc0-b03fd09c0214@redhat.com>

On Wed, Sep 25, 2024 at 02:43:20PM GMT, Carlos O'Donell wrote:
> The only outstanding question I have is around the OpenShift and RHEL costs
> in the SOW and if we can negotiate with IBM and Red Hat about those costs.
> 
> I've sent you distinct emails about that, but haven't heard back from you on
> that. I think this is something we should pursue?

Yes, sorry for not following up on that -- they are still sitting in my inbox,
staring at me with sad eyes. :)

In general, my recommendation is not to include sponsorship deals into SOWs,
but to just mention that there may be opportunities to further reduce costs
through negotiated discounts. We learned early on, and in a hard way, that
sponsorship arrangements may suddenly vanish mid-budget cycle, so it's always
better to over-budget and end the year with a surplus that can be rolled over
into the next budget cycle.

Best regards,
-K
