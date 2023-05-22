Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E93AD53
	for <cti-tac@lists.linuxfoundation.org>; Mon, 22 May 2023 10:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79C668225D
	for <cti-tac@lists.linuxfoundation.org>; Mon, 22 May 2023 10:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79C668225D
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=adacore.com header.i=@adacore.com header.a=rsa-sha256 header.s=google header.b=decjcxDZ
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9QDqBYhsvnyk for <cti-tac@lists.linuxfoundation.org>;
	Mon, 22 May 2023 10:11:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68B1B82218
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 68B1B82218
	for <cti-tac@lists.linuxfoundation.org>; Mon, 22 May 2023 10:11:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-30a4ebbda56so1826780f8f.1
        for <cti-tac@lists.linuxfoundation.org>; Mon, 22 May 2023 03:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adacore.com; s=google; t=1684750295; x=1687342295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VlrFvkPn4ll8UJcF60fdkkKRdCO8GeywkP0mquDq2v0=;
        b=decjcxDZBiQus9mW3GZfxTyl/Q8DP2WmUgAfuAapCu3XE/0l1s2okNxjUbwFE38L/t
         jG+96AwV6C1s36DzrcJsvgXPT9f+9BEmFpfCMp6dVo2+gLOkg4ejL9Ji/upCCJJv2n8D
         dG1deLsYKq0wkNqLx1shvf+UwXxR+KMiVwTJcg1X13WT7vYnH5GSkJpCMWIiGpyK3eSp
         UhYqZeFlB2OTweTd+ZmefI+T3f17EfwuwVQF2gBXxH2cIqOP+K1PsUYE0wISDhVbFpAO
         VBL+UC+vr0FNm2kKX0EE1RzXNorfyxxmp943W/h+T5eK7U+MWiJfsGwanrB4H/b3dOui
         eEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684750295; x=1687342295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlrFvkPn4ll8UJcF60fdkkKRdCO8GeywkP0mquDq2v0=;
        b=VxDNLjgbhm+1YlIUZIEscRVBBR3UJ8XcVoPPM4sxK6BqBfSr1ZzJFKMJotvxbaUjni
         mnwPZ1zU1Ci2Um8jlp1JaOLjMb/nkSYQij4kzAWp3ml/JkuZtHIt4j+jhicMCDDuaqLE
         b2Oh2Hb748MRtlkV+tOh7NwYIPZVWcTGvB7sVt6Wa/7KiAk8D42ws87RxtIyniytWj1h
         gUwRYleiTA7QPZyLMqrTEJolGM2aBYFAMFXuJF7Rl0oMnJuj7dySQL4VB/ISGwB67bPI
         pfiMREHxh9+VoklBCHx5QYyJg3IfRaDnCLt9T/zPMnXJOZh8t89O9zxH7VZendsM2DTr
         Y3gg==
X-Gm-Message-State: AC+VfDw37V1g1pyw6Kfb3ysxxoJH1Yt9hMLR5pjcBsbuJR69pk9vjIvX
	9T4+HjwXDsHJyPDVgBp4/bUq
X-Google-Smtp-Source: ACHHUZ4fVVkZasrFvlwedNDI8W/DIpfmSWB+SJDAsjjZzvnzZFrGmKxk1gxYEUcYu5p7NU4bhOSLrg==
X-Received: by 2002:a5d:4210:0:b0:2f8:c94c:3895 with SMTP id n16-20020a5d4210000000b002f8c94c3895mr8041117wrq.23.1684750295480;
        Mon, 22 May 2023 03:11:35 -0700 (PDT)
Received: from takamaka.gnat.com ([45.147.211.82])
        by smtp.gmail.com with ESMTPSA id m13-20020adfe94d000000b002fda1b12a0bsm7325217wrn.2.2023.05.22.03.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 03:11:34 -0700 (PDT)
Received: by takamaka.gnat.com (Postfix, from userid 1000)
	id D756681B59; Mon, 22 May 2023 03:11:21 -0700 (PDT)
Date: Mon, 22 May 2023 03:11:21 -0700
From: Joel Brobecker <brobecker@adacore.com>
To: Joseph Myers <joseph@codesourcery.com>
Cc: cti-tac@lists.linuxfoundation.org,
	Joel Brobecker <brobecker@adacore.com>
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost of
 glibc migration.
Message-ID: <ZGs/yahtWK4pholh@adacore.com>
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>

> > * Sending per-commit email to mailing lists -- this seems like a vestigial
> >   feature from the pre-git past. Does it really serve any purpose? I am
> >   fighting to kill a similar feature used on the kernel.org side, because I do
> >   not see any remaining legitimate use for it -- it just creates a lot of mail
> >   traffic that nobody really reviews.
> 
> I think it's extremely useful to have those messages for watching out for 
> commits that shouldn't have gone in or went in in an unintended form (this 
> is for human-determined "shouldn't" or "unintended" - not anything 
> expected to be covered by automated checks).  And also to have a message 
> ready-made to reply to when something was committed without being posted 
> to the mailing list.

I strongly agree as well.

-- 
Joel
