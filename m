Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8413B7AA
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Nov 2023 17:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YdZJf5wB"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1921E8227E
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Nov 2023 17:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1921E8227E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YdZJf5wB
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uq7N9nEZ2ALb for <cti-tac@lists.linuxfoundation.org>;
	Wed, 29 Nov 2023 17:18:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0C92982277
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Nov 2023 17:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C92982277
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701278317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmGmKBCGbA5p2v9oINoLvIIPdUM9qQUdhvj9sMUfCyE=;
	b=YdZJf5wB3cD7FHej9HlbMawITdAOIu+Y17uD7vTpICGdIV+QBcaui+81cFCHO3gjWSxBKX
	OYIyV/4WQVYnyHsJNXcyaQ6KnfqM7kLCdlQzcOZkr1seQMRfczuwf95l+NE8impPkWlNiU
	kzd2P3EHp/oa2FbghszCjbu9PdWv6Lk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-FVsxWWwQMoiI75594DC09w-1; Wed, 29 Nov 2023 12:18:36 -0500
X-MC-Unique: FVsxWWwQMoiI75594DC09w-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-67a0d2eae4fso74720856d6.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Nov 2023 09:18:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701278315; x=1701883115;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmGmKBCGbA5p2v9oINoLvIIPdUM9qQUdhvj9sMUfCyE=;
        b=Dqgm6ZeF+r3ynfLplkcuCwXQYF0LJJEG/7WbqUv0Hz8VQ1O10ACnNMLDyUX2hLUlXl
         D7IljiQNJMCbbPAUHP/ksV2h6hKOx1cCV153JwW0qYL5rQ5BDX4+ath8bBUwyuk8FaVA
         otf2N4QCTpH7B9fkAKQlLanMgQS7EVLNo3i9rjVfqC6RJX82bR9RqzWtTrjNxgI0eVaN
         n2CGx6mvy9f0/EQS67q5nNdW7ukynRM6CPPdf8ss/V4HlRd8Sed0p5d8oEmdgZNWfyl0
         qurshc/INZUGAUbASFUble85a4uKuAbEPBpfqcMG8mR+uLsDNPIkCUHqyAg81GgxmPE8
         TA5g==
X-Gm-Message-State: AOJu0YzBuEvIAxy7jArGZDU3XTHL5Sl4H3hMIkhSIOmPeJyTOnNfEi3j
	WJ0nAd94mlTv/Dcq7JUY8hbYADv5j6jhLOVEZpCKf4SsibH+SbxMdyxCq7ujziEDD9Bs6kwp5LL
	v1RNT8urzXfkRp54UuJpjdsjMQcgJHznY8QSl6U7GC/uQvzR/0Zjl+T0vsSZvFbAv3e2p72PzaF
	2bom54+XZuG6olgI0=
X-Received: by 2002:ad4:5be2:0:b0:67a:2424:ff1d with SMTP id k2-20020ad45be2000000b0067a2424ff1dmr20232429qvc.5.1701278315222;
        Wed, 29 Nov 2023 09:18:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbK2+XTZUbFfmgSG9Xi5BQS/ncq6ItYfhaVPzyzl1NnUW07W0OkOEXoOTo3mgOHRloHKk3AQ==
X-Received: by 2002:ad4:5be2:0:b0:67a:2424:ff1d with SMTP id k2-20020ad45be2000000b0067a2424ff1dmr20232405qvc.5.1701278314902;
        Wed, 29 Nov 2023 09:18:34 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id b7-20020ad45187000000b0067a276fd8d5sm4554010qvp.54.2023.11.29.09.18.34
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 09:18:34 -0800 (PST)
Message-ID: <8817f362-43c0-ecc8-1b9d-81b775af6c33@redhat.com>
Date: Wed, 29 Nov 2023 12:18:33 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: CTI TAC Meeting Notes 2023-11-29
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
References: <367fd081-0ee0-556b-3104-d4afd4744f07@redhat.com>
Organization: Red Hat
In-Reply-To: <367fd081-0ee0-556b-3104-d4afd4744f07@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/29/23 11:56, Carlos O'Donell wrote:
>  * AI: Carlos to reach out to overseers to clarify if they have registered any typo-squatted domains.

I filed this infrastructure bug to check with the rest of overseers:
https://sourceware.org/bugzilla/show_bug.cgi?id=31098

-- 
Cheers,
Carlos.

