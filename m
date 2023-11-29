Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F751DA24
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Nov 2023 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dR0vsNs7"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99FDE82234
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Nov 2023 16:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99FDE82234
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dR0vsNs7
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.599
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wURjs2VIXDrP for <cti-tac@lists.linuxfoundation.org>;
	Wed, 29 Nov 2023 16:56:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D7DB382232
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Nov 2023 16:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7DB382232
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701277012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PEL+73xmLZqYPTIDXD4/oPRqCpNMfk/EZ2l71AnyV6Y=;
	b=dR0vsNs7W8pBh0foadGKvT0NC/jhPwpesxqRq92alNY/AZNSXt3x8Po6YYb/tpRjCmIwRb
	kKMoiNgqPOf+Z8Zt7bk0fR1QA40pDNfNkVsRXjqFIp4Nhg2dJ25bAy5OrHwm5Wn06Jadnu
	UCC1gOtHhYS9gxLK2OTbBMygiFKmGSo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-km86dC28NnyrsXeZe1VG1w-1; Wed, 29 Nov 2023 11:56:49 -0500
X-MC-Unique: km86dC28NnyrsXeZe1VG1w-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-67a16e9eedbso69038026d6.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Nov 2023 08:56:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701277008; x=1701881808;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEL+73xmLZqYPTIDXD4/oPRqCpNMfk/EZ2l71AnyV6Y=;
        b=kDvi/PcB+0XoZFtwtu9KPD+rWWZvRDjJU+qCUTcgS+I/RGlNZy6sAv6sumEBsj0Iz3
         Es8x8nvXapQSSgWUQBx4ZvLX3D5TKEhJJTo4s38O8jLaMhtYdK8lPcf+kRhAFSXe8QZW
         qFnf5YqmTWQyLDDySSLO9OJLak3Gaf1X8xtuIP2XSQY/AVGZN+Lgt2H+CjDxWbjZPGjn
         9oxlRQf/x4K2PmqmjTQYSKvBGPP/1Ci5uNwInsAwceXyk2XbLG9EecGxutLxbt9I8Uek
         y5LeJ/b/blPyyoE4VcyxO9uyMSrqP82zI0iF3INWNjK44bwiOTH3Jvgi43XCdjyg/nny
         DDyQ==
X-Gm-Message-State: AOJu0YxSEKx6nCPEZJhiTFQHswZti2kw6aDrunS4TFQQnPKrlQWYVP5o
	z4ICHYS6D04d5sVaqJUbKcRBwbYEsr8XxtjdLg0+mJf5sf4EIAVIAWDFXxKIi9yTfSGrHCfKUk7
	sFsoT2s6mq2xkrr8TRnK+X+G6xIwwFdf/2vPHRT7qmAV5Jb+UvnRNWxCLxEFYv2au9SynEjb0S1
	FzHmCMoZRoHKpiVc0=
X-Received: by 2002:ad4:5051:0:b0:67a:165e:aeec with SMTP id m17-20020ad45051000000b0067a165eaeecmr18493560qvq.40.1701277008159;
        Wed, 29 Nov 2023 08:56:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrRWN6U6k6/RJ+1zJZYnQPtPjZmlUVrqlPIjx+Qn+07mwRP+8rdM1rUFlpEktNZyT9AyhYZQ==
X-Received: by 2002:ad4:5051:0:b0:67a:165e:aeec with SMTP id m17-20020ad45051000000b0067a165eaeecmr18493544qvq.40.1701277007664;
        Wed, 29 Nov 2023 08:56:47 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id kj9-20020a056214528900b0067a4a8f9456sm2710801qvb.38.2023.11.29.08.56.47
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 08:56:47 -0800 (PST)
Message-ID: <367fd081-0ee0-556b-3104-d4afd4744f07@redhat.com>
Date: Wed, 29 Nov 2023 11:56:46 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2023-11-29
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

CTI TAC Meeting Notes 2023-11-29

Present:
 * Carlos O'Donell
 * Joseph Myers
 * Konstantin Ryabitsev (LF IT)
 * Bennett Pursell (OpenSSF)
 * Ian Kelling (FSF)
 * Siddhesh Poyarekar
 * David Edelsohn
 * Adrianne Marcum (OpenSSF)
    
Agenda:
 * Previous meeting AI: Create cti.toolchain.dev and document what we have and what we know for the community to have a place to review documents.
 * Since the last meeting we have registered various domain names.
 * Someone has registered typos and pointed them at sourceware.org.
 * Need to reach out to the rest of overseers to see if this is intentional or a mistake.
 * The following domains are transferred and being managed by LF IT
  * toolchains.dev
  * Typo-squatted toolchain.dev pointed at sourceware.org (needs review)
  * coretoolchain.dev (recommended by LF IT and registered)
  * Typo-squatted coretoolchain.org (needs review)
  * coretools.dev
 * Carlos: Ian, Has the FSF registered any domaints to prevent typo-squatting?
 * Ian: I'm not aware of any registrations regarding CTI, but all FSF registered domains will show that the FSF is the owner, the organization doesn't hide the registration.
 * AI: Carlos to reach out to overseers to clarify if they have registered any typo-squatted domains.
 * TAC question: Which domain do we use?
  * toolchains.dev (unfortuante typo-squatted toolchain.dev) (+1 Sid, +1 Joseph, +1 David, -1 Carlos)
  * coretoolchain.dev (+1 Sid, +1 Joseph, +1 David, +1 Carlos)
  * coretools.dev (-1 Sid, +1 Joseph, +1 David, -1 Carlos)
 * Consensus is around "coretoolchain.dev" for "cti.coretoolchain.dev" documentation.
 * Konstantin: Primary infra up and running in OpenStack host. Montreal area. Small VM currently. Gitolite for documentation. Gitolite server is up. Need a procedure for who gets access.
 * Carlos: I can call Konstantin and authenticate myself and send my key to him.
 * Konstantin: Let me hash out the procedure and I will send it to the CTI TAC list for approval.
 * Konstantin: We can setup the trusted key points in another meeting.
 * AI: Konstantin to send the authentication procedure to the TAC list.
 * Carlos: Any objections to "tac.coretoolchain.dev"? Noting no objections.
 * Carlos: During the glibc steward review it was raised by Alexandre Oliva that he objected to using CTI services, but Joseph Myers and I felt that all we needed to meet was https://www.gnu.org/software/repo-criteria.en.html
 * Konstantin: The LF IT meets B and some more, so maybe B+.
 * Joseph: Alexandre seemed to assess the hosting on his own criteria and that is not in line with the GNU Project recommendations which are the Ethical Repository hosting criteria.
 * Carlos: Ian, do you know if the criteria will be changed in the short term?
 * Ian: There is going to be an update but it does not likely change any of the hosting decision being made with CTI and glibc. Can join the discussion on the criteria via repo-criteria-discuss@gnu.org.
 * Carlos: Konstantin, How do you host larger files?
 * Konstantin: No easy solution. For a couple of files you can hand them to us.
 * Konstantin: A peertube channel might be an option. A permanent seed might be needed.
 * Carlos: We can point at the FSF hosted conversation for the talks we gave there.
 * Ian Kelling confirmed they will continue to be hosted.
 * Konstantin: Would you want to use fastly? A caching service is convenient.
 * David: This goes back to my earlier comment, does Fastly change the criteria from B to C?
 * Carlos: I would recommend "No" and then discuss with the community.
 * Siddhesh: For the current traffic "No" is fine.
 * Joseph: Don't need to discuss this until we get to hosting releases.
 * Carlos: I will add the OpenSSF (Bennett, Adrianne) as "consulted" when we draft the docs for the services being provided, likewise LF IT will be "consulted" on the docs.
 * David: No further topics.
 * Ian: No further topics. Thank you.
 * Joseph: Nothing more before. Other than sorting out the next meeting.
 * Siddhesh: Nothing more. Thanks.
 * Carlos: Proposing the next meeting be the 31st of January 2024, with all other agenda items carried by email.
 * Carlos: Any pressing meetings between now and January 31st?
 * Adrianne: We have a weekly lowdown in OpenSSF to share out progress, so we can be more verbose in those channel. Bi-weekly update goes to the governing board to share progerss.
 * AI: Carlos to talk with the TAC to share something through the OpenSSF chanels to the TAC and GB.
 * Carlos: Any objection to cancel the December meeting and carrying items by email? No objections.

-- 
Cheers,
Carlos.

