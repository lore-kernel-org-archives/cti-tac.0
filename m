Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A288A39F
	for <gti-tac@lists.linuxfoundation.org>; Wed, 12 Apr 2023 20:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35820615BE
	for <gti-tac@lists.linuxfoundation.org>; Wed, 12 Apr 2023 20:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35820615BE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Lz9/Fc+q
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41Hw1RJ59yGz for <gti-tac@lists.linuxfoundation.org>;
	Wed, 12 Apr 2023 20:46:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 619206140E
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 619206140E
	for <gti-tac@lists.linuxfoundation.org>; Wed, 12 Apr 2023 20:46:16 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id z1so3557442qti.5
        for <gti-tac@lists.linuxfoundation.org>; Wed, 12 Apr 2023 13:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681332375; x=1683924375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mrwET8y5z7hAooQ9GAcmp2fAZy5lxPwyesQEyqv0JgY=;
        b=Lz9/Fc+qvrIKY/Gmg96JRxuE34wf6JbPBhqxweuVgivGJFxsDBo0Oi0L3uW6JDxnrG
         L8wjKKuwolDkgX9wsdFO85pzyNYb9tFVizttZAYEhorkWrwfuwanV9nZRMGuj0LCILB3
         mlV5A8FVDnf+6/rs+f+AqvupzSiksINPvJpOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681332375; x=1683924375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrwET8y5z7hAooQ9GAcmp2fAZy5lxPwyesQEyqv0JgY=;
        b=bFmUYLHIQle88/FeNAl2APKZ+4/gFminC9w+OXvCyG+kk0IBfC659VXno/phnYABsq
         2Xk6N5sdp+BbaWk+izd+Iavfq1UeeOxU2wfba6YjnM2YmyVqVUCLnEfhO9BDVxDKpWJV
         c3j1OzUyT/usfCTCWmk4AKc+3Liqlr0QjabYyxMsog5+MbBQvxKkPGBTcdX8IS2cfbbC
         wmp8lPl1M01vvftiNwrR3OTIwaBhIQAwav2o1B9VyOTkf87PuKnT8/6bG30tcnDuuCd8
         CEg8KjbD9RIZLmIK5IZ9b1E8Fomtx4NJbx6EB+2Dc990DI14kK3890E1qCLkDluGaAuT
         x2Eg==
X-Gm-Message-State: AAQBX9cCUnrUhLQ8t3guXn0VfoCLtlGvMZ7m9Be8/vkh858ezHKSmei6
	f0xBORGbSg/nKlgADBDJKDzXtl3H
X-Google-Smtp-Source: AKy350Y1iKVfjpG6b/5aRVOoloO7mQB6FbatVwEj041ToW3NkPh+6LuEW8Ev+4hzyzgHqn1xm0vWTQ==
X-Received: by 2002:ac8:5cd3:0:b0:3e4:d887:3e88 with SMTP id s19-20020ac85cd3000000b003e4d8873e88mr31345099qta.10.1681332375083;
        Wed, 12 Apr 2023 13:46:15 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id k21-20020ac86055000000b003d3a34d2eb2sm4472833qtm.41.2023.04.12.13.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 13:46:14 -0700 (PDT)
Date: Wed, 12 Apr 2023 16:46:12 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: gti-tac@lists.linuxfoundation.org, 
	Khahil White <kwhite@linuxfoundation.org>
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost of
 glibc migration.
Message-ID: <20230412-renderer-muzzle-fb5ea0@meerkat>
References: <13b3266b-a410-77fd-5dfc-4e4994b630cd@redhat.com>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <13b3266b-a410-77fd-5dfc-4e4994b630cd@redhat.com>

On Mon, Apr 03, 2023 at 01:24:21PM -0400, Carlos O'Donell wrote:
> Konstantin,
> 
> The GTI TAC met on 2023-03-08 (please ignore the date typo 06-08):
> https://lore.kernel.org/gti-tac/b72a0c4f-fed3-7418-e9d6-7a277bf37b3e@redhat.com/
> 
> There was consensus that we should start working through the process steps one
> project at a time and pipe-clean the process and learn as we go.
> 
> I volunteered glibc as the first project because I know the most about the project
> and the requirements.
> 
> I am providing the full list of glibc services for review and pricing by LF IT.

Carlos:

I'm not ignoring you, it just so happened that the ice storm (and the
subsequent loss of power) + Easter holidays basically ate away a whole week of
my productive time. I'll be responding to your email shortly, apologies for
the delay.

-K
