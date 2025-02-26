Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D71F7464
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Feb 2025 13:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740575818; cv=none; b=lHbo/JGLQhraOyoiXbGRUOlfWa09Xb99rgjLT2KuXnvlw87gQ44t5sD2OZbcdzUJRFY5YuW3Kj14anf7uAoNMt2QhuZn5lck1TlRp2KdIqGcpHWLcIgSDqvLQiByDIYBI7BErK9x4qon/IrjTSrXwVwPgPWR4qf5tLDAy4wlzf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740575818; c=relaxed/simple;
	bh=BeHu2qbyvtL+Q+6k2SCeCQLHG66du3eQoxyuwTD91Kw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=QpyI+fN96mh+9M9y4Ke9JM4T/jDeEiVzKGkr+G2/El9gKeTstqv178yxv85Jl/jKBagqrGnSmravT1RGuYQbyg2O28GhuVDOGH46IFhSdRTLBuuWUmDbD8Um/aDAyK0Rfr+aIVfY5qyt6EnGZZXR3eO2gVeWIXqGM2ftCRwSZKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M8bnhn7U; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M8bnhn7U"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7DA582C18
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Feb 2025 13:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rjz_TIkhvsZ3 for <cti-tac@lists.linuxfoundation.org>;
 Wed, 26 Feb 2025 13:16:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE14F81A65
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE14F81A65
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M8bnhn7U
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BE14F81A65
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Feb 2025 13:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740575814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=/kmE6HMNyKZ1ezZ7HZ1FRdfDGg2FIMGYLJISlsGn6nA=;
	b=M8bnhn7ULczugsHlkbySFgYWXm4uJeSjxowXxyHZ+8GekemIPbpeA6Ko1SKToz6Gxn+njn
	hSRyiCr6n/m+fZf93An3KXXtKaAlfu+u9xK2fr/4r9oIwlulWf7+m7AbjJzIIzU1TU946t
	Q17GRNjNmAKrDUksnxKQe0t7vQLiFrc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-x8qHHr9wNEa9JS8G8SXoFg-1; Wed, 26 Feb 2025 08:16:53 -0500
X-MC-Unique: x8qHHr9wNEa9JS8G8SXoFg-1
X-Mimecast-MFC-AGG-ID: x8qHHr9wNEa9JS8G8SXoFg_1740575813
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e66c51e5e8so123018886d6.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Feb 2025 05:16:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740575812; x=1741180612;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kmE6HMNyKZ1ezZ7HZ1FRdfDGg2FIMGYLJISlsGn6nA=;
        b=pQmU7z45MjA0aTBd0s8qrQ40Dtm2GMPvLUYr4pnAfYNo8FQRnXdO6IVMr1g9LA2jDf
         JQEa00rxAab95246yIc5AC2hSfmZKyTQ1zuIqDPzbdGAQ26Ux+g69+aQqVxEYJKrBNyF
         PzPg1MeVcEu+HpLQQnj3YZO5KdyJ6SO3WsZw/IWiloHeWTK/W/4/a5i5K7yr6AcK3+C4
         2hzNU2kRn1jU4y/6x98CZ8JRR6nP5iLWZUKFMdrf/WsIi4jrAXE9MjSl6lyfrdxOKGP7
         YCHBUM/Qn6xv+VpE5IGK5xDEf030zm8Qv65Q5Nh8TolbkAwwSjgpEm/GMMp1GKFs4MJu
         7leg==
X-Gm-Message-State: AOJu0Yx6cMm/fvwLdhniWYduxCmGOHj1j9KYp8me986eLLWhc8MW73bm
	teu1Jr1KulybS22AW7ywCBI6dhmsEb8wKC4dX8hdPYa1/kOPcd0FaCV80IVMesYg7weEsANTw85
	S9vlb8Vv+ha97JollSS9oeG3DO6yfwqnN7nlr8tgiZ/3gJzZaM8oAhLBwPj9lPXW9MsCbSag/V7
	gYzEsed4Zx5thzueDAMp8nDjVqpLq+pgNC3r/iVRst7z57AYKugA==
X-Gm-Gg: ASbGnctE3887qbM9RCoTPPKBBWVEB20n76XVNZewCIv3uxre2KeVViisu2Jz+14IDBP
	vEhTdzZ48kYCcPP/Y4LJxPIbfJ6CgfSFi5tGb+hUfWs+yXxgsj1nTSmibsg29w9X+L9aauoSAv1
	luIoXTkv423q48UwkbSQ60I/ubIST6nShjNFeAqiBgDcnrK2KQPBFL1STNfl9Le1bmzOcNhRte1
	/0pf4/0rxd1U5VEx4fWMtvNg9Zkv1ZnvRAWU6621pnW3Nae1qo3BIE86Mb2ehjF9Svc84ViywAo
	YOWPdHDypsNO/Jsc
X-Received: by 2002:a05:6214:d8a:b0:6e6:64a5:e18d with SMTP id 6a1803df08f44-6e6ae7f8290mr288162866d6.17.1740575812614;
        Wed, 26 Feb 2025 05:16:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE22Q7FUCo+M/4jef8FDdEEwAodrj4bpyKtBO2Rp9gI2Im5LoCydPGAvKjyZ3WNt0IelLTtmw==
X-Received: by 2002:a05:6214:d8a:b0:6e6:64a5:e18d with SMTP id 6a1803df08f44-6e6ae7f8290mr288162606d6.17.1740575812278;
        Wed, 26 Feb 2025 05:16:52 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e87b17194csm21692936d6.97.2025.02.26.05.16.51
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 05:16:51 -0800 (PST)
Message-ID: <7058f3a0-0068-4c88-8125-17158058deb5@redhat.com>
Date: Wed, 26 Feb 2025 08:16:50 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: glibc status update - Week ending Feb 7th
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m-T6Ch0VLF3L_eO6OblYI1I3gKKrUceNIat5eSUN3OA_1740575813
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Current status looks like this:

https://sourceware.org/glibc/wiki/CTI
https://sourceware.org/glibc/wiki/CTI/Policy/glibc

Didn't make any progress this week.

-- 
Cheers,
Carlos.

