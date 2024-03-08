Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DC858101
	for <cti-tac@lists.linuxfoundation.org>; Fri,  8 Mar 2024 19:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709926914; cv=none; b=Rb61K8bM8L+JW+TO2+zX1u1DDO+o3samDo40vPqeF8sMNSLww77CDscX2Fr1Wu2JwouTwc3YQ2XToA6sDJnJqJ0nneWzlvMfreHZrmDlXQHxjdrzWopqVcMDGqLTHfMKp4ll1kdjOKIwuTVbhBd2nFLTRWSoGzgmSzW+r0zo8VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709926914; c=relaxed/simple;
	bh=pC4LGKcQ1zWlxMCdGBg02ahrt16+hBR31WC36HfqNBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hNpDQ+FLqmLq3mxP3wQV2p/d39fswhUkbK4JMVJnCH7ZDRVXZD+cWJM7+zgDsl2Y7pD0i9XyhQ1EswjEQLqTSacEf0lX/KrB2OTmm4yYmmVHr0G5hmkMTMehMyE9WGcepPl/+9M9SoEk2x+jrZCAvtVHI90OuBOZi1ARR4PaRkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZiywPTgf; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZiywPTgf"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B221F82DE6
	for <cti-tac@lists.linuxfoundation.org>; Fri,  8 Mar 2024 19:41:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kTbX9r7VcTeA for <cti-tac@lists.linuxfoundation.org>;
	Fri,  8 Mar 2024 19:41:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B427D82E95
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B427D82E95
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZiywPTgf
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B427D82E95
	for <cti-tac@lists.linuxfoundation.org>; Fri,  8 Mar 2024 19:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709926910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nt6n4Q469RyJSDm3PM5Wive8b4dryDpHN0fz3J2pAUE=;
	b=ZiywPTgfOZDkVt9SYo2sRCgk+FMpCkAr4q2dLfkON5Vt+x5aTh5rMdXVWAoZVWTKWsgi0b
	gvDd2KComU3UQoX++eKuiHGwO6+yjxHfWErZRFhVLKyBKXNcYWKsn+/YEfyfhxOQQvUsrz
	o13CopIf9S7vplYNtkt+25ivfQjLCOY=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-qLk1KnPmPqaW3TTig3cvBA-1; Fri, 08 Mar 2024 14:41:49 -0500
X-MC-Unique: qLk1KnPmPqaW3TTig3cvBA-1
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-dced704f17cso4147217276.1
        for <cti-tac@lists.linuxfoundation.org>; Fri, 08 Mar 2024 11:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709926908; x=1710531708;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nt6n4Q469RyJSDm3PM5Wive8b4dryDpHN0fz3J2pAUE=;
        b=X2yS3HeEoV1vCzsQjBrvqDv97GTP0hboXWHRoR0eqtX2vChJGHyHiQM2j55yZreCQo
         bkGpixoGto50rxZFhPK5D8kid75PLl4Sb4kuVSkMwe6TEqKBHKcEIfdGwIZEb6P5Slvo
         c6nFHmIr+yMTfTWwufy5f7u6aeOZ918180lt2qX/3hhFg4kN+pTKS8H6mlie7/K6+6Fw
         96ooc4qPrBxSdkDYPS14xVDoXcXqFr7BUnVnkmt0/Eb4c9X3Qo0eSPcnqwQ2nj3Y1JC7
         KwGsAViwIgmotcz94m0cpI1WZHdHR2MBW1sxYpYEusSHkeGVtudYvMTHGH+OIPeNkfTC
         2eHA==
X-Gm-Message-State: AOJu0Yyb39U2RZGC7UEvOOvbTu+o/gC3TlObBxctHG1K6jgWfXl9EBex
	dk/lzta1CHKErXv6HtPNrv3UAVADpg2/NdS8FtS3TicsEvJlq6XjwzOkEQsvKsM+H8ncXwRbvRn
	WoQRNuNGdjMmG/OmV3WX6W0TAdKxJ4ATz7INSdh8rsfnUo06oZWCrD9wkr4mdRoGOL9Nz
X-Received: by 2002:a25:aa8b:0:b0:dcd:5bdb:4aa4 with SMTP id t11-20020a25aa8b000000b00dcd5bdb4aa4mr19535947ybi.51.1709926907533;
        Fri, 08 Mar 2024 11:41:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnTnGLU933g+GlIynHXoQLntIlz3WclF6diipLpNy4RiMfiHoXNgH2oD0eOXspyPrK1QMeTA==
X-Received: by 2002:a25:aa8b:0:b0:dcd:5bdb:4aa4 with SMTP id t11-20020a25aa8b000000b00dcd5bdb4aa4mr19535937ybi.51.1709926907232;
        Fri, 08 Mar 2024 11:41:47 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id j3-20020a0cf9c3000000b0068f2d2f64d1sm50755qvo.32.2024.03.08.11.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 11:41:46 -0800 (PST)
Message-ID: <2407e9d6-7cb0-4b4b-bd53-816ea581ab3c@redhat.com>
Date: Fri, 8 Mar 2024 14:41:45 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: suggested website faq addendum
To: "Frank Ch. Eigler" <fche@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
References: <20240307195951.GE5062@redhat.com>
 <d0a99699-911d-49d9-b638-7a475cee0282@redhat.com>
 <20240307223803.GA25065@redhat.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20240307223803.GA25065@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/7/24 17:38, Frank Ch. Eigler wrote:
> Hi -
> 
>> Please feel free to provide a diff to the sources so we can look at
>> your suggested changes.
> 
> Here it is.  I'm afraid I'm unable to provide answers to the questions.

Thanks!

Public readonly repos are also up now:
https://git.coretoolchain.dev/
 
> --- index.rst.txt.orig	2024-03-07 16:17:06.726132460 -0500
> +++ index.rst.txt	2024-03-07 16:20:31.854901376 -0500
> @@ -16,6 +16,13 @@
>      must meet more stringent expectations to maintain the trust of the 
>      ecosystem. It is with this context in mind that CTI has been formed.
>  
> +    For example, the following demands and expectations are based on the
> +    following origins:
> +    
> +    ?                   ?
> +    ?                   ?
> +
> +
>  * Q: What concrete steps will CTI help with?
>  
>      * A: Some of the major goals include:
> @@ -48,6 +55,13 @@
>        infrastructure. Projects of similar scope and importance have been
>        deploying significant resources for the use of the development community.
>  
> +* Q: Are there plans to construct a feasibility-confirming prototype of
> +  the entire constellation of enumerated services for a CTI project
> +  before its migration is decided?
> +
> +  * A: ?
> +
> +
>  * Q: Sourceware volunteers have fielded requests and organized volunteer 
>    efforts that have worked well. Does LF allow volunteers to administer 
>    the servers together with them? Have they in the past?
> 

-- 
Cheers,
Carlos.

