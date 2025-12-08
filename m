Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5444E2ECE85
	for <cti-tac@lists.linuxfoundation.org>; Mon,  8 Dec 2025 23:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765238365; cv=none; b=OnVsKnZfWVyhnfADcYkmH9wkCEVgNKOM2HdgBhOXocmRJjvl0z75CF7/hIWDeu1lwh8IWiKrNd+ZqheWLyRlqJadIbcHubLKdxZV6fqqkLBh91ya/EimFzrDc4KRffGXVDxPoA08BP6vwn30C7wM8EoNrYgb0LWKNST7jwb8T8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765238365; c=relaxed/simple;
	bh=X6w62mM2hTrQ7zY/KYpr84ikqsumvd1JnRr078BHNH0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=BPb3tbvfxpzuTqEu1FmvSc/97x50E+GcLP4UqpA13suPZYtoJpc3FFEuazZdlEPQUF4Ot8GTTvVxVV9lLJpSK0xvLMhyCDXhTQ6BhJobyBmjbP2deNd+ztGuktwkm34Vryr0ub0HkNn+ZZTv4PDlJIaiNMA6SqXwiXypViQQY20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D5Nkpu7w; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D5Nkpu7w"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F105880B46
	for <cti-tac@lists.linuxfoundation.org>; Mon,  8 Dec 2025 23:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.795
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQZZ9G0l2Bi0 for <cti-tac@lists.linuxfoundation.org>;
 Mon,  8 Dec 2025 23:59:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=codonell@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC40480B16
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC40480B16
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D5Nkpu7w
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DC40480B16
	for <cti-tac@lists.linuxfoundation.org>; Mon,  8 Dec 2025 23:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765238360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=X6w62mM2hTrQ7zY/KYpr84ikqsumvd1JnRr078BHNH0=;
	b=D5Nkpu7wYrPc+y8Jcggl8Q0LaTEVbwaAnAM02epAfx1XLqapbjrwHNu75qGTMwb+6fM09T
	V8ppH7GwHc089LMCHhQFlLBpxqkm4VNxo1G65C/7B2P/w3P+RryuCxpD+u0JyEJkqRwaFi
	v8i5zOnZsjamyIWet+/15dBxkY9dYqw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-vjPTrIIZMleZL7gLRHtcgw-1; Mon, 08 Dec 2025 18:59:14 -0500
X-MC-Unique: vjPTrIIZMleZL7gLRHtcgw-1
X-Mimecast-MFC-AGG-ID: vjPTrIIZMleZL7gLRHtcgw_1765238353
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5957bd7530aso4900247e87.2
        for <cti-tac@lists.linuxfoundation.org>; Mon, 08 Dec 2025 15:59:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765238352; x=1765843152;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6w62mM2hTrQ7zY/KYpr84ikqsumvd1JnRr078BHNH0=;
        b=xJilks89y7xb5ec9gyR6Fq5rOH/kG8EnjHpD9E79vQ/kG94Knz7cy4xxSj/YitnRUp
         wGfZ1wYQt8EtcB0O8v+hDQ7BhlaT01QrVC5A9NB6xwPISaaaCM89oDnFKABMwR5UL4wW
         OXE2bTrd46FGdFUUuIgqvmEsqFHCA9nJF4URwtywLkI7oGVXTORmzfL+EFMl31hlED2+
         sIkSIy95hrAW5bmtoZesaz4itfueXfDLw29w0DMCY4Y16wHwq/JDDo2cn46J6eEC3+oY
         BzBTYpERmidmaL25oyhnImpgPGttCIYw+hRGZe4tbe8wVBrgiFeeFiB7le8szkDZCZOP
         QUew==
X-Gm-Message-State: AOJu0YxJXHG736wKjPUczpACbr6n8UQPbYJrP2q1w2wcgiZxhadOqhs4
	ZccZVJln4O6agkgiO5aGXm/mg/dRMXKOYyEAcxxuJvJ7mCIVn8RxR67goSC+6nP6A5S90RQzevN
	V3xdyWgZc0Su9JWiuQ5N8UuasWpi4L+skztJdBN8hM9F9Bqq4K7i+g3lSnZtaBVwtJuPg21nv0+
	3rnyQFuQprbanaI5f4emZW7JTb6vGWgxSqXO1lYseFpc6xmjiIxKnhNMoWjg==
X-Gm-Gg: ASbGnctbXLWdto5wrBzMPXfyBi/TXZFW8Q0Zv8BOzHsY+uvTrFJ0a0JFuodxPZL6qEt
	Gkj8c3aRZWQE7d5lNsfFLuTvhlEz0LlMVTUNmmblxatzXFEh37t7tYP2/RRlC9ZndZDS1QglHRh
	+Ht5trPqI1eNLFcTUqMBMdec/Wgw/vquqN5kVHthI5J3VTa8aTgNxgLsMuglL9ED9y+Q==
X-Received: by 2002:a05:6512:1113:b0:594:2dbb:723a with SMTP id 2adb3069b0e04-5987e8d0e0amr3708089e87.39.1765238352229;
        Mon, 08 Dec 2025 15:59:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE69F9PgdWRn+Kv0PnEwQ/PJBhzL/BdFGAxShKOvNCBNKo1X5MoUv1/LoD21YlGDaah1Zp4vYGoonxrx3jIjZk=
X-Received: by 2002:a05:6512:1113:b0:594:2dbb:723a with SMTP id
 2adb3069b0e04-5987e8d0e0amr3708081e87.39.1765238351759; Mon, 08 Dec 2025
 15:59:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Tue, 9 Dec 2025 08:58:49 +0900
X-Gm-Features: AQt7F2pLcm_gKt7gLeA7unHzlbmwccj64zf4r--0eazwgGDYvaWfcZvJNDLwrQI
Message-ID: <CAEMqeSrSizomhdNH=r6MYiidwmkpkwRcN0kDrbBh4AxR_9c5pg@mail.gmail.com>
Subject: Update to the OpenSSF TAC for CY25Q4
To: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tPiETyf4AAecnXr2z62w91I9QW_aZhVfDPS1nOhQBXs_1765238353
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

TAC,

This is our update to the OpenSSF TAC for CY25Q4:
https://github.com/ossf/tac/pull/553/files#diff-77ddd228be4d68cf347433dd8bf3071d7fb8e1ee5a6517e3b668664da981d5b1

Cheers,
Carlos.

