Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECD613957E
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Jan 2025 16:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738169157; cv=none; b=dE5tQ12/cVvhimPeyzFMLXhPt+mQyg+t4J6eaGHfJMKJulYHSpYLJCEcSHPp7C1CPfgYTRhfo5pN/DHcxuWY0yLcSVZxlriVqdwrt4LyNToGNX3cp9EjqEHkU2wCaJJfjBAb4D5HAWvwj95/TF60ymjkhJeyNV0SaIoiF8Un89s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738169157; c=relaxed/simple;
	bh=iyZitSxVkPh17QC8XB+FoDyuIy26RZptTBVIxxGobIQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=GQYbgqT1VAuaeFoVF73QPqSiunGdXNh5o5UiFYh87icXuRH2d4U2uZIpP8ToB68Iu8Ux20a7r3T+m0ynirVZMkReSzVQo8bbSvHA9YvIC95D9XkI8/poY5Nww+HIvtpg1S7c2yn8Jx+IUTqUm7oZUXAgo+EifdK2SBVslNiOuHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MQ3wqsb0; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MQ3wqsb0"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF39280D87
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Jan 2025 16:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isYnZMdx-1U5 for <cti-tac@lists.linuxfoundation.org>;
 Wed, 29 Jan 2025 16:45:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0DDD811F6
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0DDD811F6
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MQ3wqsb0
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D0DDD811F6
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Jan 2025 16:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738169152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=QwkO1qpPaUT5Er4Px2cZTVgGU3bsPE5fGJKK68EjTao=;
	b=MQ3wqsb0BcArqvrkv2b90wJsXJpvmTQ+cVwyEFdGajdCuyVhE5yKA6/ePuNoL5sz+GqTYq
	lucSWpX59Jgdq6LvGTWVKSB/HcefS/YlNpCZgEa9FFf4w0feEL9RN6ry0H6TQexKyDu/ST
	yXbeoWd461wN8u/fTiTJqVh/vQudG08=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-F8KiuJWVMJe3194uq4d1Yw-1; Wed, 29 Jan 2025 11:45:51 -0500
X-MC-Unique: F8KiuJWVMJe3194uq4d1Yw-1
X-Mimecast-MFC-AGG-ID: F8KiuJWVMJe3194uq4d1Yw
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8860ab00dso111262346d6.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Jan 2025 08:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738169151; x=1738773951;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QwkO1qpPaUT5Er4Px2cZTVgGU3bsPE5fGJKK68EjTao=;
        b=Wkf0KII3Hk7G7sEDvtcLt7fUDUfhqpzMi5iZ+vxFZutEIhJ+F7CQtRdbsJVjRjC5w+
         7/ulXq0TyOMops9k7afeuJOxfjxrlhwgH7bWuXssOtdAzoCkeUlrfkxbXOOBHBQiaf58
         k7HLSMht+z6HL6at9vO7z5sKpLU+XhDtTWjhGlGb1sDYzfYuisoij4snrcsDpNoe+HCO
         Wa1fCZ8W3oUqXYG/Uh8pwsyF4uh1MkOCUUI65KlgK6W1cbxwgWMWN8nEZSUzlThIZjyB
         iwzEo0J/KIBir9g2720L1uJTS+SEvbiwZpjArDsnGpFIuosb5lDNeEy5OxlFR1X6RN3E
         hkaw==
X-Gm-Message-State: AOJu0Yx1IuX8X1tDrFK+xc38lof0nw2mS3EpJZgl4TM/zdTtMIpZQUQD
	igQDqN+5p0tjrW8nnwPALGFImsI+8LSVfqrY2nooSP5mUZCOjOK8FI1BB4GPWEL+oB67m5KaHkO
	Viut77NiaSSrXbUMvm8pCstn4qHeXTUFYPxCCA6Ew7H1wneyo2oynzSbJOvVXLxHpNQoKK/9bo6
	LBn253ND5irdsgKdPKLaqKJVpJcCt7n6kHleJkvQYHzOFSdvs1vg==
X-Gm-Gg: ASbGncsGPXoPpv5JjmkqtsnEClgcJFjZEUW685c6LV2R/MW7fQnrsaOtpfk7hWImndw
	OjO98BQcuEvIznYdOb6F5my8AO9Iin7Rt8cdeVpLGg9BAuHN0vukUOTmap6yzEOWajU+57rywjC
	BwCFMfndFfEonmPLFOLIY5lnMBwfPqxhHYTH1bQTdMSK6L2uN0v/qsuBIv/RuZudIv7VpKowuv6
	w6BCPRSwbJbPvXUApqYcz6w0RjZIsUQ81xqEA0RumGyIjVWlp6Ns6loMClh/Qx/fcaNTn/A01Vc
	IRuy9A==
X-Received: by 2002:a05:6214:c2a:b0:6d8:d84d:d938 with SMTP id 6a1803df08f44-6e243c647d6mr60499986d6.28.1738169150693;
        Wed, 29 Jan 2025 08:45:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNyeYJUzDWUh9PpPbvBxnCNFJUCnpZzhLQ5wQPpYFDCrYbheRlj2xFdo6mBwxgscdnFzG1YQ==
X-Received: by 2002:a05:6214:c2a:b0:6d8:d84d:d938 with SMTP id 6a1803df08f44-6e243c647d6mr60499546d6.28.1738169150237;
        Wed, 29 Jan 2025 08:45:50 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2051369e7sm57182826d6.11.2025.01.29.08.45.49
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 08:45:49 -0800 (PST)
Message-ID: <50dd80af-7b74-41f8-b3b1-48bb1b9b483d@redhat.com>
Date: Wed, 29 Jan 2025 11:45:48 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2025-01-29
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0MRJpQDNC8RUtVyj-zoq6rKB0QXUCDxjAXu8Mh23DSc_1738169151
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

​CTI TAC Meeting Notes 2025-01-29

Present:
 * Carlos O'Donell, Joseph Myers, Siddhesh Poyarekar.
 * Kris Borchers (OpenSSF), sends regrets since he can't sign in.

 Agenda:
 * Carlos: Still writing updates for the glibc community.
  * https://sourceware.org/glibc/wiki/CTI
  * https://sourceware.org/glibc/wiki/CTI/Policy/glibc
 * Carlos: Change in strategy. I didn't make enough process in December and January to publish my document and glibc policy. I'm going to switch to doing a weekly report to the CTI TAC mailing list with my updates to drive the completion of the document by end of February. Strategy going forward is walking the NIST SP-800-218 items (~14 pages) in order and identifying the glibc policy, how Sourceware does or does not meet that, and how CTI would meet that.
 * Carlos: The lynch pin in the argument is that we are doing this because we want to show FOSS can and will support the security and safety requirements of all users, including downstream distributions.
 * Carlos: Tracking NIST SP-800-218 page references in the document for anyone following along, but providing rewritten language that is more developer friendly.
 * Siddhesh: Discuss best practices badge for OpenSSF.
  * Carlos: There are some "Met" statements in the PASSING badge that are hand waved. Particularly around static analysis for each release.
  * Carlos: To limit scope my question from the previous meeting was limited to evaluating the infrastructure requirements from the OpenSSF best practices passing, silver and gold levels. For example Eclipse foundation requires 2FA.
 * Joseph: Discuss the experimental Forge and forge-like services and the potential security characteristics of the forge?
  * Carlos: Can I do this last? I'm prioritizing what we do today.
  * Joseph: Yes, this is a future option for development that would need to be evaluted.
 * No further requests from the CTI TAC to CTI board or the OpenSSF.
 
Next steps
 * Siddhesh to go check silver and gold best practices badge levels and report on infrastructure requirements.
 * Carlos to start posting weekly updates about the writeup, with the goal to complete in February and publish a CTI update for the first quarter with that text. Working through 14-15 pages of the practices and tasks.
 * CY25Q1 udpate posted with glibc notes about policy and why we want to meet that policy.

-- 
Cheers,
Carlos.

