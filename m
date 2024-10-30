Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2184768FC
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 16:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730306775; cv=none; b=sWtsrLsEJCoAj/MWsaKQkSyqVGNIM5/YsISeDZl2uUlNAxLlWogX1zYThkVSipu/tNAw5QsSfWswN+uomm6hvgc2V6mJfQRdUvQE0s8oIzMjczE19yMw2n5G9V7yh3H9rbZRe+Vi6+Ftb8VK3eKIsFQKNgPlgrR0d7Q7yFAwplI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730306775; c=relaxed/simple;
	bh=dkRcX73/JoaYgdUVyWYRsAu1i5fDQ5TzodAoP+bABTQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=S1fUjmNirVZQZTgK2F0RuBMoN7ogk22Q5CwU17R8vmQIStUy8vVS3qRBKRkMYcxQY3AHdwaNeCW4UzjUTPeR98Q9Pkd9m6cgzpkGSl11+ePnwZh2xtSLw7IQJHoqLZPseZA3KAFMw87GzDI4qPmJWRNj/bJBbUWbbc61o5DbSjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FFo4CJQQ; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FFo4CJQQ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 848E680AD4
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 16:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oka2qJdLjXpe for <cti-tac@lists.linuxfoundation.org>;
 Wed, 30 Oct 2024 16:46:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=josmyers@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6CA8680ABB
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CA8680ABB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FFo4CJQQ
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6CA8680ABB
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 16:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730306770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=flG1ekCb9/fj9G5BI443atdR6hVnoHoUi5asCdpiLyI=;
	b=FFo4CJQQmoGaS9sIPXE+I9viyAe3CbAc451AqwzMe6DNS3iFbHjeuIGsWP4HyZ6Hq/mPkf
	zoSNZk/i6b2ORZLvTM3lCtRL14+2H8B0VeWGU830kbuFzElUk45EYskAPUTNSHQnFjPAjA
	c9qVJteq3LeiPcqVSTbDkUvri2Yu44E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-dOjxAQ5sMV-mMxXmXaaZrA-1; Wed, 30 Oct 2024 12:46:09 -0400
X-MC-Unique: dOjxAQ5sMV-mMxXmXaaZrA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43159c07193so347545e9.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 09:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730306768; x=1730911568;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=flG1ekCb9/fj9G5BI443atdR6hVnoHoUi5asCdpiLyI=;
        b=ayhnjMfhHrXUPQKZvFJtSPsL2INgJwj2DdKMyDd2a9GyhBbrHTRKlFFmce6UU3IVPS
         XicAL079uudRYdQSVSKKsEyndTQGNPMMIxjgY2/4WL62cHad/e4ZLkWpH6R5VWR/rXs6
         M1J7prfmwbKvq+v/KHPFTWdG1bqm5MhaE5JDopYZ+pph6D8jEWRIgtWKQiIzc6IT09r3
         dUSqrPp0EcOuFIWwVp3mdquapqbHqb07UVjpoOAcmmdwZP/KIeDZbHd4hFQRgPZul+bq
         XiNwRXkB99kunHFuf2eDNLJyO4sP/w3ccd1TtLgUYjD0oBZ/71NGj5eIwJ+OLT3bLvtj
         nzOg==
X-Forwarded-Encrypted: i=1; AJvYcCVmD66fYA5yUzfhxobojo0lTFWK5UAZ6eSLeiU083nsybsU+AF16neC3ctZdLV91zv5AMEpkVj3@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzAEwQANVvzjnsoVNPQovHRhIelTWynVt0TXBzTyDROwEZB7Z5v
	F920a2ekNttyK/wOIJLQJhPlYQilNp3HeIRXgQIjyPjLee0+xTf3MzDWn5T/YvokvUv35sRoFPH
	oKV0UEGPYbscfYtZvWTleJ1Iq+U4FfXe2FK+eaQYrcLOB8OTQzN9ho4qBS8SqKXPRV9qk
X-Received: by 2002:a05:600c:5249:b0:426:6e9a:7a1e with SMTP id 5b1f17b1804b1-4319ad293bfmr148897505e9.35.1730306767890;
        Wed, 30 Oct 2024 09:46:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZcWiwe7g5+ROmV8J24q8XjdchKU509SN3EQeHPju8VsW0o2MId/j0e7FsE6Nf0u4rahXJ8g==
X-Received: by 2002:a05:600c:5249:b0:426:6e9a:7a1e with SMTP id 5b1f17b1804b1-4319ad293bfmr148897225e9.35.1730306767515;
        Wed, 30 Oct 2024 09:46:07 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b9d70fsm15794723f8f.108.2024.10.30.09.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 09:46:07 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.97)
	(envelope-from <josmyers@redhat.com>)
	id 1t6Bp8-00000009Q3Z-2sf9;
	Wed, 30 Oct 2024 16:45:34 +0000
Date: Wed, 30 Oct 2024 16:45:34 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Mark Wielaard <mark@klomp.org>
cc: Carlos O'Donell <carlos@redhat.com>, gcc developers <gcc@gcc.gnu.org>, 
    glibc developers <libc-alpha@sourceware.org>, 
    gdb developers <gdb@sourceware.org>, 
    binutils developers <binutils@sourceware.org>, 
    Overseers mailing list <overseers@sourceware.org>, 
    cti-tac@lists.linuxfoundation.org, 
    =?ISO-8859-15?Q?Zo=EB_Kooyman?= <zoe@fsf.org>, 
    "Karen M. Sandler" <karen@sfconservancy.org>
Subject: Re: Core Toolchain Infrastructure - October 2024 update
In-Reply-To: <ae8662fd114be6b26300e85173cfcd1068421abf.camel@klomp.org>
Message-ID: <ac4a7299-459c-bbb9-4f23-56f2f71fb80e@redhat.com>
References: <9ee5b9e1-3f84-4d9e-8249-7a4bf8080bb0@redhat.com> <20241030103912.GD28606@gnu.wildebeest.org> <3a2c2d35-3b86-4286-a393-5ec166659f92@redhat.com> <ae8662fd114be6b26300e85173cfcd1068421abf.camel@klomp.org>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Oct 2024, Mark Wielaard wrote:

> Yes, we did already discuss this. But it is too early for that. Richard
> setup a wiki page for the Forge Experiment that includes a list of
> various bugs/issues in Forgejo that we would like to see resolved
> before we can call the experiment an success.
> https://gcc.gnu.org/wiki/ForgeExperiment
> When we are a bit further into the experiment to know which ones are
> real blockers, we could fund the work to get those done.

There is also my long list of considerations at 
https://gcc.gnu.org/pipermail/gcc/2024-September/244806.html for 
evaluation - it's not just a few specific issues, there are lots of things 
to evaluate.  Some may be supported well already, some may need more work 
on the ForgeJo side, some may involve significant local scripting to 
combine with existing or new APIs on the ForgeJo side.

I don't think there's any real evaluation been done yet of what email 
notifications can be set up to go to mailing lists and what those 
notifications look like (for pull requests, commits, etc.) and how much is 
configurable there or needs custom scripting, or of what configuration is 
available for checks on commits that are allowed to enter either the 
repository at all or specific branches thereof (both commits pushed 
directly and commits merged via PRs) - but such checks are certainly 
important to avoid various subsequent automation (e.g. the nightly cron 
jobs) falling over.  (I expect many of these things to involve some kind 
of configuration hooks that link into appropriate APIs / scripting we'd 
need to provide, rather than ForgeJo having configuration options that 
directly match what we want.)  Likewise, for API support sufficient for 
people to build their own efficient workflows for reviewing lots of 
patches, where they currently have such workflows based on email.

As discussed in the previous thread, such evaluation would probably take a 
narrative form discussing how desired features relate to what ForgeJo 
provides, not checkbox yes/no for each item, and so provide a basis for 
further consideration of what we achieve through appropriate hooks / 
scripting, what we seek to get added as ForgeJo features (possibly paying 
for features to be implemented) and what we might end up deciding is less 
important or has underlying goals that can be achieved in a different way.

Each toolchain project may reach its own conclusions about what's 
important for possibly moving to a forge - we don't have any group that 
makes decisions for the toolchain as a whole, and each project has its own 
existing hooks and other scripting / automation that would need adapting.

-- 
Joseph S. Myers
josmyers@redhat.com

