Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65022175BF
	for <cti-tac@lists.linuxfoundation.org>; Wed, 27 Aug 2025 15:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756308589; cv=none; b=C0hnyLgHqTmGdDSo9mosJl4kZtUNEGKQosOdp5GwkbOZWQNJDfHCMph5H2szYETANlFxjMOrwv4zfABLKZNBCfR6we7ckRyjWlCT5i3bWUTcyLQh8LZNYOFHkbgX2IVIkGwcrfuYTO3xDlMFoqqLPobJhMPXN1S+g1pHdLXHX+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756308589; c=relaxed/simple;
	bh=UKNwQSIEudAXZUurnKLx2mnKf3GhLTirIOBs/vO0nzc=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=CG677ey+rgqr7d4UDx2zz8dUftfK8tNmCjtIhdXh6cSCaPZ6Pg4r/eK0s5VEQ8s/g0qxNRuA6FgLijV5al7coUgNzT4+ZTavYjkzlC4teH8bxCt6vpP75r1tLO1qJxXm7j26CKh6UuPsOLErpOtBi+FKMX+8wpGMZxLd2ocscFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CQ+0VkFs; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CQ+0VkFs"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E6B460E32
	for <cti-tac@lists.linuxfoundation.org>; Wed, 27 Aug 2025 15:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZfM7KWxY63q for <cti-tac@lists.linuxfoundation.org>;
 Wed, 27 Aug 2025 15:29:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 229B660C2B
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 229B660C2B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CQ+0VkFs
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 229B660C2B
	for <cti-tac@lists.linuxfoundation.org>; Wed, 27 Aug 2025 15:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756308586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=3drqder3GWbHmqpAXHhkClzWB4xWxNCGqM1WpGhjXeM=;
	b=CQ+0VkFsktgYtaJ3/TrlwfUL9snly9VIcT03I2MaBSaJLaWMjNgNPl2ftUsuJ6BymgyoWY
	Et2kRlP9loIWdjiE1Yd43NtSYBnH3nNQ3+OpvGy56jfnPq5+E/Xt0kCUrWJ1IpZ0b4Mz+O
	N8rJoHHMPAzh5glDErNLSlB+IEFLDoU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-akJIboUnMD6QWnwm3qwkiA-1; Wed, 27 Aug 2025 11:29:32 -0400
X-MC-Unique: akJIboUnMD6QWnwm3qwkiA-1
X-Mimecast-MFC-AGG-ID: akJIboUnMD6QWnwm3qwkiA_1756308572
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109be525eso151449641cf.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 27 Aug 2025 08:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756308572; x=1756913372;
        h=content-transfer-encoding:organization:autocrypt:subject:to
         :content-language:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3drqder3GWbHmqpAXHhkClzWB4xWxNCGqM1WpGhjXeM=;
        b=CB3HvDkcc6Ejx39BoUw851h9l/rn2CET5oYD1DRuUPt/OcleadeAewYCspMsKbS8Oh
         GNnWiuHaedkYY0lCJvi3LpGaSXN5vu3qbq67PH1bc5rE1YF7r5tV5FYaVjpFpD7TNWUx
         jxkFvGDJvC5RaOeOkoBc40Xmj3sYxuZzLFViXExAoBNhj94//fHCBRWEbpFxxek/oHed
         ES7KpoIedmPDqQSEMR7SMNEDhtLLXwDjwWIJft7+YYptxEhppPUP2c06eIHdcuo//GkE
         gUVk5c4gVNA4YiVwXxF95w+YIHqvqecdyqTD0NlGIkrZRGkSQCO4d3t6hbtffb0yoFg4
         Q4yA==
X-Gm-Message-State: AOJu0YzDNf3rZ0gCTPUITZB+BKwVrQqHThEuKUVhNitib4i+cnZEkUdt
	RMuG/ScBVlrW7EDDJv9UqmuC1JH4+CU4U5pQNXyVkABC5bIxGUjDWTlNWQ0B9+QpcXXW7Hbg5SK
	SalONW1OuJx2mzHas2srXywYt+gzoIM9qyr/XDtK5MF62kdoB+uTfoo/QY37TjyXDA1YTqUHx/q
	w4kiDFgOxyhQn5sWzCUYCZ+DcYFOBhgUlpR7bz3OzCvuyh3SAR/HIKzA==
X-Gm-Gg: ASbGncsp5nc6InPmwOiUfOqDKeOeessKnaSNw3bK/SRrc7/gRYCJuSufCd/Oyggaq0G
	EdCaCxAD9YtGdpSXkjZxOr+HhGOf0YJTmxYbBNgmrGZ4GUKgXCeulD1aMaeKHOfrmUwjA9YM6+5
	gxjUSV5v8pCU6rTzlxlBibl6stRMi6/alLv1Ahberu3aiKBdZtKKgvlp3sJTlaTLGYG4DlvKWhH
	w1GzbB3pGMoziYyn1HORQy7Kwy3guPG2d8pTnH1o0Hm3YpAhZlWw72hr6sRaxp9RqUa89LgreOX
	w5dDMLX8R1zNb2SCHfwBsJ6DksgXLLXSMSIsJrdy
X-Received: by 2002:a05:622a:1e89:b0:4b2:d607:16c8 with SMTP id d75a77b69052e-4b2d6071a31mr136206931cf.37.1756308571969;
        Wed, 27 Aug 2025 08:29:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9t+HaSfP7y3tUxG5ls/H/G7tMWq9RRdcUsvdvCLX4GFzCufV6A1kAzvYsTgsK0xyZkYdnbQ==
X-Received: by 2002:a05:622a:1e89:b0:4b2:d607:16c8 with SMTP id d75a77b69052e-4b2d6071a31mr136206651cf.37.1756308571428;
        Wed, 27 Aug 2025 08:29:31 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8caab26sm94744781cf.19.2025.08.27.08.29.30
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 08:29:30 -0700 (PDT)
Message-ID: <4c7f3274-1c2d-4ae6-935a-5ceb656d71c4@redhat.com>
Date: Wed, 27 Aug 2025 11:29:29 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Subject: CTI TAC Meeting Notes 2025-08-27
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 m/A+1AHg4g==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qLR_T4P-cGjDeQKVUFS5edzd0mkeeeWOZSFPYpg9iG4_1756308572
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

CTI TAC Meeting Notes 2025-08-27

Present:
  * Carlos O'Donell
  * David Edelsohn
  * Kris Borchers (OpenSSF)
  * Joseph Myers (attending ISO C WG14 in Brno)
     
Regrets:
  * Siddhesh Poyarekar (schedule conflict)
     
Agenda:
  * [codonell] Need to post an update to the CTI website around the SSDLC work.
   * Done. Posted.
  * [codonell] Post this week (2025-08-01) a post about governance and infrastructure.
   * Not yet posted.
  * [codonell] Write up a CY25Q3-early update around infrastructure.
   * Not yet posted.
  * [codonell] OpenSSF TAC presentation on CTI status.
   * Presented current status, and blockers regarding discussions with community.
   * https://github.com/ossf/tac/pull/512
  * [codonell] Posted SSDLC project:
   * Gitolite transition to make project access transparent (part of CTI plan)
   * https://sourceware.org/glibc/wiki/SSDLC/Projects/gitolite
  * Disucssed 5 whys and why we're still on existing infrastructure versus a transition.
Next steps:
   * [codonell] Post this week (2025-08-27) a post about governance and infrastructure.
   * [codonell] Write up a CY25Q3-early update around infrastructure.
   * [codonell] Refine SSDLC project for gitolite - Needs a roadmap and next step.

-- 
Cheers,
Carlos.

