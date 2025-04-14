Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120A327B500
	for <cti-tac@lists.linuxfoundation.org>; Mon, 14 Apr 2025 14:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641721; cv=none; b=GMLDDRKB+7VKtuqlgIiO3cGLXxB4KL8EKrIyZYWnEIxeO13Jq2m97gHoaS/WQYKoCO1s6wZqEZCtWklDR4iX7+gyZJffMW5c9OeZ6x3ww1wlMFuNnZj94g39qpE9YpRi8gtjYwvBZz0RWd2Z0+7fgIU/0Gow28VBX4dugBxAqYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641721; c=relaxed/simple;
	bh=qFyGsXKW0JyaBcgAyq8wyGhAXTdwf6hv72NYMz0VXGQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=aVrFrls0BpgEEmeqo0zwYf5w8IV3mYgxWiP0/X4FLRWrQvb+1eO/TsI0bo+T82iLr4/x4iK5IeydAYfXxL67MJLQinE3qiGMx1NHnYm1osn+Oh2n0ZWG7v4YaeYMfRJBVYhOqJnR/1PcKDaW+OH+rbkVWfAS+mPDvSx0hkYg56A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eMRggOHX; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eMRggOHX"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABF4061171
	for <cti-tac@lists.linuxfoundation.org>; Mon, 14 Apr 2025 14:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHDeVP3Eg5z8 for <cti-tac@lists.linuxfoundation.org>;
 Mon, 14 Apr 2025 14:41:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D8B8B60608
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8B8B60608
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eMRggOHX
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D8B8B60608
	for <cti-tac@lists.linuxfoundation.org>; Mon, 14 Apr 2025 14:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744641716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=iT4SNeqlh7Tm2xQTCbNNEXGdC+0wpp2xx98CU9r+uSQ=;
	b=eMRggOHXLkAdaF3x0EHYxdwU5YNKBUVLnfnSJVSVnEROeMbjWW1PK3rxclhcFkBuKGXJ7U
	du4W2Cq4J2TXVawe3V11WeDeboWHr92rQ49+P51DESRn+FWZw/azHSL9Mc7nkd3ny8CEjQ
	+JGChdaVZS5nc8eedQf6lrDbMv+QyZA=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-oBO9Yhk8NSKgGARIy1yUjA-1; Mon, 14 Apr 2025 10:41:55 -0400
X-MC-Unique: oBO9Yhk8NSKgGARIy1yUjA-1
X-Mimecast-MFC-AGG-ID: oBO9Yhk8NSKgGARIy1yUjA_1744641715
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b3827969dso397661339f.1
        for <cti-tac@lists.linuxfoundation.org>; Mon, 14 Apr 2025 07:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744641714; x=1745246514;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iT4SNeqlh7Tm2xQTCbNNEXGdC+0wpp2xx98CU9r+uSQ=;
        b=paqnzTfo9vXOzM1lbVjxGeyQk7zg/ZT9rg9pPMfEsF+5u2YAIgF9o1Rvj4vCQHMiBb
         l4MswdOe5EwPwjcjTZgkeN1aDYWNAgBQqzZfdC5K8cyWNJccjLNz+d99BckgfUXqGQps
         PGiI0aHb5a7lv9QXOdFSUwU9PJ1LknlckWZilqTIsPmiGCIFkJJNRNW1zE1XjG4z9UOl
         A919uNIBj1ZSvL+8+qsAjWnAlbkfokJqIgdZPCj3nwPuHZKdoKV+pKBLX94KBmsLbNzF
         wi/ozvUHhKTSaMM1YQmhg1vj89tUmMfCbICREEOQi5rTaBb57e7sh85cjjvDmNWmfxgq
         CK6g==
X-Gm-Message-State: AOJu0YyKUBtZSHFM5rBX65Kn88/K0HHya0uVNT/G3y1XGwR3S4WVozD+
	EcjyzkYdsL/GTYClIUZpylR63RPozyRE34WLOoSkJJNq5eQ5MxTMToNS2AS/dW1aJMngxhpQ5Yx
	D5HmxIAZ4CII3cU30+CTr21WoeCFhVeIJsZg2mO5Er6ZJVa+FpMFRhqGxnxQ/ULH/t32EKK0YYF
	EDkMfhLB/YYG4FlT67oX1HuI0Fb/095I3rrvlVNlNE2sEz7BYm+g==
X-Gm-Gg: ASbGnct4S3v/eyis1P7AHUs6Yghi/Ivl6EUFy9mW5pJr+xZueNDFsAw7qS0mD2rgwLN
	mY+0OwILmRsZLA0464FrvY+i1kZARoes6rYD7iou5d8rBTG9l58nicKXjoETJlO8P+dtkoFwcc8
	nmC2tthpwm6Yff/gZw2ip5OyLwYInqAKYI/dzSOrGB8aIoF6Kk7HzejVEqbxGaMfx37+MnblIrD
	RObEWxe3EHr88/teMzxhnRWGNRnwhjoWil3KTTDyDooMi5tlNoUN3mB18l8XYw+rljZXlFBqLin
	woSEb+w6YrQ8
X-Received: by 2002:a05:6602:3609:b0:85b:3f8e:f186 with SMTP id ca18e2360f4ac-8617cb76f9amr1595243239f.6.1744641714270;
        Mon, 14 Apr 2025 07:41:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSNFpgEOEB1tBcZTEFDm77iEW4VYKEYG7F/EOY+Hko9gmONK0BsVvZF1pA3QbcntDstVIX3w==
X-Received: by 2002:a05:6602:3609:b0:85b:3f8e:f186 with SMTP id ca18e2360f4ac-8617cb76f9amr1595237239f.6.1744641713711;
        Mon, 14 Apr 2025 07:41:53 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86165437230sm213005039f.21.2025.04.14.07.41.52
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:41:53 -0700 (PDT)
Message-ID: <3ce61df0-f4aa-4234-9e3f-751a79dfeee5@redhat.com>
Date: Mon, 14 Apr 2025 10:41:52 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: glibc status update - Week ending March 28th
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8QFbuyc9cBhF8I813jv0vL_ySEQIwCy6ntL-rzYZGtg_1744641715
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Current status looks like this:

https://sourceware.org/glibc/wiki/CTI
https://sourceware.org/glibc/wiki/CTI/Policy/glibc

- Working to finish top-level GNU Toolchain details and tables.

-- 
Cheers,
Carlos.

