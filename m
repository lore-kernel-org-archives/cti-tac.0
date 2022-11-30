Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17C66FA1
	for <gti-tac@lists.linuxfoundation.org>; Wed, 30 Nov 2022 18:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E87B4056B
	for <gti-tac@lists.linuxfoundation.org>; Wed, 30 Nov 2022 18:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E87B4056B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=TU0ukPcS
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
	with ESMTP id ds89F3o6prHh for <gti-tac@lists.linuxfoundation.org>;
	Wed, 30 Nov 2022 18:11:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 862A04000B
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 862A04000B
	for <gti-tac@lists.linuxfoundation.org>; Wed, 30 Nov 2022 18:11:05 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id l15so11742695qtv.4
        for <gti-tac@lists.linuxfoundation.org>; Wed, 30 Nov 2022 10:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0+86xdFNsEFLJRmiDOkpIBpJa9D5xSHpytcEm2BX4hY=;
        b=TU0ukPcS/+sEyDNbzCLGX/t75LQNj6fSnMkEZMLVe1UVvWLs2KTIxEDuu0eESSufN2
         o0zrPdW0bf3gbEuA8FyKo5Wz3xUNiSmKJ3c42m9EHSNTowcaqdCxKjun9Smez0wW/jxL
         D3/S4jJv97OQkMG9yBOQppNSzcg+Ytjlur0nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+86xdFNsEFLJRmiDOkpIBpJa9D5xSHpytcEm2BX4hY=;
        b=XhyueXTMvub0zTE9dIt59xKXSJcCCX4gNkwSivISfhZSEqb4UbN80GnxpRKFURnkDl
         7OIo2EUQ3JFr6QgSuwh9F8yLhyB/zpW2CAc45cd0xdDEyZW7KRT+s88uE42k0y9fO1SI
         g0rY+cA3neSSgXR0KCReA4gyjUcaRScIvRYJGVfxK/xi+S0/xT0ru6jzR7+8HPflLaWs
         oEeaDWTSm2qNpPNnEEI1OIo/1DLb7M8wrlYoNC+1OEPGWZ5g191ZfW2C7Tr/obsVay12
         +b6K5P+Bm6AcALPw2fV3HQjpPpe5dgOQzF2W4FMQhpZ/v1VoO+wCg3xUKg++Dcz4XF8F
         m88g==
X-Gm-Message-State: ANoB5pmuomMERm5B0qmgb4SUeBhzxWWnk9CCkmFzlgj29hXwTOSk5R8c
	7j0hHM4r572asAfc0FgqSVOgDurR
X-Google-Smtp-Source: AA0mqf7MYVx0dQaBg1Yu+j5nHZUd+V30a2saEDeIjHT8Jebw+vSqXnm25U+EUJjtrmpq+MpjIRX1vQ==
X-Received: by 2002:ac8:4241:0:b0:399:f8f2:56ed with SMTP id r1-20020ac84241000000b00399f8f256edmr56637014qtm.137.1669831864321;
        Wed, 30 Nov 2022 10:11:04 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id bi19-20020a05620a319300b006b929a56a2bsm1644668qkb.3.2022.11.30.10.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 10:11:03 -0800 (PST)
Date: Wed, 30 Nov 2022 13:11:02 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: gti-tac@lists.linuxfoundation.org
Subject: Re: Testing LF BBB instance for GTI TAC meetings.
Message-ID: <20221130181102.qnteq5nvbxuiezob@meerkat.local>
References: <957106ad-24b6-e144-1132-faa7f1714371@redhat.com>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <957106ad-24b6-e144-1132-faa7f1714371@redhat.com>

On Tue, Nov 29, 2022 at 05:08:24PM -0500, Carlos O'Donell wrote:
> I want to extend a big thank you to the LF IT team for moving
> forward and setting up a BBB instance that we can try using for
> the GTI meetings.
> 
> The previous GTI TAC meeting was hosted by me using 8x8's Meet
> hosting service (hosted Jitsi). We had discussed using BBB since
> it is well supported and is empirically more compatible than Jitsi.
> 
> The BBB instance is here:
> https://bbb.linuxfoundation.org
> 
> The GTI TAC room is here:
> https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1
> 
> At least two of you tested an earlier BBB instance, and this new
> instance has been upgraded and updated to avoid previous issues.
> 
> I will be looking for volunteers to test out the BBB instance :-)

FYI, the hosting provider is doing some backend work today to complete the
move, so please don't be alarmed if you get an error in the next few hours.

-K
