Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A76F1C6FF4
	for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Mar 2025 13:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821215; cv=none; b=csaFntDGpf4vCQjbYpGYT4oemnHrSx0jtBy568LUM3l62wU9skIK14Z6IQfhHBraesl5R1+PEXR9O7xKpHc35zfHRnuzLO9qWsmng+CEuX7QC0f2KllRgGc6kbmhGR/8DMaZHAKITqnT8X6zo8WgZxze36VvKIjKGqk0aMPN248=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821215; c=relaxed/simple;
	bh=Zoyax7ZgxaLie+25+50mXFSnPesdw/ne2+5vac/fCPw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=NlDQMR1xayYblRUw5N6JRtgIKYhvIfeZz8YpTwqSN+KNqUO3dZaawoH1jVQWav6XJOufYy+0DHJZDEE7NyJM/JrgJbNeHs7CbNpNjP0p5Fu9tWsAVhSuowvk120/JM10b0gOM25ZNwfvruDMwU2prMFtz8/+KoPAQhq5NtSowTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eyMM5/zP; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eyMM5/zP"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 871DA60BCE
	for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Mar 2025 13:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWn15RJaPx-o for <cti-tac@lists.linuxfoundation.org>;
 Mon, 24 Mar 2025 13:00:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9959560AE8
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9959560AE8
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eyMM5/zP
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9959560AE8
	for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Mar 2025 13:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742821211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=CzzH10eQPmELT46+H5gyXWOTbT+n3UaW/fh7P3ZkPm8=;
	b=eyMM5/zPpM4T7C6rKGDxMhdfCy2aDeICWQI/aRRUizbuVe6Qcan0sxUHeI9SwJogJiqUbr
	2SkYBqr+5bVScDYP+yohMVsPDQHxJBsPqhZMCzt9DkEueDAGOM6SDM4xIC+XLpqTvXPLpW
	W3kX5Y9YEgDXgYhDVcUsclUSGz/BOnI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-1MrrgTNqMGGtOXKIVQIw7A-1; Mon, 24 Mar 2025 09:00:09 -0400
X-MC-Unique: 1MrrgTNqMGGtOXKIVQIw7A-1
X-Mimecast-MFC-AGG-ID: 1MrrgTNqMGGtOXKIVQIw7A_1742821209
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e913e1cf4aso115847336d6.2
        for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Mar 2025 06:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742821209; x=1743426009;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CzzH10eQPmELT46+H5gyXWOTbT+n3UaW/fh7P3ZkPm8=;
        b=MFRK9+uGk1newSAmpheXP9AAXMWCsapwPog9CuU5l++WCF66YU/Sq2M7mG/Zln1f7P
         1I5YRVXYtWIE1WFxNmRvmeWXLBrwLVRSUc7dcMgctBBfGI4FcSVRF917CV+UmkmxfEUD
         1PBQ+WzUNHcErEyn5TmAcyXpQHodSnXH+2GZ6DfcyvTvzS/0rfggdclOV+egKI7z1NJd
         L8zwqW2W1qQbjEOFK1lofhIj3BAJNtRIIhHbF+JJBF0irjHb+9zqGkB+CB8j85WsKDJT
         wf+Zbwsyai8yKoP5MrRQwrjUH0+l9YHx0w2yxE7rNOnlicOn563Hfm0LOKUriFx/jRA4
         q0zA==
X-Gm-Message-State: AOJu0Yym0BZ2przSrfCE5WpsWLycvTuNi+f7EI+ZsV/SNsS2Beum+U38
	SxSecmNRryQOEquRXg9Lc/8SX6YOqCm2ABaHdRbmmPhkrDqMglw1At3PQx/3ZoGTmsufNOXHnZi
	te0pefBIFrejG2Tj57D45agoT4dk8OPgWJ3vcxkEQFuVSiZtQYzGUycj7QMWh0D8zYiBOyIBr9I
	0UOOt5LdGHlJxSrDTw0Lva1v6XjSjgcUGCdBPScvnaWWKaZf2zQQ==
X-Gm-Gg: ASbGncuoWAoZziUw4YXO9bPXRGuDQ6Buu5IHZku0rAfFEb/TD27sfelQ1IHUnbkvHJc
	nPv3ME9ccS9c6t/axww3M6Kgu7bEjNEP4K1FlvhRaJUigEERDVAbGxVEDzONKGkH7egpUSyD3Xb
	XhANQ9ZRIe3U6g8ueQ1CImER33R37lquX4aITzxwV/sg72k5+KArSfZlmG4OBcTtmUDL9ukL0sT
	D/NeNC8iqh9qtzBnftW+wCOtjdX55eaAS8N0pWfJmfIOuRM7tXWf2l8o37OE7jT5mMz5qSgUALI
	ObXrIXHkfMcD62U4
X-Received: by 2002:ad4:5aaf:0:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6eb3f2eb079mr189783196d6.22.1742821208866;
        Mon, 24 Mar 2025 06:00:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb0DQ9SdwhvyjULdqiD8VhMvN+1ty21h0w4x1NiMLK8abTuPkJjKmHjakKDFrTT0TuCNOkew==
X-Received: by 2002:ad4:5aaf:0:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6eb3f2eb079mr189782616d6.22.1742821208326;
        Mon, 24 Mar 2025 06:00:08 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3ef1f5eesm44509406d6.28.2025.03.24.06.00.05
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 06:00:05 -0700 (PDT)
Message-ID: <05327f73-c619-4e7d-8718-b9b8341c3d60@redhat.com>
Date: Mon, 24 Mar 2025 09:00:05 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: glibc status update - Week ending March 7th
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IXndmNOJhLPAXRiifbwX6wJ5demDmRSUsi3rcGDHAUo_1742821209
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Current status looks like this:

https://sourceware.org/glibc/wiki/CTI
https://sourceware.org/glibc/wiki/CTI/Policy/glibc

- Went through some of the internal roles and responsibilities in the
   existing Savannah and Sourcware sites.
- Wrote up some text about them, but removed it, since the high-level writeup
   is about GNU Toolchain requirements, not the current implementations.

- Wrote high level "Implement roles and responsibilities (PO.2)"

Next steps:
* PO.3 - Define supporting tools (high level)
* PO.4 - Define and use software security checks (high level)
* PO.5 - Implement and maintain secure environments for software development (high level)

-- 
Cheers,
Carlos.

