Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6307C13A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 18:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D775835A7
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 18:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D775835A7
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=dw9jCKwZ
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
	SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDN2xoCbI5d0 for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 18:55:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 593868002D
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 593868002D
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 18:55:13 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-64d30ab1f89so984717b3a.3
        for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 11:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684954513; x=1687546513;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vt/puC4GCDPeEY+/P3/c5Htnm1OVHS+tJK3vSLjIXAk=;
        b=dw9jCKwZpJV+EihlvvI/XKjOMtwPYaNbBs33j2XhtoAz+T9luDbcgmw/axuTeUebOS
         nvjCC04C4EGtwV+vS98UKS8qrqWFflWFS0qKqf3ey8OKmjuqSnxZY6dxzoc10FoKRbR5
         JE4q1gBpiHTfeQpqxpCm9tOk1VTrZcyPXDwLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684954513; x=1687546513;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vt/puC4GCDPeEY+/P3/c5Htnm1OVHS+tJK3vSLjIXAk=;
        b=ftiYw/Dn43751ji0CeY9ZKOrZUASSI7tM7WB4LwntlUTgQz9h1md17KeX2vHIkYqP2
         lGLCyBHQ+sTp7TGzwr1R6g9WTC7rwHwDKUw4pjlyjgmixxt0k1wV9P7/o5S7HyjEpjaa
         dA/igeAoJZTaR4uF3SZb9gKpNs/2RTx8kzGxoxiF6/XSUApnDUQBk4VO/jkbyg/mPtVo
         2oTNjL2l1mj3um1wo1C3ZNLXsaE4QwbUG1sZFlVA3E92kycY+J9RCpHFPT1RE4Rq6DCK
         gxeeBLEu++6qicF/+obyvpJHxyprW7RTatVwYZ1bC9JpTBQ6/H+9QEmtpraSKb16xp3H
         05tA==
X-Gm-Message-State: AC+VfDxkrCuB+i2d6rUcoPsb4SHC/gdLddi6UtC1MxkpMZEQi2c/rPM2
	vj+eL7Siz4Mgk83QA00UvgiqCUtJ
X-Google-Smtp-Source: ACHHUZ7K1uy6Bb47U4OEARqrSJp6yDJ/qy8TYGTn8tM43Nj6khwh09vS78cdwhU9bUiAvTMo3eEpuw==
X-Received: by 2002:a05:6a21:9998:b0:10a:a57a:9f7e with SMTP id ve24-20020a056a21999800b0010aa57a9f7emr18708950pzb.25.1684954512694;
        Wed, 24 May 2023 11:55:12 -0700 (PDT)
Received: from [0.0.0.0] (taz4.hyperreal.org. [209.237.226.92])
        by smtp.gmail.com with ESMTPSA id o15-20020a17090ac70f00b0025063e893c9sm1644152pjt.55.2023.05.24.11.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 11:55:12 -0700 (PDT)
Message-ID: <e5634ca9-57ed-c3a4-5488-1cb02f98fb72@linuxfoundation.org>
Date: Wed, 24 May 2023 11:55:11 -0700
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Siddhesh Poyarekar <siddhesh@gotplt.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Joseph Myers <joseph@codesourcery.com>
Cc: cti-tac@lists.linuxfoundation.org
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
 <20230523-ankle-infer-spurs-55ac6f@meerkat>
 <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com>
 <20230523-banks-calve-rio-844c98@meerkat>
 <7f11ed34-9529-9b3a-e720-64bd3a85542c@codesourcery.com>
 <20230523-cease-candle-debase-dd7485@meerkat>
 <cd8ad55d-38c5-72f1-3464-b5968d1f8fde@codesourcery.com>
 <20230524-december-goon-09e728@meerkat>
 <a4c8b242-7ab1-a0da-fbe0-19cffe1a6054@gotplt.org>
From: Brian Behlendorf <bbehlendorf@linuxfoundation.org>
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost of
 glibc migration.
In-Reply-To: <a4c8b242-7ab1-a0da-fbe0-19cffe1a6054@gotplt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/24/23 11:13, Siddhesh Poyarekar wrote:
> On 2023-05-24 12:29, Konstantin Ryabitsev wrote:
>> [...]
>> GCC and other projects are sufficiently high targets that we should 
>> not trust
>> the infrastructure to be secure or admins to be above being bribed or 
>> forced
>> under duress.
>
> It looks like the question of who to ultimately trust, either the 
> gatekeeper committer (or two) who is the only person to have write 
> access to the repository, or the admin who manages the box.  The 
> gatekeeper committer could also fabricate commits and push to the 
> central repository in the same way.  In fact, the gatekeeper committer 
> could choose to do worse, like delaying (or declining to merge) 
> someones patches.

It doesn't seem like an equal comparison - it seems like down one path 
there is an audit trail by which regular (machine+human) processes can 
detect malfeasance, while down another path there's a greater 
opportunity for compromise that can't otherwise be easily checked.

If GNU Toolchain devs haven't developed a full threat model (that would 
include things like "gatekeeper delaying someone's patches") that would 
be nice, so that you can weigh approaches that solve some threats but 
not others, or a combination that maximizes coverage. Social attacks 
matter - from a security POV it's less "gatekeeper being lazy/a jerk" 
and more "gatekeeper being compromised by an attacker".

> Signed commits would be nice, but we're not there yet as a community.

It's not quite as easy as "hey just add -s to your git commands" but 
it's not far from that. I'm not a part of the TAC so I won't go further 
than to suggest that a migration, where there will no doubt have to be 
some adjustments to process and flow, to introduce other non-zero-effort 
but non-blocking changes that enhance overall security/integrity.

Brian

-- 
Brian Behlendorf
CTO, Open Source Security Foundation
bbehlendorf@linuxfoundation.org
Twitter: @brianbehlendorf

