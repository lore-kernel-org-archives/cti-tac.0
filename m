Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F77D3BBEE
	for <cti-tac@lists.linuxfoundation.org>; Fri,  8 Mar 2024 22:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709937915; cv=none; b=XuRJHZ5VVhuOI2FZzKgkDGFGW7srZnVqNiO3h9AVQXtgsIGqCacLhoHuwmIbacb/nmZtLg+ZmymUie5qXn/Nh9llDa7HvaAetBTNDM/3sZyMNLwrbcb9yxkdeRJUpFVBpebUIrwIRtrVa+SlrqVjY+M4F2wXNj3z3TiI4Yh0ltI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709937915; c=relaxed/simple;
	bh=8QD8eYVIRJ+a59c0txQ5ODHwjSq/PBv71PIUlUCEdM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f46FNRzcSPmqH/ADaLTkbl+hmSxRqUiOjdtXDAOJouPgT8cvlFaJDplYUce211K5PDAekBw9Z3CSuSD1ei0WZewGodIEIVKVbF10OTBgxLSkIyxVennjAyDDBpIGc/749+cj6eHzf5PN3Pr7wZbmmxlLYAesYtyvXbSxMEfz0LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DV03nwN/; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DV03nwN/"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB02140184
	for <cti-tac@lists.linuxfoundation.org>; Fri,  8 Mar 2024 22:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XjX-Sd9zcnCM for <cti-tac@lists.linuxfoundation.org>;
	Fri,  8 Mar 2024 22:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8458A40135
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8458A40135
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DV03nwN/
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8458A40135
	for <cti-tac@lists.linuxfoundation.org>; Fri,  8 Mar 2024 22:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709937910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kf2XZks1iF7hBSQO4a7PwZRghyRJXa8/TcOq5jOj1gY=;
	b=DV03nwN/dt9c23AHuuL0MeurF/nVawDPFFU7qrb9TogOcvvTGXFgpGE5mB9nEDDA94oq+y
	O1Nn9SFCFiaVoMmvGW0+bMK635X1DFWiIM947uAklWERc4V77mZ9evrTNgsLvE2ZENS5cl
	Y6+vAbzeQQMsfPop3FgRv9/C7uczmUA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-5rSSbGTzNwmWdFGSReQcQw-1; Fri, 08 Mar 2024 17:45:09 -0500
X-MC-Unique: 5rSSbGTzNwmWdFGSReQcQw-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-788287856f5so106043885a.2
        for <cti-tac@lists.linuxfoundation.org>; Fri, 08 Mar 2024 14:45:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709937909; x=1710542709;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kf2XZks1iF7hBSQO4a7PwZRghyRJXa8/TcOq5jOj1gY=;
        b=J1RovjsdDnZdROnlKduhg5JNCGIN/t3k5HaQPpAeZ+Vla2+u6qcQhDjPOqVFxGFQ2R
         RmcdV5U3bEsb2/yzUcl7qu0u9EfEHSq8wuDA/lAed+MHlCGSnXTzzMax1pVRKbe2z+sV
         5pNjYsprQSYPThRqR3rAWuLFm/aRTzEQksna1eO+6iQ2uPGD3AdeJkn5eqeZm8SYLVMQ
         FTpWR8XFxboCrvloOh2DHyX59x1r5nBa+qpsm0jel1UTu3YttHW/Qj99e57jyWAm24oP
         OokC3q8F8KMz4HQS1GjdFROh/CrABOcQxhVWS+bypK3tgP/WCOsOn/6MeFYzwmF8RhJf
         BlIQ==
X-Gm-Message-State: AOJu0YwG1XpcJf5Z/X0L2RY2ItLy9/HjZUoUw24nBsq7//WiZHCuOqAT
	j34ebddqSrgRVRuCO+NAMZHq2wu27FobnCMAIVuIPUdsBk3EoJ9BOqZa+miZzhDJbuHr/54wNvp
	5b3xJZMCwHxOXVZBgtbqvty3CvGq2Jv6Br9LeHpP44b/UKz2PT3oRlrIhPQSLnTsW/w/G
X-Received: by 2002:a05:620a:1706:b0:788:2ed3:b004 with SMTP id az6-20020a05620a170600b007882ed3b004mr588010qkb.6.1709937908734;
        Fri, 08 Mar 2024 14:45:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEBSEaXaac+ptgiRsC3xFk/wk/oh9AC8uknnmt+ARkwEpdjn/tYC0sG3t4apvQbhsFs8Tjdw==
X-Received: by 2002:a05:620a:1706:b0:788:2ed3:b004 with SMTP id az6-20020a05620a170600b007882ed3b004mr587996qkb.6.1709937908451;
        Fri, 08 Mar 2024 14:45:08 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id s10-20020a05620a16aa00b00788323a0c14sm199446qkj.39.2024.03.08.14.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 14:45:08 -0800 (PST)
Message-ID: <2ee8975b-d855-4a9f-88a6-8c4380c7e985@redhat.com>
Date: Fri, 8 Mar 2024 17:45:07 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Anonymous read-only access to CTI website gitolite repo?
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org
References: <312f9b73-3055-44fb-bde6-1b631b189cb5@redhat.com>
 <20240307-truthful-dancing-dogfish-1ed0cc@lemur>
 <20240308-cocky-sapphire-booby-012fee@lemur>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20240308-cocky-sapphire-booby-012fee@lemur>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/8/24 13:58, Konstantin Ryabitsev wrote:
> On Thu, Mar 07, 2024 at 05:34:36PM -0500, Konstantin Ryabitsev wrote:
>> Yes, we can enable replication to our public nodes and make the /cti/*
>> repositories available via a cgit view. I can get it set up tomorrow using our
>> existing infra (e.g. see git.openembedded.org).
>>
>> Is git.coretoolchain.dev a good name for the site, or do you want something
>> like source.coretoolchain.dev?
> 
> I have enabled the public view on:
> https://git.coretoolchain.dev/

Thank you!

Updated the services page to reflect that:
https://cti.coretoolchain.dev/services/index.html

-- 
Cheers,
Carlos.

