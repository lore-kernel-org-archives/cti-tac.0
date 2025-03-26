Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1021F419D
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Mar 2025 15:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743003909; cv=none; b=nDSeERwe1jO7z+d/n6Ely358KUnPXisE0PHLA8MUf8cAp4OpycpAaceJT4VvAeyDsNi/3B5OHitaHYl93mfJJ0RjnlLRhke9tMSOTu9NcnBKRmlx6WlNvpcMIWQSYLeNqYuhK7f2Gmk5dSG8xVY0rVFGzluLCNn6KZO1yP+/OXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743003909; c=relaxed/simple;
	bh=u9okOg17qX/Oe2Z7Xrt8QBCg4KAbL8hu5J+dUf+u02k=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=tFo8aUIvscURsiH667eEpFTjzS+OzLROxX8I9JWnaQHesxcp0RwWy6R9J+PgbM1Ht6r/RR7VwvaYwppN92cS7UhL8gsGDtZARorATd7u7fBAI14Ym3ekmq8rGZnuVsei4/U3aen60KUlEuZrkB+A1iu54tMIP3Jh9gHeq1hzemE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AeCb9QCi; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AeCb9QCi"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D3384264D
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Mar 2025 15:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mVx9r3dBBrD3 for <cti-tac@lists.linuxfoundation.org>;
 Wed, 26 Mar 2025 15:45:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B6B9542461
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6B9542461
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AeCb9QCi
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B6B9542461
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Mar 2025 15:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743003905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=0zkkohg++O+/o4yBqHhxtFXgjzlhNQX4sf0qje4j/kw=;
	b=AeCb9QCiHxJE/+uZdlGSdjLAhW+npl/imhELJHgiHmpI6r0ncGaP7LJCxzLOMiIOnEX4jO
	UuyqQ6YqDwWPWyyq3WwpAHLLKh4qHgGaMh2ZTyTSmCxVdtoFcneCvSC1EypKTq2ta2r136
	wZ21zBYlwjzA7Dc/0e4EiGeJ+sBuC14=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-7EvUXjxxM_i3i3U-27o8TQ-1; Wed, 26 Mar 2025 11:45:04 -0400
X-MC-Unique: 7EvUXjxxM_i3i3U-27o8TQ-1
X-Mimecast-MFC-AGG-ID: 7EvUXjxxM_i3i3U-27o8TQ_1743003903
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4767bab171dso66986211cf.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Mar 2025 08:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743003903; x=1743608703;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0zkkohg++O+/o4yBqHhxtFXgjzlhNQX4sf0qje4j/kw=;
        b=adsc0FawWs+viYIW6L66NOn0nXnP4t4sJkwnt0L7WkGdKCxZxWdqXfWURN22y6hwts
         SLs5R0XXaSSKxr3t4+Hqizo1BFDB10zKDPlMV/QfjS3bARXC1UiHa0Huf3fkiAVUNyNS
         1TGdUuQpW2VbDenT01MjQlk1IQqT8aoT/y7gLRLBB/h47LDFEPPoDklKc3ViWvHnHNSu
         72+Brs48AGG3uyW3/V61RpBWhUJ7nB0cf6VJ6OmkyJSP0t598F3PqTzgrsUo/o8P0Sbr
         ORqbxbxVE2oSvFNZWe13WH+etvrz/TocXLP5Kc4PUJ+lEfqPBhhylw5oZ9XpuCISNxrF
         ygfA==
X-Gm-Message-State: AOJu0YzcC460a2uvoiOs91P3lZcmgmYz73zs3GeWo7oXsgUB/EtqoSnq
	7yQleCg14zybK3fQnaaKXM1n4Kuq91RrvG/OPth0vzAN2I8KUgNiQMb4J7ZsFTFw0uqGmGyJV5i
	5azjJhV5s2g3sRyKqA9yPuDAa24OeM+N01AjpuFc88wElky7/TS8XhXXgV1cphHrFoIIk9sYJUR
	rzjepFhSpqGEurjY6qZfnarzsP8gzSj0Fm0sO8u+WicXaYnD+2LA==
X-Gm-Gg: ASbGncuYk+BjEvv0vamj8m5OGQHsySQRUStywA3nLWbL5BnBf6pM7AGRuzXUkrdMVcF
	tTgulZ0fRt9ypozXguyhQYjP+H4leSTce0uLaYZtRN/DYYs7xDWQM+JGJR5DTQD3nW8rdieKLyN
	hC73Y8pyPSTIlmG95zFk4hby3W5DoRFZYvQdnbV8txk7Y1aqxpDV8+vuOVtkP9eSm0EbNXIABY/
	uHsom73BQRopfBjjcpvPc5rP1xldGvr+jgfyY5YZxfVpyauMPTJmCnWJFILPFAB20HYD7bzE4m+
	Cy8ZeowmzIhtIH69
X-Received: by 2002:a05:622a:2b44:b0:476:a6bc:a94a with SMTP id d75a77b69052e-4776e07f165mr3213631cf.8.1743003903042;
        Wed, 26 Mar 2025 08:45:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGjBCOUPJMbvkyz3u64k/QQy5Dj4PiNcQ36iLiOaY9CHS4RsUFScPpgOgi5a24WFb7ryPx4A==
X-Received: by 2002:a05:622a:2b44:b0:476:a6bc:a94a with SMTP id d75a77b69052e-4776e07f165mr3212911cf.8.1743003902424;
        Wed, 26 Mar 2025 08:45:02 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4771d51fd81sm72605711cf.51.2025.03.26.08.45.01
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 08:45:01 -0700 (PDT)
Message-ID: <5ebb8fa6-22ce-4224-be5b-6977b0bef8a2@redhat.com>
Date: Wed, 26 Mar 2025 11:45:01 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2025-03-26
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kMvgKWnTxJLq432MoAEZtgxw5QcNNw-2rXujreZ1XKs_1743003903
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

CTI TAC Meeting Notes 2025-03-26

​Present:
  * Carlos O'Donell
  * David Edelsohn
  * Siddhesh Poyarekar
  * Joseph Myers
  * Kris Borchers
    
Agenda:
  * AI: Carlos to find dates where we can have a meeting with Steve (OpenSSF GM).
  * Siddhesh: Started on the OpenSSF sliver and gold badges looking for hardware requirements.
  * Carlos status update:
     * Completed top level PO 1, 2, 3, 4 and 5 writeup. This is 25% of top-level items.
     * Working on PO.1.1 for glibc.
  * Was able to get through PO in ~1 week. Will need to put more hours into the writeup to finish by the end of the month to publish something. Otherwise I need ~3 more weeks.
  * Carlos: Goal is to publish something by end of April 3-4th.
  * Discussed the next items in the documentation and touched on the topic of developer endpoint hardening and MFA keys like Nitro Key.
  * Asked Kris Borchers if there were current OpenSSF initiatives around MFA keys?
  * Joseph noted: https://github.com/ossf/great-mfa-project which is now archived.
  Next steps:
  * AI: Carlos to get dates to send to Kris for a meeting with Steve.
  * Carlos: Publish the top-level and glibc level analysis for April 3-4th.
  * Sid to still review OpenSSF best practices badge gold and silver for hardware requirements.

-- 
Cheers,
Carlos.

