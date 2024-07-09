Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916CC157A6C
	for <cti-tac@lists.linuxfoundation.org>; Tue,  9 Jul 2024 15:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720540224; cv=none; b=OU8c5FPsinZg/+DPImLx8LNXbF7yR5rLxqDvod2RsyQNSUFGFioc+pI8yVeE+lFfeX7lPqE3FwnDOhN2MFfCTZPbo0/CC4fdYPB5uwgq6V0UjHHL0fQccPDtU+4UA1+XTts1cpVNBw3pa436Pd53VbaieSnsFuk7X8BqZgJfij4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720540224; c=relaxed/simple;
	bh=FAEwUePWY+rqJjOjXe5bTCyWmsur/wHYEZ4Vi7dtFdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f0IZYmbs8Y6dxQzBmN2BXfp6RiNuN74h5YqZeJQg0xsDsFDOjshrmDXjrwgUfuy/koklukcdwNJxaWNGpWzBHlSC+QHiNq5MuA2vrkz0mxxpK5PRf79gdwBGWXb+FI2BPl3QFlyvh36E/14F0AsXUiUfiVLbAg4v30tNBsmldJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tusogi9B; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tusogi9B"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 239AF81E40
	for <cti-tac@lists.linuxfoundation.org>; Tue,  9 Jul 2024 15:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrWdYST1DwdN for <cti-tac@lists.linuxfoundation.org>;
 Tue,  9 Jul 2024 15:50:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 61BFB81E3F
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61BFB81E3F
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tusogi9B
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 61BFB81E3F
	for <cti-tac@lists.linuxfoundation.org>; Tue,  9 Jul 2024 15:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720540220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=v1iEC8vqKgIdCQcZBfCWziVRrcnKxLtd6VQUj9EPDF0=;
	b=Tusogi9BdV8ageISpG+8G5AzGLf3/yxBrNHFENefD+eoiC7j9JZOZDczR46ot224dxSIQ0
	6e+hGN1TK86e42VhSD23umnLOXtHLUNxtjrrpCrhneVWKg53qtMBnw8GU3e4RoOBEYQyNc
	CGO521LZSRmN3yEFv9yHx6w6cOZh65k=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-Oh1YajtkO_6fRTVlv_gZEA-1; Tue, 09 Jul 2024 11:50:19 -0400
X-MC-Unique: Oh1YajtkO_6fRTVlv_gZEA-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-70362fac519so3223147a34.1
        for <cti-tac@lists.linuxfoundation.org>; Tue, 09 Jul 2024 08:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720540218; x=1721145018;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1iEC8vqKgIdCQcZBfCWziVRrcnKxLtd6VQUj9EPDF0=;
        b=OPZP7LL4ibu7W1vTUhPyw5LmZlPzX+Yfr36Zvgg6nNWDlnIcCMXlEHeQOTwRhx5o04
         Jq6tnUJmjO9+kTJrjr/SPfvIF45NSdXDLrVKiRnCzjsts3Axi87cZa3pJXVX+uOP/Sws
         Q5H1OYif27at8jAxULZY1PTwmu/pnV6vSv3WnTZPqB4RC8lPrGVISgHigfyR9CMdC539
         sBiltSg5STzgEzSixYKX0E9T/Ml4PwNOa1Q0NBTdyCgRUra+rLexGcJMhZb6dXrkE5YE
         wuqlmeVjqeWMVf5hGAG+nJl9nDcZHgYiBqvcY7UnL5wAUeDefVSw5oeYpod9eunHLM1P
         NGkg==
X-Forwarded-Encrypted: i=1; AJvYcCWzPjedmRYul3jGTQ9gS6d3WZQyDDTy0sY/DGEVk459NdFVI+VS7FS4aTWHAsdsgvqZwi4UWEYAOHEoP25OaLrBkx8zohF+1lkW/VtNRF9owto=
X-Gm-Message-State: AOJu0YyhwuxqCyK2iOpf/64HdMpCK/RJ3KTapt+gMLRlKiT2iWeo45V5
	MwBiB+ITgQjs8pTeIaPElbLjt0DEoIB8XH0S2+7IB8OVq1vhJ903pKRj9XIGBma0VcujJpQ+OcZ
	mQ8SChrqrDiyWpKu9XNhcL2tYMXSHUPtBqft/PJOF5xkNaP0cZYQsbqzNR9iKoZI9WOhd
X-Received: by 2002:a05:6808:4446:b0:3d9:2575:a4f2 with SMTP id 5614622812f47-3d93bff5d87mr3593687b6e.15.1720540218595;
        Tue, 09 Jul 2024 08:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQefPv4f/pNqVazXadgrvlQ6GCFK+tSXjN0r/yCLtuiMk4XXhl+LN7/eR5T0mp2HdcCvrROA==
X-Received: by 2002:a05:6808:4446:b0:3d9:2575:a4f2 with SMTP id 5614622812f47-3d93bff5d87mr3593668b6e.15.1720540218244;
        Tue, 09 Jul 2024 08:50:18 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b61ba73c6dsm9788196d6.90.2024.07.09.08.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 08:50:17 -0700 (PDT)
Message-ID: <72e08918-0786-4063-aa52-686260de0b08@redhat.com>
Date: Tue, 9 Jul 2024 11:50:16 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Stepping down from the TAC
To: Simon Marchi <simon.marchi@efficios.com>,
 "Jose E. Marchesi" <jose.marchesi@oracle.com>,
 cti-tac@lists.linuxfoundation.org
References: <871q46zed4.fsf@oracle.com>
 <725f7f38-7325-4511-a30f-4c54757bec11@efficios.com>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
In-Reply-To: <725f7f38-7325-4511-a30f-4c54757bec11@efficios.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/9/24 10:14 AM, Simon Marchi wrote:
> On 7/6/24 12:15 PM, Jose E. Marchesi wrote:
>>
>> Hello people!
>>
>> I realize I have not been active in this group for a very long time and
>> all things considered it is unlikely this will change in the future.  So
>> I think it makes most sense to just step down at this point rather than
>> continuing being idle.
>>
>> Thanks, and salud!
>>
> 
> Piggybacking on this... likewise for me.  If things start to concern GDB
> at some point, I'd be happy to be back to help.
> 
> Simon
> 

Thanks Jose! Thanks Simon.

I'll update the docs shortly.

-- 
Cheers,
Carlos.

