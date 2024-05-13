Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FA02868D
	for <cti-tac@lists.linuxfoundation.org>; Mon, 13 May 2024 17:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715621307; cv=none; b=AUl+zzmzhyZg1G5h0yOObA/f1E4Uiis5kyUzwKocMUjrW7JVkBEsI2Nq3hKwDpC5qYkQOwWlB71uva5NUwTJEiQTfzOfwWf5HLwJMoBtKLFZAtEWHh9S5JuDIF/nvzs09sGd70j6YZmG+4lQYGZgJRCFBOxIjV41G9rn+sBK3bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715621307; c=relaxed/simple;
	bh=CD/vQ/nF+saGiH7AZpIHHCqk3mNgnT4p+NCbRNNbnDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0VoqvUuiNzJ0u+ZJ34O6HIVmWBkrhm1NhnwHph19944yQz0AH82nLdPuuKqmRPNw1jCiSilzwwRZhQka9teFDQOpbLpQRnfFCjCAbpPZ+ErrqbPwi1OG19tnZgGtSBSnDRLxDJTg5mIUhHb7Ex68piD60FFu57rT1phlHVlHiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bLoA2Uc3; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bLoA2Uc3"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BFB14011F
	for <cti-tac@lists.linuxfoundation.org>; Mon, 13 May 2024 17:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.599
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r82CFn-QKb8W for <cti-tac@lists.linuxfoundation.org>;
 Mon, 13 May 2024 17:28:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 63C0A400FE
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63C0A400FE
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bLoA2Uc3
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 63C0A400FE
	for <cti-tac@lists.linuxfoundation.org>; Mon, 13 May 2024 17:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715621303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pg1Q8f79J5rhL4/5zIecvWH1JTwvI/NGYk58RbZLUic=;
	b=bLoA2Uc3S3T6rn3iN5F2LPD5TA1qdpgYnLvbWWWZEKeGPNHX0Qoxyeu+CvDsFLRBQ70xKp
	aTUnrFpAjb2b24XQ0x2wFOjmdkJCie4JvxaWiKzuSXamJokI9lzO2lVlCsDSpDPmau2HiG
	45tX9AhMly3AJV85AlQ+eocm7ODf0ag=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-9bExV2AyN9WHOj8fZmgmtQ-1; Mon, 13 May 2024 13:28:22 -0400
X-MC-Unique: 9bExV2AyN9WHOj8fZmgmtQ-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-43e1c1c333bso11842041cf.0
        for <cti-tac@lists.linuxfoundation.org>; Mon, 13 May 2024 10:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715621301; x=1716226101;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pg1Q8f79J5rhL4/5zIecvWH1JTwvI/NGYk58RbZLUic=;
        b=AsJuOKAKDtO7DlfbX+EHBSg/hXFqIJ7NB8ZxP7fHHk3RNSY8jIzqGuHlOkx+BsFvyh
         fj1To5iYsTJlKr/kS5i5h1+HMn5Ss1MHXAnbBbHNMQOONlfwbq7Qh7P5olgociGetm+3
         tsCsbnjvj6MbaSCNL39uAGQOqGLi2lkrvjnl8fPHYZPYZwqVrW+6hu+/vq6xMo+LUaxt
         lWwiTSabPh++58wxlEFZIjIfvYRwFwzR/297HGxokWiv8uDtqopsG7UxKztuJ0JxWaRY
         IjrMXYTKP5GKH0HALFpw4IzyNEST9ZYS6uBp+QGOG+n/Elzh1TFtov8hZqwJSlxaPXMQ
         khUA==
X-Gm-Message-State: AOJu0YwO/Q6x4cNvBZUwJhDNOdRWaXOpTTkWIYe8tKmCE5IipjDI3NLg
	E0Dd2v4iJM8OHfl2oWvNt2l8UD1biEsVfzJXn8vkirTmRHZnf1o42zMTb4X48ZpHG0UX3YkfCcF
	vw6Q99j+WVS2FfJfQrhmAB9tyLOowqs+scTlZzKrkUsxTMtr1EUnerfIMqkJ+DNUdHsUJ
X-Received: by 2002:a05:622a:11c8:b0:43b:758:6ca with SMTP id d75a77b69052e-43dfdad7b3amr108310971cf.33.1715621301504;
        Mon, 13 May 2024 10:28:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE547ld9ljxI5uVAPOkGO0vX1RcVMfVlHh5wqHIuOjdxdyAALP0+HhlaeUt5zLGdz7fP6vEQQ==
X-Received: by 2002:a05:622a:11c8:b0:43b:758:6ca with SMTP id d75a77b69052e-43dfdad7b3amr108310781cf.33.1715621301182;
        Mon, 13 May 2024 10:28:21 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43dfe46c114sm46812051cf.0.2024.05.13.10.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 10:28:20 -0700 (PDT)
Message-ID: <28393d8d-eb53-47f8-a889-69939e11e245@redhat.com>
Date: Mon, 13 May 2024 13:28:19 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hashing out the scope of work
To: Ian Kelling <iank@fsf.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
 <87v846a1zi.fsf@fsf.org> <20240424-funny-lemon-starling-8b1aae@lemur>
 <87ttjpurtr.fsf@fsf.org>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
In-Reply-To: <87ttjpurtr.fsf@fsf.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/25/24 4:06 PM, Ian Kelling wrote:
> A promise to use free software is one thing, actually living up to it
> needs some procedures, procedures that failed or that you don't have in
> place.

We do indeed promise to use free software for the services provided.

The procedures we have in place include auditing the license of the project that
provides the primary service that interacts with the users.

The other procedures are that we have open and transparent conversations on this
list and have invited the community to participate. I appreciate you calling out
that we have a compliance issue with BBB.

I think we need a plan around BBB if they haven't migrated to a FOSS database,
but that plan will have a timeline and process around it. I'll start that as a
distinct task for the CTI TAC.

Jitsi also has a hosted service that you can pay for. Has the FSF evaluated that?

-- 
Cheers,
Carlos.

