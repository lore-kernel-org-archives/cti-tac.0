Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A5F2144CA
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 17:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730308024; cv=none; b=edpF/GnH6DxjkIcL8ch/dDx4QU4ARvtEIyh6hnEnPXt3EFkYMG4TsYW0M+T43ktstca4I/xJV70oe9KIPrD7L+3YQxi6hGnhhqBNCtxcVnneDiStzplyfwpjgVo0pVrRzQRw50++ONAH12sM+qitU8D47EUPSabfJPTHQcjA4nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730308024; c=relaxed/simple;
	bh=nHLBbgzqApeJxl5T+cU1/NZhUK+aPaCCjbl4VEvWFTk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=irjVxNJPfzlcA5nHPqabgyyw0L1M2ZtZPF/BtAtkTmUBh5IlCFWOY28VO+yN0UzWPJfAO+7Y9OtIa4QdEyS1bK+mz7++JoNrmDSzcyDQ/zVjF3mHvT26Fv90onmlBRKVsj0kum3yJEG0Xm2LHJaq8vKkfN8dCGqJu8yLs0BSyz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GQTUHTyR; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GQTUHTyR"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC99A40100
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 17:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgU4iVKpZk9S for <cti-tac@lists.linuxfoundation.org>;
 Wed, 30 Oct 2024 17:07:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=josmyers@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EC06D40BED
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC06D40BED
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GQTUHTyR
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EC06D40BED
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 17:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730308020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uv3N6IT9SawUpQE0fHGZdai3JGX7GQhGkihXE8XqXpM=;
	b=GQTUHTyRqAuLLlznknvg+bxZGX6YvCFIcIf4vrbn1RNphFhfBZE+uApm7xLoQGjR4YOLoQ
	5Kro8ukwqZaHPshwkJkkHVw765sATAJjaGam8bbsNCJOEXh6w54pDhYSmNFy7R2K6QVasR
	x1LcX4npEiGv6lH+jGXY6gkvK8Owljw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-ToDdpOTFMc2PR9_vluEMTw-1; Wed, 30 Oct 2024 13:06:58 -0400
X-MC-Unique: ToDdpOTFMc2PR9_vluEMTw-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2fb5cdaba8aso72999261fa.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 10:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730308017; x=1730912817;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uv3N6IT9SawUpQE0fHGZdai3JGX7GQhGkihXE8XqXpM=;
        b=dNb0mvgRZIKqodAtgOJXlgdNpHmNDj/bx1wTuJ0PGcTBlqvAeFfjTfOJ4i1vUWKEHX
         P3fFmXi/pTR7K0Q4mSqmQbwDseS/Bmzf9QDS+sf7Ltx6H3o3RzQnJBYWHg1Hodd2ItBO
         d6meoBcaqlmJR8rPMw70e6bcRNzod75utU4+Ju5dj3yD9qwP5h5Il8zp0BvO1vIMkAGr
         XRqau+iQbxcYEo6yWP38V0uB2XWk8MQIYLyZhIr0iXp906pEyLYISLE6iP4Hg9ELjvYm
         3X/t8mAJVuMNLAbpSL1zwqHZDyulGbsnNPHo9J2x92zOGD8X5BGT6BbIwTH4QTIxXcYp
         L9/w==
X-Forwarded-Encrypted: i=1; AJvYcCVcSqav05vIDUKLaNRfW0isz6CSy8qdCRYxAQ5lELqowezAwS9M/kAazDqdf0v4JJRdMp2in9R9@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyCxh0Oqr/RFxCUsG+IyX40Hn/FobUL6aB9jUN1bEreMF4JRjTU
	jCczEdH/fUIfVhDQitfXp3ei1i5tSkTEWABfGWSH4sE2mD3BwM7xlFH7W8rOVpHVioeTM66Ti8v
	DeDvh+gSeZtKk5+/CizrDxkq1QSq95TpGS4ThKSZYlEqVUwfsfy+JQcOGiLllxeYxAEc9
X-Received: by 2002:a2e:bc15:0:b0:2fa:c5d9:105b with SMTP id 38308e7fff4ca-2fcbdf61167mr128925611fa.2.1730308017257;
        Wed, 30 Oct 2024 10:06:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd5hFo7/oapuYd2j8TGiFM/Siukmal4xqSGh8agqdT1EdYQsZxctYHX9deE+ED9Z1rFthogA==
X-Received: by 2002:a2e:bc15:0:b0:2fa:c5d9:105b with SMTP id 38308e7fff4ca-2fcbdf61167mr128925191fa.2.1730308016706;
        Wed, 30 Oct 2024 10:06:56 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947de6sm26836485e9.13.2024.10.30.10.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 10:06:56 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.97)
	(envelope-from <josmyers@redhat.com>)
	id 1t6C9m-00000009QcM-2ODi;
	Wed, 30 Oct 2024 17:06:54 +0000
Date: Wed, 30 Oct 2024 17:06:54 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Carlos O'Donell <carlos@redhat.com>
cc: Mark Wielaard <mark@klomp.org>, gcc developers <gcc@gcc.gnu.org>, 
    glibc developers <libc-alpha@sourceware.org>, 
    gdb developers <gdb@sourceware.org>, 
    binutils developers <binutils@sourceware.org>, 
    Overseers mailing list <overseers@sourceware.org>, 
    cti-tac@lists.linuxfoundation.org, 
    =?ISO-8859-15?Q?Zo=EB_Kooyman?= <zoe@fsf.org>, 
    "Karen M. Sandler" <karen@sfconservancy.org>
Subject: Re: Core Toolchain Infrastructure - October 2024 update
In-Reply-To: <5691d7c8-f92e-46f3-8edf-c83e085dbfa2@redhat.com>
Message-ID: <94813230-3ceb-8060-4272-57612b65cfb1@redhat.com>
References: <9ee5b9e1-3f84-4d9e-8249-7a4bf8080bb0@redhat.com> <20241030103912.GD28606@gnu.wildebeest.org> <3a2c2d35-3b86-4286-a393-5ec166659f92@redhat.com> <ae8662fd114be6b26300e85173cfcd1068421abf.camel@klomp.org>
 <5691d7c8-f92e-46f3-8edf-c83e085dbfa2@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Oct 2024, Carlos O'Donell via Gcc wrote:

> Have you broken down those project goals into actionable steps that 
> could be taken?
> 
> For example filing Sourceware Infrastructure bugs for each service that 
> needs to be migrated into a VM and isolated (with a top level tracker 
> for "Increased isolation")?

Note that we have the CTI service enumeration which effectively identifies 
the various services that should be isolated for various GNU toolchain 
projects.

There may be other services on Sourceware that aren't used by any of the 
GNU toolchain projects with CTI service enumerations.  Those can still be 
of security relevance to the toolchain, if a compromise of one of those 
services could be leveraged to compromise other services or projects - 
isolation matters both inward and outward, for both current and future 
services and projects.

-- 
Joseph S. Myers
josmyers@redhat.com

