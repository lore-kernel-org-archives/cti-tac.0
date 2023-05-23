Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D1B1F957
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 20:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47EF44202A
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 20:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47EF44202A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=ZmBsrJYY
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PNOdRSWMg0_C for <cti-tac@lists.linuxfoundation.org>;
	Tue, 23 May 2023 20:21:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08AA141E21
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 08AA141E21
	for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 20:21:26 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-62384e391e3so299356d6.3
        for <cti-tac@lists.linuxfoundation.org>; Tue, 23 May 2023 13:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684873286; x=1687465286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0DcOb4r3uAnhxTq2SVxnkyY0AmskFfK0mGyyXFuLiSE=;
        b=ZmBsrJYYcoFSLnxZw5KEJyPRhBHEQ1ormPy6AZBTf9eTMcMEIjbHrcl4CmUwQnXHAB
         1EZyEg8Y5tYbA95kf4tsTlUiuQjcBD2ABcKXqaGPW8Sn+grBdz/4xCjFFpzb88gY/tCQ
         otwDWg+ZMt80qIFNitCzoc5qhmC/ooZUBIAhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684873286; x=1687465286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DcOb4r3uAnhxTq2SVxnkyY0AmskFfK0mGyyXFuLiSE=;
        b=LYXXKGQcnqI/Ovw9/wCPz/NIprZCPMeJ7RW+GNwF9T0EOMfoxnwLk6lRsNtI1V9m11
         z0kTtcgMwgi6NBiTeUZLTjfz/4wVYKsFt2kHyXhRdQ63xxzUjOOVaYrYSL078zrbTTVY
         FRB4rCJQxFj7oeJGMojFPPUp9w4roHxbpuo3ytBHggp3qS1N3IZHKSsRPb5VXFPldxYe
         Fl3vRoqAvHsfuJGvFhVu2WX0zM8P+3h31k+SvkARb/nZKbNLYEIre4QQ7kpmSz2Lao6v
         W1vvW4ebd1gKNzxMjQUdP7BgcKmTr6aPnOUaj18dSd/IcKlKWMXkqgY4f5EeVeE7eeNw
         /hrg==
X-Gm-Message-State: AC+VfDwKeBcew2AIR9u9uhVmCUbl43JoYdw1uwgOtzscWUDR3+A0NP/U
	EBf/9wnyJ65HwH2EKJwTrkeouDBLPg8iRUIKcbu3Xg==
X-Google-Smtp-Source: ACHHUZ7AgmMM6IFZzJ4Yr3pR8b6tLfKWryc1MIqs9qP22VGLFvIok57wFFfd8NRNE5jrL7ES0Qhheg==
X-Received: by 2002:a05:6214:d0f:b0:618:5ac0:5e68 with SMTP id 15-20020a0562140d0f00b006185ac05e68mr20016777qvh.48.1684873285802;
        Tue, 23 May 2023 13:21:25 -0700 (PDT)
Received: from nitro.local ([204.48.95.153])
        by smtp.gmail.com with ESMTPSA id lf14-20020a0562142cce00b006258fc319bcsm1223225qvb.79.2023.05.23.13.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 13:21:25 -0700 (PDT)
Date: Tue, 23 May 2023 16:21:22 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Joseph Myers <joseph@codesourcery.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost of
 glibc migration.
Message-ID: <20230523-cease-candle-debase-dd7485@meerkat>
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
 <20230523-ankle-infer-spurs-55ac6f@meerkat>
 <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com>
 <20230523-banks-calve-rio-844c98@meerkat>
 <7f11ed34-9529-9b3a-e720-64bd3a85542c@codesourcery.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7f11ed34-9529-9b3a-e720-64bd3a85542c@codesourcery.com>

On Tue, May 23, 2023 at 08:12:10PM +0000, Joseph Myers wrote:
> On Tue, 23 May 2023, Konstantin Ryabitsev wrote:
> 
> > Okay, perhaps I'm not fully grokking the picture. How many people are able to
> > push to master/release branches? I was expecting it to be 1-2, maybe a handful
> > of people, but perhaps it's a much wider set of developers?
> 
> There are 612 users in the gcc group.  There are 121 users in the glibc 
> group.  There are 461 users in the src group (which can commit to the 
> binutils-gdb repository).

Okay, clearly a totally different approach to the kernel world where only a
single person (or perhaps 2-3 people) can write to a repository like
torvalds/linux.git or stable/linux.git. Hence my misunderstanding of what is
happening.

Can you please describe the lifecycle of a patch and how it gets from "user
sends a change to the mailing list" to "that patch becomes a commit in the
official project repository where it lives forever."

E.g. for the kernel, it is:

- the patch receives initial review by the subsystem maintainer
- after a few iterations, the patch is committed to that maintainer's
  separate repository (either on kernel.org or elsewhere)
- during the merge window, the maintainer sends a pull request to the mainline
  maintainer (Linus) who does a final review and either rejects it or merges
  it into the mainline

I need to more clearly understand the kind of access 612 users of the gcc
group have to the git repository.

-K
