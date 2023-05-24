Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7FD19523
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 19:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBA94429DE
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 19:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBA94429DE
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=IW+fSlQa
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id haBIZfMdsstx for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 19:06:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21D3541788
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 21D3541788
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 19:06:24 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-3f6aa6171a6so519571cf.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 12:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684955183; x=1687547183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5trmA/ApFFIFS1g8BwXjDnVyMiZKDAJkP3Ews8SmAE0=;
        b=IW+fSlQaGHo8fUISv8gMop6Xa7Ios7ItRwgrL2oozrky+wxYyLhYeYYvkIOBw5yFkW
         zQ8Y9gQfDpI7O977FW8tJVfPpEdWwklfPTbdMRHEXfVr3iiYHg9E3mmvlgiOc6TfxEFU
         S2gowMKdeS3Z5qiP9skoYEvxTlSWPl4qM8fs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684955183; x=1687547183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5trmA/ApFFIFS1g8BwXjDnVyMiZKDAJkP3Ews8SmAE0=;
        b=SU/HO0iQex9SHXvAbIlQNbI3BoZvLF+Cl/gjT8Fykl412xKWN5jB5RZ+vzHJWh9lF/
         SpSUW4eZs61HSRKdTplHHcwoMyI+MM3SVL3F+tLr7rYE+QJv4dfXeberdCMEW3Av199P
         bRQKOpGP3ln7YEIGdyQB9LbgyPwcwK7PaYefImHsh83eRe0Mb5XBNUWehcwIp58MZyZ6
         KEj4NkL3UaCidsrv2V0u7CWJ3cTAWWaYUOhMz5gNtnz5Qbrn8kIdcnCyvTmZUw8eFfX8
         z/d5ZcUOacedkNP3ONPDuOak/LiPvEUgCcQ1DZIRPRiaO+UQr2glE4dgoDdc60u/dqTZ
         DCqQ==
X-Gm-Message-State: AC+VfDxlHgqHCknNMjdr1t915MUXZHz0xDHyYOyReTAyrWiagxOzK3U3
	4e+brHYNI3IpByTmmkGJx/QXbIpx1a/NfnNKvJx+tw==
X-Google-Smtp-Source: ACHHUZ4bW+tVzygaTgeuqDIeebcpH94qOi1+7xDMKTbHSVVktCI2KWoowTVXQRWAs5EPWMTC8tBgRA==
X-Received: by 2002:ac8:5806:0:b0:3f0:a426:5f33 with SMTP id g6-20020ac85806000000b003f0a4265f33mr307987qtg.34.1684955182900;
        Wed, 24 May 2023 12:06:22 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id l28-20020ac84cdc000000b003ef1586721dsm3951060qtv.26.2023.05.24.12.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 12:06:22 -0700 (PDT)
Date: Wed, 24 May 2023 15:06:20 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Siddhesh Poyarekar <siddhesh@gotplt.org>
Cc: Joseph Myers <joseph@codesourcery.com>, 
	cti-tac@lists.linuxfoundation.org
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost of
 glibc migration.
Message-ID: <20230524-gloating-diocese-cde658@meerkat>
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
 <20230523-ankle-infer-spurs-55ac6f@meerkat>
 <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com>
 <20230523-banks-calve-rio-844c98@meerkat>
 <7f11ed34-9529-9b3a-e720-64bd3a85542c@codesourcery.com>
 <20230523-cease-candle-debase-dd7485@meerkat>
 <cd8ad55d-38c5-72f1-3464-b5968d1f8fde@codesourcery.com>
 <20230524-december-goon-09e728@meerkat>
 <a4c8b242-7ab1-a0da-fbe0-19cffe1a6054@gotplt.org>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a4c8b242-7ab1-a0da-fbe0-19cffe1a6054@gotplt.org>

On Wed, May 24, 2023 at 02:13:53PM -0400, Siddhesh Poyarekar wrote:
> It looks like the question of who to ultimately trust, either the gatekeeper
> committer (or two) who is the only person to have write access to the
> repository, or the admin who manages the box.

The maintainer's action are in the public, while the admin's actions are
hidden.

> The gatekeeper committer could also fabricate commits and push to the
> central repository in the same way.

1. Not with nearly as much impunity, especially if non-fast-forward pushes are
   disallowed. 
2. At best, a maintainer can modify someone's patch to introduce a deliberate
   bug, not freely modify a commit somewhere in recent history to add
   significant chunks of code like an admin can.
3. If it's someone else's code they are committing, the original developer
   will probably discover any malicious edits, because they will be watching
   their own commits show up in the repository.
4. It's much easier to audit and review the actions of 2-3 co-maintainers than
   when hundreds of people have write access to the repository.
5. When only a small subset of people can push to a repository, maintaining a
   valid keyring for verifying their cryptographic signatures is much easier
   than when 400+ people all have write access.

I could go on for quite a while still. My recent talk at the Linux Security
Summit was on the subject of how easy it would be to sneak a backdoor into the
Linux kernel where I go into many of these considerations (unfortunately, the
talk not yet posted on the LF channel).

> In fact, the gatekeeper committer could choose to do worse, like
> delaying (or declining to merge) someones patches.

The gatekeeper is accountable to the community and can be replaced. The
admin's actions may never be discovered or they can be blamed on someone else.

-K
