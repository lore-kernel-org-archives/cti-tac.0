Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C120383BF
	for <cti-tac@lists.linuxfoundation.org>; Fri,  1 Mar 2024 02:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709258498; cv=none; b=LEyfJMextFwXG/o7jSXklLtfiYCApeSjytx0RXBj32qUnmrTC4gsaoObDks/ND615oEPd7WxqfZ9qhJB9YCFUGsOnlrXe+iUeJHwNdG87sEO7fAIJz82LtPr9rZil2A9CRvHPri8nTaw4UxkaVW/K9vjqCo0SijSfKdkFejm590=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709258498; c=relaxed/simple;
	bh=5HGUfFuSKsh5lzjZ4aqnoihAIEK9xQBZK/2eWaBxxTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QO3u52i6UQLPxdjfcaCKklxnWGgxyawqu/hyWwlyw86BrEc99BzDJBEikjUCvKkZBxtktSMurVscUo3ZSsa+pyGEceVdlYh96PE3nT4RbNIesHfVvYs5BMdsnrp8fmuN29D9mz+rtm6tk5YEySkZq7HdPTXu3dh3yF9WtF5jZx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SRqSeAC6; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SRqSeAC6"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E59E1821CD
	for <cti-tac@lists.linuxfoundation.org>; Fri,  1 Mar 2024 02:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.602
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZqmBEdCUnz6K for <cti-tac@lists.linuxfoundation.org>;
	Fri,  1 Mar 2024 02:01:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 101788219C
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 101788219C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SRqSeAC6
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 101788219C
	for <cti-tac@lists.linuxfoundation.org>; Fri,  1 Mar 2024 02:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709258494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gUg5LrLVSZgjAkSZVJP3LWZo1EStuAyS+b6scMz9tys=;
	b=SRqSeAC6gkN9BjbKcibqj6d6JsbFOd2iIPQjr7HeQdIybncRA0ONe5aBdoFmPen8qh06YO
	30Olpo8LziIZXrBJ/6IBdW7xz5uRHP4cfWcbUisaNhg2UgygxptkHlCvtrzLh7dx1YZo5c
	GP0T+2rqJjPp3kqLMs7YGzdgfOzGx/8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-fasD4dZrMLuzkUr_rgDj0Q-1; Thu, 29 Feb 2024 21:01:30 -0500
X-MC-Unique: fasD4dZrMLuzkUr_rgDj0Q-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-42ec2c2d2f0so11501521cf.2
        for <cti-tac@lists.linuxfoundation.org>; Thu, 29 Feb 2024 18:01:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709258489; x=1709863289;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUg5LrLVSZgjAkSZVJP3LWZo1EStuAyS+b6scMz9tys=;
        b=i2xqOT5ML/C+1O1APrvAa/8xGLQKTYLVVaBa90A+Eh62VTWeRM/WRIhX1oP7f815n6
         0QIyuI9ZLxJBCN8mcby+s6P+HAKHf24gIXA9CfP3sB8zBlvUDLJOIkNJDHN1/zuc2ZUh
         D5iG2OnQ55mpId0AjSv9A8idY0z+2plPv2aAq4ACu48hKOrD7lGslWrRGMIiP9BEQamB
         lgNK+VuEPqevVSaPjJlc6w4zHf31c07Zy2TZuTvhYqb8xScvQcxWyXAmhoxMhlMipYKk
         rNTyIfK6G2vgR3nk2zlrlk5vQ9SDpQKtx+IG5BcQYQFIIc78j2Pnog/vm2V0FY4goWWf
         /bBw==
X-Gm-Message-State: AOJu0Yx80gQb5xT0RW5lKxt7QfFfLItf9Tm2IHAQCCUTcx0Jqs8HWasa
	2RmhsRDYMc3Qs6uwlaakXa+Idu31ItcT9GEZnkzbCXjFrv2yInqW/Ulp9b9ekcqD6Fkg9XcDqYT
	jWmdRHaY8MpaDbeAYRMrhCc3V+OB1I52Y2ByyEbxTSzgDQxzBJVAlQ7oq1fw973imyebq
X-Received: by 2002:a05:622a:1389:b0:42e:c634:89ae with SMTP id o9-20020a05622a138900b0042ec63489aemr330046qtk.58.1709258488810;
        Thu, 29 Feb 2024 18:01:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IED0fA8LxHT0kD81MtlaYkl28NsPYo4WwCsNM/vYciZVMHISY9wek7d6YXQY6xLOSbkgJFiAw==
X-Received: by 2002:a05:622a:1389:b0:42e:c634:89ae with SMTP id o9-20020a05622a138900b0042ec63489aemr330032qtk.58.1709258488558;
        Thu, 29 Feb 2024 18:01:28 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id kr23-20020a0562142b9700b0068f52a6f4besm1342155qvb.103.2024.02.29.18.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 18:01:28 -0800 (PST)
Message-ID: <8c0e5054-0e34-46b8-8643-56225288de95@redhat.com>
Date: Thu, 29 Feb 2024 21:01:27 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Next steps to turn on https://coretoolchain.dev?
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org
References: <26fa2971-f3c4-4b92-b89d-9157e21f59b7@redhat.com>
 <20240228-functional-impressive-pegasus-ee839b@meerkat>
 <6f509356-b893-40da-971f-bb0fde4484b9@redhat.com>
 <20240229-gregarious-jade-mantis-9d3df2@meerkat>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20240229-gregarious-jade-mantis-9d3df2@meerkat>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/29/24 19:25, Konstantin Ryabitsev wrote:
> On Wed, Feb 28, 2024 at 06:19:42PM -0500, Carlos O'Donell wrote:
>>> I will enable that in the next few days. However, I thought the site was
>>> cti.coretoolchain.dev, not toplevel?
>>
>> Let me check the CTI TAC notes...
>> ~~~
>>  * Consensus is around "coretoolchain.dev" for "cti.coretoolchain.dev" documentation.
>> ~~~
>> You are correct, "cti.coretoolchain.dev" was the final decision.
> 
> This site is now available:
> 
> https://cti.coretoolchain.dev/

Woot! Thank you very much for getting this live!

If Joseph, Siddhesh and David are happy with the content then I'll promote it more widely.

In particular I want to point Paul Eggert at this to answer his questions.

> It's not auto-building yet, but it's a small thing to enable tomorrow. There
> are a few small tweaks to be done, too, like redirecting 80 to 443, but I ran
> out of daylight today.

-- 
Cheers,
Carlos.

