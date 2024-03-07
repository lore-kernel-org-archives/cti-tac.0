Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177FB5B1FD
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709843081; cv=none; b=Ghy62ah6J32Zog7AErW8kBQsGRbllLFy3UDHpvXnHqiKt9onN0sUwQcIMOzPXnLIDoFwZNSdaj7N69zJgFy7YGatCee7Oma2EzltpLZukGNfOkpRrJBgv2qsFYt8sceLSoLXjdnvUNviCKIyPptU1+rEsOVKYdlV8k80Ji5KagU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709843081; c=relaxed/simple;
	bh=eZncCe2ZSHB8wv0jTZdQjQ4sTHnyEcpIoJUYT+K+Zmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GdpxE3x0EymmJw3RXXrzLx/cJ7qkSbBQZJuThacrMUf/60gwZk0N9YqV3dI/s4jgzAuMDVCYWpL9CGz+/+HmFbX9uaDxFwIVE8OvwGReGiH01DuN9pKSHUfKA/sxBrK5lldHj7CxmgFHr0c+2eUF0khY/uBT+tXsGnivSYcZXc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UA8RZnsb; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UA8RZnsb"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C957D40A58
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8JDYC2luSis for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 20:24:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29F454029F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29F454029F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UA8RZnsb
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 29F454029F
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709843077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0Tp3SrukcT6VdvX3tF3GBXkUYTfQF30jxdo6wSAfmc=;
	b=UA8RZnsblFUox7TvnfEDJik7WQ19MPcoHTMMW22GmiQZd84wCoz6hUfkxlBajNMsm+SNnf
	I/DpCg936JFgAWLdj0EJT4GGzHkd8JsdKNnKjFnqe58O/I4HRgR9nqA1v4uIycddYs0lEY
	W5fFbN6jgj5Sy1ECyZ8zKsU7bpVHoAE=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-r3ZIWU_eMRO9bTP5J5NiUQ-1; Thu, 07 Mar 2024 15:24:35 -0500
X-MC-Unique: r3ZIWU_eMRO9bTP5J5NiUQ-1
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-472f30b12dcso557018137.0
        for <cti-tac@lists.linuxfoundation.org>; Thu, 07 Mar 2024 12:24:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709843073; x=1710447873;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0Tp3SrukcT6VdvX3tF3GBXkUYTfQF30jxdo6wSAfmc=;
        b=DPLozn1XHwTchqcoo6y+8iRD+q/MhNHAFtS1XdbXvUpqQmk85MvU5RhNG8AINWY52/
         0KsrYr76HFmqGPGrNyxGlKTA9bzH7U8zNZcqe+UO/J8tHnFiUqwaoMsAgW0ZEcKAdEO1
         1okNVRoRNULmZX2y/pxpCUvNXlWDwgcPddjb8DOYPKWCSDw6JP+YE6o5hyp/iv3wCb8i
         8LbwRAV7Uc6fEEXYfKGrzJTw/MgTDKD8mmbe/lq0crSe7XtJmQTcKfLA1G1Rc73tr5zi
         +tmnid0Uz3xiQkr2hqc0qdtMeeJ4eCTG50qROoaCvZIq/HBCmtPuBMBWk+/1j5PncyUW
         gPBg==
X-Forwarded-Encrypted: i=1; AJvYcCUYwU+YgZEK3cRuuRQPs8UuhyaJfhfJUIpcFkipCtCPzqaSDuWAXNs5YmcG5NudY5a7rlJL5L7sdGViq0uwdUGmjI3sgcuy+onCNQ3WjtFUk8c=
X-Gm-Message-State: AOJu0YzSQkxMlW3gbpF1ZQwST7QQjnU8dqFdc9aZbAReQhwxM9PxwD4O
	iLoaZuegipbxqVHB8ETihWxxw4CYreKi8WZGzTQpzhKzzYSFAiZ2A0OZXRbHfW6hzShkLWSsBOm
	ZT1stpbQxg9/59/j1SJwBcKdA7Cvtto5wKL2cB/juhDQfEPgUrkC7RBXyhgY+pb0j+sUA
X-Received: by 2002:a67:c412:0:b0:472:e292:3933 with SMTP id c18-20020a67c412000000b00472e2923933mr8158232vsk.17.1709843073466;
        Thu, 07 Mar 2024 12:24:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5QFBZDcwf0QW1ZtqBdiNyUOdbYCvp+14hAVBOwQHQmYoqKp61urmYguBSGCNERVpdSe/kBg==
X-Received: by 2002:a67:c412:0:b0:472:e292:3933 with SMTP id c18-20020a67c412000000b00472e2923933mr8158219vsk.17.1709843073093;
        Thu, 07 Mar 2024 12:24:33 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id ng10-20020a0562143bca00b0068fbe6d38f6sm9053251qvb.54.2024.03.07.12.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 12:24:32 -0800 (PST)
Message-ID: <0f2f943a-63cf-4ed2-a202-4c0f1050aa30@redhat.com>
Date: Thu, 7 Mar 2024 15:24:31 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] Add a toplevel README
To: Siddhesh Poyarekar <siddhesh@gotplt.org>,
 cti-tac@lists.linuxfoundation.org
References: <20240307193019.4028812-1-siddhesh@gotplt.org>
 <20240307193019.4028812-3-siddhesh@gotplt.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20240307193019.4028812-3-siddhesh@gotplt.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/7/24 14:30, Siddhesh Poyarekar wrote:
> Add basic instructions to allow one to test and later submit changes for
> review and inclusion.
> 

Uses markdown, suggest the preferred README.md rather than README.

> Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
> ---
>  README | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 README
> 
> diff --git a/README b/README
> new file mode 100644
> index 0000000..f0a7f64
> --- /dev/null
> +++ b/README
> @@ -0,0 +1,15 @@
> +CTI documentation portal
> +========================
> +
> +You need sphinxcontrib-spelling and piccolo-theme to build html pages
> +from the rst sources, both of which are available through pip.  Once you
> +have them, run
> +
> +  make html
> +
> +To build the html pages for testing.
> +
> +Submitting changes
> +------------------
> +
> +Send your patches to cti-tac@lists.linuxfoundation.org.

-- 
Cheers,
Carlos.

