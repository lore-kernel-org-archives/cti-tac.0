Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=140.211.166.137
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793202773;
	b=hltbZx1aCS4EoKgZSAbLgwPpcyBKhdpIUmNF8wUHCxPs8xkF/U+4XH0BIZT/Ygsf3ATw
	 E9saAOX5cxwoaDRfWn4RhrGYAHqmYWJy0kFFuWxfVL7paKJQwLatPrcdi0UPNXmiJ2bgx
	 njfUf9C0ViZf9Mr39Vywa4mYmyTS071eU+b3CVYlKPoFSaNtShGVeiJc4dL2JwNmFkg1J
	 j7NewILSpb1r+zba6IItFW4y9NAfPRWnMljGLjQGZ7Og50Ve0ViaYPo4oOccsKcgTbZuw
	 IEEFh83vhKvbJ08cbhQxlLrPvB9xyHPjKhyZTQml0K4kNmt3AJ4+TA+OfI/VhZv1aWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202773;
	h=Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:X-MC-Unique:X-Mimecast-MFC-AGG-ID:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:From:
	 Subject:Autocrypt:Organization:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding;
	bh=TiALOk+KocpPA8WHL/SSsy+cwU1txRuOQL9DvI6kUbA=;
	b=xHHWnKrS8ObqpGgP93/z1KvvbIZC/FJ5Y1qEXzY0xXNIb2kMK9LsfW0UG7zXQo7rEbZo
	 NY4ljbPt6IPNo/Cm3hIvJq6I3prmPMFoNeJY47jGHHm8fSpFHltHQWqpD9N5Pt2T22jon
	 avs+SAqU38U+vqQtpej0JGMDH4tXzZsvYD5f3qQpwI/7e/9LUH6KMeQIyzsKn7bbVDDoI
	 Rl9c/rkKBKgYb+T6PtxiAk/GGtBKiZ74cG2txXpe7XGukYpyzXDp0eVsifoZhn2OIDbMv
	 U51nkPijJX/sG1S3tV9IGkkX0QPbjKvwkPHFaxISOLxLmPjaQFhnNHiUoW2R6KpHO/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WCBgn2R3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=140.211.166.137
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44049606A31A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Oct 2026 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WCBgn2R3
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E38A6404F8
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Oct 2026 15:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.413
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64esMoJXASn3 for <cti-tac@lists.linuxfoundation.org>;
 Wed, 28 Oct 2026 15:52:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 011FB40478
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793202771;
	b=SldIQwGc3lox9WB3nt3UfETxI1wl+MOur9gyK/eJnyMOrD5yY65Dif1HItD6lehd1tf4
	 PaIN8KOYtx6EjC1KVvPnvJprdSBZ1KU9QO+mE2oZuyrWKGlpOaifTmsHQ+upbzu/FVDIU
	 uyKiWI/sM+wxMiNlnNb6uYx0OeAmAuGkv1jDqAHywmPUY/cjv2xUDyOyBYKQryIQ3Exc2
	 8AJnwTSFckSPcciRyG/IdFz5k/2DWh3iKQ1yQfPnYA25U+XVzcnUpp2iG7twhsdHxnusw
	 ZvwTv1tdXsyYPZm0jx2riaVUEhhZmPERVHP2dlkIA/nV34w6BkEqjm1/7Mo++gFtyhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793202771;
	h=Received-SPF:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:To:From:Subject:Autocrypt:Organization:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Language:Content-Type:Content-Transfer-Encoding;
	bh=TiALOk+KocpPA8WHL/SSsy+cwU1txRuOQL9DvI6kUbA=;
	b=Oo7tY+SwLMxSJLcMaXmlgq6xOe/D0fI3XvvX83tio+J60F5RVYP2lFaLoVgjYTzJF7gu
	 QgLh5SUSnPi9FOj6yh+GBa7ww1Tbz9s3uhXH55CBI0FOW1dcD/hvO4sK9u9Me/56Mjx45
	 QoXQr6kvESMnqbQDmvczcRxYpYI8KDY9fGTiNCbIkVFdGsUOcqsZZLjNy+fYJCRYvpCCC
	 b6RFa70wNC2/iRCmNbYk95cgpxGgQemducBzyMvDAfZEP06X8x+jqNaQoe2pzZm46DFt2
	 hevOJblM98XyXG9s8ZuSe+f+cKCGXqfgQXzzcABILb2P9uKBuHJ1Y6p0j+vnWDdmwnA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WCBgn2R3;
	arc=none smtp.remote-ip=170.10.133.124
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WCBgn2R3
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTP id 011FB40478
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Oct 2026 15:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793202769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=TiALOk+KocpPA8WHL/SSsy+cwU1txRuOQL9DvI6kUbA=;
	b=WCBgn2R3WbbDBGQn4vgsrejXlfpld4X4RfZGBB4sjWodBrRsMosSomj/i0+LtuLRRb0XXe
	o25fLhvww/IbkmFb3TZ2HfxbDRHI8au09p7mzqn3zS8+9sSII3xlrRo3IvLiQpZbVDwpu+
	ZifVAIPfH36lamsjICrJe8vx9nr5a/8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-hYN-V9xWPueVWjw8JIjVEg-1; Wed, 28 Oct 2026 11:52:47 -0400
X-MC-Unique: hYN-V9xWPueVWjw8JIjVEg-1
X-Mimecast-MFC-AGG-ID: hYN-V9xWPueVWjw8JIjVEg_1793202767
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917baea8e5dso21473976d6.3
        for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Oct 2026 08:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202767; x=1793807567;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TiALOk+KocpPA8WHL/SSsy+cwU1txRuOQL9DvI6kUbA=;
        b=JkOLxMT7DpYk7FqktlUy0pqVn3oGXzMH9cQ/13zkz+/ThG6fH5YxeGClEL7ZdV3Udp
         bedfXyaXH4hHCipID8PVZONe4u31SdUIm+ejGu91ZhvQx4LgYmZ4wBZOUsuPPmQSwYUu
         y6WZPjwg8c5ABRhXyOF5Uf9DEpJQpzSlBDJWCOisV8PEFPnladrnz+g3xg1mkh7QdnHS
         a1DUIN7rUWhEaDIjZvb67WJpkn1rIX0UWuFlFE+8o3rvK8/s2Q6vV/xUf+mqp4Lqd8nc
         o7k3/fAoVp9FpbiLS7F9GAUDS2Pv2Skq1Bvxbgl3tdePGgIDteQBhni4Fvz9OSXWPRnE
         JXTQ==
X-Gm-Message-State: AFq9FYIV/5rymFtIn8QFLhYJbQzp3bdHRGArWZW15Y46VNszPKLtzrEm
	uoeiy/f8e8y3Tfd1emzbG+d3lYzQ7dEBXfzoaVYmEoPnbalfnxecKQgkmkwqlvtF29+L5nWuo+u
	ZnPGYH2VkcK2n7+pqTDOQFkdvZFbuSBGIylp7CRMWfzQtMwq63919e1fMCEx4f8BxdyZY3MAuAi
	iVHusAYGjy1kjDC5m6fpP76s6rJu4zVuNv8/qKDqbL6NNEBwjI11yRMg==
X-Gm-Gg: AYBFou0hmPNxnsPoHmuo9w7sNStQS63LjFEYT6Qugw8xgLJkrRL+VPoUKgdUHe5MDBh
	KcxrB0EvAqitrtmFSw6a4IiijIERMcIKaoG2SL3zdx4HDVJGyIdHdn08c7Za68juNrJ7dBBalKb
	97xqfirSdReerhVQXYllq4bVrvZBTVrHk+iAG8na/2cfNF4aTCZr8BsS2TF57SdNzHpqJoaASBZ
	tjkZGcFp9yN7Bs9+5DN0192j1xuyv/38RbnBxSmgDGpB21QWPIPVlVr+ugx8QO34SGUTG4aPmZH
	X+HtbCtjgjVsiG2MgBOOvYtZhpQvywRKzBM6NhyrrMf3hKVdedr+Hv5AtiQHbmQB5G/GNMoDOzv
	xCs9rWz3neQKjGQslX0b2vG/wrCfce/Qz6Yq5w6U4nG/SlVKRQWOPz7+A67ZeT3Q6Ai3gWJhcbF
	KzEbGDjSVTpCYz0/bTXIrfaeCMC8Sd+xcz214/7cVnDxVZArvq
X-Received: by 2002:a05:6214:2126:b0:91c:67a7:136c with SMTP id 6a1803df08f44-91c7d19db3bmr43341516d6.28.1793202766478;
        Wed, 28 Oct 2026 08:52:46 -0700 (PDT)
X-Received: by 2002:a05:6214:2126:b0:91c:67a7:136c with SMTP id 6a1803df08f44-91c7d19db3bmr43341016d6.28.1793202765698;
        Wed, 28 Oct 2026 08:52:45 -0700 (PDT)
Received: from [192.168.0.116] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c67688300sm75314896d6.12.2026.10.28.08.52.42
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:52:43 -0700 (PDT)
Message-ID: <0ffe4532-14dc-4e2e-a2d1-14d2fcea2eed@redhat.com>
Date: Wed, 28 Oct 2026 11:52:42 -0400
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Post: <mailto:cti-tac@lists.linuxfoundation.org>
List-Help: <mailto:cti-tac+help@lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
List-Owner: <mailto:cti-tac+owner@lists.linuxfoundation.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: CTI TAC <cti-tac@lists.linuxfoundation.org>
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2026-10-28
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 hsfHTTi7JQ==
Organization: Red Hat, LLC.
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gAra-y5ZGTRdCyAf6AZxUOXiMLQE5wMfP65TSCh7yj8_1793202767
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Attendees:
  * Siddhesh Poyarekar (regrets)
  * Joseph Myers
  * Kris Borchers
  * David Edelsohn (regrets)
  
​Agenda:
  * Siddhesh: Going to work on the SBAR for MoinMoin migration to Sphinx and a gitolite repo.
   * Carlos: I asked Sid to use RFC/SBAR style so we can add it to the other 3 in the list.
  * Status of LF IT timeline for services including standing up the git pull mirrors.
   * Carlos: We asked LF IT to give an estimate on timeline for a horizontally scaled git pull mirror.
  * Kris: We need some help with a standard set of documents for:
   * Committee Rosters and chair(s) with term dates
    * This is going to live in the CTI git repo.
   * Election/voting records, election process definitions, etc
    * This is going to live in the CTI git repo.
   * Member Benefits and Onboarding docs (I assume these don't exist so I'll work on drafting them)
    * This is going to live in the CTI git repo?
   * Tool and infrastructure inventory
    * All tools and infra that supports the project(s), committee(s), communication, meetings, etc
     * gitolite.coretoolchain.dev:cti/keyring - CTI website keyring.
     * bbb.linuxfoundation.org - CTI uses for services.
    * Meeting recordings/transcripts if they exist
     * All by email: https://lore.kernel.org/cti-tac/, and recordings if they exist in httsp://bbb.linuxfoundation.org room for meetings and meeting recordings.
  * Carlos and Joseph agreed that keeping this in the git repo makes the most sense.
  * ACTION: Carlos to send Kris a writeup with more information for LF directed fund data.
  * Status of existing RFC requests.
   * [RFC] Using bugspray for updating glibc bugs in bugzilla? https://inbox.sourceware.org/libc-alpha/a1c0fb87-de0f-40da-a917-25520839d209@redhat.com/
    * Carlos: Do we need to finalize the update mechanism?
    * Joseph: Yes, a webhook is important to be able to update bugzilla right after the commit.
    * Carlos: OK, so webhook and timer are required.
   * [RFC] Using git-mailbomb as post-commit VCS to email system for glibc-cvs emails https://inbox.sourceware.org/libc-alpha/5d2ef95d-94c4-40aa-83a7-84dc5f376e2b@redhat.com/
    * Carlos: I expect we want the same outcome of webhook and timer.
    * Joseph: There was a question about providing information about who pushed the commit.
    * Carlos: LF IT noted that they have a transparency log for the kernel and can deploy for other projects too.
     * Sources: https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/post-receive-activity-feed
     * Reference: https://git.kernel.org/pub/scm/infra/transparency-logs/gitolite/git/1.git/commit/?id=4830331838dcc9b4eb65dbd511462264abcd5cf0
     * Two options: Simpler git-mailbomb improvement for post-receive hook information. Or deploy existing transparency log.
     * Joseph: Who pushed is the relevant thing to record.
     * With git-mailbomb we would loose this transparency unless we also deployed the transparency log.
     * ACTION: Carlos to respond on the thread about the transparency log question.
   * [RFC] Using project and service specific DNS end points to support flexible deployments. https://inbox.sourceware.org/libc-alpha/8e167d49-86c5-45ba-841d-f9f74151d596@redhat.com/T/#u
    * Carlos: Still in progress in progress.
  * ACTION: Carlos to post RFC on horizontally scaled git pull mirror network.

-- 
Cheers,
Carlos.

