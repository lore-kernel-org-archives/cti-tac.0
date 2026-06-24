Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058603090D7
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Jun 2026 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782316947; cv=none; b=FvuI00DyCyKocRt5xE/6ahsZNkmLAgrSmYsXU1A4M1+jWXTHPrSEITozvNZg6SHuthyENvlJPq9riW3Bilb0YhWpyfrleU/CxTUnhenkwvsJIvFR1c2cCIs+sIypgZCPDTdi+C0O2YbdaiiT9eM15RzGm/fbuIkER4s4JaiBP00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782316947; c=relaxed/simple;
	bh=KAtQ3Qn29v/FHwBvZWNwLCxQTPA+nUJwfXbkCDnmMWc=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=pcRx/hrjG30+c3eyEPA2u82c/oVKXAzxdB0KTqRR63QDTkjytn5+hQWG1nwzWXIkmR7zRGAr8KYXFoS0Rra09iGRXBuZxbqhYMprbqts9Yf0xhitkMWQ26jKp10DR8Rv8mUir2lyGn4Ljnec9C8519bd4LxQT0vF1xsz7K0xWgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JD8P7p5P; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JD8P7p5P"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6BFC81446
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Jun 2026 16:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3ABu1IBWtZh for <cti-tac@lists.linuxfoundation.org>;
 Wed, 24 Jun 2026 16:02:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97458813D8
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97458813D8
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JD8P7p5P
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 97458813D8
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Jun 2026 16:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782316942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=ghEF3HME0pivBhlAoyNOYRY4AVlgOz3xFGQHKRBr/y0=;
	b=JD8P7p5Pfyf1nOrYUybzZ3G3syrdNdBIdz4DXz7aVzXbePf1ibAgtD+ZbNKfUiaNf5Jtu1
	qiJOTK2ROHS122SL9Q2vcfrSvvvPHRKZGqIiczlkQwIGqO76JqKIo6M/w19abb8L8qQgBA
	bvjpf6XVJ5ntcpdMY/oRSWZkpcltdxQ=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-nadGCLLhN0m7vmmDwBFbnw-1; Wed, 24 Jun 2026 12:02:21 -0400
X-MC-Unique: nadGCLLhN0m7vmmDwBFbnw-1
X-Mimecast-MFC-AGG-ID: nadGCLLhN0m7vmmDwBFbnw_1782316941
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-69e37d24cb1so5219eaf.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 24 Jun 2026 09:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782316941; x=1782921741;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghEF3HME0pivBhlAoyNOYRY4AVlgOz3xFGQHKRBr/y0=;
        b=Czd+PbtLI8L8KmuCUfCgeaRCdjU+Kti3iDEduGL1Md/eE60pIsS3xoLX1Q9vHk8JC1
         uVaml6ZklL9tQyCrrDL4pvEHAe7nNJktyU4uf11JsgRALfW1qiBYhlK5q8NkMIuhSVcu
         DL6jbpFnTfoKcRwYYHhCZFXnTPEz3ZiO/g4KjBvKW90DMUIIq3t5Sy83bZqjagNUFstN
         9pzsjUK4Rkl9NkIdAuYABEYE2kKcp3NPWrmGrMBiW4eRUyAyrKwJ1iI7/wCw0rOpH+ok
         h3Fkn5yrkLeAN3FhdG08swVH6/2pK/AePTCry8j+JoHgQvHHW5g8DttxyunvtJM6ichc
         RtDQ==
X-Gm-Message-State: AOJu0YxAF9H79tIkZkagTr6GJ6NQwu6BVcov2GDSWtjcNKXhf/jkm0pz
	Q7xFXw69Ti/FBtnP8FDIFxqa5uChEW5GSgJ4eJ02MzmoRAwqjcnc/w9xZzZ34gdiQoQvIjYXN22
	jMhlPdNaP5rE084utJIkFFpzE/odb7KU+GYHGZjCq9Ej+dNFx7KWrLRZN6rXJ2kM5Ww9EnYOnMK
	UY1Q1RQf9plZ2LcU8PTSSnpYLJjT6j1DPUsbyYqY0XOF0y0n7wCecOyw==
X-Gm-Gg: AfdE7clArQTS6H+sMeE8HFLqQgRrofTMzsIvW9v4h+ZbyVQGJAnN3+hrlkkCH74RJZb
	vZWNTZflid5v7cR/BUZyg8U98bDslUDft6/kNBExHYAb0ib9CHi2QC3l0hcve71MJJTX9L7AMiV
	bSiQKT4Vm7Gums2CtkYsz7E9hibUdz7A4if8O2GdoYbcRtgmXCHkxqFv2BhOdLHqQkseLCBexwW
	nOXuCX1uNxaXWMbRAfKqLTdnvcRGPcCVi/o0z3gYhMkSJkF7NoPVx5//v0lqyKPKDuewfoqkT4g
	F2AAQXurFa+Z/gk5DT5j8BoyybM+uHKNLVICAE7m98OJeTRQd7HFEU7mAYuA3TTaDNznlzbvfGN
	fk2A1vefpXIXI4f1XlRUwLK7B+Nt9lss8nuoDl7v0i5GTA6ydFGFKyxNT5kRqzEzeu6fR/MaVkS
	P0zFPaNSjT9R0=
X-Received: by 2002:a05:6820:2d02:b0:6a0:f7f8:607b with SMTP id 006d021491bc7-6a12d788b58mr514562eaf.5.1782316940712;
        Wed, 24 Jun 2026 09:02:20 -0700 (PDT)
X-Received: by 2002:a05:6820:2d02:b0:6a0:f7f8:607b with SMTP id 006d021491bc7-6a12d788b58mr513369eaf.5.1782316927223;
        Wed, 24 Jun 2026 09:02:07 -0700 (PDT)
Received: from [192.168.0.116] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ab49csm582153385a.34.2026.06.24.09.02.05
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 09:02:06 -0700 (PDT)
Message-ID: <2cbed0e8-3d01-4207-b85b-6ac2e34d5dee@redhat.com>
Date: Wed, 24 Jun 2026 12:02:05 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: CTI TAC <cti-tac@lists.linuxfoundation.org>
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2026-06-24
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 hsfHTTi7JQ==
Organization: Red Hat, LLC.
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r7sC_gLRl78KD1lDc-z3hz5in0jfibcP5X63em1PHtU_1782316941
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

​Attendees:
  * Carlos O'Donell
  * Joseph Myers
  * David Edelsohn
Regrets:
  * Siddhesh Poyarekar
  * Kris Borchers
Agenda:
  * Sponsorship discussion. Discussed the pitch deck going out to sponsors.
  * Carlos: I broke down the AdaCore hook definition into 12 parts. Does this meet your requirements for the analysis?
  * Joseph: Yes, for the AdaCore hooks. However, we should have more detailed timelines around the implementation of specific items.
  * Carlos: Updated the service-transition-plan with requested TODO items, and will circle back to fill those in.
  * Joseph: Is the new mailing list setup going to do some from rewriting?
  * Carlos: Updated the plan with a TODO to verify AdaCore Hook 12/12 step versus the from-rewriting on the mailing list.
  * Discussed with the TAC the question of mailing list forwarding that was raised.
  * Discussed with the TAC the question of renaming the mailing lists to more meaningful names.
  * Updated service transition plan.

-- 
Cheers,
Carlos.

