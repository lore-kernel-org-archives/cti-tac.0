Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BD1265614
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Apr 2025 18:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038402; cv=none; b=XJa89QAKQEidjad4lDJ2GXSOi2rpJ9q+7aNNr6w3rQcvxpJSS45MnxM6XEteQh+kl4888knObhIWnbwUtwFLcrENDmfSSUzmUFm1X7kTUT0r0dlIDFz4ll+yq3MdLSTlEN0OGYz7tWTSFixi17hBmgFZzuWylqHSnBeA46s6tBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038402; c=relaxed/simple;
	bh=giSL2Zhkh83edXJViHhZqiDLQL8M+4E62wIMLwFMuSs=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=CdrLm0E87pjKiMaIYhXwX4xw9ONT9OydCWIE2oqGXAsV6RUxk7HEDSg/wwhWKjvQ8/TbBB6e4nxeM8u6+pdiAYPjyPmmz9cTjvGT7u1l30OMVMGTkx0evDXU4VIgnBVpUajoNVLC9x+RXyVB0/UkNxEWyYjGXK0sxUpBlT7mOn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U5IE853N; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U5IE853N"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0E2960A6F
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Apr 2025 18:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wJziAMPYXu3 for <cti-tac@lists.linuxfoundation.org>;
 Wed, 30 Apr 2025 18:39:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D51BD608E3
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D51BD608E3
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U5IE853N
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D51BD608E3
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Apr 2025 18:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746038397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=zG/L6/QTNlkQiOUdxliFGyATrrN9aDCWe4UTuqTNdZg=;
	b=U5IE853NI7KmoIHswdAIx4z2qHABtj7SwVU97UCzl6NddlJe5wNEst2Do20jKtygSG+fLS
	TGww9bqu/19F3dT3Mqf5rp6Vduld3Ndpu5Bqz340y/JUQMCij3QU4XwRFgpUKcNpQjueHr
	5VOd5QduHVaN1y4QHm7CN3ab6IT7p7Q=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-NgxceTpiMOG46tPQm9bPAw-1; Wed, 30 Apr 2025 14:39:56 -0400
X-MC-Unique: NgxceTpiMOG46tPQm9bPAw-1
X-Mimecast-MFC-AGG-ID: NgxceTpiMOG46tPQm9bPAw_1746038396
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c77aff55so20678285a.3
        for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Apr 2025 11:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038395; x=1746643195;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zG/L6/QTNlkQiOUdxliFGyATrrN9aDCWe4UTuqTNdZg=;
        b=dMNAGJc9axAA1umbsqtJFwCtZ+i/RWl+ElfHkoFx18NpaUNeD/wPH98sGBWHgkA3Uc
         WnSoVljiuqPRwjoXluwTPfN2+8r3rPGLBwVA3Fx2AF3kjDLb6uQB1//HTnoaPGXIzaNj
         IBJDcHfqilGVoDs/Bg4eTkirWxsMriZscmiCQ7uuCSe51M8A/cKyyBszzSkrdyOSzNOz
         9bYxfYVC1jYh8AEns4uZLgs5+LywpW6twmupjDyx/RaLtTDg1nWmi8sTCWM9FDOhrNzc
         BV27miNMpoT2TLFSHKM40F+7l9ydoqVyjNZankNfwrTpx+CI0baNu3GkDIYBzR9vqRpl
         rZQQ==
X-Gm-Message-State: AOJu0Yxup/nHCXmQeBOMqFfpp9s7I21uIT2GR5BX93ZMW/kw1kjeQQN+
	Z3b7g+cOGLqmedhbVecQKdfvPXdDQyStH2YcVazV4FUq3bSFaJEseKwSElo23to5tKh2pHg30Af
	UyBLFyQkzI88hKSW+byfY5tNfjg2c+8yCGV1GI7oP3O+6eT8jB1qnOl3d4FJySW6OM/o3lSouaK
	V9oOmRrbSVvGo+3S31KxY/xbuWfd+tQO+aMSPGNEpAIn5SeMd1v9UK
X-Gm-Gg: ASbGnctc/R2/qEPDJ8fE91nCHBzW6PUGgN/Dsu6thfSc4nSeuZmY7CIGSRMR+YYt3x0
	VqunaPXsRq3l0vZQcJt22iPiTpzYA2sbgx+1h53I9C17AAUoudKatV4oj2eBnNnjZB/iCRgV150
	sHMx7hUWB5MS78T6l5sIA0CETmt+RfgmqNelTkdr8R/9Y5YB/e6y22IK+569CK1sqeSWBR17KpH
	uusxk2rf26+U76nmP986m7UMCicXhYQGQ/6Lg8drqZKX2qv+WBHFTytpjCxV+XCAbNX//ZZpx75
	VXpP3T2zS/wD
X-Received: by 2002:a05:620a:298a:b0:7c5:7a03:8467 with SMTP id af79cd13be357-7cac7ea1f1bmr635050385a.55.1746038395413;
        Wed, 30 Apr 2025 11:39:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFAxuP8BW1SAKyfmZJVGuYogNKaOyTZceDpudL59Y0mmZqNXeZkhzeyVtkLT8j6kZMenZq4A==
X-Received: by 2002:a05:620a:298a:b0:7c5:7a03:8467 with SMTP id af79cd13be357-7cac7ea1f1bmr635044485a.55.1746038394901;
        Wed, 30 Apr 2025 11:39:54 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cdc2d0sm883906485a.49.2025.04.30.11.39.53
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:39:54 -0700 (PDT)
Message-ID: <b949fd82-c704-4fd1-949d-28f5b0b42e50@redhat.com>
Date: Wed, 30 Apr 2025 14:39:52 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2025-04-30
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3xAgpA_Bi1_ECqMi_tbZo-LS_jc3USYzpwV8lGFhl_w_1746038396
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

CTI TAC Meeting Notes 2025-04-30

Present:
      * Carlos O'Donell
      * Joseph Myers
      * Kris Borchers (OpenSSF)
      * Siddhesh Poyarekar
      
Regrets:
      * David Edelsohn
      
Agenda:
  * GNU Toolchain secure software development life-cycle https://sourceware.org/glibc/wiki/CTI
  * glibc Secure Software development life-cycle https://sourceware.org/glibc/wiki/CTI/Policy/glibc
  * Siddhesh: We should explore all possibilities around funding any position that would further improve the projects.
  * Joseph: Can we persuade the community to improve security regardless of where it is hosted?
  * Carlos: Forge for Fedora might eventually move Forgejo forward with usability.
  * Carlos: LF IT is talking in public about using proof of work on connections, and Sourceware adopted this strategy.
  * Carlos will post to libc-alpha with policy documents for glibc, not talking about where it will be hosted, but talking about our security requirement as a project.

Next steps:
   * AI: Carlos to get dates to send to Kris for a meeting with Steve.
   * AI: Carlos to publish the top-level and glibc level analysis to libc-alpha.
   * Sid to still review OpenSSF best practices badge gold and silver for hardware requirements.

-- 
Cheers,
Carlos.

