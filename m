Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA7E12EBD4
	for <cti-tac@lists.linuxfoundation.org>; Wed, 27 Mar 2024 15:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711553621; cv=none; b=Pwu0SAhmQlMDi2VdkMvfD8P4xnV266Wo0kNYP+wjyMt6Wz3KPicGMvsHrNty1p3oAvD7+RnPdMJdxFTrYQflAUMmYdFGrvOggpgTPx/z2hS7yyeR+zayYTQ3To4YlOKUac7KtEYxtgcaNZiwqblJhEWCz/WVbDYx5JlP8RB74sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711553621; c=relaxed/simple;
	bh=G5lid+eTjLJ2OmAMD+TqR8gN/pw2QXoBctc19yGIg7k=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=oQD84v8CSOPITxwe7o9G/pbfTJHg428gLrAshhi7CDWypotQE9MqgYTNksO7/LOWeqc+1Pu5nBskm2IQDJU2MRntgJ23+LAslasn05EqdMdaxBIWpzL+9hrxzxOkAaAcBi53RJaRtzHKku7n5qVAlQcnWf/5TiIS5jYUt/1NMB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AS/YoIRy; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AS/YoIRy"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9705840597
	for <cti-tac@lists.linuxfoundation.org>; Wed, 27 Mar 2024 15:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.599
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ie-on7OA-mBR for <cti-tac@lists.linuxfoundation.org>;
 Wed, 27 Mar 2024 15:33:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C44F840580
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C44F840580
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AS/YoIRy
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C44F840580
	for <cti-tac@lists.linuxfoundation.org>; Wed, 27 Mar 2024 15:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Na30EtQ7h2AQlSs4F+BBmaGZ/wnEnPgv4eMpcvFBAyY=;
	b=AS/YoIRy3+wOpT89UcY01Yuudm9JJcdM9aZisHhHoZRkpjJ3/7m84sdXAHNoS5WrtR+bK/
	wlHBmFvUS/4oCjdsEmgMzL/4QPvJniivkyhXN3cMUVdm3eFqXepAKmGUMFcr345jNK/65m
	w9647o63YKZJkBLJCxlJlgYDW1od6qY=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-d4Ct20zzMMOiVx9c71zcAw-1; Wed, 27 Mar 2024 11:33:35 -0400
X-MC-Unique: d4Ct20zzMMOiVx9c71zcAw-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6e68c004095so7370147a34.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 27 Mar 2024 08:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553614; x=1712158414;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Na30EtQ7h2AQlSs4F+BBmaGZ/wnEnPgv4eMpcvFBAyY=;
        b=UITzgK/mhiVzdLdG6xalVSLMDjqO1TLNZLdPd/mTkg3YFUc9RKrwnCjalLc8gefd81
         l5abJzFrqnMk3BYK84WanTS82BwNg7d5rdnXZyQ1z31ghyEQYmDbFhFgz87npdc1AuoQ
         b/t4eYTeivjKsG64UY1dVcTzTXOnjt040kmtcJ13bXAvTmiKUTynaUr62u4mCDE4vi2N
         8qY3Wwv4FMgcCxk5akrxFYX8O9Wu4yXffv/Lb6qBZsLIMYngdXBkz2FworBGM65yJ/du
         +fJb4pjyazBRQWizJ862ZcCJdXWXaGjHScdYdGAg+ySabI/cwC3cmUijvpj5wOM5jgvG
         mIEw==
X-Gm-Message-State: AOJu0Yw4Zch3Da9QVrOcxdGfDyRL/83YouobuqOlinlCRbylvIcK5oKn
	aJT4TC6rk7Ynm3uY5sFLYNWxM4dW53EIX0vOTlmlAwf+Tz5lpiA4ts3iakA7m+3OtdFOsLx03eo
	kV7A4wqCFJBuctJZnDTar853Ttf+Qfp4NEVx3BEyDDN9gybGweNLyDJPZdBCTa98DBN/V3oYea1
	4fLeo7LRjB/K33pWD8SO9wztpDLtqoY+K4823FzPDKkG5Jn7p3vQ==
X-Received: by 2002:a9d:7ccc:0:b0:6e6:e19e:3f1 with SMTP id r12-20020a9d7ccc000000b006e6e19e03f1mr108244otn.35.1711553614578;
        Wed, 27 Mar 2024 08:33:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuHQ/CSihIzuDsiura59qmnP3AA1KiUNHWYr4k+fuPDqxPKwwJ39Hv8Iuh/b2pXdkSGeJs4A==
X-Received: by 2002:a9d:7ccc:0:b0:6e6:e19e:3f1 with SMTP id r12-20020a9d7ccc000000b006e6e19e03f1mr108224otn.35.1711553614196;
        Wed, 27 Mar 2024 08:33:34 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id de4-20020a05620a370400b0078a47c3a3f0sm3677208qkb.38.2024.03.27.08.33.33
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 08:33:33 -0700 (PDT)
Message-ID: <d8b26d0d-7a68-4dcb-a7c7-1776c5cbbde2@redhat.com>
Date: Wed, 27 Mar 2024 11:33:33 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2024-03-27
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

CTI TAC Meeting Notes 2024-03-27

Present:
    * Carlos O'Donell
    * Joseph Myers
    * Nick Clifton
    * Siddhesh Poyarekar
    * Bennett Pursell (OpenSSF)
    * Adrianne Marcum (OpenSSF)
    
Agenda:
* The cti.toolchain.dev site it live with details on the structure and services of CTI.
 * Carlos: Integrated feedback from David Edelsohn and Siddhesh Poyarekar.
 * Carlos: Pinged Paul Eggert on March 8th, and March 27th, no feedback yet.
* Discuss Ian Kelling's "My suggestions on auditing that services are running free software" and other possible suggestions.
* Discuss next steps in the glibc schedule for using CTI services.
 * Carlos: I think we should move forward with LF IT.
 * Carlos: Joseph, as the other glibc steward do you have any concerns with moving forward?
 * Joseph: We should make sure to answer all questions asked about the services including Frank Eigler's FAQ questions. 
* AI: Carlos to add 2 FAQ items for Frank Eigler's questions.
* AI: CTI TAC to review Ian Kelling's suggestion on service audits.
* AI: Carlos to setup a meeting Paul Eggert to discuss F2F the concersn.
* AI: Carlos to send Adrianne a set of people for the CTI / LF meeting to discuss the start of the transition plan.
* Carlos: Walking the list of attendees to add items to the agenda.
* Adrianne: Any project planning we can help with?
* Nick: Will review the service audit email.
* Joseph: Nothing to add at this point.
* Bennett: Build into the schedule that we need to put this to the GB for approval.
* Schedule going forward.
  * 2024-03-28: Setup meeting with LF IT to start migration plan.
  * 2024-04-04: April first week meeting with LF IT and draft plan.
   * LF IT put together statement of work.
  * 2024-04-08: Sharing early draft plan with the community.
  * End of April - Agreed migration plan.
  * May - OpenSSF GB meeting
* Outcome: Have a LF IT SOW that we the GB can approve.
  * August 1st - glibc 2.40 release (possible migration blocker or the point at which we switch infrastructure)
* Next CTI TAC meeting is April 24th.

-- 
Cheers,
Carlos.

