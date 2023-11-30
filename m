Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4245652F79
	for <cti-tac@lists.linuxfoundation.org>; Thu, 30 Nov 2023 19:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cPyCF/wR"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACB094360B
	for <cti-tac@lists.linuxfoundation.org>; Thu, 30 Nov 2023 19:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACB094360B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=cPyCF/wR
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mu6uRDgdEa5i for <cti-tac@lists.linuxfoundation.org>;
	Thu, 30 Nov 2023 19:56:56 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E817D40122
	for <cti-tac@lists.linuxfoundation.org>; Thu, 30 Nov 2023 19:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E817D40122
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EDB77B83EE0;
	Thu, 30 Nov 2023 19:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30807C433C7;
	Thu, 30 Nov 2023 19:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701374212;
	bh=2uAglI9Lk5V4sGsckNA3bVQRBV67FQbnoa2d4tK+zzw=;
	h=Date:From:To:Subject:From;
	b=cPyCF/wRrRVvqxPvrNVNh6LkIufHNlx72G8EaQZ5l5cYb6c7O7M/HRJhDXCQEDtOf
	 N7vx7bLb0mDp9wPAe6ovmRSMax9HD0/X/s0PzAX+3+PUVgXhibD1rIeAkyYANbHy8s
	 apbFwsKpnpqS4iZz4MRajGCypqOtovm2s/w3pBvU=
Date: Thu, 30 Nov 2023 14:56:51 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: cti-tac@lists.linuxfoundation.org
Subject: Proposed procedure for certifying ssh keys
Message-ID: <20231130-hopping-innocent-labrador-40d2ab@nitro>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

During the last meeting we talked about establishing the procedure for
certifying ssh keys when granting access to the CTI git repositories. Here's
the procedure I propose we follow:

# Establishing trusted introducers

Members of the CTI will establish who will be the trusted parties to certify
the authenticity of the keys. These members will then hold a video conference
with LF IT to authenticate their own SSH keys, which will be used as "trusted
introducers" for any other ssh keys provided to LF IT.

# Setting up the keyring repository

LF IT will set up a git repository under keyrings/cti that will contain:

- an "allowed-signers" file in the format dictated by ssh-keygen(1) "ALLOWED
  SIGNERS" section, e.g.:

        contributor@example.com namespaces="git" ssh-rsa AAAAX1...
        contributor2@example.net namespaces="git" ssh-ed25519 AAAAC3N...

- a "revoked-keys" file in the format dictated by ssh-keygen(1) "KEY
  REVOCATION LIST" section, e.g.:

        sha256:cf5PvYZmyAWySqWVvbuSRvve3uXrZblwcSaOU/wNJ68

The only people allowed to push to this repository will be the trusted
introducers from the previous step.

# Procedure for adding new keys to the project

1. New members who need to get access to CTI managed repositories will first
   submit their keys to the trusted introducers (e.g. via a special
   access-requests@ mailing list). The trusted introducers can validate these
   keys via some means established within the CTI community, such as via a
   video call or in person.

2. Once the key is validated with the trusted introducers, one of them will
   add that key to the allowed-signers file and commit that change to the
   keyring repository. The commit should:

   - describe how the identity was verified and by whom
   - provide the link to the key submission message in the archives
   - carry a cryptographic signature on the commit itself (via git commit -S)

3. The new member will then send a request to the CIT helpdesk to request
   access to gitolite (the exact template to be established, and will include
   username selection and gitolite group membership details).

4. Members of LF IT will use the allowed-signers file in the keyring
   repository for the source of the public key data. The signature on the
   commit will not be checked (it's there for repository integrity
   verification purposes) -- being able to push to the repository provides
   sufficient verification of introducer's identity.

5. For group membership and username approval a simple "ack" via email from a
   trusted introducer will be sufficient.

# Procedure for revoking keys from the project

A trusted introducer will remove the key from the allowed-signers file and add
an entry to the revoked-keys file, then follow with a request to the helpesk
to remove repository access.

# Other benefits

The keyring repository can also work as a mechanism to verify git commits in
any of the project's other repositories if git commit verification is properly
configured.

Does that work for everyone?

-K
