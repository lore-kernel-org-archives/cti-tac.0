Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDB87641D
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 14:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714399796; cv=none; b=n/3vIaGZMyKaWkC++KdRrEJ2ACsEf7vCGi2oNdlmHaF/P2hKd8UH0BKrvziwS+onE36u9LjBBM52JhbhcJV719teUnx3BvwCflu0Rus+TmDzu5Jw8R1wU8KF+dsjFPffpi9BqkbPfU1pJb/tMy9+5+ytUqFW6ESxr2FOAw4vjD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714399796; c=relaxed/simple;
	bh=gMXTbdulnI47RF2sW51lNpk1/rNTSO/wxQEPLziz7Lc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rjFUtl9S4RouvYaUzFuU+ehcNvYGysMkwlu5E/ECtHSR/Lwycvt8AuAyDyayNtLQ7s5DW+pdXLUuf3J5Sz1cftBBH7dadqrE1gn3G3Uq/NtOStOhRcp5cm7OCpyWilgZ+nKCkVcZ0oiqsibCQR/ihXdF/UNdsvJerbybvC4HY3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h+sa8b7J; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h+sa8b7J"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 881296073E
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 14:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qPRKDAkRjUcQ for <cti-tac@lists.linuxfoundation.org>;
 Mon, 29 Apr 2024 14:09:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=josmyers@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A167C6063C
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A167C6063C
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h+sa8b7J
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A167C6063C
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 14:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714399790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7nXwgzdgJ0QCrafHlIPUHZvcMhvKjggqDouHoXZ4n2k=;
	b=h+sa8b7JQnOZkT0moDnXEEy8B6htnidKEo+rSnnlq4YwZP84d/YjnmBcmQGVy5hBjC7Kup
	akK6BK38D9AM1JXzjvLG6fbI7+Hqs7iNFFYHKqR+qvqgD6spfEH2THD1/idoRDnpX39HBt
	oCKw092lAZjQgVssh0pTmNS7ERE4Sco=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-NIvi-8gVOoaJT7l8G8pbIQ-1; Mon, 29 Apr 2024 10:09:48 -0400
X-MC-Unique: NIvi-8gVOoaJT7l8G8pbIQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-41a370b6acdso20260865e9.2
        for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 07:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714399787; x=1715004587;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7nXwgzdgJ0QCrafHlIPUHZvcMhvKjggqDouHoXZ4n2k=;
        b=OV7u7JA4lA+V80hKWIu2ud5de8o8eA88QkC+gweLsLKduQ8C0z//8b/GJ8FHnKm6J2
         yHATIFF900sRA5Sd80DTSU1FoKRVnnFi+4AN6N492NG/bNrfzjDxHbNmWU2i/iiXYkKk
         c9YP/UQkRn0g71T5A0lIr4LWst3GxSOLEJbULm6GfKxjS9Ck8iX3KJ3RuXpOcz/A1JVu
         VAEM3DMhl8yPDUmsuOhuKN+K6acRRvTdQl+kglLXtOpS5K93nXRlvjl2CBcX37h46PZ8
         CJalfboxnAW5uExBnb9FF7LKNbzrHnI52+ctE/XClsIhY2Q36ZCRFDTjMQGQjPfhrJn+
         8HnQ==
X-Gm-Message-State: AOJu0Yz4Y9Mfk3QCdO5nr2RjmXim7pIdVr2w6DTA3WDtTklnzjsklcvu
	FdYUewajU7tKaa8k1o/sStVXiPRxacIg9DLATzh50ZtQP+tERO2vDgDTbQkU1T+UeGN5fPE6T6R
	+vCluQFs1u7iHFtNVNAI1iSIIM33ez2P9zoetSNVOprVMXTshO1ngnIe/nxO8rpWjaFYE
X-Received: by 2002:a05:600c:1e02:b0:41b:ed36:debe with SMTP id ay2-20020a05600c1e0200b0041bed36debemr5128953wmb.18.1714399787281;
        Mon, 29 Apr 2024 07:09:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/5P9Wdu/j6Xavhxh8b3WiXk6lRBM1/CGfRuVsH+QjU8SoVfJbUCfcnPTHMwFudkaWj3fO+w==
X-Received: by 2002:a05:600c:1e02:b0:41b:ed36:debe with SMTP id ay2-20020a05600c1e0200b0041bed36debemr5128930wmb.18.1714399786680;
        Mon, 29 Apr 2024 07:09:46 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id d18-20020a05600c34d200b0041b083e16e2sm19697140wmq.2.2024.04.29.07.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 07:09:46 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.95)
	(envelope-from <josmyers@redhat.com>)
	id 1s1RhF-003GeR-8B;
	Mon, 29 Apr 2024 14:09:33 +0000
Date: Mon, 29 Apr 2024 14:09:33 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Hashing out the scope of work
In-Reply-To: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
Message-ID: <2293a3bb-5780-ec5a-ca72-e19671dccb51@redhat.com>
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Apr 2024, Konstantin Ryabitsev wrote:

> 2. Bug tracking software (Bugzilla)
> 
>   a. LF will set up a bug tracking system using [Bugzilla Harmony][2]. This
>      will be a new, dedicated installation in the bugzilla.coretoolchain.dev
>      domain.
>   b. LF will work with the CTI leadership to properly configure the software
>      for use with the glibc project.

There will be lots of review needed of the existing Bugzilla configuration 
and local changes.  Some of those changes may simply be to have more 
appropriate contents on the bug submission form / other HTML templates, 
some may involve actual logic changes.  Hopefully the new upstream version 
is suitably configurable without needing too many local changes.

We definitely need the various local fields (and, as applicable, sets of 
field values) from the existing Bugzilla.  (If anything, glibc is simpler 
than some cases.  GCC, binutils, GDB need all of the host/target/build 
fields.  glibc isn't itself a compiler so normally only one system, 
strictly "host" for glibc, is relevant, though there *can* be build issues 
where the build system is relevant; "target" doesn't properly apply at 
all.)

We need some form of (fully free software) spam protection, whether the 
existing scheme where new accounts need to be manually requested and 
approved, or any other sufficiently reliable spam protection scheme 
available upstream.

The REST API needs to be enabled (I'm assuming this Bugzilla version has 
it); we rely on it to generate lists of fixed bugs, at least.

New bugs should have numbers in ranges well above those used by the 
current Sourceware Bugzilla (e.g. 100000-plus) to avoid near-term 
confusion with the same bug number having different meanings in the two 
databases.

There may be an unresolved question about migrating existing glibc bugs 
(all of them, or at least the open ones) from the Sourceware Bugzilla 
(keeping their numbers); I think such migration is valuable, including for 
closed bugs (then adding a comment to all the old bugs that they are 
frozen and future discussion should take place at the new location), but I 
think there have been suggestions that such migration is hard.  (Bugs for 
other products in Sourceware Bugzilla would not of course be included in 
such a migration, since the new database would be glibc-only.)

> 6. Patch tracking services (Patchwork)
> 
>   a. LF will deploy the latest version of Patchwork patch tracking software
>      under patchwork.coretoolchain.dev.
>   b. LF will set up automation and integration services between mailing lists,
>      patchwork, and git repositories (using [git-patchwork-bot][8]).
>   c. LF will work with the glibc community to set up projects and access as
>      appropriate.

The existing glibc Patchwork database should be transitioned across.

-- 
Joseph S. Myers
josmyers@redhat.com

