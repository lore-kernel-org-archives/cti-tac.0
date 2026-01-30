Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A850C346AF3
	for <cti-tac@lists.linuxfoundation.org>; Fri, 30 Jan 2026 16:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769789447; cv=none; b=SRKV/ahw0eNROFmaZJx26vs7d27wMI+JrCHEz5ES7vmXhWpFq4WfPDt1xnUMWI2kdVXG+SNCnQGoobU8o27tHBMH2RvtzpPBeu9/A6Y/ayrOC4sdhoY+/zhP61AuvB5q+5blgsLItdUXSW9V2VpwEDQWzKrJJmTsrN4ABWfhz4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769789447; c=relaxed/simple;
	bh=RkVxNvELLmEkPlfze6NfpWT/009e54ExIUg0f0tj5so=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=heC+nWje5VcL45AZ+qz/MuQGQMkyE8MI6t5B/q+Ahy90cBUwQTcTP8gL4SQOh5TcABUUdC4sPIoz8QKbnwv3YImknpN5NJEXOaC63izSi+uNy1+Yx9RoBE+sXGJHoMpQPotHnv+jwru94P6ThT0ZdF56rpMaYL2dV/lKDpxD3Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NZ06hC+Q; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NZ06hC+Q"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4575183F77
	for <cti-tac@lists.linuxfoundation.org>; Fri, 30 Jan 2026 16:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.795
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6O4T8aZq-2g for <cti-tac@lists.linuxfoundation.org>;
 Fri, 30 Jan 2026 16:10:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B4F083F82
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B4F083F82
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NZ06hC+Q
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2B4F083F82
	for <cti-tac@lists.linuxfoundation.org>; Fri, 30 Jan 2026 16:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769789443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=1Nz+3Pf47OfcmoQjlGQhFW2kt4iXskBRMGSHt9+3W0A=;
	b=NZ06hC+QduzyfdJd5FemBNZ2FqLDGq/2u2nQZbYEAIPnnFtJqshq0eNorsujvZgCIQB7ox
	faA3KSmoXr5YT4G9/BMtPL3E1z9ZSeniH8NiOGUsI2Un/eT0BnyEkH20FAqznoEGmyJ+jw
	MlIFNo30aKHLhpiEl/XiIUF6FMyb9MM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-QKnx8farNT2RHbTHJYeXbg-1; Fri, 30 Jan 2026 11:10:41 -0500
X-MC-Unique: QKnx8farNT2RHbTHJYeXbg-1
X-Mimecast-MFC-AGG-ID: QKnx8farNT2RHbTHJYeXbg_1769789441
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-894f6713c03so6326576d6.1
        for <cti-tac@lists.linuxfoundation.org>; Fri, 30 Jan 2026 08:10:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769789440; x=1770394240;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Nz+3Pf47OfcmoQjlGQhFW2kt4iXskBRMGSHt9+3W0A=;
        b=Itacsg/tZvgl3pUYxr5Y36/P4x0mgCCJ/PHuk5rs0q2CsIazgpuLXlnN5oEvz9Wbe0
         TnnTdzC9GFXtqGW0Fu9QU6IfiSYsAYI83eOCsxfLVRrHjipuVxewaCaCESP+FdczvA5j
         h/oli4sKlAAGioTQeKPYwkJ+LGgHnq0GMXuQ6E6rsq6dkY3zEAeYCP7jBYAjlKCcIBLQ
         CBJhtCAWJBASLOXs74ikW5oTEb8k0D7uAtxX+kSYtvJq+uAIpX4Hrw+B/j70PtrJeVSR
         SNd1FSNuQjfa1YClEn5SF5MYYBK9sI0RcqFVdmewGhQ3+PBT2NKWPlgbq9n9mSKjInXM
         Mg3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3VIyHbVn5Y9yRlduCaQCfZ8DpXdWQ36axK/NVE9tH6n8fug8ayS4Z2WGM6EjogorrI2agRFKl@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxo+rdUM6n8omSzZW+WEXvprOhqt9qjzjz9AMAasnVzE2Yi0MFs
	XmaWKXxMDgGuJSHKvg7/bTZPh1XXPAxHFjM6o77JcXNx5grH4M/OHECrjVNrt7kEmygkcV+zJGS
	UeVPrVPhQ5hJp5fLFeKyN+MGajc6DvL4se4OjxSyfG2u2jFoHTrScKSM39rcJO5k7+WyYz6ltd5
	mD2DBN
X-Gm-Gg: AZuq6aLlFnego6XWywW3C+LzsS0yUgd2B+1k71z4cE+fio8fyqHSHZweSCVWk9M/hL2
	lrKIypmavVS+/Vgij0nlSrsasZGquZ1xWrPhHVFxDE8x/QSC3JcT/PjxDtIxQRBp0sbkOuwX8zN
	ydWVDd/jQbpRv57YuwhpkdbMwqYBj7YbfT+WA5lZ24r1Q8oOu9+e+L8S7aDkxzPikEQBXgSKCEw
	TD9hCt1mmI7sGo++Zo2lLbUU7hou3g7sjbe24/WBKa8/A201+9PWnfawVucNjDbjvVFmIC4EP3p
	vmz2lswFwE21F8e8iO27fiZ1ERJogyvMwWu22VX4vud0WuDWOjYZNS+yVlMejEXQHic/hcB3AbR
	DPRrP2PRWlFyKFD69HeBHTtLuFnmGE3AntzXFGMeY14zK7PHnCMtpv6ZM3BJS5CwFaoI+d49+ek
	/jbBdL/B436A==
X-Received: by 2002:ad4:596b:0:b0:894:5cfc:e989 with SMTP id 6a1803df08f44-894ea0b56e1mr50830356d6.32.1769789440282;
        Fri, 30 Jan 2026 08:10:40 -0800 (PST)
X-Received: by 2002:ad4:596b:0:b0:894:5cfc:e989 with SMTP id 6a1803df08f44-894ea0b56e1mr50829596d6.32.1769789439732;
        Fri, 30 Jan 2026 08:10:39 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d36a9b5bsm63532746d6.5.2026.01.30.08.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 08:10:39 -0800 (PST)
Message-ID: <252c1170-ffba-4dc7-9331-49b46a2deaed@redhat.com>
Date: Fri, 30 Jan 2026 11:10:37 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: glibc developers <libc-alpha@sourceware.org>,
 cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: Office Hours for CTI - 2026-01-30
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 m/A+1AHg4g==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MXs_DaL6v-vHdHUDZNQB-G7hM3BMaEOrCsFMFmsfp6c_1769789441
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

​Office Hours for CTI - 2026-01-30

Agenda:
     * Q&A about the migration.
     * CY26: https://cti.coretoolchain.dev/projects/glibc.html
     * What do we want from a git? hooks?
      * We want bugzilla updates.
      * We want commit emails.
     * Siddhesh: Neither of those should be webhooks for git.
     * Does having a gitolite repo negatively impact future workflows?
      * Claudio: If you want to make use of Forgejo as intended, you may want to move the sources of truth to the repository that is hosted on the forge.
     * Discussed the future Forge workflows and the impact on infrastructure.
     * Siddhesh: The CTI discussion is "How do we do infra in a way that we can get funding to it?"
     * Sachin: Why are we talking about gitolite transition? Should we do git to git then gitolite?
     * Carlos: You are right, if we were doing things incrementally we would go to git first. However, this would be an opportunity to benefit from cleaning up.
     * Richard: Could we switch to gitolite for all Sourceware projects?
     * Siddhesh: Absolutely. We could switch. I thought we asked for it.
     * Joseph: If we are serious about isolation we would switch all projects to gitolite.
     * Claudio: What is the process by which we get Forgejo deployed?
     * Siddhesh: The problem is more social than technical.
     * Richard: I expect that LF IT can deploy it.
     * Richard: So many new starters coming on board who struggle to get their patches out of the building for one reason or another.
     * Carlos: There is an intermediate point where we could use b4.
     * Saurov: Do you have a plan for the rest of the projects?
     * Carlos: Yes, the plan for CTI is to start with one project and work through the transition details.
     * Carlos: I would likely start with gcc next.
     * Claudio: Could we prove value by having a gcc-mirror in CTI infra?
     * Carlos: Yes, absolutely.
  
Next steps:
     * Setup Office Hours for CTI for next week and discuss gitolite rules and what glibc would want in that configuration.

-- 
Cheers,
Carlos.

