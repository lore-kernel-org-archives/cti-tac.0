Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBB115572B
	for <cti-tac@lists.linuxfoundation.org>; Wed,  3 Apr 2024 20:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712174752; cv=none; b=u7FEFz8R34FK+iVBr0D2bieefY+FtT3ECWtxf72Lgvrwuu4hgOOWmkPF1ht+Qp2ihDY2cj9Z0EPa3qEwm6Addh+g1DyErfgXfCZGRyySJWJN6jyJy/Jza/wQhQBNJXVuliEjnUm0ccTkW6REUQx0x3x+DTud0N0xVDdeVZy/ojE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712174752; c=relaxed/simple;
	bh=g3LLFCxHCPmjtkKf5HfcasNUDarkdPC31hbv4fsEZF0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=CKxsgennURlYEwQYBkuSD170a5IcDNcMLIYlcTXTLMiStdaXWtGxJnkGerGN1gZWvYxmp10ULQBC2kpzPz+Ta5+dDKHVjSpLm3XkSlA5vxyjUUj+310QmDLiiLiAApWwHKXAM1ePZ5vr2CJQwVyemF7HFD5QwsWmUgi14zxnTLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DhAoVDg8; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DhAoVDg8"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79D5460EE5
	for <cti-tac@lists.linuxfoundation.org>; Wed,  3 Apr 2024 20:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BX2ZF_d3zTJQ for <cti-tac@lists.linuxfoundation.org>;
 Wed,  3 Apr 2024 20:05:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 65FCF607C2
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65FCF607C2
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DhAoVDg8
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 65FCF607C2
	for <cti-tac@lists.linuxfoundation.org>; Wed,  3 Apr 2024 20:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712174748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=AUHihK7XOdFDmQBk3retHL0SFpXFHAR2Qz3xqlzw3s4=;
	b=DhAoVDg8c2a2a+Jlm/BNqVOp5HWoIBxqKmB8QQiKwzc97UqRQcTDJItJpPoSGXO+FjzxkD
	sjfWoojTMvMYyyAdSsDacrU2igasfjJqrLT9CGR5AvYRfwcKPmJoT5jq6V5zj0ottqXj/I
	/ukH3XjHYI1ibyQ9BwM55f1WeBbEs1U=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-6E3szZoWOeec1jYw8KlYtA-1; Wed, 03 Apr 2024 16:05:46 -0400
X-MC-Unique: 6E3szZoWOeec1jYw8KlYtA-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-78a6aabb595so25133885a.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 03 Apr 2024 13:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712174745; x=1712779545;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AUHihK7XOdFDmQBk3retHL0SFpXFHAR2Qz3xqlzw3s4=;
        b=B28SPFMCGxm9knrnIGIg2KDyBMUUCGEgX3eiFFti6C10yTlRV235XfnfGuL4vkbPqr
         8fK0EGptTEwKNu+t6xtrVDKkY3oCs8UnZpLiw5wx7blUOt5DJFrYRYsUgQ4NYG7jOeHH
         CFJwv/yrs7JtbEsoNdqDrG5wTzgrKmxqYY9XQyj7rxZgDFO4ZSu0yrWSkOjffMko2+yL
         7hIUfNNb9LdkxjW6ppkJSC7KzaYk9hVcX1yrmifY8xPSkAUKBhCnzhvoYjVCCneQBDli
         /RBiNMeVXUlQujNM7H1MKSAjheLlRiHI1DHgEkc+spbg9HFCP0TOm2aYpW0a8C9tZTJ8
         EuDg==
X-Gm-Message-State: AOJu0YxAA9ex4WbzZuZxkNYYRXWBLv3DmL9it/3WI8GTmN7IgoCNcEsf
	IWGUtS3rU0HVm3ZQubixAMz5hpTVQfieMwp6XN080cenQhld697iBNZdNmsFdNGF/IJr6nQxrkP
	XzSiwhIMkV81yHNflUfhBOu8/zgUjkUQ2YLzmfaX2TyHYSgZOX/KzSs1hZcSEVA5/uzumLXSEN6
	eXsgDEYn9UBnF9ikhpc4jaf7A5uJ+A5thKYu0vNy8qYbaze8dGBA==
X-Received: by 2002:a37:db0a:0:b0:78d:33b5:3668 with SMTP id e10-20020a37db0a000000b0078d33b53668mr442184qki.48.1712174745255;
        Wed, 03 Apr 2024 13:05:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNku3BT0NcQuGjR3J+vmZaz7XOWGYvSNiZZ6vRT2nMfnI7QyY3RGot0oN9zLqVAQOFqRXajA==
X-Received: by 2002:a37:db0a:0:b0:78d:33b5:3668 with SMTP id e10-20020a37db0a000000b0078d33b53668mr442151qki.48.1712174744720;
        Wed, 03 Apr 2024 13:05:44 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id q2-20020ae9e402000000b007887d30dbb7sm5358207qkc.60.2024.04.03.13.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 13:05:42 -0700 (PDT)
Message-ID: <b79e90ee-6824-4b22-a367-09740e4df746@redhat.com>
Date: Wed, 3 Apr 2024 16:05:41 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org,
 Bennett Pursell <bpursell@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI Planning for glibc migration - Meeting Notes 2024-04-03
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Attendees:
- Konstantin (LF IT)
- Carlos O'Donell (TAC)
- David Edelsohn (TAC)
- Siddhesh Poyarekar (TAC)
- Bennett Pursell (OpenSSF)

CIT kickoff discussion about glibc service migration to LF IT services.

- Carlos: Do we have a CTI GB to sign off on the process?
- David: Not exactly.
- Carlos: What would we need to do?
- David: We promised the CTI GB would be open.
- David: Agreed with Jeffrey Borek to go through the executive committee for the reading of our CTI proposal.
- Carlos: Can the OpenSSF just say it's part of CTI and become the single member of the GB and vote.

[Notes: Agreed to take this conversation offline, but we need a LF IT SOW to create the proposal
that goes before the OpenSSF GC as part of the open governance process to review the SOW and costs]

- Carlos: So we need a migration plan.
- Konstantin: What services will be migrated?
- The amount of data in each thing.
- The number of users.
- Access to various services.
- Carlos: https://cti.coretoolchain.dev/projects/glibc.html#service-migration
- Konstantin: The most complex migration is bugzilla.
- Konstantin: Likewise with Patchwork it requires some surgery.
- Siddhesh: Can we make a clean break?
- Carlos: I recommend a clean break.
- Konstantin: Setup a coretoolchain.dev bbb instance?
- If you wanted to start a fresh instance then you could own the instance for future migrations.
- Carlos: That makes sense to me.
- Siddhesh: Is it based on upstream BBB or is it based on distro BBB?
- Siddhesh: If the vendor has some patches on top of BBB that should be OK as long as they continue to track upstream.
- Carlos: What is next?
- Konstantin: Can we reuse git.coretoolchain.dev?
- Carlos: Yes, I assume these services are isolated?
- Konstantin: glibc devs have no access to gcc repos.
- Carlos: For mailing lists can we clone the old ones too?
- Konstantin: Yes.
- Konstantin: Let me take the current list of services.
- Carlos: Detailed service information https://cti.coretoolchain.dev/projects/enum.html#gnu-c-library
- Konstantin: Switching away from CentOS 7 and RHEL9, with a deadline being June.
- Konstantin: To write up an SOW.
- Bennett: The GC is every other week. High bandwidth. GB is once a quarter. May 16th next GB.
- 6 weeks to target SOW to GB
- 1 week earlier for GC at least.
- In the next 2 weeks want something solidly drafted to socialize.

-- 
Cheers,
Carlos.

