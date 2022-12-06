Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C045664
	for <gti-tac@lists.linuxfoundation.org>; Tue,  6 Dec 2022 19:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 677D980A06
	for <gti-tac@lists.linuxfoundation.org>; Tue,  6 Dec 2022 19:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 677D980A06
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MUAXHSVJ
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
	with ESMTP id IexQY3ZgSttc for <gti-tac@lists.linuxfoundation.org>;
	Tue,  6 Dec 2022 19:44:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5986781E6A
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5986781E6A
	for <gti-tac@lists.linuxfoundation.org>; Tue,  6 Dec 2022 19:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670355851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RjckPxp0d7prdit5O9T/zCKMsIE1vlwcWrr7AbMnQAE=;
	b=MUAXHSVJQZ68ojPqImIWZKLITpMK13RMLPMT3lMjt3Wum5T033jd3FjjY45LqM6xvI4zHf
	kYdzmKcHZ3vhixqe8tiT3M1n9y7cIRh1kMSHCBU+eJO/kqRmmckJIvtlUqsr944q0vZ0DF
	t5rRQQDyLuq3rw9xryk6ihTrKUzv/II=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-eSkFc3BoMAGZxlIzPn62Jg-1; Tue, 06 Dec 2022 14:44:09 -0500
X-MC-Unique: eSkFc3BoMAGZxlIzPn62Jg-1
Received: by mail-il1-f200.google.com with SMTP id d6-20020a056e02214600b00303620c6e39so5065358ilv.6
        for <gti-tac@lists.linuxfoundation.org>; Tue, 06 Dec 2022 11:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjckPxp0d7prdit5O9T/zCKMsIE1vlwcWrr7AbMnQAE=;
        b=UBM6nmT2Urbr2F8U4Pp3VLqx11KctB77kknfW4tfPYYGAyVCrGGvvsghXRFhxA+Cv5
         EcISxbMWmdasqKGm55Zi+gskYQ38kdtqen/mrqEhk8ILAt1A7dwu891O8wsTUKrOgROR
         blruVSlaqk5JwGhGp5YFjD9CXmy4Nh87X9zmjzMnZTrz2wu6grDSejvXmbsxnAg/ud9p
         bDEJ1erJNeqzubKyDdNGnhdJB3AIJu0eShfhRROE86cruBMblgsD4I9mG1HstcH8Vwg/
         IqAr1LXNr/Q+uLEIzMyeBSieB+r/Ac0XgfSRGD2RqtOXVL6+xh0SY0dymesaq9G25CKv
         xgCg==
X-Gm-Message-State: ANoB5pkvi8gBt4ZYng+GLKrxsJY5ADhPexwVUb2BN6R4l75Zt4GJ10Ja
	a7tDwWoymjMk+CV1D4r2y6P2EYzAiuVro0ZlrAsGXc1Ot4HdhqFjpQqtNE6ElHPO1hamjxMXOWr
	L4EZSXRMSLAov3z456AyjiNeADn0t/hI=
X-Received: by 2002:a05:6638:3e87:b0:363:798f:a924 with SMTP id ch7-20020a0566383e8700b00363798fa924mr41037084jab.172.1670355849128;
        Tue, 06 Dec 2022 11:44:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7jCZm3vjbjvWvUcyE/a3Z/vd4XtxgnaJjc4C5gmkwY7T/0urWk03XehE9KVxPDTEDicJ2rqQ==
X-Received: by 2002:a05:6638:3e87:b0:363:798f:a924 with SMTP id ch7-20020a0566383e8700b00363798fa924mr41037076jab.172.1670355848886;
        Tue, 06 Dec 2022 11:44:08 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id t16-20020a92cc50000000b002faf6559e90sm6422327ilq.51.2022.12.06.11.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 11:44:08 -0800 (PST)
Message-ID: <b965b7a1-e59e-a6cd-593b-f6fde7ec8c8a@redhat.com>
Date: Tue, 6 Dec 2022 14:44:07 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: First draft analysis of services used by glibc.
To: Joseph Myers <joseph@codesourcery.com>
Cc: gti-tac@lists.linuxfoundation.org
References: <804cee43-a120-3acf-a302-b1640f2285a9@redhat.com>
 <15f1637b-38c0-5ba9-8a71-8a6349b5b0c@codesourcery.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <15f1637b-38c0-5ba9-8a71-8a6349b5b0c@codesourcery.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/6/22 14:13, Joseph Myers wrote:
> On Fri, 2 Dec 2022, Carlos O'Donell wrote:
> 
>>   * Pipermail archives:
>>     * https://sourceware.org/pipermail/*
>>     * e.g. https://sourceware.org/pipermail/libc-alpha/
>>   * public-inbox archives:
>>     * https://inbox.sourceware.org/*
>>     * e.g. https://inbox.sourceware.org/libc-alpha/
>>     * Not all inboxes work correctly e.g. glibc-bugs-regex doesn't work.
> 
> Also the older MHonArc archives (/legacy-ml/) - no longer updated, but the 
> /legacy-ml/ URLs and /ml/ redirects to them need to keep working.
> 
> E.g. https://sourceware.org/legacy-ml/libc-alpha/2020-01/

Oh! Good point. Yes.

One would hope that with public-inbox we might be able to get a unified
new URL scheme that includes all the old list archive data merged into
the new archive data and all of it searchable.

-- 
Cheers,
Carlos.

