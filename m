Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9712E15AC
	for <gti-tac@lists.linuxfoundation.org>; Mon,  7 Nov 2022 02:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F7EA40554
	for <gti-tac@lists.linuxfoundation.org>; Mon,  7 Nov 2022 02:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F7EA40554
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=if5tZcch
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
	with ESMTP id 5YAcVFBEnbHk for <gti-tac@lists.linuxfoundation.org>;
	Mon,  7 Nov 2022 02:12:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE0A04054E
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BE0A04054E
	for <gti-tac@lists.linuxfoundation.org>; Mon,  7 Nov 2022 02:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667787125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G0Z6HULENe4ldDrGDMWETAruaI0+v6w+sUSMquJOnrs=;
	b=if5tZcchT7Bj4J8U+ekI8e5yjXTY7JOw+kxIVTQz7j/Ktzs2IhH47b1oD5RluQ9a1DVDWz
	qrZdiR7PAW2l7lR8uoCtEVA0jHBnHoKxBMLusR2Z6b+456bV/FLMDx4CZKhM8UuXgoiYuG
	H2tm8pRE+xWkDn3yv5WD0vTO3cGqi5I=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-115-DBbLF4HcMPKR8r2BibEubQ-1; Sun, 06 Nov 2022 21:12:04 -0500
X-MC-Unique: DBbLF4HcMPKR8r2BibEubQ-1
Received: by mail-il1-f200.google.com with SMTP id a15-20020a056e0208af00b00300806a52b6so7844122ilt.22
        for <gti-tac@lists.linuxfoundation.org>; Sun, 06 Nov 2022 18:12:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G0Z6HULENe4ldDrGDMWETAruaI0+v6w+sUSMquJOnrs=;
        b=y8dWptqkYSErfbELnrjeowfzgwn1a5hYnWodsR/mk1KIohItRLwCP9UozvQDFdVTlf
         WhEtLX1zT94QyCh6zZ1m34sfgsIh2iOU2T+k+8zJ02N0fwnnr/ooJS4+0xjWjloJSiOK
         gwChEsti0sxXsz+haQLGONskeips9CHo5Q3JD/gvjxcnwV1uGcUVVxWA034CC+tc3tfZ
         8jj3YbB6hwHr6nIoMYkqCjiAPn6MlVdmLhijlDrSo6MfI2G5JKvO0EXBbpZl1zuDS2wD
         CITCA4j05ewsPhsam+CcIQC2i54HZWuX0yE1ktVbk7bJGrwIShHjoIeW0iqFpb7riogO
         6w0w==
X-Gm-Message-State: ACrzQf33seTLxEKMnvJaCgElUIaKUPzCA8UNuiPAsba2r/umqOmDklt6
	yz0Ee8FP9TYHIsFVbgTrrPE1XHIeWraVJOVLU2WzoVvm7PiNBv9D+e0MEyKrs2D/k2mX2F3n4V5
	pZB8pAkriNq8n9sIoP2HB7HY2OR+OGzWsfgHvB7gzEfcSgHx0S+zLI61TsYeSAvCf3Qkr64a9z3
	UUFcgP
X-Received: by 2002:a02:1d41:0:b0:371:2c88:1d3e with SMTP id 62-20020a021d41000000b003712c881d3emr27580474jaj.265.1667787123225;
        Sun, 06 Nov 2022 18:12:03 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5HWTQTgoNy4WDqlDyLZynhJAwU+1y8PLqvEsoeOv3UhXdJ4DiJ6sgnkR8D9fYKDLZZxvqjpw==
X-Received: by 2002:a02:1d41:0:b0:371:2c88:1d3e with SMTP id 62-20020a021d41000000b003712c881d3emr27580460jaj.265.1667787122879;
        Sun, 06 Nov 2022 18:12:02 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id g5-20020a05663810e500b00374d6db7566sm2205360jae.117.2022.11.06.18.12.02
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 18:12:02 -0800 (PST)
Message-ID: <3f211d68-f6db-f3aa-5a8d-3ef698088310@redhat.com>
Date: Sun, 6 Nov 2022 21:12:01 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Planning the next GTI TAC meeting.
From: Carlos O'Donell <carlos@redhat.com>
To: gti-tac@lists.linuxfoundation.org
References: <b246cbec-4c4e-940f-2b47-5e2f9f721adc@redhat.com>
Organization: Red Hat
In-Reply-To: <b246cbec-4c4e-940f-2b47-5e2f9f721adc@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/1/22 17:41, Carlos O'Donell wrote:
> TAC,
> 
> We're trying to get a BBB instance setup so the next meeting of the
> GTI TAC is using entirely FOSS. So this meeting may need to move out
> as we discuss the use of conferencing technology and how to attend
> and record the meeting.
> 
> Please look at your calendar and get back to me about the following dates:
> 
>  * Tuesday November 8th at 11am EST5EDT
> 
>  * Wednesday November 9th at 10am EST5EDT
> 
>  * Friday November 11th at 9am EST5EDT

A quick tally:

Josephy Myers - Any day.
Joel Broebecker - Sends his regrets for next week.
Simon Marchi - Preference to Wednesday and Friday.
Nick Clifton - Preference to Wednesday.
Siddhesh Poyarekar - Preference to Wednesday.
Carlos O'Donell - Any day.
David Edelsohn - Any day (last time I checked).

It looks like 6 members can make Wednesday November 9th at 10am EST5EDT.

I suggest we hold the meeting to meet in person and discuss next steps.

For now best option for the meeting is 8x8 Meet (Jitsi) which is FOSS.

I'm going to test this out on Monday:
https://8x8.vc/gti-infrastructure/gti-tac

I'll ping some of you on IRC to test out the meeting.

> The agenda for the GTI TAC meeting would be to discuss the next steps
> for the current proposal: the GNU Toolchain moving to managed
> infrastructure at the LF IT. We could additionally discuss some of
> the mechanics of the TAC, like where we'll put our documents, notes
> and recordings (I have some ideas on that).
> 
> Thank you!
> 

-- 
Cheers,
Carlos.

