Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A5F7464
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Feb 2025 13:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740575825; cv=none; b=XFGCsyvCK1toMYSXhUV7+wj+/5Xw08kF57WNoGEyFPoyLNSf9ffQhEdfxuCEtJh3r3ywKcqbFwOc35Ef4fua0noXMAfqG6mi+gxFKhMWjLlnhZgueTJ3x+mH6ECKPvzcTigKJvI8rA8J395Y2Gn8tFpSqYWwiyPH+Fb0XfvycOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740575825; c=relaxed/simple;
	bh=B34ihJynxq5TzKI2c2WovOlx7iCHbHg6EMYzoqAhqoc=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=AAagwjCStuBdZNd+hdDKrS2CklmKpoA08i/bEdOI/S0AF/twPd4SAnCxec9PDzEULqirTmwJgdiDptcbdIX/RSwhaPcvTXYOz9pPF619pfGRUWo7OX4NOOxV21O6DGIjLldDqlDsHrlLhuZeXbeUzg/+ShTRBnM+ytLU7io+2d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FHZT6PIv; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FHZT6PIv"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3375C403B4
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Feb 2025 13:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwzCrvvXKovp for <cti-tac@lists.linuxfoundation.org>;
 Wed, 26 Feb 2025 13:17:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E38DE401F6
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E38DE401F6
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FHZT6PIv
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E38DE401F6
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Feb 2025 13:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740575821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=fZv2K1CttvJYLtszmuuXz60fnKCkyCHKYCzgtu547Jg=;
	b=FHZT6PIv5JEjKcXYNqSFRpPGhjoORESy3l/n0DJwGsk5tpHvBLP5PqcE2uWGRYicjtuN2q
	Zb2Bt6yvYyaZaPL1+i46/qewSZjtuXjUvVbUdvOTT0GgiUxEnu2oDcDdejLBc5cE3WTmcI
	8AidznKT4MCHJZyNmVMquaN9CQlSTGA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-8ccmMDVgMYCxKyuaG5WmqQ-1; Wed, 26 Feb 2025 08:17:00 -0500
X-MC-Unique: 8ccmMDVgMYCxKyuaG5WmqQ-1
X-Mimecast-MFC-AGG-ID: 8ccmMDVgMYCxKyuaG5WmqQ_1740575820
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c09d61bf4aso1151351585a.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Feb 2025 05:17:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740575819; x=1741180619;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZv2K1CttvJYLtszmuuXz60fnKCkyCHKYCzgtu547Jg=;
        b=UACSPnqEv7BM6433PBDJqDI70ejOkGT3H1DauVVlYnSyi0OOXmliUnofDGGEE/rGuY
         wKuewFA4lHoHe5yWQ+I71D9raxmNN+Mi7P6s6rLq5zv3qibXzpGgkRsG9pzPtvtCgANx
         cqEDcDS2q3GpVF+ThZ2RAvYh9pRFYqtHvg4et8wRy7A8no2TJjyqhjpEW0Y13P+SGLu0
         HU6wfVGUn5TAmQsFtw0abrn7GegQV05Tp1KTgELI8ITN9F8caTvD7Ye8zOFQ+K1RE1vr
         0OsKHu3afV9CyU+7BYzk3KRVFEuN9boqVq6O0HyocBgasKuTZr0+JO1m4W8SHsZHMQkj
         Mcew==
X-Gm-Message-State: AOJu0YwNpf+ZPJYtNxcS79ywjRRghk4s0817cLtVcdktFrf/IR9wbmfm
	eHm+rgEdAZ1mZb2Qt+AbYM/zToLEw5s1uPpgBKgMO83Wae0+MW1YZMpGSrEjh8Zo/JQnQfJ3IJe
	U8gk2rdOK2ThV3p9CKQq0f89QKiOTBaBpWHXFFkV5uPwPgwHPBuHW+wx6mA+2m/jdsmTQEI1I5l
	z0idew8g+/ZUUYxThuOtcx7BiyYdwfcSSbWdRQOFrukeuHdqNYog==
X-Gm-Gg: ASbGncuGH+yIHvwzD3H4TixxgSWgFLkbzT9Dj3PI4ANBYxFeSdK68c5hTRd8T12D4I6
	6NxUnGHe6Oz2F57fdLPOCd7F7dN+FOZgwixkfPjLiryIh9LVE+lR8boCEMRX0bCcOIk1qK03bVm
	xt4ygmTGnlWxsxOSSz984Z+NFcJn/VfK81upmHa6a4qJmAkEkzaY2TCjkSmksgDyNX1s9g6jYzp
	hV27D6RGzEZR86dqRte6V7/SVxQQR75pu8PW025OipgGO67M1/C1TwXrbP044WEjiLPuUiaQ2fL
	gfnOt8QZPkNUjtOr
X-Received: by 2002:a05:620a:17a9:b0:7c0:c4a0:bff2 with SMTP id af79cd13be357-7c23c04898emr1128800785a.54.1740575819706;
        Wed, 26 Feb 2025 05:16:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEU6QZ4ZT8/3wrlzji6tVITJdhOjTinkxXZkPfWhmL3vw2jcb9fdC1y83yRu2bbL5BFboG2Aw==
X-Received: by 2002:a05:620a:17a9:b0:7c0:c4a0:bff2 with SMTP id af79cd13be357-7c23c04898emr1128796585a.54.1740575819235;
        Wed, 26 Feb 2025 05:16:59 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c23c339e0dsm238739085a.91.2025.02.26.05.16.58
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 05:16:58 -0800 (PST)
Message-ID: <2d1abfa8-0977-4ac3-8605-ac82a0846927@redhat.com>
Date: Wed, 26 Feb 2025 08:16:58 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: glibc policy update - Week ending Feb 14th
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9_iXwdmJN1sAiii0TUboxj764qE4BfPEF-S130qYojc_1740575820
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Current status looks like this:

https://sourceware.org/glibc/wiki/CTI
https://sourceware.org/glibc/wiki/CTI/Policy/glibc

- In a discussion with David Edehlson I mused that we were using NIST's
  SP 800-218 because it was what I *thought* was the best, but this got
  me considering a review of the existing documents and what we would use
  for comparative reference.

- Reviewed Common Criteria again for the second time.
  - Some of the items in CC are applicable but because the
    standard itself is high level and Government controlled it doesn't
    apply to us.
  - Lots of documents to review here, skipped a number that don't matter,
    and while some do like the OSPP pieces, they are more for deployment
    and not infra like CTI.

- Reviewed ISO 27001:2022 which is often quoted for infosec and cyber
  security.
  - This document is very much like NIST SP800-218, but less well
    organized IMO and as a closed paid standard it makes it difficult
    to hand out copies for review.
  - As an ISO member I had access and went through the 26 pages.

- Reviewed TOGAF from the OpenGroup
  - Closed standard.
  - The standard itself is massive and very proscriptive as
    to how enterprise software shoudl be developed.
  - Not going to use this standard.

- Reviewed PCI DSS standard, 35 pages.
  - No easily applicable to glibc or software standards.
  - Skipping this. Took notes and decided we won't use this for
    our own review process.

Next week
- Review OWASP SAMM, BSIMM, and update justifications.

-- 
Cheers,
Carlos.

