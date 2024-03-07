Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4068E13B288
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709843207; cv=none; b=YPb5hEh6TkEn5vaqpJFX/MaymJ5ESIW4XrLs+RAAvAuCILIpYNt0VIrxnA2kLiQKhQzIjVYB4XEFwg9kiaJsseOiFClnWUuBQej7iT3kgRikY+B+I+ntGFh+sTJxlT5tOJiPk3XhgcR/WnHh2Ynfc6PoWLvYSrcFt4vs5j6Nz2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709843207; c=relaxed/simple;
	bh=Ta2J02oT78sm+7l33tNVPaSLxz3H/B76fVMMhWVfp50=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gJG075uekH81BRsWei16362HQ2cAPPtnVV5mjaesWt7a3APhIdq+vqKsSYmCmqCFD9Wt7+SvFLuEWldovRLkbOe+bmYDen3Go7ysmEavP2O0BQS04RSyxtxamxaKoSdOrI8qDnL0vlroi+WiufcLHPA8+izL6v1nVxfW/S247g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pg8rz7Jz; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pg8rz7Jz"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BC0081F07
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BN9QW7fuqt1A for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 20:26:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDE3B81F03
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDE3B81F03
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pg8rz7Jz
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CDE3B81F03
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709843202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hyOj13gBrlGZ0d6uLVvQ4bvrIRy/gYaIsuubbb/vcwg=;
	b=Pg8rz7JzQD2ePKcld/rtA0t09SzRtvmmPtPlput3rYhmvz1a4ae9f42+N+Ru+C1ZBLuYIJ
	rlIep+pHRRO/yZ59P0T+7NSbRSMk2CCs34uw5rZ/PC/eVwGVssZMH1fxrwY/3+3o2CXER7
	3R83IiH5ozq/pr/FvwEZzCIo10g6TBg=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-pG8YZZpxMO6HsjDzw3DXQg-1; Thu, 07 Mar 2024 15:26:41 -0500
X-MC-Unique: pG8YZZpxMO6HsjDzw3DXQg-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3c18df0db21so93035b6e.3
        for <cti-tac@lists.linuxfoundation.org>; Thu, 07 Mar 2024 12:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709843199; x=1710447999;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hyOj13gBrlGZ0d6uLVvQ4bvrIRy/gYaIsuubbb/vcwg=;
        b=bh1GLHe7FL+r+OSogYJZ0yzbwSxUg15dUDobmjykSpJCb1FKzL1NReJoTxd4tzb65N
         3WQJiytlKUeWM9cny4pMBJ8VvRnY8bGxGWRRWEHFWBwybwb7fYOsb542R2aHiuW/HHwI
         wEud8tWEBOlhoUYl4uDtRmRHavBABXig79Br1hFlX76Qy08Thu4o/xfSHJU30QGQF1JB
         y0uMELvQXoBUXho4pDzaSB91Uof1TgHWkF5Gr/W01hn8Gs7mWZ3aF2/O2dOtowBV7N7a
         81n5CbXA88Cxn0t0+FRpGm49gV0eDZTt4LLW8+lo+zH9ljf6Sw4oa//0iBX40enIr4Fa
         p8Yg==
X-Forwarded-Encrypted: i=1; AJvYcCW3OHp4inpPwJkEGwJN2aufYD5DANkLbgM15C1fFrjeFuHb7CaqqvBB6y8z+S7h7D/BVKY4MOsW82axNUlOls0m4fuLeuzQCyEBB5vo/8YbUKw=
X-Gm-Message-State: AOJu0YxSaHcOEYZB2yTugacdAOwtnY7ujePkOkrrwpQJsx7Y5I647iV4
	VV3HbnAn8YLy7hEJdpxI3K+pX973EcL3YmRMrusv53+KrLMlQ/g/gwp9yjAZdQq0qJ7YOugWgA4
	GpwXTsVR5335AeXbT0B6PMCtXRgHbF55tWzMBeyrKBIBRVU+QaJVPp53HYLZM6r+uFEJCS3Yzza
	nQ
X-Received: by 2002:a05:6358:3423:b0:178:6211:871 with SMTP id h35-20020a056358342300b0017862110871mr10288089rwd.0.1709843199768;
        Thu, 07 Mar 2024 12:26:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/jNYQG5phPekQ4FXQc/OvyFtkacCaJfhxUC316Ec0XkxPt3sJ5T8m55RdbDOgCPRvG3N+Jw==
X-Received: by 2002:a05:6358:3423:b0:178:6211:871 with SMTP id h35-20020a056358342300b0017862110871mr10288078rwd.0.1709843199531;
        Thu, 07 Mar 2024 12:26:39 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id ng10-20020a0562143bca00b0068fbe6d38f6sm9053251qvb.54.2024.03.07.12.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 12:26:39 -0800 (PST)
Message-ID: <17bf1401-cc23-4151-bf0b-718ed31fb9e2@redhat.com>
Date: Thu, 7 Mar 2024 15:26:38 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] tac/audit: Minor cleanups
To: Siddhesh Poyarekar <siddhesh@gotplt.org>,
 cti-tac@lists.linuxfoundation.org
References: <20240307193019.4028812-1-siddhesh@gotplt.org>
 <20240307193019.4028812-5-siddhesh@gotplt.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20240307193019.4028812-5-siddhesh@gotplt.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/7/24 14:30, Siddhesh Poyarekar wrote:
> Subsume the sub-bullet into its parent and fix a dead link.
> 

Docs change is OK but HTML change is not.

> Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
> ---
>  source/tac/audit.rst | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/source/tac/audit.rst b/source/tac/audit.rst
> index a47e4e3..119f7c6 100644
> --- a/source/tac/audit.rst
> +++ b/source/tac/audit.rst
> @@ -7,9 +7,7 @@ technical requirements of the community.
>  
>  The audit will cover:
>  
> -  * Reviewing that services cover the current requirements.
> -
> -    * Includes security requirements.
> +  * Reviewing that services cover the current requirements, including any security requirements.
>  
>    * Reviewing that the services are being provided using FOSS.
>  
> @@ -21,7 +19,7 @@ by the TAC to discuss these with the community and current service
>  provider.
>  
>  The CY24 audit has not yet been conducted, but the audit will review
> -the current `services being used <../services/index>`_.
> +the current `services being used <../services/index.html>`_.

This needs to work across documents correctly and not assume HTML.

>  
>  -----------------
>  

-- 
Cheers,
Carlos.

