Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874D6C8EA
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Oct 2023 15:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T7OtqEJu"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9A7B8394A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Oct 2023 15:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9A7B8394A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T7OtqEJu
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yI_X61lzBLTs for <cti-tac@lists.linuxfoundation.org>;
	Wed, 25 Oct 2023 15:52:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A5BC3838B3
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Oct 2023 15:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5BC3838B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698249155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FKuTiuxDbjJqYUhR1k8wjb5A+vISd4vEHQqGq8rQ4/4=;
	b=T7OtqEJuy4OAwSF5gczTJlf1y++RFD8XHHAFAUVZ7eL4Fmrpw+5lZKK6HoryzJ6vOajofK
	/HlkUomXZ3R8sAYURFDpcX/iOrcoKHZweulnpvpXj99kKhKHkG8cUO5NekGYfmiMftA+C3
	EGKUJeMie2MSKOAQIrwBk9wMKbkdY+w=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-6Hr9LO6CNPSKmBViue2KqA-1; Wed, 25 Oct 2023 11:52:33 -0400
X-MC-Unique: 6Hr9LO6CNPSKmBViue2KqA-1
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-49deeed31d8so2547672e0c.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Oct 2023 08:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698249151; x=1698853951;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKuTiuxDbjJqYUhR1k8wjb5A+vISd4vEHQqGq8rQ4/4=;
        b=uXzrCNgG+6DIcsuCixSoz6Vv14jGT3+47fZGotNtQK1UsBriYhXrfJ2+1lCzawIVqB
         w1Yj5paGbmSwONELftxe7OlxKHqEy0ozAhlm2u3UX81rK8N7ynymVLi32CAMPL7C2+KY
         VRT0XQ9wW5JLeNQVtl2kRnMvvHzldcdOWYaLrrnQLPMb+PuoWgYYHAGDvXUxyi1pyhEy
         7IPJDVNQeVUeiN8lzjjVFriYaZtr0OD49HgHYMUXpqqKZ4SO8cRqKpObQ1ZtdEnPnyoD
         W1qoqCjnvoFbkCVmHvoMdxEKPGpNaAqJBnxCLZKKutIWHnQouUalyh3GNT+xioWM1+73
         PzPA==
X-Gm-Message-State: AOJu0YzO9+/vvdCgyym6Y0XuN1drTaHs2MHJ9kZZ+pscPKja8Zg1uLx5
	tyDlwWrK/mO3PTz7UZLxOJlG7Jhi0UXxzK7mDHK1nmarbi7mkdimdcChSM7pIoJEGRRGoZwHFTW
	w99AdNoq6PsJ+AeV4TmNt8do5JOayQXXwEGjkPbdO3OCh6BMlrf86uQ3jDX1QxzV+j+xddpBtt0
	1cCuI1LI3vDQ07
X-Received: by 2002:a1f:1f8a:0:b0:4a1:58e0:a0db with SMTP id f132-20020a1f1f8a000000b004a158e0a0dbmr11496789vkf.11.1698249151632;
        Wed, 25 Oct 2023 08:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEafsS4FDlKeBMJ7YZqR/gz5nwTd4pLxX9T03j9JH8Pm2EsWSgnP4Sam2nSeAyhIWxjKDekxg==
X-Received: by 2002:a1f:1f8a:0:b0:4a1:58e0:a0db with SMTP id f132-20020a1f1f8a000000b004a158e0a0dbmr11496776vkf.11.1698249151123;
        Wed, 25 Oct 2023 08:52:31 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id ek8-20020a05690c2a8800b0059a34cfa2a5sm4416102ywb.67.2023.10.25.08.52.30
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 08:52:30 -0700 (PDT)
Message-ID: <44a7c3f6-537c-a46d-1708-f9795a9f141a@redhat.com>
Date: Wed, 25 Oct 2023 11:52:29 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2023-10-25
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

CTI TAC Meeting Notes 2023-10-25

Present:
 * Carlos O'Donell
 * Joseph Myers
 * Siddhesh Poyarekar
 * David Edelsohn
 * Konstantin Ryabitsev (LF IT)
 * Ryan Day (LF IT)
 * Bennett Pursell (OpenSSF)
 * Ian Kelling (FSF)
    
Agenda:
 * Previous meeting AI: Create cti.toolchain.dev and document what we have and what we know for the community to have a place to review documents.
 * Involves LF IT to setup domain and infrastructure for documents.
 * Next steps for cti.toolchain.dev
 * David Edelsohn holds the domain for toolchain.dev.
 * Domain assets stay with CTI.
  * Konstantin: Domains belong to projects.
  * Bennett: Yes, transfer of domain, but ownership is maintained elsewhere.
 * Carlos: The next question is what do we use? Sphinx or Markdown?
 * Siddhesh: No opinion. Either is fine.
 * Joseph: For this particular sort of thing this might not matter much.
 * Carlos: I see Ian is on the call. Asking Ian if he has any experience.
 * Ian: No particular experience.
 * Carlos: Decided. Lets go with Sphinx.
 * Carlos: Do we name it git?
 * Konstantin: Sent email back regarding git vs gitolite.
 * Carlos: AI respond back to email regarding DNS name.
 * David: May we clarify the question of DNS?
 * Konstantin: git DOT is usually public facing read-only. Periodically someone tries to do something like clone lots of same revisions shallow. So we use a distinct DNS for the various uses.
 * Konstantin: push is only SSH accessible and for official bots.
 * David: Are we going to enable or stand up all of these names at the same time?
 * Konstantin: We can just stand them up right away, no staging.
 * Joseph: This is still just about CTI and docs.
 * Carlos: Yes, once we have the documents up we go back to the glibc stewards/GNU Maintainers to continue the conversation and move that forward. Particularly to document enough items to address Paul Eggert's concerns.
 * Siddhesh: I think we're good. No other items.
 * Ryan: No further items.
 * Konstantin: Is OpenStack a good solution to use for this?
 * Short discussion about AWS vs. OpenStack and free vs non-free.
 * Joseph: We should be using what we will use with the rest of the projects.
 * Siddhesh: gcc will have very different requirements. Do we need to tie them together?
 * Siddhesh: Does the Linux kernel use OpenStack?
 * Konstantin: The Linux kernel is more agnostic about infrastructure services, so long as we can move the services. Particularly that it does not depend on proprietary software.
 * David: Could we have limited access or differentiation between AWS and hardware hosted nodes with regards to freedom respecting access. We could provide a dedicated interface on dedicated infrastructure, replicated from the common infrastructure for completely free software based access.
 * Ian Kelling: Developers, or members on the committee who manage infrastructure, want to be able to deploy without the use of non-free software.
 * Carlos: Note that if you keep a fully FOSS stack for deployment you prevent yourself from accidentally depending on non-free AWS features.
 * Bennett: Had OpenSSF board meeting. Need Mission Vision document for CTI.
 * David: What beyond MVSR?

Action items:
 * Carlos: Follow up with Konstantin around DNS names.
 * David: Work with LF IT regarding domain transfers.
 * Carlos: Work with LF IT to finalize the Sphinx workflow to deploy.
 * AI: OpenSSF TAC presentation on status. November 28th.
 
Note: Next meeting is on November 29th.

-- 
Cheers,
Carlos.

