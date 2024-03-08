Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B00656479
	for <cti-tac@lists.linuxfoundation.org>; Fri,  8 Mar 2024 18:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709924314; cv=none; b=X0i0WVYj684E4cvUe+d57gGUJR4fsrX5oDi43nP+5jIrzIxpndsw243vip1jsfvVwwW0k0Axg65kOugIbVA1emZ3t4D01FadDYx4Ex+uzVHOnrnzfX+bWjd90Yej6s4I0jAQ2wbQlJOp5yr40vgtQ/JSiHAiltTRFh9EWD5qsoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709924314; c=relaxed/simple;
	bh=UjsMbFxc27ayRqOwa2zv2egoqgKl3aUxfyKKN1AeHzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FocMCysDz6RC3NQ965nsdfJyhRKEeCTuhG40VPzLFlCjLyMGyB8amTuz9Ib7Yypr38dzmwleuamR85aRccB8FBRzKpbq9BVXA48/VUdm8MI6WqvBPjBr5ArrSVdLjM7dst3SCNOCJXiv+KGLpD6MTWn+8D3ZqPexbe9MBKiKrKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=y1QbLK6L; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="y1QbLK6L"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC53940AE2
	for <cti-tac@lists.linuxfoundation.org>; Fri,  8 Mar 2024 18:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXUJ3gHkDCix for <cti-tac@lists.linuxfoundation.org>;
	Fri,  8 Mar 2024 18:58:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D6BCD4094F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6BCD4094F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=y1QbLK6L
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D6BCD4094F
	for <cti-tac@lists.linuxfoundation.org>; Fri,  8 Mar 2024 18:58:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D59160DE1;
	Fri,  8 Mar 2024 18:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F62C433F1;
	Fri,  8 Mar 2024 18:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709924310;
	bh=UjsMbFxc27ayRqOwa2zv2egoqgKl3aUxfyKKN1AeHzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y1QbLK6Lq/n2OMwrHJ6pgPxsKfkYo7wpWBEFdd1klbzvECCvIOEH3ilrqrU2Nszua
	 5/8iOreDM+BkD73tXlCogCDEadXX32/J+fOH1UqwJRjLeJxVaziiWSoE66biWaJA48
	 UE0farnlkFzWUe6ML1z7R6NnQSQWi12cTGveeVVA=
Date: Fri, 8 Mar 2024 13:58:22 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Anonymous read-only access to CTI website gitolite repo?
Message-ID: <20240308-cocky-sapphire-booby-012fee@lemur>
References: <312f9b73-3055-44fb-bde6-1b631b189cb5@redhat.com>
 <20240307-truthful-dancing-dogfish-1ed0cc@lemur>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240307-truthful-dancing-dogfish-1ed0cc@lemur>

On Thu, Mar 07, 2024 at 05:34:36PM -0500, Konstantin Ryabitsev wrote:
> Yes, we can enable replication to our public nodes and make the /cti/*
> repositories available via a cgit view. I can get it set up tomorrow using our
> existing infra (e.g. see git.openembedded.org).
> 
> Is git.coretoolchain.dev a good name for the site, or do you want something
> like source.coretoolchain.dev?

I have enabled the public view on:
https://git.coretoolchain.dev/

-K
