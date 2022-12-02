Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E426333F1
	for <gti-tac@lists.linuxfoundation.org>; Fri,  2 Dec 2022 16:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ED48820D3
	for <gti-tac@lists.linuxfoundation.org>; Fri,  2 Dec 2022 16:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ED48820D3
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CiXW+ySt
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.103
X-Spam-Level:
X-Spam-Status: No, score=-2.103 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09Gfw72b8Qq3 for <gti-tac@lists.linuxfoundation.org>;
	Fri,  2 Dec 2022 16:31:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29A58820C6
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 29A58820C6
	for <gti-tac@lists.linuxfoundation.org>; Fri,  2 Dec 2022 16:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669998696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xq2UWfmzsOZKK7GQ7IqJdqQq/UR2ZlLp9We1ZxawaxE=;
	b=CiXW+yStuhINa9/Un6aQvTKI8jd1Bxf3prfZi612e9202mbQeIxL4JUOPbLsg0dJ2Uj1bb
	l9kSoSkkrPj20tQJge2HMCrgqtOjo5g8Ym7zS5LB39Qrh6mpEoInaOIuygByQD5GZMjU0Z
	LCX1tMANXYNCM0kwtp4Fv1dw/wMVj6U=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-445-rMAzlAPrP5WMPumrLG495w-1; Fri, 02 Dec 2022 11:31:35 -0500
X-MC-Unique: rMAzlAPrP5WMPumrLG495w-1
Received: by mail-qt1-f197.google.com with SMTP id hg24-20020a05622a611800b003a66175d924so18257897qtb.1
        for <gti-tac@lists.linuxfoundation.org>; Fri, 02 Dec 2022 08:31:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xq2UWfmzsOZKK7GQ7IqJdqQq/UR2ZlLp9We1ZxawaxE=;
        b=r9DbQokYxCR35KkwXykqgBFmmf9SOHm3po8jqCEvyOr1lQ4HajMmMM9lNdcdi+Xtva
         QlNV2x/uUQjMVWddH1yfFnx+HevNHWiJsq/cSzf7EnwcUdRKXCSDm34TCvJQ9qsPzdZJ
         i+rvLdiWhj+hXZ6HZjcCSGLqEbnhCr4vpA7jSi5f162k1KcxnCRHk8xPwa6lh93jR1St
         XoZscEVPirfwf8Rnx7Zd8bB99OjUbbk4V2QmcicvBQKfLmqUcNLY5vAx3wJr32WVgL3O
         R16H56Q7JEIcSgWV5sfWjKkJXN12iVfAiaGZ0t6KHO1Nkt5wuyJdTJR7ebsxFg+6Smvl
         SOTg==
X-Gm-Message-State: ANoB5pn3tJkfABmgfuIg6dU8vXi1wB3R/+HYKUBfxxv96T0VMlj1mMlR
	nBwEabU8RMVmnXfSwrsgaQb7LwPiHjoeCXMXkxtxoqfRR1TdU1JYg4Uwz8fUJkdB6a6CUYnaR1K
	3LUhcYr5zp7iz0lP2MpoH5io24JDQRdw=
X-Received: by 2002:a37:bf46:0:b0:6fa:894c:da6d with SMTP id p67-20020a37bf46000000b006fa894cda6dmr64672028qkf.527.1669998694822;
        Fri, 02 Dec 2022 08:31:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6MXlRW9vJoDdfcDmAmy1lnh/oEWFSgNbp7Sf6rBYV1x7V55kZTZ6QajDheH9sa2tsAEC0UXQ==
X-Received: by 2002:a37:bf46:0:b0:6fa:894c:da6d with SMTP id p67-20020a37bf46000000b006fa894cda6dmr64672009qkf.527.1669998694545;
        Fri, 02 Dec 2022 08:31:34 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id bi6-20020a05620a318600b006fa16fe93bbsm5749036qkb.15.2022.12.02.08.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 08:31:33 -0800 (PST)
Message-ID: <e585fa5c-b46b-ad21-6d63-9d6bcabc145e@redhat.com>
Date: Fri, 2 Dec 2022 11:31:33 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Testing LF BBB instance for GTI TAC meetings.
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: gti-tac@lists.linuxfoundation.org
References: <957106ad-24b6-e144-1132-faa7f1714371@redhat.com>
 <20221130181102.qnteq5nvbxuiezob@meerkat.local>
 <385054cf-6062-c379-413f-052627cb1c05@redhat.com>
 <20221202160028.ese522ykukctsg3v@meerkat.local>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20221202160028.ese522ykukctsg3v@meerkat.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/2/22 11:00, Konstantin Ryabitsev wrote:
> On Wed, Nov 30, 2022 at 01:25:05PM -0500, Carlos O'Donell wrote:
>>> FYI, the hosting provider is doing some backend work today to complete the
>>> move, so please don't be alarmed if you get an error in the next few hours.
>>
>> Thank you for the update.
>>
>> We'll test tomorrow to give them time to complete the move.
> 
> Carlos:
> 
> We ran a couple of actual meetings in it yesterday for testing purposes and it
> worked really well. Please let me know how your tests go.

Thanks for reaching out! I was about to email you about our test yesterday.

The audio worked perfectly. The video was stalled for all three participants.

We tried a combination of firefox and chrome an still had video issues.

The video in BBB is via a distinct channel, and so perhaps the Red Hat VPN
impacts that, and all three callers were on the VPN. I'll have to try this
again without the VPN.

We are going to try hold a bigger meeting test things out. Video is the
one thing we think we can live without being perfect :-) Audio is critical
and it works.

-- 
Cheers,
Carlos.

