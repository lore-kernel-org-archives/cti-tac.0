Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5917B5685
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 17:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 020744148F
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 17:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 020744148F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GlG9qxJv
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
	with ESMTP id qh28xN668V0I for <gti-tac@lists.linuxfoundation.org>;
	Tue,  7 Feb 2023 17:34:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20A24409FE
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 20A24409FE
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 17:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675791262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OXGPvRziiO/kA2l01FSmUtD54IlSLdwKLj/ICdC3U/4=;
	b=GlG9qxJvYLWOk/jHtrNhB0OjQU79G8IH9yG9o+DAO47T0fQ8zYJm3QaoOo4bE0L2WRqj7N
	fh5H1mOmUMOL33OyvH9ufiydXe0u/W/XA8VWlpB7r1rsSjV77Vj1eiN7hZUBDNCOiFhH3+
	KdbQjZhdJRYnOirHQh1JhMT1/hrX9OY=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-385-jhCachjuPrGkAuilBTyMZA-1; Tue, 07 Feb 2023 12:34:20 -0500
X-MC-Unique: jhCachjuPrGkAuilBTyMZA-1
Received: by mail-il1-f200.google.com with SMTP id i23-20020a056e021d1700b003111192e89aso11078609ila.10
        for <gti-tac@lists.linuxfoundation.org>; Tue, 07 Feb 2023 09:34:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXGPvRziiO/kA2l01FSmUtD54IlSLdwKLj/ICdC3U/4=;
        b=xTpUB+0e5nPqds2qtqVPCgKoZ3jKJM6quDnWDr4I1BKTx+JbSF/MtIkAsui99f1WJg
         kFLOoXX9qmiMR7zhdocMIerb/ATVJHwEfaNih458HoQ78IGY+uHga0pYZy/UqNuRzNPI
         EhvG+5ZIN8BsSgOViToo1MkZKdNJuoHJXv8ofOBA3DCFh22GaGwiNnkJrOeRekGjphwI
         AF4mzZ6bWKJGlY7D6JuuH7o4N7ciqlyq+gyFML2I9rWJzY7yU3LLQYuB4Xz7CmKRUHm/
         pvG0fKBX3wW3cxbOhsbdrc/qiwsTsI5rtq7cosBAnJKIS8Wi8WanJ2IsCNTXMjHr6yjY
         jXrA==
X-Gm-Message-State: AO0yUKX8p+X/i144j8Siiv3L4XPsM4+gx1aIGCCejhastZQjXmgB8lyM
	69bj7pIXnFsMGdwSMA0Vzt3f0Qm+KzDnf5KSoP/Wmpzyq8p19zWM589sN6ufPaJrPZlbawA/At1
	IWPe2etEyfA7DXgrZJFWhQaOvu6EWFbooFF5j
X-Received: by 2002:a92:1a10:0:b0:310:cbfc:1160 with SMTP id a16-20020a921a10000000b00310cbfc1160mr3866136ila.19.1675791259519;
        Tue, 07 Feb 2023 09:34:19 -0800 (PST)
X-Google-Smtp-Source: AK7set8azS0PC4ZoNMkIXB7mOHGBakk03BCHGLICVhyF2NvCz0ewCGYWOIfjViorUids4ZAlHBD6tg==
X-Received: by 2002:a92:1a10:0:b0:310:cbfc:1160 with SMTP id a16-20020a921a10000000b00310cbfc1160mr3866126ila.19.1675791259296;
        Tue, 07 Feb 2023 09:34:19 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id e17-20020a926911000000b0030bb7c67efcsm4348465ilc.16.2023.02.07.09.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 09:34:18 -0800 (PST)
Message-ID: <1344a6ae-15a4-f2c3-1abb-ced0caed9e59@redhat.com>
Date: Tue, 7 Feb 2023 12:34:17 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Planning the next GTI TAC meeting for February 2023?
To: Joseph Myers <joseph@codesourcery.com>
Cc: gti-tac@lists.linuxfoundation.org
References: <e7563276-8d8a-7cb2-0da5-f838969d9c2d@redhat.com>
 <bd4ea1b-3a78-f04b-3c82-7eb5829962b@codesourcery.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <bd4ea1b-3a78-f04b-3c82-7eb5829962b@codesourcery.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/6/23 17:35, Joseph Myers wrote:
> On Mon, 6 Feb 2023, Carlos O'Donell wrote:
> 
>> With the binutils and glibc releases out of the way for January,
>> I would like to schedule the next GTI TAC meeting and possibly
>> setup a recurring monthly meeting to discuss progress.
>>
>> Suggestions for dates:
>> Wednesday February 15th 11am EST / 4pm UTC
>> Thursday February 16th 11am EST / 4pm UTC
>> Friday February 17th 11am EST / 4pm UTC
> 
> Unless next week's WG14 meeting processes comments much faster than 
> January's, I won't be able to do any of those.
 
Is the week after that week a better week?

That will give me more time to put together summary documents for the service enumeration.

-- 
Cheers,
Carlos.

