Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077DF1A76CE
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Aug 2024 19:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724873250; cv=none; b=MK7LfU8RlhB70MCn0O3QK4USi/rjrq2ntcN+LUQmZFqcCRbakNy3j12cIdEKSqqjAI53VPMshgQ7ZTHO4BODFksOuXCGp98QoE5rvscuBTlkybAzz+zr7FZa94Nb0klTVFZVgL4h7ddSWfJDPAB6plH88bSHsCZr5m1owuiOv2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724873250; c=relaxed/simple;
	bh=1wC/TPzRkJzcW+h1ZVIgAbLzpAQZHXgGifl8odbhY1M=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=ZXEdjNEYeV+Bap0oEc3ZNtZQeG9oPOgh8xxV52v3+SgVZOoQsAWtqwqbnUZ8HFNk9oWnBjLszuL7zxpB8+gtCa7saGpqsFWJKFTP4LZZp8cK+tBUEy5mteS8dgRW1s9m6MrV4g9FuDK0AFl1clNjmFtb/jONE8822LmxZQybb5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hkJH61QZ; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hkJH61QZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2A0F40237
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Aug 2024 19:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IXFIvMl002Y for <cti-tac@lists.linuxfoundation.org>;
 Wed, 28 Aug 2024 19:27:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 498B640179
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 498B640179
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hkJH61QZ
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 498B640179
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Aug 2024 19:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724873246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=H/Ec8aEDU6SMoR1NOeChZAleIFXG8znOyrmk+K2bFGs=;
	b=hkJH61QZVFBec4jVXVO7d2JImiNBx84RNReshQLIQAvBn1CG9Wau6/EHOZttwJi2z1vAdG
	yc5uWrg7U/cW58T+OlHQwA1tfuPksKEW4fBQvDI5kqqkXc1zasRYfaewL09yIg5rpZMzlH
	7tOfU35TxYyyaZvEvE2hCFqqL1TH4JE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-v0dC8wY7N06tmlm5GCGhbQ-1; Wed, 28 Aug 2024 15:27:24 -0400
X-MC-Unique: v0dC8wY7N06tmlm5GCGhbQ-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-45677ff4e2eso7466361cf.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Aug 2024 12:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724873243; x=1725478043;
        h=content-transfer-encoding:subject:to:organization:autocrypt:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H/Ec8aEDU6SMoR1NOeChZAleIFXG8znOyrmk+K2bFGs=;
        b=DJpT2B0/VnYZMzKnjqydTueDf6XGc2cxW6lGdB9cx9p/w1Wnu3ksUpYNL0ThIGz2Z9
         roctVthj+lvjrrFJDSISkENQCb3ovVBlMqMM7jITPOWrC9mCd1GNe6CXc7ZcZQcIZUH7
         LXbKlwOdo1vbX5U0wmciLl4EItC1R7rnFcbE/Tvxevz3nDMAQYV5yl92f+baAaiz6eSn
         +0G3iGHlCMeTC/0hcT9ArSP3uQgr4Jlec0zBrNjsF6MHi4YAPo/b7l2DTeKcF1x2WWNj
         B0aeNPQHCig/X+OQX9vDCgl0K59bu05sluBBhaqY67hI6V6NcIjF1waYpQMBct/6A7j2
         EpsA==
X-Gm-Message-State: AOJu0Yy7mekd6PUagyNu+u/PW0T6z1BUkihjTZFmDM20308YFrH8p/em
	rryT6adfLZUxTK+z0OG1tdqpdkCxpmV0xVpquE6r9LneGG567dtHLleAlggiVV/Axp2Y3muy7I4
	yoMUlwtJugnzXV0f3392RUdk/USs6qc0uvXwqyCSxlIAc54dZ4wfpl2mVV2bhjpF2AB/LBlGf44
	S3ZhUcsNTUPvgjPbxkhyuFJGvXrhIE7t4ohNkNfhBu9exgSy5D4y8x
X-Received: by 2002:a05:622a:5c89:b0:454:b417:ac4f with SMTP id d75a77b69052e-4567f6dbfb7mr6697821cf.43.1724873243639;
        Wed, 28 Aug 2024 12:27:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWOgBKkQieXhb5R445lcTobNOfvsiNFSKjuvKU07X1F5Cur0C/9RV5K1EFiWaxbVhrDgBwHg==
X-Received: by 2002:a05:622a:5c89:b0:454:b417:ac4f with SMTP id d75a77b69052e-4567f6dbfb7mr6697451cf.43.1724873243010;
        Wed, 28 Aug 2024 12:27:23 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4567d5c4b8fsm3155931cf.27.2024.08.28.12.27.22
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 12:27:22 -0700 (PDT)
Message-ID: <4d22bea8-9a01-43d7-9579-b6c877154e10@redhat.com>
Date: Wed, 28 Aug 2024 15:27:21 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
To: cti-tac@lists.linuxfoundation.org
Subject: CTI TAC Meeting Notes 2024-08-28
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

​CTI TAC Meeting Notes 2024-08-28
Present:
 * Carlos O'Donell
 * David Edelsohn
 * Siddhesh Poyarekar
 * Joseph Myers 

Agenda:
* Changes at the OpenSSF.
 * Bennett Pursell has changed roles.
 * We need to bring someone new up to speed on the SOW with LF IT.
 * AI: Next steps are to continue to engage with new staff.
* CTI GB needs to have a meeting to officially sign off on the SOW.
 * Find rep from the OpenSSF to the CTI GB.
* Updates on glibc developer discussions (https://sourceware.org/glibc/wiki/CTI)
 * Carlos: Want to have the writeup complete before Cauldron to have material to discuss in person and raise common goals at the Sourceware talk.
* Updates to community? Next steps.
 * How do we update the community? Which things are valuable?
 * Siddhesh: Suggest that we send out the minutes to all the project mailing lists, but we don't need to send anything out to other mailing lists.
 * David: Overseers is a broad mailing list that includes a variety of stakeholders.
 * Siddhesh: Mirror this out to all the projects and overseers?
 * Carlos: I can update this into a rollup?
 * David: Sure, a rollup. The rollup can highlight the benefits of CTI.
* Updates to community from glibc stewards
 * AI: Carlos to reach out to Maxim to discuss participation in discussion.
* Should we reach out to look for new CTI TAC members?
 * David: Yes.
 * Siddhesh: Yes.
 * Joseph: Yes.
* Next steps:
 * AI: Carlos to prep September rollup, and write up developer notes.
 * Will reach out to LF IT to touch base and keep the communication open.

-- 
Cheers,
Carlos.

