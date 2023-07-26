Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FBC253B3
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Jul 2023 15:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3DCE41D9A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Jul 2023 15:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3DCE41D9A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ircKgOk8
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
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4V6CQUJ_2jQX for <cti-tac@lists.linuxfoundation.org>;
	Wed, 26 Jul 2023 15:45:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 761DA41D88
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Jul 2023 15:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 761DA41D88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690386320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E03nRytsnMaGufj2+RRIGLyXQNiD9I9kFC/VyIjpqrA=;
	b=ircKgOk8he7AdaSWpSTb74qRh2pEabObXx+FqfY8esHYDfK/VEtbRKK81t80cFjExkZwhN
	DH+LQBACCyxzUzOifNQSs5aky9lhSX3ou96lli/NLe74PStk53dNz0bqylPjpKBnEzQ/7a
	BK5Lr51dhrQeT+T55EMM/SwJAhBhHvU=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-g9fyv-QbPpGeCkDyRwNSnA-1; Wed, 26 Jul 2023 11:45:18 -0400
X-MC-Unique: g9fyv-QbPpGeCkDyRwNSnA-1
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-d0d27cd9db9so1947849276.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Jul 2023 08:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690386318; x=1690991118;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E03nRytsnMaGufj2+RRIGLyXQNiD9I9kFC/VyIjpqrA=;
        b=Ebn/WuBI3y7bqIpAZquf5lhyNNU6gJ0Ttrw26yFGi43twBGG8IvQivnGeXHs8JH1N0
         7RytBgEvjDs5YlxE98dr1pgega9obIZRLbsYjuY5sPtL+PyYbjSJmwCovseT8+0gFwPG
         O5ZIBV/xHnEESG7qt8jDR/ycTDMENqjzlEqM0+AqWoym6ytnBihMi0MZMeF5QGry7hBt
         wxOsR4qmeFxd81bL9F5WRF1fUaaEsS35kjwzrDAV0yEe2Sgo8Dc9HQCC3QTGXjZJML5b
         f96LSiQzCEbVfcv9/k2QApzDAmgtH5Z5tTk0dLLQ1d/GSdxmOck/cWm73S3Xq5dQvq4g
         MK2g==
X-Gm-Message-State: ABy/qLZGZPI//b0ypiOm72INZHoS+Gd+03gspL0x9P8Ce7QxhAHe2XnW
	eQ6pawnKiPhIBXTOUmA33Sc7obY3pmBm6o5emIDsYW9RNHoOKt/h5mbCCOiLqBMPAJL4gFpYam8
	0NNd9sAaMrm2RAWBI78Thea9OgLYUSQq/SsYXrM71RY3bOMFPJA1eJqWHYKXEeY4lMwpFrt55YJ
	bO22iuHSJOHZZd
X-Received: by 2002:a25:aaee:0:b0:d0f:213:bd3b with SMTP id t101-20020a25aaee000000b00d0f0213bd3bmr2632332ybi.2.1690386317893;
        Wed, 26 Jul 2023 08:45:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFWhSpJhuSY5ZX+y9wITKsGhdAgNPjQOQ1sut3WSuzXHnSiAIcnh6iFbk7rr9bgCf9DCupDNg==
X-Received: by 2002:a25:aaee:0:b0:d0f:213:bd3b with SMTP id t101-20020a25aaee000000b00d0f0213bd3bmr2632293ybi.2.1690386317099;
        Wed, 26 Jul 2023 08:45:17 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 188-20020a2519c5000000b00cf79d3a503fsm3515018ybz.42.2023.07.26.08.45.16
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 08:45:16 -0700 (PDT)
Message-ID: <39584ffb-eaf5-17bd-ab03-bcc65eedee66@redhat.com>
Date: Wed, 26 Jul 2023 11:45:15 -0400
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
Subject: CTI TAC Meeting Notes 2023-07-26
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CTI TAC Meeting Notes 2023-07-26

Present TAC members:
* Carlos O'Donell
* Nick Clifton
* David Edelsohn
* Joseph Myers
* Siddhesh Poyarekar
* Khahil White (LF)
* Adrianne Marcum (LF)

Agenda
- Review glibc community feedback to LF IT infrastructure proposal.

Notes:
- Discussed with Nick the use of the new name Core Toolchain Infrastructure.
- Posted to glibc public development mailing list:
    https://inbox.sourceware.org/libc-alpha/45e98807-908f-0968-b6fe-5dbb0af265b1@redhat.com/T/#u
- Carlos: Was anything sent to the list that needs TAC action?
- Siddhesh: What part of the Adacore hooks go into the patchwork trybot?
- What do we need from the Adacore hooks?
- Joseph: Patchwork does check the content but not the metadata.
- Siddhesh: Limit the hooks to checking metdata.
- Joseph: Bugzilla updates can happen after the push, within a timeline (SLO/SLI).
- Joseph: Likewise commit emails can be sent distinctly from the commits.
- AI: Evaluate git hook requirements for glibc, and which parts are content checking versus just metadata checking. This is to support Adacore hook features moving to LF IT.
  - Evaluate Adacore config for glibc and see which features are are using, which git commit phases are they in and which way can shift them to avoid the high risk repo access.
- Discussed that project level decision making is a consultative process.
- Khahil: Introduce Bennett (OpenSSF, ecosystem), and Adrianne Marcum.
- Bennett: Making sure projects make progress. Focused on the various ecosystems.
- Adrianne: Technical project manager for OpenSSF. Facilitate and make things happen.
- David: Do we include AdaCore (Joel) on the hooks and the issues with them?
- AI: Carlos to email Joel (AdaCore) about the hooks and their usage.

Next meeting: August 30th. Works for most of the TAC.

[Added a scheduled email to send a reminder to the TAC list for the next meeting]

-- 
Cheers,
Carlos.

