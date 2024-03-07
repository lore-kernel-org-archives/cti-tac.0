Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896F513699B
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709843157; cv=none; b=ZiwXUmZRFZOc3EuFJk/56r3ShWaCBY2ZNCS6af8ycAkjrD2P0cN7oR1zmIDCjByXLpRce5yTiPiTfrn12QTkwmQep2m17ikI1iLgsyq8jxe6onGLXeE20mfqpNxopr/Qm6kZo1Eg/kbV/RMoVXDVdkEQEG0Ty5XlgYaiczGe+Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709843157; c=relaxed/simple;
	bh=CSezo2G5InOfeJhTLIEbYgE7kxzokENiwF4u7ilo5Eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YGcrGaJgQB9jqLcE7fEu8jtNBkuJMcCcuC0aDbwABvci8X4nYg+rVe4jJe+TpsSnxAocRs0EF0EH2bvOJhMknyckqpSibiCF67Kp+/XiYgeo7hybVXtJUpvRIpi/EnoX5UyWhTGakwsBO+B1i2Ah1p27wZL9v6I8B/nrc0fv0AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H0Lts/qB; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H0Lts/qB"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 167AE6069F
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.599
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TCWr2x6gPlnt for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 20:25:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0243060640
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0243060640
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H0Lts/qB
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0243060640
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709843153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tv70uxjSTmjV7PVjTX91wu3jcbc6OBKFpOkVLuO/83o=;
	b=H0Lts/qBHhh2bKPIpBlvIp0KqrPtfDO0bFG5H5fqbvZ5RdzfYW68V8CKmP+4+MEpCjJNTB
	zf7L6E+4Yj1AyXDlCFAxM1DmPMzXoRxlKSglrfVqC4PArSvYF2FrsTtdfGplRNs+r5pUUG
	6augY7GokFVrFuGULo/i3nqAxcPTZpE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-uS75cvj-MY-YULWF6xHH6g-1; Thu, 07 Mar 2024 15:25:51 -0500
X-MC-Unique: uS75cvj-MY-YULWF6xHH6g-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-69046d68828so1166986d6.2
        for <cti-tac@lists.linuxfoundation.org>; Thu, 07 Mar 2024 12:25:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709843151; x=1710447951;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv70uxjSTmjV7PVjTX91wu3jcbc6OBKFpOkVLuO/83o=;
        b=EFAEyJyVlAUhCgcdkvvJnmXdZfbDbjRTcYNOBtoy3STINs+6LVcICGSTsyrc+3vGDW
         w8XGQRAQesK/7YTiBNokP2Wx0niPckcBKqF58KrQwyrRnnWLJ4X8MSdntTVvgxmMGiTU
         voQ6KWl04CptBBXPMlSp5fVcX2KY7qQKqvdjC5kMEjtu5kJTtFna8dacCrYPaFF0URwx
         HAR3k4l/LBFkz+t5apH8XxBQwPEhQsP0DKaxBWpOPIS3ZZTBA9qkbxyUInm1WXgO/txq
         NM6RTXYVULJu6siDCSa3pFnTOISwjA6aeocLU3q6NrlI9wwAbfm+R56agy8UD/OhztMQ
         Mr9g==
X-Forwarded-Encrypted: i=1; AJvYcCV4nOVm/epLiyh0e2oM6jW3DZ97Orzusy+9uii9r0Vc/Saz6Dpbbk9xtkVZIfqtsTVYlSR7FVsYTBoYxiUeQdbeAdOSewn8bD8to/SILU21BEY=
X-Gm-Message-State: AOJu0YzP5r1vOhEATSYjEPC68VOXus595GC9Hi2/7IcB5/nnWwK6Wevh
	oHofut6DaF2fbw8GUy3AM8fIhsexsfHJS3xq/R/yV7cCeGfQxgc3yktOMnJebO9trG6SJms5C54
	lwre4b5wUKcUyfto/YCpH/b/O+L/FQS6vc7UtDflwhA7+zkNtjo8YBjbDQcVsvwJEcZjN+iTxDN
	D3
X-Received: by 2002:a0c:e911:0:b0:690:5b78:5c10 with SMTP id a17-20020a0ce911000000b006905b785c10mr9682553qvo.26.1709843150908;
        Thu, 07 Mar 2024 12:25:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaxSOyk+nGR6UwtM2iiSvkxzEp7TDl4D9uY8faxOEfZUFfbMFU709GcHVSMEk3iaCZ2tb7ZA==
X-Received: by 2002:a0c:e911:0:b0:690:5b78:5c10 with SMTP id a17-20020a0ce911000000b006905b785c10mr9682544qvo.26.1709843150633;
        Thu, 07 Mar 2024 12:25:50 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id ng10-20020a0562143bca00b0068fbe6d38f6sm9053251qvb.54.2024.03.07.12.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 12:25:50 -0800 (PST)
Message-ID: <901c3254-9fa3-4714-b6ac-547bd1a7afef@redhat.com>
Date: Thu, 7 Mar 2024 15:25:49 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] services: Clean up links to projects
To: Siddhesh Poyarekar <siddhesh@gotplt.org>,
 cti-tac@lists.linuxfoundation.org
References: <20240307193019.4028812-1-siddhesh@gotplt.org>
 <20240307193019.4028812-4-siddhesh@gotplt.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20240307193019.4028812-4-siddhesh@gotplt.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/7/24 14:30, Siddhesh Poyarekar wrote:
> Use links on project names instead of putting them in bulleted lists.
> 
> Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>

LGTM.

Reviewed-by: Carlos O'Donell <carlos@redhat.com>

> ---
>  source/services/index.rst | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/source/services/index.rst b/source/services/index.rst
> index 84cb02b..34eba77 100644
> --- a/source/services/index.rst
> +++ b/source/services/index.rst
> @@ -11,21 +11,18 @@ The following services are currently being provided by CTI via the Linux Foundat
>  
>  * Big Blue Button servers
>  
> -    * Service uses BBB which is FOSS and LGPL-3.0 licensed.
> +    * Service uses `BBB <https://github.com/bigbluebutton/bigbluebutton>`_
> +      which is FOSS and LGPL-3.0 licensed.
>  
> -      * ``https://github.com/bigbluebutton/bigbluebutton``
> +    * glibc: Used for weekly `patch triage meetings <https://sourceware.org/glibc/wiki/PatchworkReviewMeetings>`_.
>  
> -    * glibc: Used for weekly patch triage meetings.
> -        * https://sourceware.org/glibc/wiki/PatchworkReviewMeetings
> -
> -    * GNU Toolchain: Monthly office hours for the GNU Toolchain.
> -        *  https://gcc.gnu.org/wiki/OfficeHours
> +    * GNU Toolchain: `Monthly office hours <https://gcc.gnu.org/wiki/OfficeHours>`_
> +      for the GNU Toolchain.
>  
>  * gitolite servers
>  
> -    * Service uses Gitolite which is FOSS and GPL-2.0 licensed.
> -
> -      * ``https://github.com/sitaramc/gitolite``
> +    * Service uses `Gitolite <https://github.com/sitaramc/gitolite>`_ which is
> +      FOSS and GPL-2.0 licensed.
>  
>      * Core Toolchain Infrastructure project documentation repository.
>          * ``git clone gitolite.coretoolchain.dev:cti/cti.coretoolchain.dev``

-- 
Cheers,
Carlos.

