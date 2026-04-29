Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F82D3859EE
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Apr 2026 16:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777478709; cv=none; b=mNRTVKODNKcUuAbWd2Xp0LyySS6P++N6lYjAZg3U+LQOo1cYhjV31JUpRspMndQkwtuJ1ZIl0zqJqMmQYasgjMELSJHOe3T0APBXn9aWxsQUAAyc0rG9c1aCF2/ypSPbeRxTy7CAX7ek500zjXmyubbh+uAX0w884x5eWAaSO5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777478709; c=relaxed/simple;
	bh=x+0wbmvfZLi2zccUgRu+8dtKBGL6sMlbHIT9xAzWRuo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=epkw934mljHrjZLNjabMU39kMOZcuX/lTklUOh9uYcYdBO4Ps7z/RkkTBcqft4cLQImiYOmfHEw5qho37ZmQ2rfVcvdoSstp/nZZojK6/c5I3awTiWz2Z1nitSv99XkLPlIbrVU7gPL6SfqxKOKl2Q2v7SIqdayXASeikk2lIhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iEEk45FV; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iEEk45FV"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B088227F
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Apr 2026 16:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6LibmhuX5GM for <cti-tac@lists.linuxfoundation.org>;
 Wed, 29 Apr 2026 16:05:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC1608227A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC1608227A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iEEk45FV
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CC1608227A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Apr 2026 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777478704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U7AWm8FTu0VUAfp4Pvt+q4dXJ8sjqalOWrMimovdIN0=;
	b=iEEk45FVOGA9ge78XUx2Y769m4rTrskcZc1mbdXC+TLcnEBN09PSrEg+8RneE22bNtPVQZ
	Gwpnn3ZDuV+hpqCuzKM5oDneG/XQWbT9x15nyQhLedOM33GlO9rO2Zn0OuvVwOhpntYvsD
	t4qEEE7K3/Y145ezwGOR7A6iYuVylEg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-zOtBzzW5MUaLyQ4-D0WN8w-1; Wed, 29 Apr 2026 12:05:03 -0400
X-MC-Unique: zOtBzzW5MUaLyQ4-D0WN8w-1
X-Mimecast-MFC-AGG-ID: zOtBzzW5MUaLyQ4-D0WN8w_1777478702
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a0b5478a12so22765766d6.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 29 Apr 2026 09:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777478701; x=1778083501;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U7AWm8FTu0VUAfp4Pvt+q4dXJ8sjqalOWrMimovdIN0=;
        b=l23P8KHVfXpxxqRNpfsQR7wfvg+qsC2PN/TzQhGWx5TCDBtiMTjgJY0CM96mFGcdHB
         H5NqDbB6MtU7SfQuxuMaLnVeLtm5mwv627NwIHPrqnLeZDRLKLWb7mJZ/0u9PfcbUHJw
         51uFNixsw2SowL4Cw6jF9F3dgY5IWU9jG74N52sZkTggPbIENIBP6BXEpphc+ry01iff
         4821C2BKGts+ASoyCLkBG56uSesrS/gl0CmikEXw2C6YjR3at2d5TLgBkjTAROfV9F+E
         tA5MjjKIh2sVovS1iZamT6NkonPp0Dt9hk9zECfJrZT2+VWNdEibxgx6MKZP6PgBbGsB
         QJyw==
X-Gm-Message-State: AOJu0YzzA4YZN/VGN2TFFutayl8KkIWEGU61reWHtwYFRRa2vHxfgfcr
	fIjE4GBZ3bU0iFRmzl6qx0eS6Yop24Ldaxid9+/ocF0LVXRxgE/Mg9aXT6tydLscedwaCV22u9T
	eALVugNg//CNSrBVfbze/JNKc7aTBYZ1HTGtCq9YWFUpEAcxNjDcbXozyNFgvvAvMJXPkAVWLaU
	r1uo9dZQL+0iqZYoy+NHEB5Q3VS86D7RQRfdlTL9tzQxO1J5gPN0VzCg==
X-Gm-Gg: AeBDievvzJmAAn87JYJuwdbXPkJXNGUrKB84DZeq3PJsguWeh/cmZOab4femXksrKgm
	EJ62OpVxH6XNwUEDD5JCo75+LZ2BdQVoh8yNpgzmgeSd3qmDZrsRJmco9dxV6d7lAXtsJ2jguCr
	cV2RlZkJiPea9oApJ8IkiQH5Mg7J5ZxW2ZlZkvjmFFBi7XKZ8341cV4Tg8A6Z4U7tgOvZznS7us
	ZvSg7Pdjdcjjs/1/JwzKDB1e80bREZyFA9xPGIV4WXG26ilps/ibyzqyBnx9rzzdKgUHOcqp5S9
	4NMsETtvZlENEIm/zRiWNHt/C7f2UNNahrYeI3z/iOyo/4XgfBrvttIZUwc5jsH0oHqKQiAWXJg
	0RSCytPpbT8f5J+MnhFDNHTHkrg3yYZrwz1jtKeHAuLo4s4jtK/kfAoAZ7UUf0HCiEZO0o6E88Z
	4Hf3FhWi1gqSqUCbciR1G9bOMH9Uifx3Ak
X-Received: by 2002:a05:6214:262b:b0:89c:87b9:a5c3 with SMTP id 6a1803df08f44-8b3eea5ebb9mr54074116d6.25.1777478701379;
        Wed, 29 Apr 2026 09:05:01 -0700 (PDT)
X-Received: by 2002:a05:6214:262b:b0:89c:87b9:a5c3 with SMTP id 6a1803df08f44-8b3eea5ebb9mr54073566d6.25.1777478700708;
        Wed, 29 Apr 2026 09:05:00 -0700 (PDT)
Received: from [192.168.0.116] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef8422a4sm26898486d6.41.2026.04.29.09.04.59
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 09:04:59 -0700 (PDT)
Message-ID: <b3141ec4-1dc3-4327-b1f7-e9706888dd8e@redhat.com>
Date: Wed, 29 Apr 2026 12:04:58 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: CTI TAC <cti-tac@lists.linuxfoundation.org>
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2026-04-29
Organization: Red Hat, LLC.
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s-2X8l1u-yc5wByxUMMmGIYOplpIiEV-553FsEaw_Pw_1777478702
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

​CTI TAC Meeting Notes 2026-04-29

Present
  * Carlos O'Donell
  * Joseph Myers
  * David Edelsohn
  * Siddhesh Poyarekar

Agenda:
  * Sent email to LF IT regarding SOW update, and meetings.
  * Responded again to the FSF which has questions about the process and sponsors.
  * Carlos: Restarting Office Hours for CTI to finish gitolite migration for glibc.
   * Will post to the list the model without any usernames that came from Sourceware.
  * Discussed if Red Hat and IBM would sponsor distinctly?
   * Carlos: My plan would be to ask both as distinct users of the GNU Toolchain.
  * Carlos: I'm planning to setup a meeting with Arm next week.
  * Discussed CY27 sponsorship pitch deck with Joseph, David and Sid.
  
Action item:
  * Carlos to send Arm meeting email out to start discussion.
  * Carlos to send Red Hat meeting email out to start discussions.

-- 
Cheers,
Carlos.

