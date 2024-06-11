Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D2717BB25
	for <cti-tac@lists.linuxfoundation.org>; Tue, 11 Jun 2024 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718108741; cv=none; b=Yy9XN25caORZlcdqI2reWFlA3iagPUELHZKe0h4MCcNGXXWdJIkoaSjwhkd/pxHxKFsOuNgdFf7UImHI1XvqlpEN3PNcbtj6GU8EclDPqkSE6kRRu5s78w7V/hZOLbSPevu/TMADRp8wKZNpUAw4PAnbxpeFDblKGMt5eR+D+xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718108741; c=relaxed/simple;
	bh=LZ9CvMcbaxnLSNYDuQef1LQwQO7F7OZ9WJcJbR7Rsb8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=tMwRABb3XWRzZ+2t7LXTfgTiKS7YTR6Qt+xGUbxfNl7L+kG9Q+EXmnWNEdCHTty7ffK97hLiYvCVtsuLyh+UlZ5cWifCilm45l7wgy2gU8wgit1F0iUVtB5xvejKbuZSipXq33R0NXk/xvXWDWGPZt9xPlUTD/bziCC2MPM7n6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jEYvtmxV; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jEYvtmxV"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9900760859
	for <cti-tac@lists.linuxfoundation.org>; Tue, 11 Jun 2024 12:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3BbkjjrNRvQ for <cti-tac@lists.linuxfoundation.org>;
 Tue, 11 Jun 2024 12:25:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C06A3607BE
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C06A3607BE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jEYvtmxV
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C06A3607BE
	for <cti-tac@lists.linuxfoundation.org>; Tue, 11 Jun 2024 12:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718108737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wK//oSxrJlcJQHiE4K0ncJTj8niea/vVsP2B+jo2ggg=;
	b=jEYvtmxVptL76jCymfr2yYWG103456cCOzKGNgl8AzBBnTH9g07vQ17oBvZa0nRfNh2h/7
	grhhpq5NgDwfoPiVPGr27CAfd51P2U0TTpEDvMnChqmsUCj4mc9VjMxYK+WMUFlabekKuC
	CRt4xLWOsq4AkLc1x/YG1mxU74EQcQg=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-ssban6b5PzamwwNxtk6TAQ-1; Tue, 11 Jun 2024 08:25:35 -0400
X-MC-Unique: ssban6b5PzamwwNxtk6TAQ-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6f9866bd6d6so3057854a34.1
        for <cti-tac@lists.linuxfoundation.org>; Tue, 11 Jun 2024 05:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718108734; x=1718713534;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wK//oSxrJlcJQHiE4K0ncJTj8niea/vVsP2B+jo2ggg=;
        b=u6UE9nzhiT/tTKxBxmvOKHC0YwTHRWV3Fyzb/P5qDX9E/gMQ2i8XvjvtcXeHIAcZi5
         xqDXMT/Mkgf1ImEXs0INWWsb3r7jDCHNjPxoW1kUYyhN1QQmP1gqeW+fW/nuTwalxXXW
         sGKuQYmYEIly+QETY52YkZ7EztiZcFjGEkPXGYqOkiBpjPxi7yfk1hXTuNSc2L9KpnrA
         15C4+asHdnHJPaQ9CVjF2e5w/EOmZbYVnI0AKRWS0tiJSUAgZhgjCnZ+AzluuvB4QU8C
         8tfucA+9IxVlDFXrNJsMtoyxQEkSIOujmWu1maXjVVt2NRZXkvrC85nflUCyu3ygipaK
         1dFA==
X-Gm-Message-State: AOJu0Yy6ap1Y2aDK7a+fm3p5De9JtP7lCe9n+GJhF+6YbpPiD6Du+LZK
	CbAylUy44QrRaX5eIUf8LoZH9ucj9xuGNw9KkHs0xOM4wI0rfCn3Y+QKFroMOX/yXANrvdWV3OD
	JqhFHBcBGhzZKh5/IQmaDbXR9oAqcuIuBWOLm5JlaGxstlxBJVViChFfDsHr5ErskBjkMCEdwwj
	opRZrLvGGswnLUHGy7LkpZ9/JicXpRHeCVpnqKMqberoZeyICjHA==
X-Received: by 2002:a05:6830:6a87:b0:6f9:89ca:fbe3 with SMTP id 46e09a7af769-6f989cb0065mr10862089a34.17.1718108734544;
        Tue, 11 Jun 2024 05:25:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8cjOvJyPwvFa/lG43oYOMiSmIMy3ndPhOdJxILVf/cWt5WNB2Tyv+28BA5SjOpK9vgNcSsw==
X-Received: by 2002:a05:6830:6a87:b0:6f9:89ca:fbe3 with SMTP id 46e09a7af769-6f989cb0065mr10862069a34.17.1718108734149;
        Tue, 11 Jun 2024 05:25:34 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-797f065ca76sm4376785a.50.2024.06.11.05.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 05:25:33 -0700 (PDT)
Message-ID: <24d36a5a-fdbd-4efb-9f30-c21a71484f03@redhat.com>
Date: Tue, 11 Jun 2024 08:25:32 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] source/faq/index: Update FAQ.
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org,
 Siddhesh Poyarekar <siddhesh@redhat.com>
References: <20240529135110.3917584-1-carlos@redhat.com>
 <c8da333c-1734-423a-976f-d2114ce597c0@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
In-Reply-To: <c8da333c-1734-423a-976f-d2114ce597c0@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/5/24 11:41 AM, Carlos O'Donell wrote:
> On 5/29/24 9:48 AM, Carlos O'Donell wrote:
>> Update the FAQ with additional entries as requested by CTI TAC
>> review.
>>
>> Add information about relevant national standards and why we want
>> to advance the state of our current infrastructure.
>>
>> Add information about service bringup and how to achieve that.
> 
> Any input from the TAC?
> 
> I plan to push this next week as the FAQ items noted here expand on the
> existing answer we had, and other answers are following what we're doing
> today.

Pushed live.

-- 
Cheers,
Carlos.

