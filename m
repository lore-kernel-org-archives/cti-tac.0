Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785AB7489
	for <cti-tac@lists.linuxfoundation.org>; Thu, 25 Apr 2024 01:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714008701; cv=none; b=fUnGhtcZGFBDE/yeXkkvaF1QoUTZUa/5e+VuVOjbrO/vnCDVJjNNoG9m8GCYfPIIKLGibb4Bvmj/bxNBYIngU1A1uuafEuQsCbuik81e0AVFkyH2tsrAto6kguqJ89xN2TRdLAjirDf0Zr9AqMg5YI5+ENK34IVOlSRpKVx4IsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714008701; c=relaxed/simple;
	bh=p8+Dzzw4ViGSfXJ84KsU7QWEFll4MHBWoDtnT2M5WKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALijj9Lus4hJNJAFuqsdXAe/fEuZq//dIeTmWgA0nTVLJ8AkwqMHNQhxCBmpb04UKDhOvKueeugDiiEHlcFbToh4I+EEeK+CB9iOt1oWwpIpvL07TAWDE3VLc3hqGJ4U+IKKhR9k9KWIHhSqwynFAl0DtVEYIeDksUV/RCOkLdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=t96VEzj0; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="t96VEzj0"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08C4241489
	for <cti-tac@lists.linuxfoundation.org>; Thu, 25 Apr 2024 01:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-wRgiJiY4P5 for <cti-tac@lists.linuxfoundation.org>;
 Thu, 25 Apr 2024 01:31:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9D2C24095E
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D2C24095E
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=t96VEzj0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9D2C24095E
	for <cti-tac@lists.linuxfoundation.org>; Thu, 25 Apr 2024 01:31:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD24861D1F;
	Thu, 25 Apr 2024 01:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4402FC113CD;
	Thu, 25 Apr 2024 01:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714008696;
	bh=p8+Dzzw4ViGSfXJ84KsU7QWEFll4MHBWoDtnT2M5WKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t96VEzj0eQvz7GTzxQgvdCjnz5Qh3+yBqyP1RrPoss8mans0e1Y00AlkzsFv6yWGr
	 fn08HpgowCU7JOcmuymm3h5s4gi84CQqIOGMNsovVzbv6TPeXlfNDYtybM6ugI8fu6
	 fgZi76acgpKajmaczbf2YJO/i6FQ5iE9a6HC7XYo=
Date: Wed, 24 Apr 2024 21:31:35 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Ian Kelling <iank@fsf.org>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Hashing out the scope of work
Message-ID: <20240424-funny-lemon-starling-8b1aae@lemur>
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
 <87v846a1zi.fsf@fsf.org>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v846a1zi.fsf@fsf.org>

On Wed, Apr 24, 2024 at 05:15:33PM -0400, Ian Kelling wrote:
> > 7. Video conferencing (BigBlueButton)
> >
> >   a. LF will provide video conferencing to the project using [BigBlueButton][9]
> >      (BBB), either with a 3rd-party provider or as a fully self-hosted service.
> >   b. LF will work with the glibc project to set up conference rooms and access
> >      as required.
> 
> Regarding BBB:
> 
> Looks like you forgot to include the [9] link.
> 
> BBB versions of the last few years have a dependency on nonfree MongoDB
> versions. I think the LF BBB that CTI has been using is running nonfree
> MongoDB. The upstream BBB developers announced they are removing
> MongoDB, but that work does not have a set timeline, I hope it will be
> done within a year. At FSF, we are migrating to Galène,
> https://galene.org/ , which has less features but also takes less
> resources and is much less sysadmin work.

Okay, thank you for bringing that up. Another video conferencing system 
which we've previously deployed is Jitsi. Are there any similar 
objections to that platform?

-K
