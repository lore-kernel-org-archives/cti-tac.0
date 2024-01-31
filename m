Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F20B1847
	for <cti-tac@lists.linuxfoundation.org>; Wed, 31 Jan 2024 01:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706666129; cv=none; b=EF6QmtEIVxUm3w5UJAdxFW/tDOzEMrv8hnjWhm9cGut+WI/hR8aDkfxIhmvf186+wG6P2iSrfcpmXT9bb0YAqgOlDjzd9dGiI7FRCyjSqF1Odur0taasR9E/UyOua7EbGrdirVyDrT4A39plfPlTbLb5PEenLaeDH/8jHj9N8Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706666129; c=relaxed/simple;
	bh=s+iCsoYZdS1ys5b2BPlfk0te3U7cw6jgqO60Grczrk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyhWyUae0ubFaL3HAKKPg/uSvRMWAM5oF/dDBDWYAA1lRcCHFejQNN9lQkH6Xmej8mcF7s2klWCcc6WXrJ4REPVYZOqyHY2iuVXDPrTCWqTvydStKMkICDC0pGwh6461GMsQu3ro6UELsB220h1vPDPSVdXbp45RvwN/L5A7OQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R9OP38Ln; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R9OP38Ln"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B25F3824B4
	for <cti-tac@lists.linuxfoundation.org>; Wed, 31 Jan 2024 01:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B25F3824B4
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R9OP38Ln
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jHPrfzvLDVIE for <cti-tac@lists.linuxfoundation.org>;
	Wed, 31 Jan 2024 01:55:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 59C2D82457
	for <cti-tac@lists.linuxfoundation.org>; Wed, 31 Jan 2024 01:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59C2D82457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706666125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G4WruGqR87IgykE0GV400m5ggollziaGxWVH7gtqaus=;
	b=R9OP38Ln5ZbUh44wuFMpG00IU1g8n4tgP4wafn6N01YWejZbaHEG94xTupCmbaE8+u9+yn
	+wnXmCbhBoSXK8+lGbeiN7dO9t7wguGlDwN8kLE+/xQoaPfIdENKFOsyYJxOF3T5o3aFNB
	I8s2N6xxyALXfEsUhwh9+M/Z7PkCYY8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-Q9i3uW_oM66Wn7ZcgjdwPg-1; Tue, 30 Jan 2024 20:55:23 -0500
X-MC-Unique: Q9i3uW_oM66Wn7ZcgjdwPg-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-680b2c9b0ccso87074516d6.1
        for <cti-tac@lists.linuxfoundation.org>; Tue, 30 Jan 2024 17:55:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706666122; x=1707270922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4WruGqR87IgykE0GV400m5ggollziaGxWVH7gtqaus=;
        b=Fm0dvHqGrvqeRojrIvC+R4B/+g0P0AkQpJR3IYHHxAhlJwCj+o2mr0pBNP4N0hXgEl
         ipHXvA6EQnhSxDUCceiXi0hbW8oN4Q+/T9DGwF7OFGospXvlfdpntJPN29l4vWPCxPVD
         AHbg3HkPt82pkgtf0qnCh7VbR4sGvE8MbhyWnQK79IEsIIYnoAsENnK0C+wrXx3YRDC9
         2XZW0QMAATEURqMNkvJqbsZG4Vg7nKrUL942SsO+pPt7kPuxZpymkS5n+ebCmp8W+XzL
         NwvCh2P0uZDxXOwg/BozEOKiA4vozoJrY7NUWSEMJo2rbQIba5juwiraOXDCaPkrWJDC
         L8Qg==
X-Gm-Message-State: AOJu0YwZktbROcVQSEL/NG2MvGkpfag+vW+ksAz3yusVANjWOlLnY1Vr
	TRlXrvdBe4hKm636POQu4brqB676HbOPWrVmi9cwpP5xxiWQPFTTB0HDeZzrw5EGW0ihvV+fpnC
	dB4eZqfCebqZB7g5N9VP/nssPPFdjNXcYJjDQoO5j6qE+grZq6vBWm2wH/PQj378oQsT5dqtKEx
	1DQW4vMJ9438moTu0EBQoffIXYJ0yL8UykGXFvTuyNpTbye0YVtcA=
X-Received: by 2002:a05:6214:2025:b0:68c:5a4d:35ac with SMTP id 5-20020a056214202500b0068c5a4d35acmr414146qvf.1.1706666122140;
        Tue, 30 Jan 2024 17:55:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKYNEz93LeTZig89ABPjhoFVxsZ5aea2uvbWKxK8jBH6mxjEUGJMz2BbExqhNlfdSLTYM0gRbNNGn6b37IgDY=
X-Received: by 2002:a05:6214:2025:b0:68c:5a4d:35ac with SMTP id
 5-20020a056214202500b0068c5a4d35acmr414132qvf.1.1706666121796; Tue, 30 Jan
 2024 17:55:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
References: <20231130-hopping-innocent-labrador-40d2ab@nitro>
In-Reply-To: <20231130-hopping-innocent-labrador-40d2ab@nitro>
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Tue, 30 Jan 2024 20:55:10 -0500
Message-ID: <CAEMqeSoE4Y+M-_kL_9eXwcN_H+8aJ3JFVLuKrN=g-TMeWk3zmw@mail.gmail.com>
Subject: Re: Proposed procedure for certifying ssh keys
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 3:05=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> During the last meeting we talked about establishing the procedure for
> certifying ssh keys when granting access to the CTI git repositories. Her=
e's
> the procedure I propose we follow:

My apologies for the delay in review.

> # Establishing trusted introducers
>
> Members of the CTI will establish who will be the trusted parties to cert=
ify
> the authenticity of the keys. These members will then hold a video confer=
ence
> with LF IT to authenticate their own SSH keys, which will be used as "tru=
sted
> introducers" for any other ssh keys provided to LF IT.

I agree with this concept.

There is no way I know to bootstrap without an initial web of trust.

In general I would say that ALL of the TAC members are well
established enough to be trusted parties to certify authenticity.

At a minimum bootstrap I'd say Joseph Myers, David Edelsohn, Siddhesh
Poyarekar and myself would work.

It would be very hard to forge our interactions online in a video conferenc=
e.

> # Setting up the keyring repository
>
> LF IT will set up a git repository under keyrings/cti that will contain:
>
> - an "allowed-signers" file in the format dictated by ssh-keygen(1) "ALLO=
WED
>   SIGNERS" section, e.g.:
>
>         contributor@example.com namespaces=3D"git" ssh-rsa AAAAX1...
>         contributor2@example.net namespaces=3D"git" ssh-ed25519 AAAAC3N..=
.

OK. So after the meeting we double check this matches the notes we
took in the meeting?

> - a "revoked-keys" file in the format dictated by ssh-keygen(1) "KEY
>   REVOCATION LIST" section, e.g.:
>
>         sha256:cf5PvYZmyAWySqWVvbuSRvve3uXrZblwcSaOU/wNJ68

OK. So we follow this for off-boarding TAC members.

> The only people allowed to push to this repository will be the trusted
> introducers from the previous step.

How do we onboard and offboard trusted introducers?

> # Procedure for adding new keys to the project
>
> 1. New members who need to get access to CTI managed repositories will fi=
rst
>    submit their keys to the trusted introducers (e.g. via a special
>    access-requests@ mailing list). The trusted introducers can validate t=
hese
>    keys via some means established within the CTI community, such as via =
a
>    video call or in person.

OK.

> 2. Once the key is validated with the trusted introducers, one of them wi=
ll
>    add that key to the allowed-signers file and commit that change to the
>    keyring repository. The commit should:
>
>    - describe how the identity was verified and by whom
>    - provide the link to the key submission message in the archives
>    - carry a cryptographic signature on the commit itself (via git commit=
 -S)

OK.

> 3. The new member will then send a request to the CIT helpdesk to request
>    access to gitolite (the exact template to be established, and will inc=
lude
>    username selection and gitolite group membership details).

I assume you mean LF helpdesk here?

> 4. Members of LF IT will use the allowed-signers file in the keyring
>    repository for the source of the public key data. The signature on the
>    commit will not be checked (it's there for repository integrity
>    verification purposes) -- being able to push to the repository provide=
s
>    sufficient verification of introducer's identity.

OK. Agreed.

> 5. For group membership and username approval a simple "ack" via email fr=
om a
>    trusted introducer will be sufficient.

OK. Agreed, since the key addition by the trusted introducer allows
this access anyway.

> # Procedure for revoking keys from the project
>
> A trusted introducer will remove the key from the allowed-signers file an=
d add
> an entry to the revoked-keys file, then follow with a request to the help=
esk
> to remove repository access.

OK.

> # Other benefits
>
> The keyring repository can also work as a mechanism to verify git commits=
 in
> any of the project's other repositories if git commit verification is pro=
perly
> configured.
>
> Does that work for everyone?

In general this works for me.

I would like there to be a further description of how we onboard and offboa=
rd
trusted introducers using the existing trusted introducers.

We have a CTI TAC meeting tomorrow at 11am EDT, which we could use to
discuss the process. I'll raise all of these items there.

Cheers,
Carlos.

