Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8827469
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Aug 2023 15:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B72C261015
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Aug 2023 15:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B72C261015
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IVcqvud4
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b7BBppmWsNmQ for <cti-tac@lists.linuxfoundation.org>;
	Wed, 30 Aug 2023 15:51:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6CAD760F79
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Aug 2023 15:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CAD760F79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693410678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3PV+mvHHVTlvUrCgLg7BmnCcZRzw+VlhLb4x/wjws8E=;
	b=IVcqvud4fdn3EKNk554FdHEW9QFgdSTg5GE/rNYOwY81O4fYtKPPMKItGzup3gX5IhNx8p
	Ufn0UcBvfMJFz4lFtQPKYtO2hrW1tXJbLbuhMH8o/T51bKelOKGdzg65nCbOPT/v8p/kgd
	trgoc+czPaf3xPOPbrdlj0IS4oYm1CA=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-3kkLcCvSNXqAq00288H1Zw-1; Wed, 30 Aug 2023 11:51:17 -0400
X-MC-Unique: 3kkLcCvSNXqAq00288H1Zw-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-5925f39aa5cso18533907b3.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Aug 2023 08:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693410676; x=1694015476;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3PV+mvHHVTlvUrCgLg7BmnCcZRzw+VlhLb4x/wjws8E=;
        b=DH1dTIN/UlXEioPyKdFN4yMM4FvPwVxGd08T+yizVvbNnFn0hb8KditreOnVfsBrGy
         eGokUVIIOMeBXDNkpJnPaPFx0Zhe4bRx3Q7p9qY1V/pjSkc7mhErSVAOGSNlqlcZhBX8
         VWzm1+soL3Zf54h5VqWx3eH/JTlZxN+pvo2LSuOQ0uy6nOSIyhxs3K5DsDunweVBviRt
         fY3QPUeGdmIbKrJA++XA6n2XN93EJzd/WLkbJ72qpgyeXHyQfNI37vd/M8Inxqpnt45Q
         4q0woRHfQVww0ndOGMdW6tXYnMeT0j2PfBq9Ai1byiiZimG4hx2o0XvvpkZF8JtqRYLe
         8SHQ==
X-Gm-Message-State: AOJu0YyF51tr9jod6qYrB3mmOjk17sgEFmyEjXVxk/W4U2eroOXWufGJ
	x7F0k1xNv6N3cCj04Z1o+xyRqQfHcJjDfkReoPE3YtvntR8AI/G/8I1l+mVR90KREynjlBHicKH
	hWZONZkWc4Cliys3W0zlQfEUDZwjeRa1QzQpfUeHP1fZe1WLtboFeSoXOz4zb2etcMRDENYBuku
	YjVrl2n9T1gN/0
X-Received: by 2002:a81:4881:0:b0:594:e439:d42d with SMTP id v123-20020a814881000000b00594e439d42dmr24496ywa.22.1693410676375;
        Wed, 30 Aug 2023 08:51:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAn66FrLEunK8l6xcUlMkMo3RL9I96eYLltTI0q8noTc65LAiIfpyAwa65xAGo4NfIaCGGIA==
X-Received: by 2002:a81:4881:0:b0:594:e439:d42d with SMTP id v123-20020a814881000000b00594e439d42dmr24481ywa.22.1693410675928;
        Wed, 30 Aug 2023 08:51:15 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id t80-20020a0dea53000000b00585e2c112fdsm3370168ywe.111.2023.08.30.08.51.14
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 08:51:15 -0700 (PDT)
Message-ID: <a8e5275b-ca70-c5b1-27ca-f2acc04b6825@redhat.com>
Date: Wed, 30 Aug 2023 11:51:14 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2023-08-30
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

CTI TAC Meeting Notes 2023-08-30

Present TAC members:
    * Carlos O'Donell
    * David Edelsohn
    * Joseph Myers
    * Jose E. Marchesi
    * Bennett Pursell (OpenSSF)
    * Ian Kelling (FSF)
    * Siddhesh Poyarekar
    * Adrianne Marcum (OpenSSF)
    
Agenda:
    * Carlos: Seeking consensus among the glibc GNU Maintainers/Stewards for use of CTI services.
      * Carlos: I asked for decision to be made by the end of the month.
      * Carlos: Siddhesh, On the feedback do you think there was anything we needed to act on?
      * Siddhesh: Feedback about the usage of bunsen, buildbot, and snapshot.
      * Carlos: We haven't had direct feedback from developers regarding these services.
      * Siddhesh: Doesn't need to be part of the services.
      * David: Doesn't need to be part of the initial scope.
      * Joseph: Some of the services do not need to be migrated. Some do.
      * Joseph: Things like buildbot don't need to be considered first.
      * Joseph: We do need a more detailed plan of the migration.
    * David: We as the TAC should create an MVSR for the OpenSSF TAC
      * Mision Vision Strategy Roadmap - MVSR
      * OpenSSF MVSR https://docs.google.com/document/d/1p6hOlE4eH1xvQ9pP7swCH2tmIJJ-6G3vnYI8MDzSCQk/edit#heading=h.h9d3nj3ybue3
      * In general we can take a strategy approach.
      * David: OpenSSF and associated projects have been asked to produce an MVSR.
      * Help share and socialize the project and what it does.
    * Bennett: Going to meet with Konstantin (LF IT) this week to discuss timelines.
    * Siddhesh: Started the CVE CNA conversation.
     * Vet security issues coming in, and with that going through we'll probably need some infra.
     * Need a mailing list, and a place to put advisories.
     * This will require CTI services.
    * Jose: Would be great to have Siddhesh talk at Cauldron on this, it's a serious issue.
     * Siddesh: I'll talk at Cauldron, but more importantly setting policy SECURITY.md for projects.

Next steps:
     * AI: Carlos to review MVSR questions and send draft by 2023-09-01 to cti-tac list for review.
     * AI: Carlos is following up with glibc project leadership to decide on CTI services.

-- 
Cheers,
Carlos.

