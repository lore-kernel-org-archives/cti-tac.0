Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B70412C556
	for <cti-tac@lists.linuxfoundation.org>; Wed, 31 Jan 2024 16:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706720294; cv=none; b=IWcOIEC72TWqM7du44hN0ky9pCx8yCi+eP89GjK58yS6o9TJtvU91VKG1YffZgM/6OP0aBhslhGhPNWmgAFXZDqlXqkietXGKu99gnBYO0fO+M7k1a3nV6fV0MuFOwhCts++xFv6tAr/yemRVj2BvfUhqt8vvs8ShnKjeogtSXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706720294; c=relaxed/simple;
	bh=JSPEN1sUun5fp8Ia7ntldh4BCr7TwK3vv6qobwEvGHQ=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=BjHXUd0wYG7MaSAagwotzmLT13XiD2+U1XqSFBC0SSCI9oRawn3Cm+JvMrcr5mmbJAwPUY+pH1yhD4rhiC5iWXJUK1VgZdw5zmORYHFxq587Nr4ktvBXYm8ZjwjaSuj0JuEuG2Qck1la2Bgk4k6sW8V0hwCduCDsQZDLHQiv25M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ETD+j44C; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ETD+j44C"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 259DF844C9
	for <cti-tac@lists.linuxfoundation.org>; Wed, 31 Jan 2024 16:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 259DF844C9
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ETD+j44C
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n85A2IsTb9Ph for <cti-tac@lists.linuxfoundation.org>;
	Wed, 31 Jan 2024 16:58:12 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 25B59844BC
	for <cti-tac@lists.linuxfoundation.org>; Wed, 31 Jan 2024 16:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25B59844BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706720290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RYXwj8Nx3VnrXCDZvto/Gr8JPfaOxZkO4yXjCT5V07c=;
	b=ETD+j44CgXhCmhDNOtXeTyx3Im8oEj/BWbsN1y5jI9sLlX59wySzTXLIqck99mUNXeSrw3
	k+hs4H9i6HJ+kjqxNAsgH3WE/7NgrQpNoBUY5heUkuqAiaM83/5P1t6XRUIX3ACHXOc8nM
	P4Zx95ZGz87Wu4rnVjk5wLzKYNWqQvw=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-8owFBlUxOBGylCWFlvNQEA-1; Wed, 31 Jan 2024 11:58:09 -0500
X-MC-Unique: 8owFBlUxOBGylCWFlvNQEA-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-60404484c23so24867477b3.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 31 Jan 2024 08:58:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706720288; x=1707325088;
        h=content-transfer-encoding:subject:to:organization:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RYXwj8Nx3VnrXCDZvto/Gr8JPfaOxZkO4yXjCT5V07c=;
        b=Q6tQWwJek+1IFN96UXygpsp8D7DxB4xcZvNho+aalngb9Jv9AysIX/6Tv5Cdj5rCb2
         BYBA33QVOAYgTHfTVfrOm08PXAnNtO90K+1x77WX2hP3hXb7W1yKgMRyEVhnlsWJix0Q
         tHto3vkRD1kqEuWuuLqkJ2+bps1nGjn7iLne4uERCHgXwAQCR75Xg+9KgqycCSg0jRc9
         YKqMO+tjhz+y6fNy6eIS/6sMik8YnS9F28OUxFOMgcIaQY1EHoC4XOEEgI2rjHZN4g59
         EDZyIocOyIn7b16JZYVk0tICMAqZJiJ5Xcc1nq1Lmf5yVJPcfUs/DKfx8SYXR062/wPW
         dprQ==
X-Gm-Message-State: AOJu0Ywlue5N8Q7LVg3TDBmHc/FEJ8p7LS3maKjfWPVt//tBd8Xk5AO3
	+2HF1YWn+7GOQhh2gr6LXfwz6qec6ieoYn5RrKet8BLj+MM8Gq1ZPNb+YEAcc6Su4RdaNUNR0Gv
	xj3zgnzWP10zArtJ+LJ12F81xK1z4QhCZhS6KfRhndzeg2iIWHTwOS4yRJVJMkBdG9jp5WnbL+Q
	5rOCm3FG5uUpEqk8Yc5BV/ipxWgtWNXKIJ5GO/jDrnUZY5mFrp9w==
X-Received: by 2002:a0d:d802:0:b0:5ff:7cca:a434 with SMTP id a2-20020a0dd802000000b005ff7ccaa434mr1918139ywe.51.1706720288584;
        Wed, 31 Jan 2024 08:58:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0d2o+eRniU6lyCdxezcbcISs8VY0uE53nUPn2fmgP1t7OmmqTc+4l2JnQhUJTESdmEvq13Q==
X-Received: by 2002:a0d:d802:0:b0:5ff:7cca:a434 with SMTP id a2-20020a0dd802000000b005ff7ccaa434mr1918113ywe.51.1706720288090;
        Wed, 31 Jan 2024 08:58:08 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id s5-20020ac85ec5000000b0042a9b0f8c2bsm3980604qtx.71.2024.01.31.08.58.06
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 08:58:07 -0800 (PST)
Message-ID: <6b433955-2865-232a-44c0-59682cbac446@redhat.com>
Date: Wed, 31 Jan 2024 11:58:06 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
To: cti-tac@lists.linuxfoundation.org
Subject: CTI TAC Meeting Notes 2024-01-31
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

CTI TAC Meeting Notes 2024-01-31

Present:
 * Carlos O'Donell
 * Joseph Myers
 * Siddhesh Poyarekar
 * David Edelsohn
 * Ryan Day (LF IT)
 * Konstantin Ryabitsev (LF IT)
 * Ian Kelling (FSF)
 * Adrianne Marcum (LF OpenSSF)
 * Bennett Pursell (LF OpenSSF)

Regrets:
 * Nick Clifton
 
Agenda:
 * LF IT Key Exchange protocol.
  * https://lore.kernel.org/cti-tac/20231130-hopping-innocent-labrador-40d2ab@nitro/
  * Konstantin: How do verify them if they are not familiar with them?
  * Adding trusted introducers in this CTI TAC meeting would add as access request certifiers.
  * Recommend: At least 2 trusted introducers handling the process of key changes or additions, removals of trusted introducers.
  * Joseph: What protocol gets used for adding committers?
  * Konstantin: No, you decide the process by which the community will onboard new committers.
  * Carlos: CTI TAC needs to decide how to decide how trusted introducers are removed or added later.
  * Carlos: I'll ask the TAC members present.
  * David Edelsohn: No questions. OK being a trusted introducer for CTI TAC.
  * Siddhesh Poyarekar: No questions.  OK being a trusted introducer for CTI TAC.
  * Conducted LF IT key exchange for Siddhesh, Carlos, and Joseph to be setup as trusted introducers.
  * AI: Carlos will setup another meeting for David Edelsohn and the rest of the CTI TAC to add David as a trusted introducer.
  * AI: Siddhesh, Joseph, and Carlos to email keys to it-coreprojects-helpdesk@linuxfoundation.org.
 * glibc steward vote update - Ryan Arnold voted Yay for use of CTI services.
 * Previos meeting AI: Carlos to reach out to overseers to clarify if they have registered any typo-squatted domains.
  * https://sourceware.org/bugzilla/show_bug.cgi?id=31098
  * Yes, toolchain.dev had been registered as part of the GNU Assembly discussions.
  * Carlos: I notified Mark that they did not need to worry about typo-squatting because we're using a different domain.
 * Konstantin: BBB password reset is to upgrade to v3. There are some issues that happen.
  * Carlos: There are 3 meetings that are probably 40-60 accounts.
  * Siddhesh: No objections to recreating accounts.
  * Ian Kelling: FSF hasn't migrated yet.
  * Joseph: No objections.
  * David: No objections.
 * Bennet: What are the timelines for setup?
 * Carlos: Feb 12-16 writing.
 * Carlos: February setup of website and Paul Eggert.
 * Carlos: Joseph and David can you review TAC docs in February?
 * Joseph/David: Yes, can be available.
 * Febrary CTI TAC meeting should be about glibc status and services timeline.
 * AI: Carlos to raise again on list with Alexander that we are following the GNU Ethical repository hosting criteria.
 * Adrianne: March 19th present to OpenSSF TAC.
 
-- 
Cheers,
Carlos.

