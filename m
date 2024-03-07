Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EAA1CAA4
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 22:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709850885; cv=none; b=GLsotJyL0iDtaU7DNBQ4qljbQARHbo3lfbB/OOlc8Y5m9u2BkRUtwUgflQWluoK4RWqoB6EgMZhHhhBvzhm4xJH0ZhPpzilPoeozGrG1Sg+97K1XymXr03oLkNpIMsMO6dzst9Qz5wDhoDQYiA+EbiNEk2wepYk60cpOD15gY70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709850885; c=relaxed/simple;
	bh=xv77Z17gyD41eLWkzvuR+7l+6CuSrnbMdzCPNz6FIeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXMVbK2Oh45VUW5RACCh0uwZNwZuhZjGoL+wSVRslxxaR736TMYzTe7Df91mWckGGMNA20WGG5zMdoHBnOULDN54yTQgE/E9TfY4OX41mwgzSfujLEkzNSsh2dycRWTok3Q7jX94B4UiNgx7vxFIJGcz29jyNaIyI73vJ80KLPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FIy/3Hyp; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FIy/3Hyp"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D607404D0
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 22:34:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k0tr7ep8pUHb for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 22:34:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 792AA404C6
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 792AA404C6
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FIy/3Hyp
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 792AA404C6
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 22:34:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1FC41CE272C;
	Thu,  7 Mar 2024 22:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1B0C433C7;
	Thu,  7 Mar 2024 22:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709850877;
	bh=xv77Z17gyD41eLWkzvuR+7l+6CuSrnbMdzCPNz6FIeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FIy/3Hypa/LsemMuGGp+Ob7h7f+fRkMTEo7Htui3H6lCWFEdtZ0XcXVszOpUo+V9B
	 Bl0jANmSfiXBzJPwSK7SLECjZNfPTgBhco4z0ovUSaGYqeQ5c/TOxrsa+8po4+EvBN
	 cMAMPW0bjNdJaK4yRDrPC7i8BFI54LV5Nu0x3TlE=
Date: Thu, 7 Mar 2024 17:34:36 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Anonymous read-only access to CTI website gitolite repo?
Message-ID: <20240307-truthful-dancing-dogfish-1ed0cc@lemur>
References: <312f9b73-3055-44fb-bde6-1b631b189cb5@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <312f9b73-3055-44fb-bde6-1b631b189cb5@redhat.com>

On Thu, Mar 07, 2024 at 05:04:11PM -0500, Carlos O'Donell wrote:
> Konstantin,
> 
> How do we setup anonymous read-only git acccess to the CTI website?
> 
> That way we can get contributions from outside the TAC.

Yes, we can enable replication to our public nodes and make the /cti/*
repositories available via a cgit view. I can get it set up tomorrow using our
existing infra (e.g. see git.openembedded.org).

Is git.coretoolchain.dev a good name for the site, or do you want something
like source.coretoolchain.dev?

-K
