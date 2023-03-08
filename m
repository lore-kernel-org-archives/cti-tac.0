Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445888BF3
	for <gti-tac@lists.linuxfoundation.org>; Wed,  8 Mar 2023 19:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0E204188A
	for <gti-tac@lists.linuxfoundation.org>; Wed,  8 Mar 2023 19:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0E204188A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=QxT6xD4Z
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
	with ESMTP id x5_b6Qyhf3ex for <gti-tac@lists.linuxfoundation.org>;
	Wed,  8 Mar 2023 19:29:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D23C841889
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D23C841889
	for <gti-tac@lists.linuxfoundation.org>; Wed,  8 Mar 2023 19:29:26 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id nv15so11821867qvb.7
        for <gti-tac@lists.linuxfoundation.org>; Wed, 08 Mar 2023 11:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678303765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=06VYbnieNbXh2w3SLm2xJFl5rD7P222JfHXc6AD1/d4=;
        b=QxT6xD4ZnrkjPVK9lxfnJRIK8FwZG7eqXUY9e1SU0Qhp32SttPsDZ9qBfCgjC2lPQ6
         +XOye7Wy8436z4g3ThbHc+eyeJiIewUd6dT79hXGpAB+l7Tpelu25F95TNP2kXXkF3OI
         QvDFFESN+lEgJxRwqdQjPeT0kHWZ/XBpVY06I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678303765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06VYbnieNbXh2w3SLm2xJFl5rD7P222JfHXc6AD1/d4=;
        b=lyxHBTB4xpas2SdRAQbofti+aScywdkVIAJpJ/1oOS3TZVsBNBoe5TM2vxHj207l1d
         Fz4ZIRCZjwJikBLFAzCcw1Yzi84tBHeH1BMhAyq5D7TQH9LZHoVvo3d+HI80YocEktBS
         A80CoNV+MYWoEbeOwQyWLr62ysxJNc6G/LaHSAr3QEqmtr2i063M4/EGwDO64//Z8cAh
         ZXc6IJ3rnys9NiLCjlboM6l+pnITiZQDQSx7Ke94Iaq2RDuQ+C8v5NZguvoIh2/E3Ouj
         IlKp02cI8ncMWWRDInpt1GYQa5M3w+licFG1bmLUMjDg+B3kQ0DfKtnrVLAgVrSc9KVT
         suOg==
X-Gm-Message-State: AO0yUKXAiK1XX2havGzV+5ppu8aRt29myJvhYZ5pMATwIjj+ZJB6jp8k
	1pEO/NGIM+Vm/c11Jr1Y+6ZG6CwO
X-Google-Smtp-Source: AK7set9ug8Am8xrtcEghZcQS0A3xsOXIq3oiz/yIr/xuOlYjkySJwwjV8ZNQ0Ze84fE/GiYatF3Zmg==
X-Received: by 2002:ad4:5ae4:0:b0:56f:ab:1502 with SMTP id c4-20020ad45ae4000000b0056f00ab1502mr37005614qvh.37.1678303765600;
        Wed, 08 Mar 2023 11:29:25 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id q28-20020a05620a2a5c00b007422fd3009esm12170892qkp.20.2023.03.08.11.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 11:29:25 -0800 (PST)
Date: Wed, 8 Mar 2023 14:29:23 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: gti-tac@lists.linuxfoundation.org
Subject: Re: GTI TAC Meeting Notes 2023-06-08
Message-ID: <20230308192923.tuxd3ocrbg3dwqf3@nitro.local>
References: <b72a0c4f-fed3-7418-e9d6-7a277bf37b3e@redhat.com>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b72a0c4f-fed3-7418-e9d6-7a277bf37b3e@redhat.com>

On Wed, Mar 08, 2023 at 11:44:47AM -0500, Carlos O'Donell wrote:
> - Carlos: Where does the complexity come from?
> - Jeff: Mailing list from bugzilla integration. Lots of custom stuff.

Can someone pass me the details of this integration? I'm currently working on
bugzilla mailing list integration via lore.kernel.org and I can see if this is
something I'm already handling.

-K
