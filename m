Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F350524F51
	for <gti-tac@lists.linuxfoundation.org>; Fri, 11 Nov 2022 17:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7664460FD6
	for <gti-tac@lists.linuxfoundation.org>; Fri, 11 Nov 2022 17:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7664460FD6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eq9tQhg/
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MbZwjdXBIRhH for <gti-tac@lists.linuxfoundation.org>;
	Fri, 11 Nov 2022 17:24:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8F9260FA0
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A8F9260FA0
	for <gti-tac@lists.linuxfoundation.org>; Fri, 11 Nov 2022 17:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668187482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RsPSc/xD7OdPg1EIATue9W4d/qFQFG2dswF94o2IBAE=;
	b=eq9tQhg/J1mHvF2sZlLZeVJ2BKw02al8zXcKZdTJaS6GpGpyVTim5h5pBFODX3/rGw+iVN
	clk1tWHr5LKijdC5t1mWFy9bBXVldjCRKcHL6oXlpnioCwwiytkYi4F0AeAiI+ZVkkM1SB
	Kj9C5Q/p40Mt8/aecpqbeHEGnqc/RIk=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-473-bXQTM7hxOlSEUKruNCqNhQ-1; Fri, 11 Nov 2022 12:24:41 -0500
X-MC-Unique: bXQTM7hxOlSEUKruNCqNhQ-1
Received: by mail-io1-f69.google.com with SMTP id j17-20020a5d93d1000000b006bcdc6b49cbso3450864ioo.22
        for <gti-tac@lists.linuxfoundation.org>; Fri, 11 Nov 2022 09:24:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RsPSc/xD7OdPg1EIATue9W4d/qFQFG2dswF94o2IBAE=;
        b=H7r6n8VaeLDBaFSgK8N9bluPri62Q9KjvxM3BBiGrCuXhKJlq9hYT9oedDo2QerJ6W
         XjG7yNW5H7PZRrm0iCJecHZhAcPQVx/pAwY41sdGRdglwJTU5pwD0Tlf68yypz6YXEkM
         oiFskp8XTLM3LQdIf1PuN4Kwuh3SSeh2MAPSvp65lERZIEn0khOKZs4VxuvGV/CREkYJ
         TiqUiLegcmWGBYLiKQUOXss6KJw4PMFRK4bNrVC2GhjoqNQRRigkHjPwqPQR+dqBbD51
         QuuVBWwa4v14Mx+Vp98LLdwc6kMFKCCSD00+sbY0ECMXLp4DGqNHZ5BpQyDR3fVFqz50
         ybww==
X-Gm-Message-State: ANoB5pnouWRGFB0wmndimlIUVXtKodf/VV/6bEgHrLdtIKta0Fgnd/nT
	0Hn53BlXkFKzwkzN/4Lg205ktL2b4vW/KSSouWGeYqHGy5UYnLDfi+vrS762r2ZmgD8louCd4fR
	VAMV+046EyZF614jJIy4uECXz0uPvWuunj5jKVPx7YURMx0gxzcFtLWgAoUcEa6x3rfP98QeIm1
	tHh/n4
X-Received: by 2002:a02:b190:0:b0:374:98f7:2ad2 with SMTP id t16-20020a02b190000000b0037498f72ad2mr1237506jah.0.1668187480393;
        Fri, 11 Nov 2022 09:24:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6GIaZ6MUp6diFs1h0aA4DBSri6R02ORc9x8ZJt30HnQYg3/fMpmXxvt2jvczruFgLppieFqw==
X-Received: by 2002:a02:b190:0:b0:374:98f7:2ad2 with SMTP id t16-20020a02b190000000b0037498f72ad2mr1237494jah.0.1668187480146;
        Fri, 11 Nov 2022 09:24:40 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id z11-20020a05660217cb00b006bccaa66ee4sm999544iox.40.2022.11.11.09.24.39
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 09:24:39 -0800 (PST)
Message-ID: <3a81d482-c952-d501-f495-485f00400e85@redhat.com>
Date: Fri, 11 Nov 2022 12:24:38 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: gti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: Action: Setup working group for the GNU Toolchain proposal to migrate
 to LF IT managed services
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

TAC,

We discussed this proposal on the 2022-11-09 TAC meeting.

Here is the action with more details. Please review and provide comments.

I'm out for the next 2 weeks, but I wanted to start this ball rolling.

Action:

Setup a working group for the proposal to transition to LF IT managed services.

The WG is tasked by the TAC to initially enumerate in detail the GNU Toolchain
project services.

Details:

- Working group will enumerate in detail the GNU Toolchain project services
  for the projects including gcc, glibc, binutils and gdb.
- Working group will commit documents to the GTI TAC sphinx git repo with
  all of the enumerated service details.
- Working group will nominate a rep to report at GTI TAC meetings on the
  current status of the working group.
- GTI TAC and WG must determine next step after enumeration is complete.

Next step:

- Seek volunteers. Please respond to this email if you want to volunteer
  to be on the "LF IT managed services" working group and help enumerate
  services.

-- 
Cheers,
Carlos.

