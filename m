Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA231B7E9
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 16:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727280270; cv=none; b=s70cXXNJELTboRixgP2YhTQo0EmIjvzCJhv+2nhd+tDFQaV5Shr2XTqoenqwg2PVnuApthR124k23iuJd5DukJ1ykcoOTWLurKKmaATbaO5kL4q8EXf+DxbEFvckfI6BPyppPzC5TRXZKtMBdhRX7fGyGc17x7JYak+tlpuNJt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727280270; c=relaxed/simple;
	bh=CvEQuByVPR3w8WwXMMLYe0jQiYlTpaZdp7yE5kQgA3k=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=tC+ioocO17RwvAUkVf2yK0ZeAFrdfUHHE7A75/FnYhPFWAw9VfbXm9D+sBEwKBX4sj+cb3LyyBROYJJ3VFxKL18cQKTy5HSsb/DxzuRIwerveNny0NrBj5HKPjhYYvj/5bI++uP9g/IhuL0Pqx7gPPxaoFDAo4J007ODGI/B5DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GG26An4l; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GG26An4l"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F34D426A5
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 16:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0L9d9t36a3V1 for <cti-tac@lists.linuxfoundation.org>;
 Wed, 25 Sep 2024 16:04:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D2855426A1
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2855426A1
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GG26An4l
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D2855426A1
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727280265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=Es9jztdlgu2e7r/6iZEFRuI54314HOpKhyWRqcgsmm4=;
	b=GG26An4lpMJzeKGiBL05bijDq/nRz7jqnsZpnxIjwlKEhIn1re1+MV86LYbhh59y4e0Bw3
	2guEtnIgEiIDCI90rUUPSXNmc+kSCUJ4nBKhKLFeWvOqlGi/Zl+sD6W4xWErQToqsuJGjw
	ti8y/0DzmnI/dC6ElGTrt65k9akkADY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-KZezfXFXOfuZSnA-ClQleg-1; Wed, 25 Sep 2024 12:04:23 -0400
X-MC-Unique: KZezfXFXOfuZSnA-ClQleg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7acac374c62so5515685a.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 09:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727280263; x=1727885063;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Es9jztdlgu2e7r/6iZEFRuI54314HOpKhyWRqcgsmm4=;
        b=tMZn2FnHD3jZIM2W1dvhzwvLhc6LNfPc5hMyyYSmkU7jgXhsYCnY6aSc4yj07TRrYl
         2Ngs7du6Pxt6k2LgQe4uPnBK1mlzmRrvbNS2P+/bvtA1ikkOfkOGYkzI8RUDQLjpviuz
         Q2PpCN/7l23Nosl9ur2YHh/edZKrHXS4oRXtux5oLvi+9fyREhDxD1PeKhM+oeRG2yA1
         9Vmj34hbAREIovDjtjmQDEzEBQXv63HdYbZ6/f8HUIivt4lRmO7ZbcZMkxA52OQOxz0/
         5XvnTwkWFu8n9Qj+Vg7CTypfbSUg9hJV63QfaL1cmJvrLZE2ktT1lT1f2+TjgyDLz8A1
         aThQ==
X-Gm-Message-State: AOJu0YxLFHl+vW1R+pBVTI4zPA6DSHvB4fu0al9RwcJQxHZTToInX3V9
	DML7lV6RMWWWbF8vSZAJoZaPzE2OYLPiyp+VAr+4eOhEN7s662YEyWm8mN4tnUwZ+9QkeyXpo1g
	CJlckR5lMOGZk5VJ+RHZK/OiJaYVWnotmG2WdViFqVvdpwoGvOqjZklTR2QhRgzRNsz73FBdAma
	BuaW9ItgIWIBsFF5E5PRD28/bX07M+vvjrPCSRbXOj+fVU7aNSY5Mo
X-Received: by 2002:a05:620a:2492:b0:7ac:b118:9b90 with SMTP id af79cd13be357-7ace7411c1emr435315085a.27.1727280262819;
        Wed, 25 Sep 2024 09:04:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOO6xRNuNm+xn8u6+1LS7QESwWZtQ8w6YGeXx7ckjVgZTZnBzEnsEhPpRVFjuX1Um0qTAH5w==
X-Received: by 2002:a05:620a:2492:b0:7ac:b118:9b90 with SMTP id af79cd13be357-7ace7411c1emr435309085a.27.1727280262084;
        Wed, 25 Sep 2024 09:04:22 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acde5495a5sm183904685a.51.2024.09.25.09.04.17
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 09:04:18 -0700 (PDT)
Message-ID: <e3551841-0427-49da-8cb0-833a335daeca@redhat.com>
Date: Wed, 25 Sep 2024 12:04:17 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2024-09-25
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CTI TAC Meeting Notes 2024-09-25

Present:
 * Carlos O'Donell
 * Siddhesh Poyarekar
 * David Edelsohn
 * Joseph Myers 
 * Adrianne Marcum (OpenSSF)

Agenda:
 * Next steps are to continue to engage with new staff.
  * Adrianne: No firm recommendations.
  * Todd Moore is the interim GM until we find another ED/GM.
  * Adrianne is chief of staff. Three TPMs (technical project manager). One of the TPMs coming on on the next couple of weeks.
  * Expect one of the TPMs will engage with CTI.
  * Connect with Todd Moore with CTI.
  * David: Have we heard back from LF IT?
  * Adrianne: I'll checkin with Konstantin.
 * Carlos: Posted Nick Clifton's stepping down from the TAC patch.
  * Carlos: Reached out to the last 2 TAC members to see if there was anything we could do to better support TAC members.
 * AI: Carlos to prep September rollup, and write up developer notes.
  * CY24Q4 Mailout - October 2024
​https://mypads2.framapad.org/p/october-mailout-lf3kpc92j?&auth_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpbiI6ImNvZG9uZWxsIiwia2V5IjoiY20xaHc0bTA4MDNra2NmZzljaGdmeXVhMiIsImlhdCI6MTcyNzI3MDI4MH0.S6ps9KKEi_gPyoUOIQnDuKRx5zv0Cktj_xnywkRFmdk&userName=codonell
  * For review by the TAC.
  * Confirmed Joseph, and David can access the URL.
 * Will reach out to LF IT to touch base and keep the communication open.
  * Carlos: Reached out to LF IT at the last meeting, but don't expect a response given LPC travel.
 * Noted https://freebsdfoundation.org/blog/sovereign-tech-fund-to-invest-e686400-in-freebsd-infrastructure-modernization/ and the FreeBSD foundation applying for STF funding for infrastructure.
 * AI: Carlos to keep writing up the summarized view of deficiencies in current cybersecurity requirements.

-- 
Cheers,
Carlos.

