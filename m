Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6B610786
	for <gti-tac@lists.linuxfoundation.org>; Wed,  9 Nov 2022 19:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0126416F9
	for <gti-tac@lists.linuxfoundation.org>; Wed,  9 Nov 2022 19:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0126416F9
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WoZmzKbW
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
	SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mMWRBUYw-VRP for <gti-tac@lists.linuxfoundation.org>;
	Wed,  9 Nov 2022 19:08:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 252BD416D0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 252BD416D0
	for <gti-tac@lists.linuxfoundation.org>; Wed,  9 Nov 2022 19:08:28 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id g24so17989928plq.3
        for <gti-tac@lists.linuxfoundation.org>; Wed, 09 Nov 2022 11:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rk1ILwsqGG7oW7ZdtO/9U5gJNxEleCsz/9t83IwNYcs=;
        b=WoZmzKbW2VM+GK8F2y34x42bnMF3F/YDDNCiefsxkSaU3BrEje+HinG4ODm//Ir21H
         hO2Hr9zjZhVNOSw4K5Bq2JtwSlQYeLu4Vo5oknL5s+jKOys/rd4FkhBYyXHbhwg7zfbj
         dBTFOHS0muGTLrRt2yInIuWGu83pLa4055pxP2GLnF25NmvMdysC6yd3gVzZjD/wagN0
         MaAqD/tSFUfyMwJhWXH4aOYbC8rohk2BBYQBGPkKqyYMRRu4xZW16Nrp7YVbz4lMFVp/
         nHzaiW0vlPwzJGoBjlPXiIrmM9EQ8BA5Dxicfmbj0hD28637093Nh4uhf0YcuKe3qDKU
         sLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rk1ILwsqGG7oW7ZdtO/9U5gJNxEleCsz/9t83IwNYcs=;
        b=yDFq+Wneb9l8lXvaeL/Pdmv9UUEbOPbdP57QevDY+MqGoF7nl91RzvZQzwF9EvxLVC
         HOUg9zLEXaLHCwRVG0ZLXjH4KQoYf7ACGArkvvHeCyHfvPVTXq3L0GEas4gPD+IhtzpF
         ZUjiUVDRCOqNKSzqdEOlBqFkOrxHmk/BP3O0RfEmoN/syygCwlZik+VM7+MxXgA0uNFD
         6PInDSPjhFJZAS1ij5XktNTxyzjIpmJehEWtut3q05ZO1P0PTox8swlOJ6+ehLUOdkBn
         uKVEzmDHUCILH3O/0fdWXWLrcsA4Uyu4bpvJCDz4r+vvh1xq3hkkbfAtEos2IXVU4sNV
         lE5A==
X-Gm-Message-State: ACrzQf3d424EO8wDL41c31SbdKTYA9etii2XBM/q8y+LQwcQ3CEoKXPg
	sVnakm4mDeYwQbX0kIfPCoQ8ou0DrLM=
X-Google-Smtp-Source: AMsMyM4mK+gj66k2y7uwQKZ3B0Tlxw1UIxoAhj1HbXlC32DLmXbSqBNjqnuf7yIfHqFiO81opqmDtA==
X-Received: by 2002:a17:902:d50c:b0:187:460:bf9c with SMTP id b12-20020a170902d50c00b001870460bf9cmr62510676plg.4.1668020907351;
        Wed, 09 Nov 2022 11:08:27 -0800 (PST)
Received: from ?IPV6:2601:681:8600:13d0::f0a? ([2601:681:8600:13d0::f0a])
        by smtp.gmail.com with ESMTPSA id o27-20020aa7979b000000b0056b932f3280sm8637700pfp.103.2022.11.09.11.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 11:08:26 -0800 (PST)
Message-ID: <ad3bb194-d3f0-4dde-5821-4c63b1fa0fc9@gmail.com>
Date: Wed, 9 Nov 2022 12:08:25 -0700
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: GTI TAC Meeting Notes 2022-11-09
Content-Language: en-US
To: Carlos O'Donell <carlos@redhat.com>, gti-tac@lists.linuxfoundation.org
References: <90611be5-1c79-e5c9-e925-cad7ef854447@redhat.com>
From: Jeff Law <jeffreyalaw@gmail.com>
In-Reply-To: <90611be5-1c79-e5c9-e925-cad7ef854447@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/9/22 10:47, Carlos O'Donell wrote:
> GTI TAC Meeting Notes 2022-11-09

[ ... ]

THanks.  I'll review these over the next couple days.  I thought I was 
going to be able to make it this morning, but a medical issue got in the 
way (I'm going to be fine).


Jeff

