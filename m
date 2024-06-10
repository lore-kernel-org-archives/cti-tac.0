Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCAF7FBAC
	for <cti-tac@lists.linuxfoundation.org>; Mon, 10 Jun 2024 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718022104; cv=none; b=nRXRmNlCmQszt5yuU6uaS/OhrWEYqLxSfVERUsBEEcf0K/IM5jtTKWXEzk6PhZqivcYIvOhnQ3OGtd7J8quzi89nya7wCTvoP2lyQYFZ22Sg3Vfhk+bBK/T6Ht9lib0GRuCyG7wgyzJRxVxJ8JDs80AvR42QAmVgZXqMjLSj8CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718022104; c=relaxed/simple;
	bh=19ra9WXh0GsSPb8ZNhlfmZOEJZKu6AGJxfqVByfC51U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHkwLELesTOKU1s/umTcobaArlEflgrEmu6NEo82ollOZBVx99rGvZJKVRYS/Yz7CwKHwLHtZQwU3x/x+CqXiR8cADWW99duOzwBpJ0hcdSzPUpqJJvGPbGhXG/xdpDrhcbQdY7JU094C1jtiJZzAlOTlllYBXi7Y5ouWds90Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iSZr0wFK; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iSZr0wFK"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03A5B40603
	for <cti-tac@lists.linuxfoundation.org>; Mon, 10 Jun 2024 12:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bL53vkjilw2C for <cti-tac@lists.linuxfoundation.org>;
 Mon, 10 Jun 2024 12:21:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7EF78405EE
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EF78405EE
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iSZr0wFK
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7EF78405EE
	for <cti-tac@lists.linuxfoundation.org>; Mon, 10 Jun 2024 12:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718022099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=u/qEZdmRhL0dbSNz4F/+DBAh9PEtOK5oWpw+U2r+Kb4=;
	b=iSZr0wFKTvOl54OZFwzzpzipZVy2szG7AVsPvMxvVqF5Q691ZJ3WDYqHqUYQU/UlyS1Cvf
	0z5DDYg3aERO4WjypjjQP2nQF+9aFZL+hF9FYjEBKLXF/2Yn1zC1HqTVc/k+3gIiSBKUaG
	SwZhKzlus+UpyHxmGENjlVNevofAR8g=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-47oMwkBUPXKtOLEyu4QmUg-1; Mon, 10 Jun 2024 08:21:37 -0400
X-MC-Unique: 47oMwkBUPXKtOLEyu4QmUg-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3d1ca4ed5a3so4353709b6e.3
        for <cti-tac@lists.linuxfoundation.org>; Mon, 10 Jun 2024 05:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718022097; x=1718626897;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/qEZdmRhL0dbSNz4F/+DBAh9PEtOK5oWpw+U2r+Kb4=;
        b=HqDyW6gQF17oXdItUvft3yDATzH5Gd/tAafnw6ni4tJk2zSAU5o1LF+rBEXI0gptob
         9us8ULW55CKCh7wclQRfe+UYSIQ6lRcn+p999exzF4PhqC5ikMleHhOPlxQ6F7Yf5fgG
         FrBn0StdWPFFjriRmBVUqCkOk27sje7MVqOMtSTAZqSvjsvejwM1cf3giqLbMXm7PqbI
         Xr5Hn8bQ0HjgVqhWxnrleFAgSF/5SI5IJwNa5MtT4DiHktlTP7mIomNhKqRytzwKh2rh
         t7k8X6YHnhX/u2bI2ZbI6vywvTZ7JuTjHRkIIJvRBNDoxuAMRsMOyYizXanK+hH7pOpW
         mAWw==
X-Gm-Message-State: AOJu0YyOod3RUA/ef39K7zC2ntT5theQmG1fxKxO33ZI/D9TFmfCCr66
	CeiqWilkLG+AT9TvBTZf3Uw37STCf1AZasPgnoFlMjySagY0IndraD7ld3p6FhajI8NUQN+wjkH
	g6CCi8fC9sp1bMjmt3qyDqyAsf7tfmHlQdYUw2j200Z00alOa3U9Jz0lP1mdG2KGK0Wdr
X-Received: by 2002:a05:6808:3c86:b0:3d2:32db:63d5 with SMTP id 5614622812f47-3d232db669emr142129b6e.25.1718022097204;
        Mon, 10 Jun 2024 05:21:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG282CmkB1rScux3RkbugiQc7QVgnjID1pLZvBKIFsH/LxreVdF3tKEpvmYe87uNHLgpLKx+g==
X-Received: by 2002:a05:6808:3c86:b0:3d2:32db:63d5 with SMTP id 5614622812f47-3d232db669emr142103b6e.25.1718022096774;
        Mon, 10 Jun 2024 05:21:36 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7954679bd13sm302537785a.35.2024.06.10.05.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 05:21:36 -0700 (PDT)
Message-ID: <c791f57d-b87e-4486-866f-cad78dd16128@redhat.com>
Date: Mon, 10 Jun 2024 08:21:35 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CTI TAC Meeting Notes 2024-05-29
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org
References: <69862ea2-d7e2-4fdc-91a6-a80525ecf423@redhat.com>
 <20240607-lyrical-warm-wren-a4b8cd@lemur>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
In-Reply-To: <20240607-lyrical-warm-wren-a4b8cd@lemur>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/7/24 3:54 PM, Konstantin Ryabitsev wrote:
> On Wed, May 29, 2024 at 12:01:37PM GMT, Carlos O'Donell wrote:
>>  * Next steps revised:
>>   * In Progress: Review LF IT SOW with CTI TAC and finalize SOW.
> 
> Hi, all:
> 
> Sorry, I've not been able to work on this yet. My goal is to prioritize this
> early next week.

Thanks for the update.

-- 
Cheers,
Carlos.

