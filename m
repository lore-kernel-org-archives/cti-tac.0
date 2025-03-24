Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD80BA53
	for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Mar 2025 13:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821222; cv=none; b=A30rK+IEXHx/JL7hq63rnv0wbw0TS418ycwIddyRJwlEclt+MXuD9u4NU2kagoLrgUeQNL5gJ7d8H+8qgM7cIgPfjpM3Wh6ht5f6mfn1j4BSlN+yUZO7iH/n4ppw2qrnGgTrtXquTdoQ6neSvc7k86I7RCt0BT6+MEb6HA/tyQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821222; c=relaxed/simple;
	bh=m6QIrr9YhpPPNKXv/AF4TEBPGlIC8/Yomr9qZRIuTi0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=MojGwZ3y9OnLNmdjJtrcSyt6SFg0TfM8Dx8DX+IGe/OnI+raVuzXui8f4Z0IsE6d0lUkKdiUIwQnTdiNYL7t7pSTEjtXq9YJmyoBJXzIpMFjlQqbwXmb+7ySwh4ZXgZ07piadTRm+Nt79+LgJx2sIeHTK1ce52nd/SLqz+C9y6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HgtG7xtb; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HgtG7xtb"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDA7480E98
	for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Mar 2025 13:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIBqqDHyW9TN for <cti-tac@lists.linuxfoundation.org>;
 Mon, 24 Mar 2025 13:00:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 11AB380E97
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11AB380E97
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HgtG7xtb
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 11AB380E97
	for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Mar 2025 13:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742821219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=mOjPoLBemwjhIv5qZS++YPVJnbPzC1nMkUsFhJP5UhA=;
	b=HgtG7xtbGZtk+1Ozf4RpsDT2seN9nXZ8OjZdBTBZu8fpUPsRhB59BK0qxk2AoMTiq9mVxY
	wKhdJczGOowxh808Wuvhu1nSIGKNxb87JVmuJSCkq868y+fDmkF/II51uXt099UK+xCQpb
	tJQkw/qP7j97L7VGVEug1SiGxJfO784=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-ob8IunBcMA-AetnKnrA1kg-1; Mon, 24 Mar 2025 09:00:17 -0400
X-MC-Unique: ob8IunBcMA-AetnKnrA1kg-1
X-Mimecast-MFC-AGG-ID: ob8IunBcMA-AetnKnrA1kg_1742821217
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eada773c0eso140224466d6.3
        for <cti-tac@lists.linuxfoundation.org>; Mon, 24 Mar 2025 06:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742821217; x=1743426017;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOjPoLBemwjhIv5qZS++YPVJnbPzC1nMkUsFhJP5UhA=;
        b=SKuYNlaLjyEHdxZnrOf97O1ttGDPwoh8XZV1D9k6tsqwTfnGyH2SnqBkXvK5Yozqpb
         Zepf3dVM8iaoJB5wJpa4N4rRxcbPE3dSFG0CNlq3if+3puGVR6m6GePnhmq0CBoqaePY
         pbQacpU+4ojgaFomxgFV3ZNJNSGODDY2Msd3iy39V49wWMZoeA8bcscjdLHKO7QIpXT1
         Iv9vFuHpXJ+PlkKlmGGZPC62EhRYSK6eRYouW/iSzMCCv8BiGoqQUjhs96Z9XJySW2Ig
         d+JeAjfHblauMjxfRxvNBra9WJk+DAZlpF9kIocIZHdlqXfS4ndoKgRWvm4myVfYsQ+l
         YWZA==
X-Gm-Message-State: AOJu0YxinOzfNypcRHUkDf9xYj1M7cib4aJmxIivseoBRzkq/6ymN2vY
	W58pYZvqeNUZr2HyqXsgYuFLyyYaJeik3Ukv3Jghhj9qS/KZHwAy/8mcl6huPC0EY632bk7sabz
	INeGBbO+EhiVzsVUp1wbM2gSFIxOazyDNXN3hqP/VNkwouYNOkoFL96eae9WTTzvW3HNMwO5Uu0
	4pkQYUOmHSImVV40vgXkAx6oqwdRgkbCiRWvM9XMdhJhweQu5fuA==
X-Gm-Gg: ASbGncug7uMoGwbwR/KVT4Dooq/QpLbqrSj7xDdX+vOGyiY1En085vRRYziPNgP4uab
	Czzv0oH4SSabBPu/FrSfoiR1rC2+fKR7dNmd2T4/vLhdj0SYIFmLLbvlGgI6j56eyzBJ7NDG32c
	nqqfP9xD/H8Asd3VN7xNjI4gMHcrWHnIL67wWzHSvnHrT8Ura/QuEBbKIErN6WNE33SGWKeAfnZ
	KDszcQ9bgzyPcMJ44Gkw+td5pYE4s/3gUnsKtxJox4IQOhZGfMA3iGMrgMhMSSzrwKkKzK34fO+
	uZ8B7YD2/zZhOG3n
X-Received: by 2002:a05:6214:2a4f:b0:6e8:f99c:7939 with SMTP id 6a1803df08f44-6eb3f3b135bmr189508786d6.44.1742821216712;
        Mon, 24 Mar 2025 06:00:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKOUQyo986qnU9CHnHFIUuH1Cu81YgaEM1wXZhogdGvYh/AEj8pKLxcygjsxnonAWFPCxWJw==
X-Received: by 2002:a05:6214:2a4f:b0:6e8:f99c:7939 with SMTP id 6a1803df08f44-6eb3f3b135bmr189508066d6.44.1742821216103;
        Mon, 24 Mar 2025 06:00:16 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3ef1f5eesm44509406d6.28.2025.03.24.06.00.08
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 06:00:15 -0700 (PDT)
Message-ID: <a0c86a34-ab1e-4bfa-9b68-732c9d13f8a3@redhat.com>
Date: Mon, 24 Mar 2025 09:00:08 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: glibc status update - Week ending March 14th
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3dLwDaGaT7prt9iwN79PGYP8Nx1nqcg9H78Z_-vYQCY_1742821217
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

