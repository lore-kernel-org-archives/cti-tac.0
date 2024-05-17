Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD2F1DFE1
	for <cti-tac@lists.linuxfoundation.org>; Fri, 17 May 2024 21:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715980933; cv=none; b=DU9KFtrTTPtvK6mK7Ph7QKY++LlcZiIiWWqLTv4sm6KzY9blQ8DFzJ9qeUI+G3RgzgZWYs4uiguK8RNyvB+hh2vkh2db6l+cZm7Kl1HVABFBhbtntsEiFO3aziNZH12YOIzRtbH9NgK1bq9zqVYjO5OkJ+13yNbssWHWjNP0OLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715980933; c=relaxed/simple;
	bh=mEsO37oA8Iau2xaDg/8U9CzKxpjXh8sCD1X9ZANFrhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KJp1mJWcH8HJtYWF6y9nR2e1N91Wg/NqidBqmW6arWUiS64kml0MHGMxY/SDE4q8STe/I8VqRddSPgqLz0Ctm/GG5qKVxDgyWujLLHErllXWvjYv+Al4LCN7qojCGyMfvCQaYktsZv/c6GuZ1p24j53NFpwdm6snMA6+zDT3mA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eQAGNKwb; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQAGNKwb"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E92A82F87
	for <cti-tac@lists.linuxfoundation.org>; Fri, 17 May 2024 21:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qNvOhYXHCdc for <cti-tac@lists.linuxfoundation.org>;
 Fri, 17 May 2024 21:22:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04C3182F57
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04C3182F57
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eQAGNKwb
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 04C3182F57
	for <cti-tac@lists.linuxfoundation.org>; Fri, 17 May 2024 21:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715980928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JE9Y8ktnY0y7eo8EszAa2ouFQW3NyOsOwZvUdx+Hlis=;
	b=eQAGNKwbADjwi1A6lfDopJzr+vQMUtkNpz1wTtYlo9B/J7jfE+xFuQCaXoeVYCxJ4DJ13c
	XRGBzo2lbBd/pDcfWqStKhjwGWClX4jNOX79TVJbIVLg07Fd1rSk7xcX2EOXf5NiPDfv24
	fV0tE0R4du1UM1wwEb/wGyqZxDs9jEg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-2udLLKnLMeWnUP4CJkQESg-1; Fri, 17 May 2024 17:22:06 -0400
X-MC-Unique: 2udLLKnLMeWnUP4CJkQESg-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-43dfc9d15c1so108178451cf.2
        for <cti-tac@lists.linuxfoundation.org>; Fri, 17 May 2024 14:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715980925; x=1716585725;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JE9Y8ktnY0y7eo8EszAa2ouFQW3NyOsOwZvUdx+Hlis=;
        b=q83ofgG5UsjRbeu4ettgjlDHpp5rM5ywa2diI3GrcuUs5SrBmuTYBnkMc0KdVU1EGI
         kahDEwSEKNONq5lK0KTYsXzxMzo74lxTG2MFVwanBeObCPXjGR0FgwEA1Jj8ys7JseZB
         Hu9dHjq1HG+MPsDSkAFagKVsiTIlIHfgmb5kcmyvh5tIBpxz+zoS9CcNgbtZo9QmW/Wb
         LCjvDevRY8AQM9alOeWQmClQEAg3gjAM7z5uttVxyghG3uhFZrwJPDj9SNZPhSQHNeHm
         MqIphYXsIlEUqu2b5LYyXlrh/j+8D6b9GpohCOxpK5bd4zsN/dNA1WS/yryT/8KmNoDn
         izYw==
X-Forwarded-Encrypted: i=1; AJvYcCWmR7gaGUCOc2vNw0laZTgOOhOIDJkgwOegkbe14nj4Jr6zpMXYTNNSO242orPdBNdN4KDc3ZdBWC+pCgMYqeyZCaeTtGLIONpBhcKC6VO9k54=
X-Gm-Message-State: AOJu0Yz4AbeJBCrha5QSUwgUN2DKJuEQTlOd8IESHoSFk8qWrRDw/JRR
	Vb9MmsnjSygwlc2t1kuiUpDGTehEzc2PQpkxq4B8IlWnHeqLOL1f0bXhbSTO9a6PdAIcxrHXDop
	cM4uJJRPp0BG9AenzHY7613TX72JNQ/z2RRuWQ/2dxHF5kLH1qq+p4GAyN9FYjfoIc5ua
X-Received: by 2002:a05:622a:28a:b0:43a:b584:a842 with SMTP id d75a77b69052e-43dfdb68facmr303457371cf.59.1715980925362;
        Fri, 17 May 2024 14:22:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElSxVcXAl8QRc26IN6Tv6Oat49Y8lSxvilD9AwISMjFQ0zAUm9mYsZKY6+ng2k7QGWYXGFYQ==
X-Received: by 2002:a05:622a:28a:b0:43a:b584:a842 with SMTP id d75a77b69052e-43dfdb68facmr303457201cf.59.1715980924850;
        Fri, 17 May 2024 14:22:04 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e1583185bsm75589631cf.64.2024.05.17.14.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 14:22:04 -0700 (PDT)
Message-ID: <8e5d1af4-4f7f-49fb-8e7d-c7219955b6b2@redhat.com>
Date: Fri, 17 May 2024 17:22:03 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hashing out the scope of work
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 cti-tac@lists.linuxfoundation.org
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 xsFNBFef5BoBEACvJ15QMMZh4stKHbz0rs78XsOdxuug37dumTx6ngrDCwZ61k7nHQ+uxLuo
 QvLSc6YJGBEfiNFbs1hvhRFNR7xJbzRYmin7kJZZ/06fH2cgTkQhN0mRBP8KsKKT+7SvvBL7
 85ZfAhArWf5m5Tl0CktZ8yoG8g9dM4SgdvdSdzZUaWBVHc6TjdAb9YEQ1/jpyfHsQp+PWLuQ
 ZI8nZUm+I3IBDLkbbuJVQklKzpT1b8yxVSsHCyIPFRqDDUjPL5G4WnUVy529OzfrciBvHdxG
 sYYDV8FX7fv6V/S3eL6qmZbObivIbLD2NbeDqw6vNpr+aehEwgwNbMVuVfH1PVHJV8Qkgxg4
 PqPgQC7GbIhxxYroGbLJCQ41j25M+oqCO/XW/FUu/9x0vY5w0RsZFhlmSP5lBDcaiy3SUgp3
 MSTePGuxpPlLVMePxKvabSS7EErLKlrAEmDgnUYYdPqGCefA+5N9Rn2JPfP7SoQEp2pHhEyM
 6Xg9x7TJ+JNuDowQCgwussmeDt2ZUeMl3s1f6/XePfTd3l8c8Yn5Fc8reRa28dFANU6oXiZf
 7/h3iQXPg81BsLMJK3aA/nyajRrNxL8dHIx7BjKX0/gxpOozlUHZHl73KhAvrBRaqLrr2tIP
 LkKrf3d7wdz4llg4NAGIU4ERdTTne1QAwS6x2tNa9GO9tXGPawARAQABzSpDYXJsb3MgTydE
 b25lbGwgKFdvcmspIDxjYXJsb3NAcmVkaGF0LmNvbT7CwZUEEwEIAD8CGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEEcnNUKzmWLfeymZMUFnkrTqJTQPgFAmStkMYFCQ8AA6UACgkQ
 FnkrTqJTQPjRTxAAnKmRztRqcP4bgMeweR3rMxDEtwQhciDybB7RgBeuZHCbY6Hmqx2so4gH
 2rG9EoBJM1RZKyqztVJ2WbGPzEb4ZAW/AjmttIoN1tSdACGBbd8kPNUzJd+QsCiWGNtyaJw6
 /HTLj9JRdGN16b+DzUJxww3gYZYTTkhSNUVjcrw7hzXU0Zb3z9/evXv26SDbNCqSfhAm7tNE
 8ceH9H8dTcalNUPJO7bgXRhXORj9OciJrMnpPs6P4U5f/IkcVSZS1t+6R0KPWeEUXGlegTFK
 F1cKsSoil8mYajqAheuqbjtPHPh55dHTbG35ngjNSZyiM54PdMW5SR6zog3RAlYnuPg09g21
 n9Y/ihuEZZve57Gp5wHUwNE+RKRByLlRF3Zezz6jKfjLyHqJYK8d8+vuFO1vca5OfxCEf33Y
 8pLhARmHXG6mzRdji1e7Ugob2OQbvM1XWkInA+NyGeqLlE7ZnzVME5kmYVa/+qjdoqEgAqKz
 EdcknAZ0uud8xuAqven5X17+bBY16RZHOysOcBiGGC2E1A8Xni8cO+vH6NTCjK+OAk7UXgWB
 +9MFvsi7WHDJAjVlpOwuRYDWjZ8o8HhkByMAhPEzjySR9G1bzHKNOVQNFpHPTP8a5LJR6nX/
 QdjKAC0bOR1TxNeK6T0h+E0iPnwWIJ6ezimzwdRl0oCbj02giyPOwU0EV5/kGgEQAKvTJke+
 QSjATmz11ALKle/SSEpUwL5QOpt3xomEATcYAamww0HADfGTKdUR+aWgOK3vqu6Sicr1zbuZ
 jHCs2GaIgRoqh1HKVgCmaJYjizvidHluqrox6qqc9PG0bWb0f5xGQw+X2z+bEinzv4qaep1G
 1OuYgvG49OpHTgZMiJq9ncHCxkD2VEJKgMywGJ4Agdl+NWVn0T7w6J+/5QmBIE8hh4NzpYfr
 xzWCJ9iZ3skG4zBGB4YEacc3+oeEoybc10h6tqhQNrtIiSRJH+SUJvOiNH8oMXPLAjfFVy3d
 4BOgyxJhE0UhmQIQHMJxCBw81fQD10d0dcru0rAIEldEpt2UXqOr0rOALDievMF/2BKQiOA7
 PbMC3/dwuNHDlClQzdjil8O7UsIgf3IMFaIbQoUEvjlgf5cm9a94gWABcfI1xadAq9vcIB5v
 +9fM71xDgdELnZThTd8LByrG99ExVMcG2PZYXJllVDQDZqYA1PjD9e0yHq5whJi3BrZgwDaL
 5vYZEb1EMyH+BQLO3Zw/Caj8W6mooGHgNveRQ1g9FYn3NUp7UvS22Zt/KW4pCpbgkQZefxup
 KO6QVNwwggV44cTQ37z5onGbNPD8+2k2mmC0OEtGBkj+VH39tRk+uLOcuXlGNSVk3xOyxni0
 Nk9M0GvTvPKoah9gkvL/+AofN/31ABEBAAHCwXwEGAEIACYCGwwWIQRyc1QrOZYt97KZkxQW
 eStOolNA+AUCZK2RDAUJDwAD8gAKCRAWeStOolNA+B0MEACVxFO++NroEQxSQ0NCWod3aDmY
 mYn+/08wLTeMP+ajq19FEjU0Lh/GBJl6WlSHeJ5ZJlNSiXZuiSYGMYm73DBaoZlyjbD+H9NL
 LwLXgtfCZYlN6Iu8JRMfk9yevVBay7Be9DkPAk565ggo0UkIjpYftiLF4TUfqnI1yO6QKXgr
 J2DDwlP3iiCYnWFpHdBTB2/BRurpZoRquhRGzgcdGfRDtp16Pzm/u8BjfaU5/AFRjM0IDYQ6
 PaQld0uZSZ0qOn0ts6usJws5gANq4U1oWJlqL/PHOFy9mbwUnKqq0oiWrmj+Mb+Ic6m9fqB3
 5CHWUhxC1QozvkuY/sTsmXnG/mnbq2oFIVcgXDsnrDHf+0GyR+TrE4AQw1Pt2utsmU67LqNB
 Ru/2NbSFgwPv5wWjtNwDVGSZEXlV4qJGjh8S9aaGXhRTwJsnN6qkFS1m6vHKwqnRb5Qy4XDg
 7kDrhFnTWe+XSwQt+HtGvIiXcR3EScJky76YlVsWDtvZMo3NePaC3qV5HAC8d2ZL3sFqxJRu
 sRyjE2l6s0EEK2MUgV/dwodftECrMdGktndVTYPqLnsua/PWWKYwYrNvD8slL6VFkXDZvLLv
 nat9vl9mBm15b76RHvKNlRcPbB9YYCbS5fhN2ObAsVbV1c5TdBCp8lp1Fa3YK0TA+WpNZVHK
 vjq6hMJAjA==
Organization: Red Hat
In-Reply-To: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/24/24 12:45 PM, Konstantin Ryabitsev wrote:
> Hello, all:
> 
> This is the Scope of Work section of the larger Statement of Work document.
> Please send any comments, adjustments, additions, or clarifications you would
> like to see.

Thanks for writing this up.

I've read through the entire thread and I will comment on a few items here that summarize
the discussions to date.

May we please consider (1), (3), (4), (5) and (7) agreed upon?

With (2) and (6) needing some review, notes below.

> This SOW focuses on the migration primarily, and the tentative time frame is
> through mid-2025.
> 
> Regards,
> Konstantin
> 
> ---
> When choosing solutions and deploying services, the guiding principle is to
> remain compliant with the [GNU Ethical Repository Criteria][1], Grade B. This
> mandates exclusive use of Free Software and promotes open platforms over
> proprietary hosting environments.
> 
> 1. Mailing lists for decentralized patch-based development
> 
>   a. LF will set up mailing list hosting under the lists.coretoolcain.dev
>      domain, using the following technology stack:
> 
>     - postfix
>     - mlmmj
>     - public-inbox

No contention here, we can consider (1) resolved and part of the SOW.

We should be able to import all public-inbox archives from inbox.sourceware.org.

> 
>   b. For scalability and IP reputation reasons, LF will reuse its current
>      mailing list platform already deployed for Linux kernel development
>      (subspace.kernel.org).

Agreed.

>   c. Individual glibc mailing lists will be created on request and do not
>      require to be enumerated in this SOW.

Agreed.

>   d. Mailing list archives will be available either via lore.kernel.org, or a
>      dedicated coretoolchain.dev domain name, depending on project preferences.

Agreed.

> 2. Bug tracking software (Bugzilla)
> 
>   a. LF will set up a bug tracking system using [Bugzilla Harmony][2]. This
>      will be a new, dedicated installation in the bugzilla.coretoolchain.dev
>      domain.
>   b. LF will work with the CTI leadership to properly configure the software
>      for use with the glibc project.
>   c. LF will work with the glibc community to offer the tooling to integrate
>      git repositories, mailing lists, and the bugtracker (e.g. using the
>      [bugspray][3] project).

Comments from Joseph include:

- Bug submission form customization
- HTML template customization
- Logic changes
- New upstream version suitably configurable
- Local fields
- FOSS spam protection for comments
- REST API enabled
- High numbered bugs e.g. 100000+
- Account creation moderation

My position is that if we can't configure vanilla bugzilla to do what we want
then we as a *community* needs to contribute upstream until it does and then ask
LF IT to update to a newly released version.

This is exactly the process we did, "Upstream First", for Patchwork development
of the new Cover letter event features. DJ Delorie worked upstream with the
developers, we got a new version out, and upgraded to the new version (and
found bugs and fixed them upstream).

Everything listed above needs to come in via upstream IMO.

That doesn't mean we halt the migration, but we configure bugzilla to match
as required as possible, and continue to work upstream to enable as required.

The local fields:
	cf_gcchost
	cf_gcctarget
	cf_gccbuild
	cf_reconfirmed_on
... are all configured in the UX, so I don't think we have any problem there.

Comments from Konstantin include:

- Complexity and cost of migrating data.
- Suggestion to reduce cost via hybrid public-inbox + new bugs setup.

The most contentious things is the move of the data.

May I suggest an alternative to the migration cost problem?

(1) Split the trackers e.g. one tracker per project.
    - Better security and isolation.
    - Scale up or scale down.
    - Decouples configuration management for projects.

(2) Import *all* of the older bugzilla database...
    - Dump and reload with no filtering.
    (2.1) Then use the UX to delete unwanted products.
          - Ensures database referential consistency.

(3) Bump the bump numbering up to 100,000.

In this case (1) is just machine cost and has benefits.
Likewise (2) is the standard operating procedures for migrating bugzilla.
And (3) should be straight forward.

I want this to be lowest cost while still providing value.

Having distinct trackers per project also facilitates future export/import.

> 3. Git repository hosting (Gitolite)
> 
>   a. LF will set up the necessary glibc repositories reusing the existing
>      gitolite.coretoolchain.dev service.
>   b. LF will work with the CTI leadership to migrate existing repositories and
>      grant the necessary permissions.
>   c. LF will work with the glibc project community to analyze, port, and adapt
>      the existing set of [AdaCore][4] post-commit hooks to ensure that they
>      are functioning after the migration, or are replaced with suitable
>      alternatives if existing implementations cannot be used directly due to
>      security considerations or duplicating functionality provided in
>      Gitolite.
>   d. LF will set up mirroring and replication using [grokmirror][5] to offer
>      multiple redundant sites for git repository access.

No contention here, we can consider (3) resolved and part of the SOW.

> 4. Documentation repository and website (Sphinx)
> 
>   a. LF will work with the glibc community to help migrate the wiki site from
>      [MoinMoin Wiki][6] to a set of restructured-text documents (e.g. using
>      [pandoc][7]).
>   b. LF will provide a publishing framework to automatically build and deploy
>      documentation to the dedicated docs website (exact domain name to be
>      established).

No contention here, we can consider (4) resolved and part of the SOW.

> 5. Static website (Sphinx)
> 
>   a. LF will provide hosting for a separate static website for glibc (exact
>      domain name to be established).
>   b. LF will provide a mechanism to publish release tarballs and offer
>      downloads via the mirrors.kernel.org system of worldwide mirrors (already
>      provided via mirrors.kernel.org/gnu/glibc/).

No contention here, we can consider (5) resolved and part of the SOW.
 
> 6. Patch tracking services (Patchwork)
> 
>   a. LF will deploy the latest version of Patchwork patch tracking software
>      under patchwork.coretoolchain.dev.
>   b. LF will set up automation and integration services between mailing lists,
>      patchwork, and git repositories (using [git-patchwork-bot][8]).
>   c. LF will work with the glibc community to set up projects and access as
>      appropriate.

Comments from Joseph include:

- Migrate existing patchwork data.

Comments from Konstantin include:

- Replay mailing list data to recreate patchwork instance.

Comments from Siddhesh include:

- Replaying mailing list data would allow us to test if patches apply again.
  - Note: We already have a patch retry bot running e.g. redhat-pt-bot/TryBot-still_applies

May I suggest an alternative to the migration cost problem?

(1) Split the trackers e.g. one patchwork instance per project.
    - Better security and isolation.
    - Scale up or scale down.
    - Decouples configuration management for projects.

(2) Import *all* of the Django database.
    - Dump and reload with no filtering with manage.py.
    (2.1) Then use the UX to delete unwanted products.
          - Ensures Django referential consistency.

This is again a straight forward solution of importing via Django's
standard process.

Then someone with Django site administration deletes all the other
projects which deletes all the unwanted data correctly and using the
right rules for the project.

Having distinct patchwork instances per project also facilitates
future export/import.

Eventually with all the instances we will want a FOSS SSO solution,
but that is a *definately* a future work item for the CTI TAC.

> 7. Video conferencing (BigBlueButton)
> 
>   a. LF will provide video conferencing to the project using [BigBlueButton][9]
>      (BBB), either with a 3rd-party provider or as a fully self-hosted service.
>   b. LF will work with the glibc project to set up conference rooms and access
>      as required.

Comments from Ian Kelling

- BBB is using non-free mongodb backend.

Comments from Konstantin

- Suggest Jitsi.

Comments from Siddhesh

- We used FSF's Jitsi instance and struggled.

  - Carlos' Notes: We used Jitsi for 18 meetings and had a very difficult
    time with community member access. We have used BBB to host 73 meetings
    without a glitch.

Comments from Carlos

- Compliance can't be instantaneous.
- The CTI TAC needs to review BBB vs. Jitsi.

For now I think BBB is working and we should continue using it while we
resolve what to do with the MongoDB issue. This question needs to go to
the CTI TAC for review.

I would like to consider (6) resolved and part of the SOW.

Eventually the CTI TAC may decide to change services and that would be
a change to the SOW with an associated cost change (up or down we don't
know until evaluated).

> [1]: https://www.gnu.org/software/repo-criteria.en.html
> [2]: https://github.com/bugzilla/harmony
> [3]: https://git.kernel.org/pub/scm/utils/bugspray/bugspray.git
> [4]: https://github.com/AdaCore/git-hooks
> [5]: https://git.kernel.org/pub/scm/utils/grokmirror/grokmirror.git
> [6]: https://sourceware.org/glibc/wiki/HomePage
> [7]: https://pandoc.org/
> [8]: https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/git-patchwork-bot.py
> 

-- 
Cheers,
Carlos.

