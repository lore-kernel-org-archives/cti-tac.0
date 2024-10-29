Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DB22071F6
	for <cti-tac@lists.linuxfoundation.org>; Tue, 29 Oct 2024 22:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730239334; cv=none; b=GnPyON2Z/9cTzwg44MNC/ORKpXKwl8irBuiyJMW55ZReSBMEuBWKFHzYSAE4ktNZz0XAf5gxNFMJfB+moeC3POzC1WBiEUjGusZknPLPuJhJvTf+EZ8thK5RydxN05Nz/bfTRXWaRu3Al0Al2azuUAYFg6TcdT4Asq2879mESus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730239334; c=relaxed/simple;
	bh=eaaV7ZG8IgscmAuUcviQYuRqlHrlKGwcVTCvBbHbQ58=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Cc:Content-Type; b=ayqT1oVGPZZpYDhCEiBNJ3UXxw7FqSI4zwpzvgFK7ecHCWyAKFBbnTs/z0Rza7mUpESQs7s3+H+ogaJfbqKlx3XMZBP1syYiCEO19fNQnQIrFcz4QqEXMtXtvqxCgM92Nh6jRWfXUNfa3tVgdxdO+FAmSmodW54juRLsGLl3r84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CDHKZKWb; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CDHKZKWb"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D14402A9
	for <cti-tac@lists.linuxfoundation.org>; Tue, 29 Oct 2024 22:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELDKsoH-omGP for <cti-tac@lists.linuxfoundation.org>;
 Tue, 29 Oct 2024 22:02:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A02C402F3
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A02C402F3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CDHKZKWb
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4A02C402F3
	for <cti-tac@lists.linuxfoundation.org>; Tue, 29 Oct 2024 22:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730239329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=dVSeV8oBh0/XtT5Sa+sFwdmH37iOr167DIpqX0dMM58=;
	b=CDHKZKWbsgTv11V6nfqxs+J5WiMoOZstv3v+wlN3XtO3/j+YunxgnHPcEksbQNCt0UZpPl
	Sttb6YevIhE5AdjkEan1pBJt1iGtMaxSxGFJqHk4aj/jVSV1Deb807X6+QYSqGO5i/Hykq
	KxMuE+j+wXTr9keEcOrV497Abk1CW/0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-gfywg_JcMrK4CXS7hieucw-1; Tue, 29 Oct 2024 18:02:07 -0400
X-MC-Unique: gfywg_JcMrK4CXS7hieucw-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-460afc4747bso8885661cf.0
        for <cti-tac@lists.linuxfoundation.org>; Tue, 29 Oct 2024 15:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730239327; x=1730844127;
        h=content-transfer-encoding:cc:subject:to:organization:autocrypt:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVSeV8oBh0/XtT5Sa+sFwdmH37iOr167DIpqX0dMM58=;
        b=qmKSo4Q3dVF0sWjCE3YM+UD3DfsnuFEx2xNSuG5J24JLjvPDGVJvh68Gd9A7s8KzQ1
         U/i02202hdhTUDrg8rQNFJqq4f/jTXVDUlh/JOnF7eEjBAAQb7TAMKLxjwmcR2OB6BQI
         sHykSdnQJ6uknw4eamT/jr/rqRGDUYwk+214O4uD5X+vwyFimC5ijku/mqhwRrS0BQeh
         pYVLU9Rqy/dlh5n/ghjSylMDrv6jiHNzDsOnEip2ZnyVFK8y4ArzU3LK4zDYSZyQxTk7
         ibyZjF0y7ruevqZ1OKhZT3fFOmcUXaeU0+fdtDPTs/VQLboz7NjA8o8YaX6y1ZPbkP9S
         2f1A==
X-Gm-Message-State: AOJu0YzNv1519lgOM00g2MygWNHo3JgB5fJiwd8o2FkKW1K0u/WjD5sI
	n70+7zB7K6NPqHeLe6CiYRnOHevmZ0XeGB1+NuXbG03V51XEqvWHuwpz1qJLo17oa0hLZedCivS
	TGEiiqNtz482leWPVGKeINLFXN1AvN0WFAUfK+nBeZkSzWxBuqWptYmRWEngTZFEchjlW
X-Received: by 2002:ac8:5f08:0:b0:461:2536:f226 with SMTP id d75a77b69052e-4616842fcc2mr60038131cf.12.1730239327160;
        Tue, 29 Oct 2024 15:02:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuALpTiCpw3Y4KCRe9g6vNMjBbYNlFHQZVMbaXzQ3ZvJa4pHNJXAJJj61HYXdh9XjFu59ChA==
X-Received: by 2002:ac8:5f08:0:b0:461:2536:f226 with SMTP id d75a77b69052e-4616842fcc2mr60037511cf.12.1730239326647;
        Tue, 29 Oct 2024 15:02:06 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-461323768d6sm48504961cf.71.2024.10.29.15.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 15:02:05 -0700 (PDT)
Message-ID: <9ee5b9e1-3f84-4d9e-8249-7a4bf8080bb0@redhat.com>
Date: Tue, 29 Oct 2024 18:02:03 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
To: gcc developers <gcc@gcc.gnu.org>,
 glibc developers <libc-alpha@sourceware.org>,
 gdb developers <gdb@sourceware.org>,
 binutils developers <binutils@sourceware.org>,
 Overseers mailing list <overseers@sourceware.org>
Subject: Core Toolchain Infrastructure - October 2024 update
Cc: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Core Toolchain Infrastructure - October 2024 update

The Core Toolchain Infrastructure (CTI) Project’s mission is to support
the GNU Toolchain community with secure infrastructure and state of the
art services required to support the community’s development efforts to
be a trusted foundation in a secure supply chain.

We want to keep the GNU Toolchain development community updated with the
latest information on the CTI project and how it can support the GNU
Toolchain.

Since 2022 [1][2] the CTI project has been working to carry out a
detailed enumeration of the services required by the projects and how
those services may be provided in a secure and robust fashion.

We have completed a detailed service enumeration for the GNU Toolchain:
https://cti.coretoolchain.dev/projects/enum.html

In 2024 we published updated project documentation:
https://cti.coretoolchain.dev

Also in 2024 we've looked at the details of the services we provide, why
we provide them, and how we might provide them with with increased
security and robustness, including putting together a statement of work
with the Linux Foundation Core IT team (who provides similar services to
the Linux Kernel) [3].

The CTI Technical Advisory Committee (TAC) is made up of members of the
development community of the projects, and is working on behalf of the
GNU Toolchain to improve security and robustness of the infrastructure
used by the community. The CTI TAC meets monthly and the meetings are
open for anyone to attend.

There is still a lot of work ahead of us to find a way forward to state
of the art sustainable secure and robust services for the GNU Toolchain
projects. Recent discussions on the glibc mailing list make it clear
that we need to expand and discuss more about our "why" along with
the "what" and "how" of these changes.

We will be sending out one of these updates every 3 months to all the
projects to keep you updated on our progress and discussions with the
GNU Toolchain projects and the wider 

Sincerely,
Core Toolchain Infrastructure Technical Advisory Committee

[1] https://inbox.sourceware.org/overseers/ef140a6b-c72d-bd63-b94c-bceeb365b32a@redhat.com/
[2] https://inbox.sourceware.org/overseers/2513b668-9ebd-9e78-7263-dc24f4a9558a@redhat.com/
[3] https://inbox.sourceware.org/libc-alpha/eb0d5e7b-0280-4c5a-aff6-3418a4210a39@redhat.com/

