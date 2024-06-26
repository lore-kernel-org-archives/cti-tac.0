Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D18018F2D5
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Jun 2024 16:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417689; cv=none; b=eu8/gAForvho0MgUQHWcEZVTAyKXH3SmNzz5230XigcqIAEA/mkdjUbdnm38rmpGkJO4r3UG5fHsZvCPvWX4ygzWkr92koaRMGOIqOf1Gbb4SfbZQXLVT0roU1LVR93tjdX3HMeKqlv/0CVLUtjotuEFV9UhezRPuK8cEcMhJ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417689; c=relaxed/simple;
	bh=dE3jyz7j0OanS6vZOh8wLtOJ2gZ1/gwFYiwjmy3CkJU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=agRBBByUrUR2WHIpF+1Yjuoz2nBmmKSRjCrn5xGyl+bBP63h5EsFdjRa7LSy4IXHbH0Edp6u6uLpqg2DloxGJkKJvPNhPu+3QEfsuSWHK02v7PLG/EfIt4nfClBRhsupOdIQ7Dwkbqngpoq6fQ2ITdUhhd1qipi1uA2Dl4fbx68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WnkpNw70; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WnkpNw70"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9966382004
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Jun 2024 16:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id du1fIhj0kMdV for <cti-tac@lists.linuxfoundation.org>;
 Wed, 26 Jun 2024 16:01:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AB90F81FFA
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB90F81FFA
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WnkpNw70
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AB90F81FFA
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Jun 2024 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719417685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=Tv/2oWyLJ+jJow01V40pDyIdCnxsiDppyNkJhnvn5ok=;
	b=WnkpNw70ukns6TzNSwERhI75tsJtmFENHGMiAVNINMyUBceAHCy1I42K3GhKQCpz9Z8dZk
	aiAylyaqr8NH2v6/DPybvnpi837XH2Dgs7rPFViJ9qYLcOF6fP4Q1forqKAIvvIkDx1w3c
	Ab1N25x3b2ywLt7+LY1sZukxnBo/P5E=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395--rdBldYqOomR2esA5uEJvQ-1; Wed, 26 Jun 2024 12:01:17 -0400
X-MC-Unique: -rdBldYqOomR2esA5uEJvQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-797d167a402so1007929685a.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Jun 2024 09:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417676; x=1720022476;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv/2oWyLJ+jJow01V40pDyIdCnxsiDppyNkJhnvn5ok=;
        b=btEizO6ia7n5OlU8gVMScSHwLuyT/x96n5QreB9PIDnHDMbvK/uY4V9+tewQPn+X96
         xBU/mwZxpz880GmMwezKK0TlzaaEzj1HTnrxXMYbsWe2JUtCE6VbQ41Avp99VICkZ5Me
         GnT/frV/4+yM71amxA+HksM1sF3DWmeUCKbFI/T1HU7yEj7HZyXaI08H0kVQ6uoCJjPv
         TULfNaAUcBh81rYYJU6kf4RGPJGoQ1YIN9CcQks0tg2o7Nl2kOLUEG7b78Q/gNxIw536
         Dd6Sbb4tvMPZiV739jjlXQAQVOAt/ueWgXW4CUf+MGDKCQBiO7k8b7t7aVPax76pW5dR
         +RZQ==
X-Gm-Message-State: AOJu0Yy4Y0VmnKeZ3hhEa6XtihJqtbg9jDV+BNB1kzZE3FRnxO8kU6bQ
	voB2+uOYGrrQL11spc0m2o/X1nhhwumAhecOL++HnAN+mGqvMJDSu+xNJzHwLo8IuVnlWJZSqDm
	vcFY+yOKe+haiStQt1rPn+eG/e0GRLjgnTyANzbOwCK+Zum86MM1OBgUjeiPg2e+a3XgeXxdzIj
	1vg6XrNK5IQYtlzj5NYR9pO6fXZfFxM6u3ogJYcTx8B+ml/b3Ilg==
X-Received: by 2002:a05:620a:469e:b0:79c:1321:37eb with SMTP id af79cd13be357-79c13213c25mr281228285a.59.1719417676278;
        Wed, 26 Jun 2024 09:01:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESkCmRxikl6jj9oeUwHQcMdD7ar2CrcEPw1+BucDwe/K5fHr5TiddNNGdWm30CYb7TyG8d9g==
X-Received: by 2002:a05:620a:469e:b0:79c:1321:37eb with SMTP id af79cd13be357-79c13213c25mr281221885a.59.1719417675515;
        Wed, 26 Jun 2024 09:01:15 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79d59f0557dsm3599885a.117.2024.06.26.09.01.14
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 09:01:15 -0700 (PDT)
Message-ID: <a1e31779-b3c3-4016-ae69-27aced5971e9@redhat.com>
Date: Wed, 26 Jun 2024 12:01:13 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2024-06-26
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

​CTI TAC Meeting Notes 2024-06-26

Present:
 * Carlos O'Donell
 * Konstantin Ryabitsev (LF IT)
 * David Edelsohn
 * Siddhesh Poyarekar
 * Bennet Pursell (OpenSSF)
 
Regrets:
 * Nick Clifton
 
Agenda:
 * Schedule going forward.
   * Done. CTI TAC reviewed SOW and provided feedback.
   * Done. CTI TAC meeting review of remaining SOW items resolved.
   * LF IT SOW sent to OpenSSF (Bennet)
   * AI: Konstantin to send Carlos and Bennet final SOW to share with community (2024-06-26)
   * In progress: 2024-06-27: Sharing early draft plan with the community.
 * Next steps revised:
  * Late June - Share early draft plan with the glibc community.
  * Late July - Agreed migration plan.
  * Late July / Early August - CTI GB would read out the cost and approve in a public meeting.
  * August 15th - OpenSSF GB meeting
  
Notes:
 * Konstantin: Working with OpenSSF to narrow down the SOW.
 * Carlos: What about ROSI pricing?
 * Konstantin: OpenShift licenses in particular.
 * Carlos: What I want is a redacted SOW that I can share with the community?
 * Carlos: We can redact the confidential pieces, just the services is OK.
 * Konstantin: Bennett?
 * Bennett: YEs.
 * Konstantin: Provide SOW? Sure. Is this binding?
 * Carlos: No.
 * David: No.
 * Siddhesh: No. Doesn't have to be binding. Intent is to share a plan.
 * Konstantin: Does the SOW include timing?
 * Carlos: Scope is OK. High level schedule is possible?
 * Bennett: High level of what we want?
 * Konstantin: It depends on availability of hiring?
 * Carlos: We can make a more comfortable statement like "working with LF IT as quickly as we can"
 * Konstantin: We can say we will be starting in Q3?
 * Carlos: Yes the blocking windows are July and January
 * Konstantin: Other things can be done piecemeal?
 * Carlos: Yes.
 * Konstantin: Table of first 3 months has costs of initial deployment.
 * Carlos: Community will ask for the rough number.
 * Konstantin: Estimated annual $276K USD, projected hosting cost and support from LF IT.
 * Konstantin: The LF IT services are extensive and built in to that cost.
 * Konstantin: Is there an SLA requirement?
 * Carlos: No SLA, commercially reasonable effort.
 * David: No, now is not the time to ask for something we haven't required over the last 30 years.
 * Siddhesh: No SLAs.
 * Carlos: We recently lost git push issues due to AdaCore hooks. Routing issues to the colo.
 * David: The SLA is within the LF, with the OpenSSF funding, and the OpenSSF saying this is important from a security perspective.
 * Bennett: We have redundancy and is that something we want to publish?
 * Konstantin: We do mention that already. We can also put in the design of the platform. Automatic failover.
 * Carlos: Yes please.
 * Konstantin: OK, I'll put it into the part.
 * Carlos: Goal to post to the mailing list?
 * Konstantin: Post to you and Bennett and OK it?
 * Carlos: Do you expect me to redact it?
 * Konstantin: Yes, we would hash out what needs to go to the community.
 * Carlos: Yes, I can do that.
 * Konstantin: That unblocks the SOW, and for OpenSSF we will provide more details to sign off on it.
 * Carlos: This week? It's the TACs purppose to review scope? I'm just going to work to redact the confidential data.
 * David: No other requests outstanding. Add text? Send to Carlos?
 * Carlos: Look forward to the email.

-- 
Cheers,
Carlos.

