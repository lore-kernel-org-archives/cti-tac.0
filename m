Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F942A92E
	for <gti-tac@lists.linuxfoundation.org>; Wed, 12 Apr 2023 21:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADAA483C91
	for <gti-tac@lists.linuxfoundation.org>; Wed, 12 Apr 2023 21:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADAA483C91
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=bTmaeed9
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
	with ESMTP id cx24ahaSPrLN for <gti-tac@lists.linuxfoundation.org>;
	Wed, 12 Apr 2023 21:28:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 973EE83C90
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 973EE83C90
	for <gti-tac@lists.linuxfoundation.org>; Wed, 12 Apr 2023 21:28:02 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id my14-20020a17090b4c8e00b0024708e8e2ddso2129719pjb.4
        for <gti-tac@lists.linuxfoundation.org>; Wed, 12 Apr 2023 14:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681334882; x=1683926882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vl3gMbCZdDaW9ciWoT6m6Q4NB4TIjT2GtXtL4w5cqAk=;
        b=bTmaeed9K9InW29Ueg5lCNFMJRyzLGY79ADpu21n0JhxOD6vdl+vKnTtkTBBbUYCFY
         k2yDLVa83idnUUx7ju/Mo8WCyO8TxD3t2/Gtg2kE5p1Hn2XQZo8ql5sSWA4+u4cTK941
         DvdzHiInGR4rAYgjybq5ocEUGB/Ol9NJoXqSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681334882; x=1683926882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vl3gMbCZdDaW9ciWoT6m6Q4NB4TIjT2GtXtL4w5cqAk=;
        b=kWNbfhgR80zoBAfXsETYT8Q2HE5QuZbgoS35RPkQmA2fQfZ/QkVQaDT3vfH9I42b4M
         df57BwnSRrDPefyEZIJzUaiJlPk1VqyypAjubAQR/vJkxAu1O937qnMCAQPKz161/WeH
         H03S3K4EY/qJEAqODJP2svfQWOq+Z8nsnVf8e/LvQLVNxuF7npM68h72agesJXFWG7hJ
         gdhKHodgqBvX9QShUpKe8HqMIdsSqV49WtRrErtY7d0VPA3vktMrnCDbWBeBurtvfnuT
         9jDyM5E+irQQEm1AMroHebIwnvR2KCdXnUgE48grKtxGW/21Kx2S6OwKoB28RvN8Thgb
         YS7w==
X-Gm-Message-State: AAQBX9czPfb7ANhBjV4u3ulsZLrrhLg0dEitpt8XSqByu60HfTKwwIje
	Ti0hOIGV+fBsUNZ9L15MtC2ulPEY
X-Google-Smtp-Source: AKy350YKXb3OuIgfCSnP0pKhVm28lhbrpIa2hW5Vt3QYLjRiL/fcWpwFvAj207BlkSWDIfc2XvJfmg==
X-Received: by 2002:a05:6a20:c289:b0:d9:896b:8c0f with SMTP id bs9-20020a056a20c28900b000d9896b8c0fmr5113472pzb.24.1681334881945;
        Wed, 12 Apr 2023 14:28:01 -0700 (PDT)
Received: from [0.0.0.0] (taz4.hyperreal.org. [209.237.226.92])
        by smtp.gmail.com with ESMTPSA id t3-20020a635f03000000b0051b3c0b87fbsm47608pgb.68.2023.04.12.14.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 14:28:01 -0700 (PDT)
Message-ID: <e2ea1355-4de6-910b-0de1-bc1a48f9a595@linuxfoundation.org>
Date: Wed, 12 Apr 2023 14:28:00 -0700
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost of
 glibc migration.
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Carlos O'Donell <carlos@redhat.com>
Cc: gti-tac@lists.linuxfoundation.org,
 Khahil White <kwhite@linuxfoundation.org>
References: <13b3266b-a410-77fd-5dfc-4e4994b630cd@redhat.com>
 <20230412-renderer-muzzle-fb5ea0@meerkat>
From: Brian Behlendorf <bbehlendorf@linuxfoundation.org>
In-Reply-To: <20230412-renderer-muzzle-fb5ea0@meerkat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/23 13:46, Konstantin Ryabitsev wrote:
> On Mon, Apr 03, 2023 at 01:24:21PM -0400, Carlos O'Donell wrote:
>> Konstantin,
>>
>> The GTI TAC met on 2023-03-08 (please ignore the date typo 06-08):
>> https://lore.kernel.org/gti-tac/b72a0c4f-fed3-7418-e9d6-7a277bf37b3e@redhat.com/
>>
>> There was consensus that we should start working through the process steps one
>> project at a time and pipe-clean the process and learn as we go.
>>
>> I volunteered glibc as the first project because I know the most about the project
>> and the requirements.
>>
>> I am providing the full list of glibc services for review and pricing by LF IT.
> Carlos:
>
> I'm not ignoring you, it just so happened that the ice storm (and the
> subsequent loss of power) + Easter holidays basically ate away a whole week of
> my productive time. I'll be responding to your email shortly, apologies for
> the delay.
>
> -K
>
OMG! Wow, no problem and completely understood. Thanks and good look 
with the inbox wrangling.

Brian




-- 
Brian Behlendorf
General Manager, Open Source Security Foundation
bbehlendorf@linuxfoundation.org
Twitter: @brianbehlendorf

