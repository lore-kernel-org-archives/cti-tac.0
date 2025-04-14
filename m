Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D06727B515
	for <cti-tac@lists.linuxfoundation.org>; Mon, 14 Apr 2025 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641727; cv=none; b=BbgHpEOiZQvf8Sbe6T7uSrpRQd67AP4mF8i/ex++yUZDSrcAmfFbLnHK6Tqyv2/3su6N/0cI7zUEqgVRt2XZvfo1Cgkd2hz8zII6X6gBuPRo/dxYGMumGR8V0+LFx2TxmERj/wJiY3ifjL8cXnHNtVidQKZXNvY7JA0wvddfA0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641727; c=relaxed/simple;
	bh=m6QIrr9YhpPPNKXv/AF4TEBPGlIC8/Yomr9qZRIuTi0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=U9N/vpx5cHyrLNMMlt1MSdZEMeiQIH63cqOEo3P3Wcnp53GQJEmxXqXP12v+eolUj/DT6O2HmVsLDvx0Vfw0SKjF6q4h9v+0fDrceryevyab9l5YH82ohCQBjDl6wxpkICQWnOiNUTMDny8Tn8aD4NMBdLzxk4H4HLpMek8wjtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gH5IP/HW; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gH5IP/HW"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 111DC80E53
	for <cti-tac@lists.linuxfoundation.org>; Mon, 14 Apr 2025 14:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_4StWnzdQvH for <cti-tac@lists.linuxfoundation.org>;
 Mon, 14 Apr 2025 14:42:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2288980F17
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2288980F17
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gH5IP/HW
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2288980F17
	for <cti-tac@lists.linuxfoundation.org>; Mon, 14 Apr 2025 14:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744641724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=mOjPoLBemwjhIv5qZS++YPVJnbPzC1nMkUsFhJP5UhA=;
	b=gH5IP/HWGNwQwN1ARZ904QJkf3cIlS2VQw0bzy7kusfvznWHy7J3HYv9nHAc+KlvOeW8Ll
	jRScDGqDdg7CW95BIJZ187hoWHvm4+XBWuxLsz4okXf43Tm2rXPnUZdnvZ2VFlEZXzpwjB
	7HccHGFG/0eyvyZ5fwv1vpa37cyQnRk=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-nSYy7EqAPxO78-tw6wnOvg-1; Mon, 14 Apr 2025 10:42:03 -0400
X-MC-Unique: nSYy7EqAPxO78-tw6wnOvg-1
X-Mimecast-MFC-AGG-ID: nSYy7EqAPxO78-tw6wnOvg_1744641722
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85e15e32379so376316239f.3
        for <cti-tac@lists.linuxfoundation.org>; Mon, 14 Apr 2025 07:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744641722; x=1745246522;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOjPoLBemwjhIv5qZS++YPVJnbPzC1nMkUsFhJP5UhA=;
        b=keIRSCzapqB+GAaUD6K1D9t6/5UTNTpgDIlmDpEUtO9x8yz+sc4PJDXMrJmTGPwrxi
         QD0Tbpu4Vd0tz84NoHjyANkSHKlFkx+W+8JiuflHenTk0Y7NvkkzKE8j11PFeICl9qOT
         aGePB1ErMWP5ujKf2gaN6R4jqIOXb6xIEbaqKvL1ftQWKhT4Z8/W4YY/UWELOWW9gFf0
         KCWqESNc/eaIHY5ekgztHyBbVS+V3fkFmnxwFLnWKsBHILC6zJKsbAiiUa0y4j3AZIu9
         DegJL1bnUUWg6u0gvYrkTFxQp4zGRm4lFJzAbtKu02RneVEwyS4uGGknKhQK3l/Am/aF
         nG0w==
X-Gm-Message-State: AOJu0Yxv33k8VstcPEgBki8mL+DYcLkJ4YBJhbVa76KkPS67VdRfq46N
	W1f0rzN0bgPQWnr3XMobeBYO4a1/TLN7i7YoVsWg+dGJSsx/bgPAtejY+JEmsrb46i0LJyDMn6R
	bh2PedSuJqEG3a1ZK8z4DCnLxloAbcmS9oLCEN+Q3sjcT1VqnYjoTi9nXaadjipuTCqHAXHdxxA
	Jr4qg8Icu7Z0KKDJqecSHNYr2q7U9Zf7U+bsEgD7HetmgKB49xwg==
X-Gm-Gg: ASbGncspCSZ8tpRRunLtR7t/ovMSNaTPWm3Ugu+dSLOOkHGxEuyUMAMQrJ3laNRKC9W
	c7iiO6Y4VHL/52Pi/w/piEScrKt11Q/jVQAvtcBMg/kj3aeiXD7y38wCcRztO/2D2dnlQV1rVYt
	Z8vL89n7biPepuIdo4AnKsxHzOb4breYb3+OK46t9t6JPnPhZdvOusPHbpdb4ELkZcb8LaEzRsU
	ejU3kVfF2jnbC3LACPpU5MkjHGhmibtIlj1yh7ckZpbLyzF3124MccDgsCFwmexUTXfKUnFpYGz
	NV30N8MdHNQN
X-Received: by 2002:a05:6602:7209:b0:85b:3885:159e with SMTP id ca18e2360f4ac-8617cb0f2fbmr1342983239f.3.1744641721868;
        Mon, 14 Apr 2025 07:42:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5SFwe7a2ja3B+uqOggd4M1axuL19eCj4Aj8KbROT+BhDGZ42tDL7QEPdWTbKokidsPThEIw==
X-Received: by 2002:a05:6602:7209:b0:85b:3885:159e with SMTP id ca18e2360f4ac-8617cb0f2fbmr1342977939f.3.1744641721256;
        Mon, 14 Apr 2025 07:42:01 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86165437230sm213005039f.21.2025.04.14.07.42.00
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:42:00 -0700 (PDT)
Message-ID: <3bb38c9c-5cb3-48dd-b951-607a0beecf05@redhat.com>
Date: Mon, 14 Apr 2025 10:42:00 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: glibc status update - Week ending March 21st
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 52BDd4o9x0iVY11731Xq8_EhvCJHi2qhprPr64GyIVA_1744641722
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Current status looks like this:

https://sourceware.org/glibc/wiki/CTI
https://sourceware.org/glibc/wiki/CTI/Policy/glibc

- No progress.
- On vacation for March break with the kids. Back on the 24th.

-- 
Cheers,
Carlos.

