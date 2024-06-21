Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581F015F30F
	for <cti-tac@lists.linuxfoundation.org>; Fri, 21 Jun 2024 20:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719001655; cv=none; b=EaUeyLp0OUIeBM0FLwelv9HrSO+qVe7g9eZBrT/ULJw53QT3lyY84WzPNfxiwHgByWffqJHBc5wi53KVIuRrGZ9XIDfuFOWo4RtMQDnV0V/3vQbG2/cSuLvO+9DAgjLY6ytmQ1NRJI99s/XNQkcEwv4NVEcYXSp5YzcqAVKMnDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719001655; c=relaxed/simple;
	bh=HJs3UzaKMAwHXwKSt52zaTy6vzh2AlxR5E+GIJGR5ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=utGYndS5yCK0nqILN0C8HTmBYytEHLVj6v+Pid99HxLgvCnP+kl38K+CCPP/fzjKH8pWkfc7lecJRzFMNefTcAXqiERAkpe7DpXG8NQguJN4Mr8FYRMlEx016DCtcV8L7hjAEhvwRUif0aU97MnBt0inSVPbbCgo7FZrZiZ8t2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V3+aNZhs; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V3+aNZhs"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6837402D7
	for <cti-tac@lists.linuxfoundation.org>; Fri, 21 Jun 2024 20:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-gMYGKvTRq0 for <cti-tac@lists.linuxfoundation.org>;
 Fri, 21 Jun 2024 20:27:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B258A401E1
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B258A401E1
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V3+aNZhs
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B258A401E1
	for <cti-tac@lists.linuxfoundation.org>; Fri, 21 Jun 2024 20:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719001650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z0S2ycYE2hubtvL9Lw+R6VW9X5e2IHcs1C74hJVqSDc=;
	b=V3+aNZhstQfjti9eW0AKLrLB16fxszvL8KyL5tymiXjW3krKfcnXla/PZ5AqXM9tZF2VWZ
	jzHDWkDBZvAzdvXnwCMB/4k6YvRqr08HRZ6kgayuh3mbmKNLmqesPayXfKWkdLZuVJeYcF
	/NS+P7Uam9llCx3AXVvM7NK79vNEXIg=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-RKa_BSiOPY-cBConRIt9ow-1; Fri, 21 Jun 2024 16:27:29 -0400
X-MC-Unique: RKa_BSiOPY-cBConRIt9ow-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5b976c32d9dso2220496eaf.3
        for <cti-tac@lists.linuxfoundation.org>; Fri, 21 Jun 2024 13:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719001648; x=1719606448;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0S2ycYE2hubtvL9Lw+R6VW9X5e2IHcs1C74hJVqSDc=;
        b=B0phFt9W5gXTcnYcik1zqzy/3b15Hg9sh3fi8R0D0aqAgNWur8zbhyX5Ru/cCMAoqR
         4nW0AXaAEnptk+cLpfRfF/sWLGCRWbUED3cyDq/E0KTYWks4O40NI4imYB0PeWwyLhGy
         tx9goBED7dwaJVfenvf0ElAhdxsJVjhVeylxvJKxJzfQHUem+wCs5vP0neqpz1dpcNai
         J2/MrJSIaAoayqM9Rglm6/mw187vkVrxQ86AQPlPKDJ4c4CI3nyoLUA7gTbohcqcRXri
         c1fbwwRyuZd/Yp3fW0/QFWjzgoPL9sCzgd6HDnDJpS1DwjMGWQWxglAofQ4AMjb25s+Y
         Rv8A==
X-Gm-Message-State: AOJu0YzVZ+NCZGKA4Rhttlx04+ex6GA+UhJdznRyoe7V14dWNY+wpBX0
	2YluYB2mOqsgdHiA0bygB/ZeyQXlOC8TXe2+zCsFY+o45APl2VdXUI227MfiIhzWqKOIEFE/+ob
	4hXSxG/suBeiYtYl/nP6ZPJpOvW5d5XzUgTRBsBQyfBeAT6zeBr491e2mvyWggLM6xQae
X-Received: by 2002:a05:6870:9a1d:b0:254:e4a0:4d9c with SMTP id 586e51a60fabf-25c94d7510dmr10362304fac.58.1719001648306;
        Fri, 21 Jun 2024 13:27:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEycizFp0vcumpL/Ved9wbsgCtdiKlvW1Xt1I/XIOS95c5x59EQIp+2a+ArZFy18wwU1GbeIA==
X-Received: by 2002:a05:6870:9a1d:b0:254:e4a0:4d9c with SMTP id 586e51a60fabf-25c94d7510dmr10362289fac.58.1719001647983;
        Fri, 21 Jun 2024 13:27:27 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bce91f288sm114327085a.89.2024.06.21.13.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 13:27:27 -0700 (PDT)
Message-ID: <cfc367b2-8440-48f3-b5ae-eae9c5918210@redhat.com>
Date: Fri, 21 Jun 2024 16:27:26 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Migration to CTI services should be an opportunity to reduce
 dependency on git hooks.
To: "Frank Ch. Eigler" <fche@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
References: <b3d04984-cec4-456f-a05d-7adccb1c3b3d@redhat.com>
 <20240621133048.GA24746@redhat.com>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
In-Reply-To: <20240621133048.GA24746@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/21/24 9:30 AM, Frank Ch. Eigler wrote:
>> The gcc community was locked out of committing because of
>> issues with the AdaCore hooks: [...]
>> My strong opinion, particularly for glibc is that we have as
>> few hooks as possible, and timeout those remote hooks in a
>> reasonable amount of time.
> 
> Note that these hooks exist only at the pleasure and control of each
> individual project.

To the degree that these hooks don't impact other services though.

The hooks themselves use resources, so we need to have a design discussion
with the community when that community needs custom hooks:

 * what is required
 * what is desirable
 * what can we do to improve security and isolation
 * how can we design a system that degrades gracefully
 
etc. 
 
>> As we transition the services we should be looking to architect
>> a safe and robust system that can handle the hooks timing out [...]
> > You don't have to wait - such a thing can be prototyped today.

We're tackling glibc today and doing just that as we transition to CTI services.

> Is the issue mainly the lack of anyone's time to do that?

We will get to it as part of CTI services since it's in the SOW scope?

For gcc, binutils and gdb we could engage to gather more exact requirements
from the developers doing the day-to-day work e.g. what features did we really
need from the AdaCore hooks.

Then scope out the solution and what it looks like, and a prototype would
certainly go a long way to giving a good budget estimate.

Then figure out deployment and cost e.g. small vm to run the isolated hook
that returns a result, average timeout, and degraded result e.g. no bugzilla
data.

Then the usual TAC review, vote, and approve the spend (unless already covered
under the budget).

Would you be interested in working on this for the gcc hooks?

-- 
Cheers,
Carlos.

