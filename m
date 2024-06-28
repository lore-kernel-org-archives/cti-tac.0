Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BB73FB88
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 18:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719600661; cv=none; b=IYBP/u72Z9ro5HuarqKaYtvuRaszdCxQge33fTBXAJs28l+esuA4znXcaqLqYC1bDrZdZKxhk7bpg6YVcoGzeJ+q6uV1pI36oruFWV15PSdxeIwMLDeYj8vF6njJQNVloByXv5fffmqWjLwFzCMfF9FUT3lAwxOpQ1Ldn1K3nU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719600661; c=relaxed/simple;
	bh=phWYrYZuIT9lUUrD2lKUBKpJElQAChpkFCGvB4cLoMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uRxhpGwgCeYkQ/Iq8Q7wrWMz5O1VmQxqz8mep+R8obU/YpCYmoaRXi4KSy7hq6aJxTHZ7tD4Tb7AGF2LJ4Ge675mC8q1YDAsovbqjwCGKd2BHpfFRgOkgwTamfAZhWDX0AM9O4GUAJBSSNPGjVGigWkjZI+cXNS8FePG4xDZdio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JpiARzwo; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JpiARzwo"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F68A403AE
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 18:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6d9qFUGIxVNG for <cti-tac@lists.linuxfoundation.org>;
 Fri, 28 Jun 2024 18:50:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49518400FE
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49518400FE
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JpiARzwo
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 49518400FE
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 18:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719600658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=s81/LlKZy731PckRq2InpNomIy+pQWxkBVwht6R72Ws=;
	b=JpiARzwouO33mjccjgQwPwxztrFYtwdhrw7jFkBQm8FXaCh1OC4FVVqUn0ST9qMlGTe7LF
	s/mHhleF3gZeZckq+UytilYP70gL7b98RolAt0gQ/EJqb+84R1/sX0L4CETVh5hShrkXiN
	RGychq4BMyyA01qAjPAypsCJSG6yGhc=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-c_q6GVukMHuYxrczqvJRkQ-1; Fri, 28 Jun 2024 14:50:56 -0400
X-MC-Unique: c_q6GVukMHuYxrczqvJRkQ-1
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-4ef016e6678so328663e0c.3
        for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 11:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719600656; x=1720205456;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s81/LlKZy731PckRq2InpNomIy+pQWxkBVwht6R72Ws=;
        b=l9/51vHn4KJ/+P5u19OmxsjbBqD0z49/aIjxyCqXsLCK/gaPEuBvPewQ5HnX5tCJtb
         NWPEtRDBE2/NtEH+iNemDHd4BY64NZ8HsvTZ9a4Wa3NlmlVwN1igKYR/Wf3vAm0pSx3k
         EfFYr5ssK+/4N/iBbagcfwmlIKZoQCCt8+uizqhCGYRDdRVLiF9ar0nNTV/29GuRbgbJ
         MU7WHDTaa9zqJRTIR/8PKZQLclCgPt9kxFDIPTaSpiH2FzA1O3Iwpsrtax9/rM17hqo6
         Vz0zUWa/pgCnqyYSSh+z1wCXUUNUXcmfBtF73SzCBw2SmiOaPw1eXwqo/Y4+8JLAFLia
         uoPg==
X-Forwarded-Encrypted: i=1; AJvYcCV+3grIPUOM5/kqtm63q3xvAie9WxJXC6/vBOoEr7DhEtbzFuEvilHZZJldDPlqU82fzaUY2z5EzbGm/W6juq0/Kqud1W7OlIHHzvbs39uzrOQ=
X-Gm-Message-State: AOJu0YxsMRZvDJ7rwFiLRvzmuwGmZQX62qq8pK4QTel66EOa4wtJQfvf
	ovIswVufamnkxaqjuOmoBN+Gk0nk5yNBBsPOU/SBnofUzjZgXcNhyOpMwvVrxfxY7JUqzZgcpL7
	eTsCC0ffiWqN7l6XtJYu+8cnLmq6AzEj2Tee8wusjdFy1mwsIDyTzn3kvqux0+b/jOfgB
X-Received: by 2002:a05:6122:c9a:b0:4ef:5e6b:98c0 with SMTP id 71dfb90a1353d-4ef6639544cmr18524347e0c.9.1719600656042;
        Fri, 28 Jun 2024 11:50:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1xtc7RtiYa34pVmoPe0IGOBpNQEZG7tTH0uDpPjcx6Jj8ePQQfAIiFgykGccYjWFYrsdyRg==
X-Received: by 2002:a05:6122:c9a:b0:4ef:5e6b:98c0 with SMTP id 71dfb90a1353d-4ef6639544cmr18524331e0c.9.1719600655696;
        Fri, 28 Jun 2024 11:50:55 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79d692613e0sm97793585a.9.2024.06.28.11.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 11:50:55 -0700 (PDT)
Message-ID: <587b16a0-1cc9-4987-a36e-f4f3306aa14b@redhat.com>
Date: Fri, 28 Jun 2024 14:50:54 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CTI TAC Meeting Notes 2024-06-26
To: "Frank Ch. Eigler" <fche@redhat.com>, cti-tac@lists.linuxfoundation.org
References: <a1e31779-b3c3-4016-ae69-27aced5971e9@redhat.com>
 <20240627142532.GA2948@redhat.com>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
In-Reply-To: <20240627142532.GA2948@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/27/24 10:25 AM, Frank Ch. Eigler wrote:
> Hi -
> 
>> [...] Routing issues to the colo.
>>  * David: The SLA is within the LF, with the OpenSSF funding, and the OpenSSF saying this is important from a security perspective.
>>  * Bennett: We have redundancy and is that something we want to publish?
>>  * Konstantin: We do mention that already. We can also put in the design of the platform. Automatic failover.
>>  * Carlos: Yes please.
>>  * Konstantin: OK, I'll put it into the part.
>> [...]
> 
> Given that the routing issues mentioned were upstream of the
> colocation facility itself, effective improvements in failover would
> have to work in a cross-colo way.  Is the intent to have
> failover-capable servers in multiple colo facilities?

Yes, correct, as noted in the just published SOW:
https://lore.kernel.org/cti-tac/2186f48a-12cd-4630-8944-26b9042e924a@redhat.com/T/#u

-- 
Cheers,
Carlos.

