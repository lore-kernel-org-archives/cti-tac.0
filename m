Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44FA137778
	for <cti-tac@lists.linuxfoundation.org>; Thu, 29 Feb 2024 15:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709219574; cv=none; b=qmrTVTypH/YqpVlH5EtE0Mly6ap7SdmQHfY0uDmpza/y/uKH7NjvGEUlL90pTqzmJSPb7nD3+mwfuAlEohWe9j9+RHgp30a+yOaJz1T1e4ConqyJtXJokizXZrJWLH0efgyruOMtZp7a/6CtvdzHorfS/9TGd1J9pLyDXmjLEus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709219574; c=relaxed/simple;
	bh=7x3MAWXKSNgV6p2RjsNHi0LBqcxEQgzWXIxqkRb7MuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ci3WWEPmCzqVhD9CBcJVV98wNQI6CYGcRqagAAXhCvcUEh+F+O9FtDk9Hufhg6IeUuKbg3Hws9g7uR1wBQqX47MkQsP5VilW6iXCJVufafPptTgBdEbdZ5ob/Q6Y8+yYxJ75pH78gvQhCVMoAMXqhyI98J0hqvuT6O604m+I5GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NoWNAiq2; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NoWNAiq2"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56D12417D8
	for <cti-tac@lists.linuxfoundation.org>; Thu, 29 Feb 2024 15:12:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgqEGeoqnRXa for <cti-tac@lists.linuxfoundation.org>;
	Thu, 29 Feb 2024 15:12:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F4016417D6
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F4016417D6
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NoWNAiq2
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F4016417D6
	for <cti-tac@lists.linuxfoundation.org>; Thu, 29 Feb 2024 15:12:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A11F160C3C;
	Thu, 29 Feb 2024 15:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B16C433F1;
	Thu, 29 Feb 2024 15:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709219569;
	bh=7x3MAWXKSNgV6p2RjsNHi0LBqcxEQgzWXIxqkRb7MuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NoWNAiq2jHVv472o5ubDSUYmLvnCUvwhRw2gpzHKrATGaFRntiSGURWSCoD5ShZhi
	 drK2kCghTHWMQR/OhlcHPdsB18RPH8ZNPlhe6c7plm1OnUC9vZYg4Mwx6YB6CjDPKa
	 iSbFK/zQ+phAGxUkOBQcTjbmJnDaYVyMdTRiFVhU=
Date: Thu, 29 Feb 2024 09:50:29 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: General keyring process questions.
Message-ID: <20240229-imposing-curly-nautilus-e610bc@lemur>
References: <343c164c-a49a-4ece-97b8-a28eb7b84da2@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <343c164c-a49a-4ece-97b8-a28eb7b84da2@redhat.com>

On Thu, Feb 29, 2024 at 09:55:45AM -0500, Carlos O'Donell wrote:
> - Does adding a key to allowed-signers give access to also update
>   allowed-signers itself?

No, it just adds the key to the keyring. The actual permissions to that
repository are granted by LF IT upon request and the trusted introducer
verification process.

>   - I assume the answer is that only trusted indtroducers can update
>     the keyring, and that the keyring is only an intermediary keyring
>     because it doesn't look like a normal gitolite admin repo.

Correct.

> - What is the syntax of allowed-signers?

https://man.openbsd.org/ssh-keygen.1#ALLOWED_SIGNERS

>   - What does 'namespace="git"' mean?

It means that this key is allowed to sign git commits.

> - Are new account requests sent to it-coreprojects-helpdesk@linuxfoundation.org?

For the moment -- I expect we will set up helpdesk@coretoolchain.dev in the
near future.

> - What are the implications of selecting a username?

Minimal.

>   - I assume the answer is that the username is not visible anywhere, but
>     is the username used during the ssh connection to the gitolite server
>     and as such is the name used in the gitolite admin repo with the keys?

The username only shows up in the backend logs and helps us figure out who
connected and what operations they performed.

> - How do we authorize group membership?

Helpdesk request.

>   - How do we know what groups to request in the email to LF IT?

To be established.

>   - Group membership is a gitolite repo policy detail and some groups may
>     have distinct project policy e.g. web repo vs. code repo.
> 
>     How do we enforce that policy?
> 
>     For example, a gitolite project will usually have an admin repo with
>     configuration and keys, and the code repos. In the current setup it
>     LF IT is the maintainer of the admin repo, and the community maintains
>     the keyring and content repos. If we have several content repos, how
>     do we authorize only access to one of them? Is that encoded in the
>     allowed-signers in some way?

No, this is discussed in a helpdesk request and acked by designated group
managers on the project side. We can establish the exact procedure at a later
time.

HTH.

-K
