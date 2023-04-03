Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90D4A925
	for <gti-tac@lists.linuxfoundation.org>; Mon,  3 Apr 2023 20:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41930409F0
	for <gti-tac@lists.linuxfoundation.org>; Mon,  3 Apr 2023 20:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41930409F0
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nj7MMsHI
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
	with ESMTP id R6FBtP1Qb2FH for <gti-tac@lists.linuxfoundation.org>;
	Mon,  3 Apr 2023 20:12:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18C984091F
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 18C984091F
	for <gti-tac@lists.linuxfoundation.org>; Mon,  3 Apr 2023 20:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680552720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pRGH4YPCf6uPYf9OI6u48TX1rNjKqpghHCKfDkERF4o=;
	b=Nj7MMsHIbA9O2J0fYbjLGxx6wsVoRFB8wbxhoorkEczRFTFXf8tOEv7Aqixt1du5KPmXlw
	mrxZzBkiGVdSeLB28CiDWFrXqkwgvSdIElsuMPojoPllZdBl0+xsLSzJ0ftYQwKgjhA9/U
	JJah7UXgcTdGwI37Oxl2HR+X0siGbcg=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-7y6YC85wMhGAtQ_UpDGXbw-1; Mon, 03 Apr 2023 16:11:59 -0400
X-MC-Unique: 7y6YC85wMhGAtQ_UpDGXbw-1
Received: by mail-yb1-f197.google.com with SMTP id x15-20020a25accf000000b00b3b4535c48dso29695296ybd.7
        for <gti-tac@lists.linuxfoundation.org>; Mon, 03 Apr 2023 13:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680552718;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pRGH4YPCf6uPYf9OI6u48TX1rNjKqpghHCKfDkERF4o=;
        b=KlVYAo0BpRl86a1aQu5T5Zzx7XME0BwiuptMV/YtbbBCODDDAC0aZS5nKwFpaYK1vr
         Yv7HcoTYhMLlU25TUsGpZPJcLBHZHyIr1jmdtsjlj77YB46CJ5Pdz6trZjB3r8puWuYM
         EkIIsknXW/qkL7JZiGtZMstu0JdMIxhBXWUpkHlGnlhzZYaXocuuN7y1aqs6p893/QQH
         OBAiIAYbhUUnj0JkLPUia9dsSDk8vgfyswYAVUZhY6+Wy1YB0cchcHqLME5bv1UNZec1
         5ZP4XSJvhlI9QYaIJIsYyBg1jlA4Bvx0P3q914DQ8zEvvD3jcC0TL1FGxyMNfFXzbIIU
         EjpA==
X-Gm-Message-State: AAQBX9cm6oHJFx4DDf1g0BwKID0o7DVQz1gQj9Ou6aiY4SynUqtucDNI
	0jgu48+jLVNcm2GqMLETs8LyNmQ7EhklMHeGPDSKigvLXsoI9WH+nAKIZiyRaM82M+4YM/RP2ce
	qNoFw28M6HryU4rRFvDmeWIue3VuH9MghY8jPZz3m3HSnkfu3V4CUNHal6PBKa4yFQSZuRJgvhK
	vMnsBvnW5bc8bz
X-Received: by 2002:a81:1954:0:b0:546:2a87:ce9c with SMTP id 81-20020a811954000000b005462a87ce9cmr16931075ywz.12.1680552718333;
        Mon, 03 Apr 2023 13:11:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350aNcecAyNLJhkUot2YxlHS/e7ybXsu2gW8Eunrn4En4gcfm0FPzKS9HspMshUXJWxNQaBwxzg==
X-Received: by 2002:a81:1954:0:b0:546:2a87:ce9c with SMTP id 81-20020a811954000000b005462a87ce9cmr16931060ywz.12.1680552718019;
        Mon, 03 Apr 2023 13:11:58 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id l133-20020a81258b000000b00545a08184e5sm2766940ywl.117.2023.04.03.13.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 13:11:57 -0700 (PDT)
Message-ID: <55958c9d-7395-3d45-b3e0-5290936fca7e@redhat.com>
Date: Mon, 3 Apr 2023 16:11:56 -0400
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Size of bread box analysis for gcc, binutils, gdb and glibc total
 migration.
From: Carlos O'Donell <carlos@redhat.com>
To: gti-tac@lists.linuxfoundation.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Khahil White <kwhite@linuxfoundation.org>
References: <74d44891-f436-f949-0efa-bca9b1351ecf@redhat.com>
Organization: Red Hat
In-Reply-To: <74d44891-f436-f949-0efa-bca9b1351ecf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/3/23 14:04, Carlos O'Donell wrote:
> Konstantin,
> 
> I would like to also update the current "size of the IT bread box" analysis
> for gcc, binutils, gdb and glibc as a total cost for CY23. This will help
> the OpenSSF plan for backstopping the cost.
> 
> GCC service enumeration:
> https://lore.kernel.org/gti-tac/7e59d8db-7b26-1249-ad5c-67b7f3411e1@codesourcery.com/T/#u
> 
> GLIBC service enumeration:
> https://lore.kernel.org/gti-tac/13b3266b-a410-77fd-5dfc-4e4994b630cd@redhat.com/T/#u
> 
> BINUTILS service enumeration:
> https://lore.kernel.org/gti-tac/679ba29a-24c7-6684-a565-0e5d5db05b19@redhat.com/
> 
> GDB service enumeration:
> https://lore.kernel.org/gti-tac/b755774c-3912-2dac-957c-91f659c95119@efficios.com/
> 
> Please send such an updated "size of the bread box" to Brian Behlendorf
> at the OpenSSF and Khahil White (on TO:).

My apologies Konstantin, this email was way more curt than I intended to write.

Let me restart this by saying "May you please also have a look at the following for us..." :-)

I appreciate LF IT's help in all of these evaluations, and I know it takes quite
a bit of time to review the details and the exact requirements.

-- 
Cheers,
Carlos.

