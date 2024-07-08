Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C386B14E2C4
	for <cti-tac@lists.linuxfoundation.org>; Mon,  8 Jul 2024 16:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720454421; cv=none; b=WVnkYRQgcMQqgIrUmTHBngIoL/1F7Mzz0ZLHBDvMPnoLf+fZoavQwfpfY7SgXInobrloNN60Oifp3o8sXcLukyI5SVzko7aAybez5mM7dUKRXi1qDv3v1LCXCbl4UQr2T0wrNflKUhGmUBzLNQXmijfAmde+6qpIZ3E8+HmR3bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720454421; c=relaxed/simple;
	bh=mrRphvBatIfxSz59vGKyG+XP2qO/TZcNNUq8rRCzd3A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DMfIDdqtzauRGlSsCps/+IYHisykHAwg/1ReAFrQX33dS+wK7mSieoDTMG1KXPOBGRjaHo+ZzfC2Hq2Js6VvhDsg4OkIVEfnEcunLgUUS1gjFF3EjXCsILQeK7kyZfpvY6q4B2fTz56Dullyfy4fYFLYdxseZNzW0nJQIsqnOBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QilF7w4L; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QilF7w4L"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72A386086E
	for <cti-tac@lists.linuxfoundation.org>; Mon,  8 Jul 2024 16:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8hPOxqVR9LDN for <cti-tac@lists.linuxfoundation.org>;
 Mon,  8 Jul 2024 16:00:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=josmyers@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 90A00607B2
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90A00607B2
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QilF7w4L
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 90A00607B2
	for <cti-tac@lists.linuxfoundation.org>; Mon,  8 Jul 2024 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720454417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w3XoqqC7u3YXSg7UeaYAhqLLHiAtUwbBWtAWizFiUWU=;
	b=QilF7w4LsfBcEgbQrxEztOCwavSHMwcploVp3ZC8LrNtcsneci3iLNDwFy8Wc7anbVOXMh
	d7a18cS7CdXrJe4wi/tWWovPR2hw9pyAPz084GcYKVW9SDkZnPwSAXUtnVi5S8H44hcWMo
	o8piD9hlm2z+lNIv7Mq/tNWU2h3Y3Pw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-O3M5dZvQPKGmBt_H8n2EWw-1; Mon, 08 Jul 2024 12:00:15 -0400
X-MC-Unique: O3M5dZvQPKGmBt_H8n2EWw-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2ee8d83db53so46162911fa.1
        for <cti-tac@lists.linuxfoundation.org>; Mon, 08 Jul 2024 09:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720454414; x=1721059214;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w3XoqqC7u3YXSg7UeaYAhqLLHiAtUwbBWtAWizFiUWU=;
        b=QwO8xzlJo2lRVKJiuKF59y9MRhQ8NrvZ4tpj3yZ5bolbDBRn69n6xdmFDH3QIbo6dG
         udGWCibLWsHXQ2QynmMtTlizCXGycrWdCSfBLUKLnwOECPbWm81MDZRtpzt6KPNuoEpi
         oLzlQkguVpstc10NZSgfSGmYeJYLP5V8p8CZAxNsFGvfWK6fB7+4+SKcJ5fCMMXGShmy
         fmpe1tMwf23TRhXkjyK50uVHoAR+lzmeD0kKbHrpvUtekGHWu92yqv72bW52WLlNQkgQ
         dyjO3/8qYgPLhVXiCjx5CImYU+JiOxBC3+xXNdi7zUAtkYHz9lSUHhdEMVHqJYU3W4Rr
         fLHw==
X-Forwarded-Encrypted: i=1; AJvYcCU5/Yd8KSN4zLFysVeqIECqoCzjEBoM8K9pV5ehDrDlPGA0adp/6AwUspuGVGqTB0E4BasZ5RPQNiqExOElcVUTR9imq/y/QN7kPkJnmODtXfI=
X-Gm-Message-State: AOJu0Yzfrx+03m/EXD1qaQM+S2JiXQp7bNL02wpXrEhM38iuoA80dSu0
	ZTP1VvA4aUIL5VLfIOPq9Pi/KgfRkLILt42oNnvSFpuG23yn/xSuL1T7VBWnL5nQhBJcTFzzo7O
	jY9MiaEKbtF7LniJoet8E+ABcoQigwnisCcOdQAFhQodh5OKiYTpj/BaPtH/2XQ7+Apl7
X-Received: by 2002:a2e:9693:0:b0:2ec:165a:224d with SMTP id 38308e7fff4ca-2eeb3169f03mr1062911fa.38.1720454414311;
        Mon, 08 Jul 2024 09:00:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErFuInCTi2Jj2O9mJ1tehAMTiCSPjSwdMEuSqkAVzqhlPOdXxsxzbeP1JTGcGYgPY4uG9OoQ==
X-Received: by 2002:a2e:9693:0:b0:2ec:165a:224d with SMTP id 38308e7fff4ca-2eeb3169f03mr1060921fa.38.1720454409111;
        Mon, 08 Jul 2024 09:00:09 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f736188sm3626465e9.31.2024.07.08.09.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 09:00:08 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.95)
	(envelope-from <josmyers@redhat.com>)
	id 1sQqlw-0043Sz-55;
	Mon, 08 Jul 2024 15:59:24 +0000
Date: Mon, 8 Jul 2024 15:59:24 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Carlos O'Donell <carlos@redhat.com>
cc: "Frank Ch. Eigler" <fche@redhat.com>, cti-tac@lists.linuxfoundation.org
Subject: Re: Migration to CTI services should be an opportunity to reduce
 dependency on git hooks.
In-Reply-To: <cfc367b2-8440-48f3-b5ae-eae9c5918210@redhat.com>
Message-ID: <3a8bd8e3-9099-48c1-8da9-3198ed6d8e19@redhat.com>
References: <b3d04984-cec4-456f-a05d-7adccb1c3b3d@redhat.com> <20240621133048.GA24746@redhat.com> <cfc367b2-8440-48f3-b5ae-eae9c5918210@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Jun 2024, Carlos O'Donell wrote:

> Then figure out deployment and cost e.g. small vm to run the isolated hook
> that returns a result, average timeout, and degraded result e.g. no bugzilla
> data.

There is a significant difference between pre-commit and post-commit 
actions from hooks.

Post-commit actions can be run in some completely different context (that 
receives some kind of append-only feed of ref changes in the repository), 
and a degraded result might be e.g. no commit mail or Bugzilla update.

Pre-commit actions ensure that some invariant of the commit history is 
maintained.  For example, in the GCC context, they ensure that the nightly 
ChangeLog updates won't fall over by verifying various commit properties 
(on master and release branches) required by those updates (imperfectly, 
because some things pass the checks at commit time but the updates still 
fail), and that new commits don't masquerade as ones converted from SVN so 
that tools expecting a single commit with a From-SVN: line referencing a 
given SVN commit, in order to map from SVN commits to git commits, don't 
fall over from a new commit quoting an old commit message in a ways that 
could confuse the commits.  (They also enforce rules on e.g. which refs 
are allowed non-fast-forward updates.)

The safe form of degraded result from a pre-commit check is to block the 
commit within a limited time if the check doesn't complete quickly (rather 
than running for hours).  One long-term way to avoid hooks for such 
pre-commit checks would be a system based on merge-requests where pushes 
to the main repository, or at least to branches on that repository needing 
greater levels of checks, are normally done only by a CI system that 
verifies the desired invariants before pushing, rather than directly by 
individual developers.  Although that sort of thing is more commonly done 
to ensure invariants of the state of the tree (i.e. that it builds and 
passes tests in some set of configurations), it certainly could be done to 
ensure invariants of the commit history instead.

-- 
Joseph S. Myers
josmyers@redhat.com

