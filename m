Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903D915443A
	for <cti-tac@lists.linuxfoundation.org>; Wed,  3 Apr 2024 18:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712170518; cv=none; b=TFAUriNu38XWDdhyOcAizXcSJSqOWjACmGOpISSp0QnrZLSn2qwiFSWpoyDoZLSFkIHWOj/dXih1x+o0o27kaYj4xK/dGQtC3xNzt28uVX2EMcaL5gkqnUvORoYXJaRY5bkTomcdsY5z1YX2HreKJbvqvYKb0TBAZTnk0DvHHRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712170518; c=relaxed/simple;
	bh=HF13a4n+Z3WCHQPBI+pvX8gteqWrlYJMeQtcXCKpJuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KttJhJcna+B4s+4/bodUHAMez85SuwGDsT36ly21WbsiBMHzHTNOv8fIqLCbaxTXd25Q7Iuya16MDsxpUKQ96M3nBe05qaTyCt6sBuRXd/Rpp2jH1ME8vi2DVc8rSLzQSFtLSZCVTThIp4qWuDLbtsQ4ME+Fvu4vsgY6Vxgop9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fG9gVWL5; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fG9gVWL5"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C5F1417B0
	for <cti-tac@lists.linuxfoundation.org>; Wed,  3 Apr 2024 18:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-vxIa_x4N9q for <cti-tac@lists.linuxfoundation.org>;
 Wed,  3 Apr 2024 18:55:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 642D6417AB
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 642D6417AB
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fG9gVWL5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 642D6417AB
	for <cti-tac@lists.linuxfoundation.org>; Wed,  3 Apr 2024 18:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712170513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Qi1QLsLS21dIjJlfYhbFTXLxwgsXMZsL0WSDAJMrSKM=;
	b=fG9gVWL5YuEvAVS8ve0fO104YK6HLc6ybgQ4y+rWG6NMXqlglJ9G/aaEb8IrVlxOtKQByK
	edeeojE1QggrCt0ylTjOIe00zMLT1Zv9+1r47NzqQzR4ZMsxGoffx3B+Z2gCpmt7y8kvTP
	eVZyKgjB51M0VnBwEa1T1+ScpH+5IXg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-QzvfwlRvNnqNL4iv7GgWfw-1; Wed, 03 Apr 2024 14:55:12 -0400
X-MC-Unique: QzvfwlRvNnqNL4iv7GgWfw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6992c8f3c45so1248066d6.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 03 Apr 2024 11:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712170512; x=1712775312;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qi1QLsLS21dIjJlfYhbFTXLxwgsXMZsL0WSDAJMrSKM=;
        b=uF1mrrR177cU7Yn2hVlcVMpmavUWVC656NYqXRN6CopkW34wMXr0y9IFaZw3wqf+78
         w2opD/OQon0EOCxbf58y9IANhlVAWu9uMud+S0Y+BbSsYP8CtZ2wnO+PntwrcXn4HiAW
         7S+NaqRAMRHI5cwQGf9Pm0vpJnXnR54pkgdCDqwOv6qzT3Ak+u++mtQfBJ6N1zdlAWPA
         zVdZBJ/pEJJ0VJY7f08bqtQ3tr86juKfbGKU+QakQbKcvh0XacULdA/Xo2SKGBfgNxQw
         xC/bF6wBGHbJ6bbWQ5A4KwUgIIY+/at1llr/Y8zbMCV/xbyCu5xkqAwljcZunFOa2Jhn
         fvDg==
X-Gm-Message-State: AOJu0YzfDkCWiUwQGGy6fFU5Bg+YCh8qx0DOAw8AlYvuWTAAJFccf8x2
	vSE4YwfOjZjcA5hDDijeTGFJzq5O76YpekwY+GtLm5XE9P4xIrS6zqp5XTbDP2SsHkKn7iCa59I
	Po1vd4XSGOvp2nfaBbmJVM2/VrrtwMLqlGkwusRcXWIzixQkeMszrq9M4Y4j7UuiQ+fTOKqynuB
	KA
X-Received: by 2002:a05:6214:202e:b0:699:2cc3:9b55 with SMTP id 14-20020a056214202e00b006992cc39b55mr227739qvf.51.1712170511846;
        Wed, 03 Apr 2024 11:55:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF09tZsab7+x3A4hLwx5sF9gHhLyQHpi7VZHgxBKz//eM6CwKXNCoQd12L/uwqya4hge3pwJw==
X-Received: by 2002:a05:6214:202e:b0:699:2cc3:9b55 with SMTP id 14-20020a056214202e00b006992cc39b55mr227723qvf.51.1712170511497;
        Wed, 03 Apr 2024 11:55:11 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id q15-20020ad45caf000000b00698facb19d5sm4599199qvh.106.2024.04.03.11.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 11:55:10 -0700 (PDT)
Message-ID: <380b365e-8d5f-4150-affd-32b12c895e59@redhat.com>
Date: Wed, 3 Apr 2024 14:55:09 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: My suggestions on auditing that services are running free
 software
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Ian Kelling <iank@fsf.org>
Cc: cti-tac@lists.linuxfoundation.org
References: <87zfuqcvlo.fsf@fsf.org>
 <20240322-bipedal-nostalgic-adder-fec630@lemur>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
In-Reply-To: <20240322-bipedal-nostalgic-adder-fec630@lemur>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/22/24 11:57, Konstantin Ryabitsev wrote:
> On Fri, Mar 22, 2024 at 04:35:13AM -0400, Ian Kelling wrote:
>> I suggest that CTI come up with a proposal/plan for how to implement the
>> audit. Eg, checking what software is being run and that users are able
>> to download a copy and that it is free software. The FSF will be
>> available to review the proposal.
> 
> Before we go down that route, please note that LF IT does not provide backend
> access to third parties, so any audit plans will be limited to auditing
> documentation.

I agree, and I would not want any service provider to give backend access to third parties
because it creates an increased security risk to support the audit. The cost of compliance
is relevant here if it creates a security risk. We can achieve compliance without the
additional risk.

For me as a CTI TAC member is reasonable to have a documented list of the versions of the
software that was being run, audit the list, and update the list with versions on the
CTI website.

> We, of course, comply with licensing terms, so any AGPL-licensed software
> (such as public-inbox) is available for download (we run the upstream version
> without any modifications). Any free software without such requirement may
> have basic version info, not necessarily down to the exact patch level. For
> example, I doubt anyone benefits from knowing the exact version of Postfix
> used to send this mailing list message.

The purpose of the audit is to ensure that we meet the ethical repository hosting criteria
and we can meet those obligations by ensuring we run unpacked distro versions or unpatched
upstream versions of the software. Where we deviate from upstream or distro versions we should
do so only briefly to address security issues. Knowing the exact version of Postfix is *less*
important to me than knowing that we are running without any local patches applied and using
the standard distro version or standard upstream release. So it would be a checkbox item for
me to ask "Are we using the distro version? Are we using upstream directly?"

Does that make sense?

-- 
Cheers,
Carlos.

