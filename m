Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FE12F42
	for <cti-tac@lists.linuxfoundation.org>; Mon, 14 Apr 2025 14:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641744; cv=none; b=ewXjZeGqXKPz/8qDYnNnqs97lUK9QvIM/XKF1SvU9m0UMKRnVguXCnWlOvBniyk5H7olu6wJWDAhhwCtILx7kXDivb6DdjsWTsACiSXf+FSZl6PTQtxPVBPKaPv4b2AgsbsovqM+SMofkU4F64cAj5Eg0V4clOUS2fhVq1coiIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641744; c=relaxed/simple;
	bh=xRQxxhU9gtoUaEq1rqLgFUgnISutqE5NciiYNuyxZrY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=tJL/j3+mbCHY1IeeDMTjunGJ1jQtNZ92niThsGQRRmdOyMWAiVkQ4ozwZTzSRictxNqmgXQJ2BkL3IEjkKnMKpGv4D1Jb3P/sZQKZmE4vtQKhKjQyoX2R1MBKVsoRhLU4EYEEXWLuqdNYUsp9Y+piMUD6cwkG2B/izn6wAcbOQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D9eHiz50; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D9eHiz50"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B818402B1
	for <cti-tac@lists.linuxfoundation.org>; Mon, 14 Apr 2025 14:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7SmJG6T0uk0 for <cti-tac@lists.linuxfoundation.org>;
 Mon, 14 Apr 2025 14:42:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 732CA40C56
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 732CA40C56
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D9eHiz50
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 732CA40C56
	for <cti-tac@lists.linuxfoundation.org>; Mon, 14 Apr 2025 14:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744641741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=w5LyotVWlib+quuYhSTY88Kd43f23o73CWpPRJnjFfA=;
	b=D9eHiz50f8KOpszAIduJ2W0QXu9FU8/jXSq8o7zZ9odjyaibzwiBvDHstbX2Yi/OH85LRs
	8vM4Qp5adLuon7C0MJ8WzpHrhn5OWnq5VL27hDyxIKhvvGEdIKuxfs2VS6P6WnQX5wZKMr
	V+9JDFMidrVumZV+eiL6XKi1oEH67A0=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-w5ccNLhPNMuPKmdqrZYo_A-1; Mon, 14 Apr 2025 10:42:20 -0400
X-MC-Unique: w5ccNLhPNMuPKmdqrZYo_A-1
X-Mimecast-MFC-AGG-ID: w5ccNLhPNMuPKmdqrZYo_A_1744641739
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85db4460f5dso843020839f.0
        for <cti-tac@lists.linuxfoundation.org>; Mon, 14 Apr 2025 07:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744641739; x=1745246539;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w5LyotVWlib+quuYhSTY88Kd43f23o73CWpPRJnjFfA=;
        b=q4gspVnpURSgd3RjIOINgDAD+6zGSkjFvLO8IFEoSkLPAAk8/ucLGjK4BXbT5LcUCB
         VHX1fCb6S+dovf4SnjJ27M7tPMXRgTDLezdOuATwU5FGouz1AUC1qLINuKPOD4Dveu+r
         ztv/hFA/fdlZXTxempWF1+HmdrVKFOix6YFJPY8EU4xRWuhmo2QTKpyl0ToDtx4MBEKp
         uU3r3vgrBq1Id9Id97tma+FXqCB8hxfjZ4wYdj06giGc2NbqvlUotSUHg02voxFMNKJZ
         SccAaWMV7FIMrA23B+Tm/lvw5tmcXL/PSSiRVXDjR26l+lm+sqxezX5lS2UHJQyYHrwA
         nn9A==
X-Gm-Message-State: AOJu0YyZnomwC+4HYyAXhklAdJr3JtPjPqwc0oFYv5GZFc6VQcVEiad6
	COydswSPsbVcQgcXSIjegI3unP/j8/c88wNa6GqwrdkCmPK+NhdW+ffKadcjdubVp9K/1qoVC8k
	s85EQ+WcK+7qbGZb/ynKzpHliq/jd5vF2u2ObjYSiT9LY1jbIVEk5F4meBu1vqipirc2Ovo2ygV
	QMzw0TzlbH1ZqpUczHO8PGHWZKReR2rlbk2p3IOON8BZOwb45GyA==
X-Gm-Gg: ASbGncs0lKwaK4NOCFqBbgS46kdrGKlTHKuONVnh2ZmQAFR6F9YyS+wKdgCyCB3aD42
	jm+TPBUwM0WusXmFPx1vV/qKKxoR2qWjrxRDZyAKrhyO4KhdMsm3M16Za7fEpbTTulokWkwdSjK
	a6SxAqGP4FkstbgO/k0m4pHG2tTGgSUvToSFvNf6oWnYRAtzuNoCdaAKSEgUynabt+SjIAY+dki
	mzKLi5mmiO3cLSEH3jbRuCXN8uC+B1rl3Ef45TakAdgrdcMyoU1tSkGkO9Ttvym8RC15afS8Zot
	bG1w2sgPCnf8
X-Received: by 2002:a05:6602:3890:b0:85b:43a3:66ad with SMTP id ca18e2360f4ac-8617cbbd27bmr1416158939f.8.1744641738899;
        Mon, 14 Apr 2025 07:42:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzRlMeqFymrzrYfgr+Jz9iSjSmnPjBRQ9wogZjWqwKtvWK2ld7dLtbZBPaOAxrVNZj3/0Evg==
X-Received: by 2002:a05:6602:3890:b0:85b:43a3:66ad with SMTP id ca18e2360f4ac-8617cbbd27bmr1416154539f.8.1744641738388;
        Mon, 14 Apr 2025 07:42:18 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf84d1sm2627480173.9.2025.04.14.07.42.17
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:42:17 -0700 (PDT)
Message-ID: <fed82cd1-a3da-476e-b96d-77a7cfb3bea9@redhat.com>
Date: Mon, 14 Apr 2025 10:42:17 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: glibc status update - Week ending April 4th.
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QtpMIb8hHXYUT_LDl7bz8AvpWGS1x663I3U6ZAUZJvI_1744641739
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Current status looks like this:

https://sourceware.org/glibc/wiki/CTI
https://sourceware.org/glibc/wiki/CTI/Policy/glibc

- Completely finished top-level GNU Toolchain details and tables.
- Top level for the GNU Toolchain is 100% done.
   - Completed PO, PS, RW, and RV sections.
- There isn't much detail in the top-level because on a per-project basis we need more information.
- Continuing the same process with the glibc policy doc.

-- 
Cheers,
Carlos.

