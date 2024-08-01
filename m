Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15A0161306
	for <cti-tac@lists.linuxfoundation.org>; Thu,  1 Aug 2024 11:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722512738; cv=none; b=nI7YihjwDWVb0dyLxu1kfAaHqfTJ3HaQjUG4xkmlHNl8Ad/jPvzJKPJ9t2/Zrfy0jKx7mUXw6YHlroDwVG+EiaJgMmZ2UUidQv6IEx+Qjtys8ofcOl30C97izfe66MzhM4KEsU5+0GNeGfhjFtXzC3BZoPTPqSEmks/aEBhv7c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722512738; c=relaxed/simple;
	bh=Dou6uwGGi+4h+4TZAyd1jQhPYCKwxLt2iLu4yrwEGWQ=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=mWdc1LRWZMN9fXz4I9/SsxOg/3+jG/wO44hIZtpMwfvmtAVv0JB+DHArvlVYCegFERYJEqO+y1EfhrYoS+Fb5qn15rEDM7VjjAMewxo2VKnq/XYLjfflaF5GcKQ9BM8Z9scEkfPT7A53wKE+glDS/bhMCPH2VrXdohpAb+i9ZEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cNQBqscX; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cNQBqscX"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4DD840198
	for <cti-tac@lists.linuxfoundation.org>; Thu,  1 Aug 2024 11:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e65EckMNdnwv for <cti-tac@lists.linuxfoundation.org>;
 Thu,  1 Aug 2024 11:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1059B400D7
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1059B400D7
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cNQBqscX
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1059B400D7
	for <cti-tac@lists.linuxfoundation.org>; Thu,  1 Aug 2024 11:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722512733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TP8rvKALKgDAN/So2P7UlPYSVvYBqc1B+4/WH45Tw5g=;
	b=cNQBqscXPtxVXmN1aCF/jnM4vn7JzkyacNL0AuovFDYE4xOwk0pDVx172VKeZDicW0xD/q
	pieicG42ZWpXLhynUmz/k0K+2P60w9JjZDKn7NWriHZAkDuQsqA0OMIUTFvTFPbeyTpqLd
	yexsCw9/WNm1Rl4w6BD+tKnHyL+1uu4=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-6Rb0hOwMOb-6Fq8zzmB4Mw-1; Thu, 01 Aug 2024 07:45:31 -0400
X-MC-Unique: 6Rb0hOwMOb-6Fq8zzmB4Mw-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-70947f2854dso5503667a34.3
        for <cti-tac@lists.linuxfoundation.org>; Thu, 01 Aug 2024 04:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722512730; x=1723117530;
        h=content-transfer-encoding:subject:to:organization:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TP8rvKALKgDAN/So2P7UlPYSVvYBqc1B+4/WH45Tw5g=;
        b=aKv3BfIaBJQskDqY7yZjY85CVL1xSGzzVmwJeNkel00h3ywub0Er+vh2O3Ph5SdQ8/
         TeHy7zsTIjtayvtFNJ4zMo9H5eQeyGI/vtCf3N52vXCeGYzXiZt50tvs+PJKad7eTcjP
         ECRY6X6HCpUNBlGjA6pYuJ3PoWh/riPjCB/6jt1rIS6weJsDOdSQMQAKwq/3BoiNXPAb
         jtPL0AS45ALcdfFM0soAuNJ2M8FR/2Y3eh3LREhU4bxXhaeIAsMIwJXT8ZPH31H/Io4e
         4MSeLEvRxIZLP61iabemjsH1YIMjfiPgnn1vzIwCVPcnEIOkLktSBZ3mO3RP7S23Wevp
         GmgA==
X-Gm-Message-State: AOJu0Yx7BahPnWVVaN4jPS2HX0cU64RXtYgXaVRWUs+EMYxknJYPXY/q
	BGCQV1F0fc4OhKuAsZbb8mA4JLkgf7x6fjKgAA0RZ0gZ5R8+OF+FeU3hXRtARIb8PfYtb++7eVy
	DSUXo5JjgkcU/v4G14xS4nSYM/K2lF0eb3FSvlgyUBezLKmd5rDqA7wn2am+yZv4BztpLHltZVY
	a/aotmvOsozIMXBOJ6AVna98Hy7pj6ec2Zqc1fzG8P5iFU4VW14Q==
X-Received: by 2002:a05:6358:9102:b0:1aa:bc42:eb01 with SMTP id e5c5f4694b2df-1af2edccfc7mr286203155d.7.1722512730424;
        Thu, 01 Aug 2024 04:45:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC+pzH44zWYffECGcE3d2zhoIuE5lwZjk/eQY47kQFX6UxiDnNNJQDAjfOU8ZwbMeXtemPLw==
X-Received: by 2002:a05:6358:9102:b0:1aa:bc42:eb01 with SMTP id e5c5f4694b2df-1af2edccfc7mr286199655d.7.1722512729585;
        Thu, 01 Aug 2024 04:45:29 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb3f919501sm84040356d6.53.2024.08.01.04.45.29
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 04:45:29 -0700 (PDT)
Message-ID: <5e90ba39-d301-4ce3-bfab-d663864cb627@redhat.com>
Date: Thu, 1 Aug 2024 07:45:28 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
To: cti-tac@lists.linuxfoundation.org
Subject: CTI TAC Meeting Notes 2024-07-31
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

​CTI TAC Meeting Notes 2024-07-31

Present:
 * Carlos O'Donell
 * Konstantin Ryabitsev (LF IT)
 * Bennet Pursell (OpenSSF)
 * Joseph Myers
 * Nick Clifton
 * Siddhesh Poyarekar
 * David Edelsohn
 
Agenda:
 * Updates on glibc developers discussion around the SOW and migration.
  * https://sourceware.org/glibc/wiki/CTI
  * Clarify the how and why?
  * Siddhesh: Key concern around communication to the community? How often? How we communicate our progress?
  * Carlos: Certainly, yeah, monthly updates?
  * Siddhesh: Yes, mirror the meeting minutes?
  * Siddhesh: As far as CTI is concerned, the project stewards too, are quiet, and it doesn't help that they aren't vocal.
  * Carlos: AI: I'll ask Maxim, and Ryan, and others to make comments. Likewise reach out to senior developers looking for public statements of support.
  * AI: Mirror meeting minutes to libc-alpha on a monthly basis.
 * Carlos: Also I'll note that I don't want to ask specific teams to change they way they communicate. I will not dictate how teams want to communicate. But I will engage more on the mailing list if they need.
 * David: I agree with that.
 * Siddhesh: We want more vocal support from the stewards.
 * David: This has been the achilles heel of the project, that we are very technical, but not about being active in a mission around the projects.
 * Nick: Does the project need to move all of the services to CTI?
 * Siddhesh: I don't think binutils or glibc have scalability issues, but security and isolation, particularly git, it makes absolute sense to move them over and not replicate. Like having an official git repo at CTI and a mirror at Sourceware.
 * Siddhesh: git and patchwork are both really core services for access and auditing.
 * Carlos: Yes, git and patchwork are core.
 * Siddhesh: My personal preference is to have everything in one place.
 * Carlos: I agree.
 * David: Note again that we've always had corporate sponsorship.
 * Nick: The migration can be piecemeal if necessary.
 * David: Within the projects individual services can be migrated, and within the GNU Toolchain project, individual projects can be migrated.
 * Joseph: We should be thinking of the "community" those people actively working on glibc, equal partners, and working with them and understanding the security requirements better. First understanding what the issues are. And then only given the understanding going from there to the corresponding hosting requirements. I haven't seen any direct improvements to meet these concerns since 2022.
 * Joseph: I have another problem with Sourceware, which is social engineering of the changes requested to change Sourceware services.
 * Carlos: Yes, not just sysadmin requests, but also approval of account access, and volunteer approval are things that need a process.
 * Carlos: How does LF IT handle this?
 * Konstantin: Signed emails, trusted, verifiable, and any requests are reviewed by the team.
 * Siddhesh: We do have informal channels, but do we have specific examples?
 * Joseph: I don't have examples of social engineering, but I have examples where one person requested a change without review of this with the GCC developers.
 * David: We are still operating in a "trust" based manner for a 35 year old project, and that's not entirely practical right now.  
 * Carlos: Can we publish the CTI sponsorship agreement?
 * Bennett: Yes, there are public samples.
 * Carlos: OK, so I have an AI to update the CTI one and publish it?
 * Siddhesh: One of the concerns that was raised, was a fear that the TAC does not have enough influence to move things forward in the CTI project.
 * David: We had addressed this concern in the town hall.
 * Siddhesh: We probably need to update the CTI docs to add that information.
 * Carlos: Bennett, Who do I reach out to to get a PDF of the sponsorship agreement?
 * Bennett: AI: Who do I reach out do?
 * Updates on OpenSSF TAC presentation from CTI.
  * Presented on July 23rd to the OpenSSF TAC.
  * Paul Eggert came to the meeting and talked with Carlos.
 * Bennett: SOW, need to huddle with him. Are you going to review the SOW with the FSF?
 * Carlos: Yes, possibly, 
 * Updates on FSF position regarding CTI.
 * Bennet: What AIs do we have?
 * Carlos: I'll email out the minutes, and a distinct email with AIs that we have from this meeting.

-- 
Cheers,
Carlos.

