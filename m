Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B4512B79
	for <cti-tac@lists.linuxfoundation.org>; Wed,  7 Jun 2023 19:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63A838202F
	for <cti-tac@lists.linuxfoundation.org>; Wed,  7 Jun 2023 19:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63A838202F
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=FoOJtuBy
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13_cp0jlgnBZ for <cti-tac@lists.linuxfoundation.org>;
	Wed,  7 Jun 2023 19:37:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C31A81FF3
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7C31A81FF3
	for <cti-tac@lists.linuxfoundation.org>; Wed,  7 Jun 2023 19:37:34 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-62614f2eee1so58286206d6.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 07 Jun 2023 12:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686166653; x=1688758653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ELodCsgFYH5Ai/E7Z4rQo4HfGAW//qBKCkOUIGiQzHw=;
        b=FoOJtuByxfgsJ0ib49XPhsjRzM5m9AmU4/f51ulPrNEQDB6ywvnu9EisBi+yg5FYqj
         4cVOuxG6JbjJnLoPVVf96Hws/2TLDC8G37Kj0FQgQ5lIO00tyQ+NL9P1cGrRiTWtdLoz
         /Ihe+8+0C73GOdoDjgH/h3/IwFR/OBGxMWRe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686166653; x=1688758653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELodCsgFYH5Ai/E7Z4rQo4HfGAW//qBKCkOUIGiQzHw=;
        b=RIru8NQ38jocOH1UXCsBm0ouucvX+YzXa0cZLWKR4bkr62NnDaeUxJyNowYK3aF/ej
         8qgaPgvzPOFQ65e7gl0Lf7qbaV/s3EiDqQSSDf+4UddYX/JUQPu72vw+KQtqwKKnjlGd
         LRSP8CmdwYr2p6EpfW5ExeuCqGC2AyZvfunpUHsPh4YmfGmkLBkG2qLqWAMifUtVAf/F
         IH7kqnUUltvd/hW7Wk2xbqbhPPSwMvzhkACR1mVEnpZHu1NnRbcRed1co/UvWPmKcYkH
         lrgm8DalNwMjMp5Dzx9QQIt1/ZEQT1JBRtd570N0bxSkYW+TT4kIi4w0JflHV/yvTDdP
         JIYw==
X-Gm-Message-State: AC+VfDy9hm5WuQZVfdHN4j0hO2+Wc+He+hX/h5Vzo3079x4iRntkIQWA
	lsESmy1ovoH8X6/YObSmZq53bYh/el2Vw7QNMwIqGw==
X-Google-Smtp-Source: ACHHUZ6WuUiIQcdamA/l9vHkwKSx/xQSG6/V2Gk4GS0bZMZFEKX1gcZBATmX+rPD62FzMM7Kt7nKOw==
X-Received: by 2002:a05:6214:2627:b0:618:e1d9:75b8 with SMTP id gv7-20020a056214262700b00618e1d975b8mr4679657qvb.34.1686166653250;
        Wed, 07 Jun 2023 12:37:33 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id g9-20020a0ce4c9000000b006166a48357asm141429qvm.60.2023.06.07.12.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 12:37:32 -0700 (PDT)
Date: Wed, 7 Jun 2023 15:37:31 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Status of glibc-related service cost review for CTI?
Message-ID: <20230607-lob-grove-nab-0a1320@meerkat>
References: <2b961760-b1c5-0bf3-1da4-b76d06cb925f@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2b961760-b1c5-0bf3-1da4-b76d06cb925f@redhat.com>

On Thu, Jun 01, 2023 at 08:18:20AM -0400, Carlos O'Donell wrote:
> Konstantin,
> 
> This issue came up in today's CTI TAC meeting and I took the AI to email you here.
> 
> Do we have an update on the status of the cost of CTI supporting glibc's service requirements?
> 
> Is glibc too small to even count?
> 
> Does it make it hard to estimate?
> 
> Would you rather budget this or estimate a price based on load or resources used?
> 
> We have a similar outstanding question to ensure the LF's BBB instance stays funded for glibc
> community patch review meetings, CTI TAC meetings, and possibly Office Hours for the projects.

Carlos:

I think there's a general disconnect on the topic of costs. As far as LF IT is
concerned, your migration, hosting, and support is already covered via OpenSSF
directed funds. I understand that it's important for you to properly
understand the cost of running the project on the LF IT infrastructure, but
it's not a trivial matter to come up with a precise number. A lot of it would
be running on shared resources that serve several other projects or on
infrastructure that is straight-out donated to LF (e.g. via CDN and Equinix
Metal frontends that serve most of our traffic). Some of the cloud
environments we use have special agreements with LF, such as our Openstack
partner, Vexxhost, who excludes bandwidth from their bills because they know
we try to serve any large requests from other resources.

So, if we try to calculate an accurate "slice of IT" that glibc would be
using, it would too difficult to come up with a meaningful number. If you
like, we'll be happy to pass along any invoices that are exclusive to
CTI infrastructure -- we do it for transparency reasons with many other
projects.

In general, LF IT is ready to start moving you over at any time -- in whole,
piecemeal, or in any other form that makes it least disruptive to the members
of your community. I suggest we focus on the technical aspects of this
migration -- once we start receiving bills, I'll be happy to pass along any
and all of them that are exclusive to CTI so you have a clear picture.

Best wishes,
Konstantin
