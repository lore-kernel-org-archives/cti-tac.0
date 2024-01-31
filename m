Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897CD3984F
	for <cti-tac@lists.linuxfoundation.org>; Wed, 31 Jan 2024 21:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706736383; cv=none; b=IAwIxU9qV3IXRGldHzAKDbMdgTyLmFT56vyN1iZpVHuuxxZ/daoyLwL2htZTH27FFm2IbL2jSEP+axberfIqIMva2ITSnrLkI2C34b8tG2uUSEpVbY6Or3Esd2l1LEkGY/9BVskk3LwjrIV1EfNBjhGvgiCQbPQq88quk2yxfYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706736383; c=relaxed/simple;
	bh=+cBZD/UxkS8ToK49yoDF73bfx1kizJtgTiO0pCT5HyY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ld65NHLkXs6RIsBEUEWu7uWwItgCc6Bz7ij6G+x/JwDHgIZaxmtiy9bp1s7bUEqD78RrMyeLbFIZyPXuP2zektTbBQCwPekEugCzn6BlDDsfDl9x0abel3pD567IS+nBdf8yTWDSmRgRIeyRW9mzL6zyhK1GuoMID5NC+Bo0abQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dmsl59wc; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dmsl59wc"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E572940139
	for <cti-tac@lists.linuxfoundation.org>; Wed, 31 Jan 2024 21:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E572940139
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=dmsl59wc
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bS_CKrlSZ-Eu for <cti-tac@lists.linuxfoundation.org>;
	Wed, 31 Jan 2024 21:26:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E033340198
	for <cti-tac@lists.linuxfoundation.org>; Wed, 31 Jan 2024 21:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E033340198
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2ED6A616A5;
	Wed, 31 Jan 2024 21:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD18BC433C7;
	Wed, 31 Jan 2024 21:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706736379;
	bh=+cBZD/UxkS8ToK49yoDF73bfx1kizJtgTiO0pCT5HyY=;
	h=Date:From:To:Subject:From;
	b=dmsl59wc/yPnga4okRHlDXJU1QUs096ZNiddmwBZgx4Aka3OzUrPlx5RxvwbuIJmW
	 qkw4G3JkmgJw0F7eldBdcka0FyaS+PXVQ3KFoOPnIBJ1nuysZqKNi8/Uz176fGFNDC
	 KQ3AHih1hZpWNrWu1XJUt60dWAVCDzlyxjA43Li4=
Date: Wed, 31 Jan 2024 16:26:10 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: cti-tac@lists.linuxfoundation.org
Subject: Gitolite access
Message-ID: <20240131-angelic-positive-goshawk-ca6e87@lemur>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

I have completed the initial gitolite setup. I have the keys for the following
users:

- carlos
- josmyers
- siddesh

To set up access to the gitolite server, add the following to your
.ssh/config (not strictly required, but recommended):

	Host gitolite.coretoolchain.dev
	  User git
	  IdentityFile ~/.ssh/YOUR_SSH_KEY
	  IdentitiesOnly yes
	  ClearAllForwardings yes
	  # We prefer ed25519 keys, but will fall back to others if your
	  # openssh client does not support that
	  HostKeyAlgorithms ssh-ed25519,ecdsa-sha2-nistp256,ssh-rsa
	  # Below are very useful for speeding up repeat access
	  # and for 2-factor validating your sessions
	  ControlPath ~/.ssh/cm-%C
	  ControlMaster auto
	  ControlPersist 30m
	  # Helps behind some NAT-ing routers
	  ServerAliveInterval 60

This should let you run the following command:

    ssh gitolite.coretoolchain.dev info

You should get something like the following output:

    hello mricon, this is git@vex-yul-cti-gitolite-1 running gitolite3 3.6.13-1.el7 on git 2.43.0

     R      cti/..*
     R W    cti/cti.coretoolchain.dev
     R W    cti/keyring

     CTI gitolite server

If the above command succeeds, you can clone the following repositories:

- gitolite.coretoolchain.dev:cti/keyring
- gitolite.coretoolchain.dev:cti/cti.coretoolchain.dev

The keyring repository has some initial entries, as well as a README
describing the agreed procedure and how to use the keyring repository for git
signing and verification.

The cti.coretoolchain.dev is currently empty, but is intended to be the
repository for the sphinx contents for the upcoming site.

You should be able to push to both repositories.

Please let me know if you have any problems, otherwise please go ahead and
start adding the content to the docs site repo. Once you're in a position
where you need to have it built, please reach out and we'll set up the
auto-build and the public-facing site.

Best regards,
-K
