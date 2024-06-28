Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC3F1CB317
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 17:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719594560; cv=none; b=BnqZzQOqfEuma6Xd4TOAg6Ukf7Dqzz5lN89phjevq8YGYYLBTsCn/qfbLrdwbjTDoZaqJDaCpygXnXn3fu+esRLGtdhO0H0NFup8Y4IicxqeZhdYoLzSFpkhU/7N8SGifUL233fz9q/i5UUG34vSQypncCm/Fp145CmCksNkPpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719594560; c=relaxed/simple;
	bh=zA3sAtbxhtrckg4Dob60VnT8WQaKIk/5pNaa+L48A/Y=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=hY4dxfmZuBJdiz84cRKYW0ifpKnMAw93vNG0bQ69/d0I/yuLiBkmTvScfkpVqVEYGtHawKj7lwz0ZTPZo/P653TemxvWBJCbdoK7rVZqcHRg4wxe0TJoM8CQqwQBqDi3eIAnhFFV7VeoiSfl4PhrZ1EDiMqvyqX/FIBRdWm2TJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K3e02Y2r; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K3e02Y2r"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0341F40B47
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 17:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 0.401
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYJUAhrmL643 for <cti-tac@lists.linuxfoundation.org>;
 Fri, 28 Jun 2024 17:09:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D350840932
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D350840932
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K3e02Y2r
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D350840932
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 17:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719594555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=Qpv7PR899Y28pbB0OkO32JHAtk3JAckj9+Qo4As6rKU=;
	b=K3e02Y2rlMHEgbMqH4vsfAm7yHZ/Hk2iw+b+BVnhJbP+q5exGfNadxlfOmyhTHO9LMCI2P
	mDInI8mOQaCvPQ/tmxKyrlQcFxVtznjGvhEtY7+YTZ38ApmDT7lEc6IYr5mQ+xlzvhIkt7
	LUQg5iPdtdHiFu3izyG9MEI+zcb8+0o=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-5lbNPr2-PoWuOAS2Kb-Bmg-1; Fri, 28 Jun 2024 13:09:14 -0400
X-MC-Unique: 5lbNPr2-PoWuOAS2Kb-Bmg-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6b077178ca4so11966416d6.0
        for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 10:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719594553; x=1720199353;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qpv7PR899Y28pbB0OkO32JHAtk3JAckj9+Qo4As6rKU=;
        b=eVaakY0plV4RRZClAG+42KCm4zhg0sqGRE6Ns+mfc3UqWg6t3DeFTa6PpWlfPTeVta
         E8QvApPFqX+hyx7lhIpEIEUe5cQHHQRJl66F57Lg25+eaM2CaeI0n1QDX3FlhsXXGL7Z
         YkGW2h/tO7s5scTf7pogjbLavLgjPnRKLxreqlYHCduOAzRo4gxfHOv60E0ZRQVeARYV
         zgwpQY4VS31Bh6A6om+Ayj3oz6OaWg2epZrwn2mablJQnikXoCIwNZ/3SPSUS138h4jv
         b2/hPShALao+fyR6xkrX6KBLUvlxaRGv+pOlRC8oW07QAsOq5WK/gvN1Z7M4Ww0nH3f1
         NXjw==
X-Gm-Message-State: AOJu0YxoZRi4LCcikJ0SW9jSB9DLZcW7tJRuNn5vV+3w/JHjd+s44XxT
	XjcuhsTJYs+6oejhK8eKX2L5mV9jjTYLx2batuS5xIZIGFT5TOZSsPSxX9OfcdjPmpdBYEi8TI6
	sQqNqBw1yYF+JYCwgVdsfJIGtShkv1e58smM9Z4O0sp3xOq6TXtshBctyFOa5tPpzC+5dQd4u0r
	NwS+EEFbRxE4AFJQ0RLQPKUCnyEaBjq/vNXT+nClXRTWnjWyifcA==
X-Received: by 2002:ac8:5a4b:0:b0:446:425a:e731 with SMTP id d75a77b69052e-446425aeb4emr72064031cf.63.1719594553149;
        Fri, 28 Jun 2024 10:09:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZvGH5XKUdOIy8+ynO/Irk5ZZvVgeY5aQHURCBrlYE3m6GGoSRWJ+iD3/V2yluuYsO6Ds+eQ==
X-Received: by 2002:ac8:5a4b:0:b0:446:425a:e731 with SMTP id d75a77b69052e-446425aeb4emr72063371cf.63.1719594552344;
        Fri, 28 Jun 2024 10:09:12 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-446514000bfsm8685841cf.29.2024.06.28.10.09.11
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 10:09:11 -0700 (PDT)
Message-ID: <2186f48a-12cd-4630-8944-26b9042e924a@redhat.com>
Date: Fri, 28 Jun 2024 13:09:11 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: LF IT: Statement of Work for CTI: glibc project hosting
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With permission from Konstantin (LF IT) I'm posting the final SOW
publicly to the list.

The cost breakdown is considered confidential information and redacted
from the public posting, but the summarized cost is provided for the
yearly ongoing costs.

Thank you everyone for contributing to the SOW!

--- 8< --- 8< ---

Statement of Work for CTI: glibc project hosting
========================================================================

1. Background
========================================================================

The Linux Foundation provides a comprehensive range of financial,
operational, promotional, technical and managerial services to open
source projects. With more than 20 years of experience driving the
growth of large-scale open source projects, The Linux Foundation is a
premier partner for collaborative projects.

The following statement of work (SOW) describes services The Linux
Foundation (LF) will provide to the Core Toolchain Infrastructure
Project (CTI) to host core project collaboration services for glibc.

2. Project Description
========================================================================

The Core Toolchain Infrastructure (CTI) Project’s mission is to support
the GNU Toolchain community with secure infrastructure and state of the
art services required to support the community’s development efforts to
be a trusted foundation in a secure supply chain.

The CTI project aspires to move forward the goal of creating a long-term
sustainable set of secure and state of the art services and
infrastructure for the GNU Toolchain and related packages.

Some of the project’s major goals include:
    • Secure and state of the art infrastructure.
    • Continuity planning for infrastructure, development, and governance.
    • Security policy planning.

Glibc is a GNU C standard library used near-universally across all Linux
distributions as the base library layer for the operating system.

3. Scope of Work
========================================================================

When choosing solutions and deploying services, the guiding principle is
to remain compliant with the GNU Ethical Repository Criteria, Grade B.

The CTI project requests that all service providers use FOSS to provide
the services that are used by the projects. The use of FOSS for the
services is a mandatory requirement.

1. Mailing lists for decentralized patch-based development

  a. LF will set up mailing list hosting under the
     lists.coretoolcain.dev domain, using the following technology
     stack:

       i. postfix
       ii. mlmmj
       iii. public-inbox

  b. For scalability and IP reputation reasons, LF will reuse its current
     mailing list platform already deployed for Linux kernel development
     (subspace.kernel.org).

  c. Individual glibc mailing lists will be created on request and do
     not require to be enumerated in this SOW.

  d. Mailing list archives will be available either via lore.kernel.org,
     or a dedicated coretoolchain.dev domain name, depending on project
     preferences and to be determined at a later date.

2. Bug tracking software (Bugzilla)

  a. LF will set up a bug tracking system using Bugzilla Harmony
     (https://github.com/bugzilla/harmony)

  b. This will be a new, standalone installation dedicated exclusively
     to glibc under the coretoolchain.dev domain.

  c. LF will work with the CTI leadership to properly configure the 
     software for use with the glibc project.

  d. LF will migrate the existing database using the database export 
     provided by the CTI team.

  e. Once installed and available, CTI members will manually remove any
     projects and components that are not related to glibc.

  f. LF will work with the glibc community to offer the tooling to
     integrate git repositories, mailing lists, and the bugtracker
     (e.g. using the bugspray project).

3. Git repository hosting (Gitolite)

  a. LF will set up the necessary glibc repositories reusing the
     existing gitolite.coretoolchain.dev service.

  b. LF will work with the CTI leadership to migrate existing
     repositories and grant the necessary permissions on a schedule to
     be agreed with the CTI project..

  c. LF will work with the glibc project community to analyze, port,
     and adapt the existing set of repository post-commit hooks to
     ensure that they are functioning after the migration, or are
     replaced with suitable alternatives if existing implementations
     cannot be used directly due to security or other considerations.

  d. LF will set up mirroring and replication using grokmirror to offer
     multiple redundant sites for git repository access.

4. Documentation repository and website (Sphinx)

  a. LF will work with the glibc community to help migrate the wiki site
     from MoinMoin Wiki to a set of restructured-text documents
     (e.g. using pandoc)

  b. LF will provide a publishing framework to automatically build and
     deploy documentation to the dedicated docs website (exact domain
     name to be established)

5. Static website (Sphinx)

  a. LF will provide hosting for a separate static website for glibc
     (exact domain name to be established)

6. Patch tracking services (Patchwork)

  a. LF will deploy the latest version of Patchwork patch tracking
     software under the coretoolchain.dev domain. It will be a
     standalone instance, dedicated to the glibc project.

  b. LF will migrate the existing database using the database export
     provided.

  c. Once patchwork is configured, CTI members will manually remove
     any projects not associated with glibc.

  d. LF will set up automation and integration services between mailing
     lists, patchwork, and git repositories (using git-patchwork-bot).

  e. LF will work with the glibc community to set up projects and
     access as appropriate.

7. Video conferencing (BigBlueButton)

  a. LF will provide video conferencing to the project using
     BigBlueButton (BBB), either with a 3rd-party provider or as a
     fully self-hosted service.

  b. LF will work with the glibc project to set up conference rooms and
     access as required.

3.1. Run Operations Support
========================================================================

Both during the deployment and the ongoing support stages, LF IT will
provide the following services:

1. Email-based help desk support.

2. Monitoring, alerting, and off-site backups. These services are
   included in the cost of ongoing support and maintenance.

3. OS and software updates for security and new features. Occasional
   downtime will be required in order to restart affected services –
   communicated and coordinated ahead of time, unless addressing a
   critical issue.
   
4. Mailing list anti-abuse services. Core Projects IT team employs
   multiple self-hosted and third-party services to identify and block
   spam and malicious content that may be posted to the mailing lists
   or public sites.

3.2 Platform Fault Tolerance and Redundancy
========================================================================

The infrastructure will be deployed with a cloud vendor with multiple
points of redundancy built-in:

    • Multiple hardware nodes with live automatic failover

    • Primary/Secondary database design with automatic replication and
      failover

    • Redundant virtual IPs with failover and multipath networking

    • Public git repositories mirrored to multiple worldwide frontends
      with geo-ip based routing for requests

    • All critical data is encrypted and backed up to off-site locations
      with high levels of data retention and redundancy

While this design should provide a lot of built-in redundancy, it will
be deployed within a single public cloud environment, so a
provider-level outage would still impact those services that are not
mirrored out to multiple public frontends.

3.3 Service Level Promise
========================================================================

The Linux Foundation IT offers a “promise of our best effort” for all IT
support:

    • LF IT provides 24/7 monitoring and engineering support to handle
      all service outages or high-risk security events. On-call staff
      will do initial evaluation of impact and escalate to other members
      of LF IT as necessary.

    • Members of the Core Projects IT team will respond to incoming
      project requests, aiming to respond within 1 standard North 
      America business day. Should the primary engineer be away, there
      will be a back-up staff member familiar with the project who can
      provide support in their absence.

4. Project Cost
========================================================================

LF IT Engineering and Support Costs:

Yearly running cost (incl. estimated infra costs):
	~$276,000 USD

4.1 Hosting Cost Estimates (pass-through)
========================================================================

The costs are high-watermark estimates for the glibc projects as billed
directly by the hosting provider. Depending on the final deployment,
they may be lower; justification will be provided by the LF IT team for
any costs exceeding the estimated high-watermark amount.

5. Terms and Conditions
========================================================================

The Linux Foundation and CTI shall make available to each other a 
designated representative with each authorization to make binding 
decisions regarding the obligations covered by this Agreement.

The Linux Foundation ensures that all services will be performed in a 
professional manner using qualified personnel. The Linux Foundation
reserves the right to reassign personnel to achieve the best allocation
of resources.

The Linux Foundation reserves the right to engage qualified independent
contractors as necessary to complete any work covered by this Agreement.

Nothing in this Agreement may be construed as creating an
employer/employee relationship between any of the Linux Foundation’s
personnel and. All work performed by the Linux Foundation personnel
under this agreement is done on behalf of the Linux Foundation and may
not be considered to be work made for hire.

6. Communication
========================================================================

Communication is essential to the success of every project. Meeting
attendance and regular correspondence by phone and email help keep a
project on track. The Linux Foundation teams welcome feedback at any time.

7. Agreement
========================================================================

This Statement of Work governs services provided by the Linux Foundation
to CTI. It lays out the mutual responsibilities and processes necessary
to complete the services described herein with the best result. 

This agreement covers the period through December 31, 2025 and is
renewable on an annual basis.

The undersigned agree to respect this Statement of Work, for the mutual
benefit of both parties.

--- 8< --- 8< ---

-- 
Cheers,
Carlos.

