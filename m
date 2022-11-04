Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049C9803
	for <gti-tac@lists.linuxfoundation.org>; Fri,  4 Nov 2022 21:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90EA341554
	for <gti-tac@lists.linuxfoundation.org>; Fri,  4 Nov 2022 21:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90EA341554
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aMB77sXH
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
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xd4e-Rd7k3-b for <gti-tac@lists.linuxfoundation.org>;
	Fri,  4 Nov 2022 21:00:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45B45409B2
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 45B45409B2
	for <gti-tac@lists.linuxfoundation.org>; Fri,  4 Nov 2022 21:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667595606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/A+48rvyq8c3r1NXNzVIlwrwMW8iZraa7AVjvJAd3Gs=;
	b=aMB77sXHzpsaENmT6yRhUKLjRaPvkbusIEGOkdGTPBwAxTchGwwmdlFgutpzmAab78s/1Z
	1qUS6Dt8uO0fOSGUoIkueRNR6TZydCYEi82gL/WhYQ6OYOy7Sg5uq4gDvVZDNKLoOcQyvt
	zkdQ2zV7B52wU3TXCeA9pLpdi1vNx0s=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-lUgjjC2FN_Sj1tpbCg40tw-1; Fri, 04 Nov 2022 17:00:04 -0400
X-MC-Unique: lUgjjC2FN_Sj1tpbCg40tw-1
Received: by mail-io1-f71.google.com with SMTP id y5-20020a056602120500b006cf628c14ddso3759404iot.15
        for <gti-tac@lists.linuxfoundation.org>; Fri, 04 Nov 2022 14:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/A+48rvyq8c3r1NXNzVIlwrwMW8iZraa7AVjvJAd3Gs=;
        b=R4o9fjycgEL+0R8cMnVLy9uFo8Eb/Q6ndDvWRtez9XOH3cnbjuqOL8KUxKZdDzAfq9
         CG81pZpE4n6lbNX1FL8E6l1n+Esh2Apgz2lVBOwej6O8uFmqBnUVIcRUb/sVnGTy5Slr
         vuU4Y39akedY/zMYAHv1KijWBM30SLLhEv5+1E7VZexf3GbA3MWoculPoZX4FXXz3c5v
         7ugrgRU4tufGHINAgDIx0XJt6XWu7XvtkfaESfR/sbk4ijTSEszLrsI2M2/xjGRGh5oi
         ZEyEzkWUVDT5g35KLaBLcfDEZkmwTG1Ys2j113SXrqlj/oMgVH/LpjgUiQFgR+m3L+ZF
         ee0g==
X-Gm-Message-State: ACrzQf0jsHUgqv81xW54a91HGoD8ScKhbbReCIg9VU2oGs/ObIwewWa/
	pL/NrqRtgP6pSb69jf5zZlS4Trk6xALvxqjNVv1Qb7yJ4+96zvyEOs4U1uILIgeTZz7xgNQYTo1
	/CkoW7pRWkQ1Z/ythc5QY1RhkdQ37Iws=
X-Received: by 2002:a92:6912:0:b0:300:c48d:19cd with SMTP id e18-20020a926912000000b00300c48d19cdmr12462678ilc.216.1667595603439;
        Fri, 04 Nov 2022 14:00:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4fqYYaITeU0kuk/V5kgQrzEqbQqbI0fsUKrWVKaqekRHU9UArfeRx2t8ICbYOoChRd+6TcSQ==
X-Received: by 2002:a92:6912:0:b0:300:c48d:19cd with SMTP id e18-20020a926912000000b00300c48d19cdmr12462669ilc.216.1667595603233;
        Fri, 04 Nov 2022 14:00:03 -0700 (PDT)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id z26-20020a05663822ba00b003640f27d82esm23992jas.21.2022.11.04.14.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 14:00:02 -0700 (PDT)
Message-ID: <323a1bed-1be3-3640-d4af-1c3e219311ab@redhat.com>
Date: Fri, 4 Nov 2022 17:00:01 -0400
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Technology for hosting the next GTI TAC meeting
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: gti-tac@lists.linuxfoundation.org
References: <25877c78-d2bb-9107-01ed-c0b7a852dbea@redhat.com>
 <20221101215541.mjxazlondthy2awq@meerkat.local>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20221101215541.mjxazlondthy2awq@meerkat.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/1/22 17:55, Konstantin Ryabitsev wrote:
> On Tue, Nov 01, 2022 at 05:27:55PM -0400, Carlos O'Donell wrote:
>> Konstantin,
>>
>> What options does the LF have for FOSS meeting hosting?
>>
>> Are there any BBB instances currently running that we could use?
> 
> There aren't, simply because nobody's asked. :)
> I'll investigate what we can do on a short notice.

Thank you!

>> There does seem to be a SaaS instance of BBB via Think Modular:
>> https://think-modular.com/en/bbb-simultaneous
> 
> Thank you for the suggestion, I'll look into it.

Think Modular looked like the most viable of the options.

BBB does have 6 vendors they list here:
https://bigbluebutton.org/commercial-support/

-- 
Cheers,
Carlos.

