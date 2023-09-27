Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5CD5257
	for <cti-tac@lists.linuxfoundation.org>; Wed, 27 Sep 2023 12:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66D8B610E3
	for <cti-tac@lists.linuxfoundation.org>; Wed, 27 Sep 2023 12:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66D8B610E3
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IcxUepbm
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jI-jgXWJh3j4 for <cti-tac@lists.linuxfoundation.org>;
	Wed, 27 Sep 2023 12:51:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 075EF613E0
	for <cti-tac@lists.linuxfoundation.org>; Wed, 27 Sep 2023 12:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 075EF613E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695819096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=elI2MJeoJ6yPvqH2erw1Gc+aU/B9KIr6IqyOzqZ7p4s=;
	b=IcxUepbmlHL33QmjgPYeVxhpbW+7JsBWXgM8ORv7JMkOCZRcZL5ojpmVdbf54E8GStcbNU
	SQRXYISCLf/JSTCcJKUhHUVNBieH0YFf8bHquNNvHN6YzpmF0ap0QRM0NS2jb9Hd4SIOl9
	iC+hhYs+2vQ4jy8RXDEWsLwogqJd6yk=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-MFRs-f-EOB6nsnG2-ETNCA-1; Wed, 27 Sep 2023 08:51:34 -0400
X-MC-Unique: MFRs-f-EOB6nsnG2-ETNCA-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-59f8134eb83so127975137b3.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 27 Sep 2023 05:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695819093; x=1696423893;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=elI2MJeoJ6yPvqH2erw1Gc+aU/B9KIr6IqyOzqZ7p4s=;
        b=YxLvFwq2aTCHseBdGtECGNOACAQ3x9PrmWL8mdGLSTWg3f3rl9BEx4w06+Q5W5NXmk
         FJ7RVHLLL4bQ9ExkfoqDX4m4c2EOvp33HkdsmIQs7MKbcRjihq/tf5yuC9D2VMo1H+FL
         tm89HiU3xbHiREA+gWOY6z3GOyNURwyiIU+if4A/jwqGwKVmidBCQYn1TmTCShOmco+B
         kIhQp8RMEh1WzoSjzIDXbUd7E5aeizJmrqofDapJXCcWbE9boBmJfZq0p1cfOIyPEO7p
         tAWLDRhXXXBq2s7ur1BHplr1vS0oWWZBwV9W3Pt7pvOk7TOYKdVe/ut04r+jnQd1RkFx
         cRcw==
X-Gm-Message-State: AOJu0Yw/B+hqXOXqDN/Sf+jjGRU9otIPWhRdLZe7WEH37a9g/Nr3enha
	MkHGfwQ2Ih5i0KpQF/m9+pC4JaOHYkudwU346kKenpcSMgsUw5BhlPY4jySQJslEe6mTvSeSREy
	I5v0+cyigzqFie5RfZ8H6G1xr7OckoE3IZYiI7OKD/fjKM7r+6CUyV/xAKAEwYUhJ/G/hSyozQx
	5RpbL+uP1tWZ6R
X-Received: by 2002:a81:a247:0:b0:59f:72a6:da12 with SMTP id z7-20020a81a247000000b0059f72a6da12mr1932183ywg.23.1695819093333;
        Wed, 27 Sep 2023 05:51:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3mZKLCBtqfT6e5ExK5/zAvfzbUnZ09f5FUSOUh+EZHSddPAcw1CrrZu32KQCNibPF1vysfQ==
X-Received: by 2002:a81:a247:0:b0:59f:72a6:da12 with SMTP id z7-20020a81a247000000b0059f72a6da12mr1932158ywg.23.1695819092741;
        Wed, 27 Sep 2023 05:51:32 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id r188-20020a0dcfc5000000b00565271801b6sm3689332ywd.59.2023.09.27.05.51.31
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 05:51:31 -0700 (PDT)
Message-ID: <94ba0463-ff5f-04cb-e3a1-e299e9111e68@redhat.com>
Date: Wed, 27 Sep 2023 08:51:30 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: Reminder: CTI TAC Meeting on September 27th at 11am EDT (Today)
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reminder: CTI TAC Meeting on September 27th at 11am EDT
BBB Conference link:
 https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1
Recurring last Wednesday monthly CTI TAC meeting.
Agenda:
- Standing monthly meeting for review.
- Discuss current TAC topics and progress.

My apologies for the day-of reminder. The meeting should
be on you calenders as a repeating meeting. I'll schedule
an email to go out ahead of this on a monthly basis.

-- 
Cheers,
Carlos.

