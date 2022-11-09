Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB02DEC09
	for <gti-tac@lists.linuxfoundation.org>; Wed,  9 Nov 2022 17:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E6F740911
	for <gti-tac@lists.linuxfoundation.org>; Wed,  9 Nov 2022 17:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E6F740911
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TYb3fROQ
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PWk869kxKd6x for <gti-tac@lists.linuxfoundation.org>;
	Wed,  9 Nov 2022 17:47:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B6D340399
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4B6D340399
	for <gti-tac@lists.linuxfoundation.org>; Wed,  9 Nov 2022 17:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668016055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2xe/2cCe/SwAtYkneQ1+waVevFaghFSOOzcwT6AVmx4=;
	b=TYb3fROQ5G9nVjDlhbKPIhyaEUTA3P2jWEFcAG2t9oHSfjzQ0Zgyi+XQr1+gKmbBXjzSIC
	doZ47eHWz53SRd+O2L6pxXsyKq1kLcysVC/DPIME4qYVnDtJd/WnaSoyuYIqKn4HbS3d8Z
	Yt7Msz2K5in/f9bBtTpqlg7sScpDB6U=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-260-g4nM-K5DMjGrbiruxMHu3g-1; Wed, 09 Nov 2022 12:47:34 -0500
X-MC-Unique: g4nM-K5DMjGrbiruxMHu3g-1
Received: by mail-io1-f71.google.com with SMTP id h8-20020a05660224c800b006d8de87e192so7718338ioe.6
        for <gti-tac@lists.linuxfoundation.org>; Wed, 09 Nov 2022 09:47:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2xe/2cCe/SwAtYkneQ1+waVevFaghFSOOzcwT6AVmx4=;
        b=q4S5TXmU5dQH0JYDZUYyc6KSUxL6o4syDFi4MLLAJJfaV5NrHXzYJJeWMzEWVNGrsx
         EZXAuDOdXIXVFRRUkihvmth4kECMF9D9KVIRt+6Zy4NIRGpcdQ1nhj8HnjiJ7lhZYtKa
         iFFyeWjVPuWqgXdEa0bHmvE905Ihn1Zei29PuRG9Nv3idnPgtH4nJu7T8Djq1TcTjbOw
         Nt9/OoZsl3pa42SNsBnWxBpqwFUQObRTppiiJVwwENwVov82V9txi/r6fZFGMhrw5MrB
         AGd46tgsA/D8q+jUs3HL5cLYl1SLN5YK4GfHV2hc0rHUHgyHEWpsR1/YnmZ4f9ale74T
         Qukg==
X-Gm-Message-State: ACrzQf0UmuvyDNb+ovfl+/MReVJCJkEkN+98BZ/FDawC52oWL471Aqfk
	lewdjfjhMxQIH6lT+ikpZPGsruYEflJgXNDtoW5vIX+Wg/OLKVstRUqY1jybsSbKcs5snxkQtgw
	kQa5Yip4zDF+Cm5CCiB4z3vlpoGIssax+EFi2eSaQWEDvkriXahBqa3HmxGiG7s1ymVFvnrp9Iz
	1EoBQ1
X-Received: by 2002:a6b:3b10:0:b0:6cc:70d6:b8c0 with SMTP id i16-20020a6b3b10000000b006cc70d6b8c0mr34138584ioa.179.1668016053047;
        Wed, 09 Nov 2022 09:47:33 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4yPkZ7m9hAj8wapj87JjVrLOpOkSFxnT0lGL99dZVCAd13Q/4ycxXkI/Edom7fxs4Yrw4NIw==
X-Received: by 2002:a6b:3b10:0:b0:6cc:70d6:b8c0 with SMTP id i16-20020a6b3b10000000b006cc70d6b8c0mr34138576ioa.179.1668016052660;
        Wed, 09 Nov 2022 09:47:32 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id g15-20020a05663810ef00b00365d1d1cc58sm4806786jae.118.2022.11.09.09.47.31
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 09:47:32 -0800 (PST)
Message-ID: <90611be5-1c79-e5c9-e925-cad7ef854447@redhat.com>
Date: Wed, 9 Nov 2022 12:47:31 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: gti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: GTI TAC Meeting Notes 2022-11-09
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

GTI TAC Meeting Notes 2022-11-09

Meeting URL: https://8x8.vc/gti-infrastructure/gti-tac
- Using FOSS Jitsi hosted by 8x8's Meet service.
- No scalability issues.
- Jose had video issues.

IRC on OFTC #gti-tac.

Technical issues:
- Unable to login to 8x8's systems and authenticate as moderator
  - Timeout from sign-on systems.
- Unable to "record" the meeting, instead Carlos took quick notes
  on the discussion as it happened. These notes are inaccurate
  or even misleading, please take them with a grain of salt and
  reply to correct them if required :-)

Agenda:
The agenda for the GTI TAC meeting would be to
discuss the next steps for the current proposal:
the GNU Toolchain moving to managed infrastructure
at the LF IT. We could additionally discuss some of
the mechanics of the TAC, like where we'll put our
documents, notes

Present:
Joseph Myers
Jose Marchesi
Nick Clifton
Siddhesh Poyarekar
Frank Ch. Eigler
David Edelsohn
Simon Marchi
Carlos O'Donell

Regrets:
Joel Broebecker

Agenda:
- Discussing the mechanics of TAC documents.
 - git site / read-the-docs or sphinx
 - Get access to TAC for that.
   - ssh keys for gitolite
 - Domain for the GTI.
 - Joseph notes gti-tac.org is available
 - David suggests using a more general domain
 - Jose notes is this for all of the projects or just GTI
 - Carlos notes that this would be for GTI
 - Ask LF IT to set that up.
- TAC mechanics
 - Simon: Could we use this domain for services?
 - David: There is a distinction here between GTI and the
   services GTI offers.
 - David: Have a number of domains:
   - Have gnutoolchain.org
   - Have gnutools.org
 - David: There is a longer discussion about trademark for GNU
 - Siddhesh: Could we just use some of the LF and OpenSSF stuff?
 - David: Some of that could be non-FOSS
 - Siddhesh: Do we have concerns about non-FOSS for the TAC?
 - David: Yes.
 - Siddhesh: Yes, a simple solution would work.
 - David: Also have.
   - toolchains.dev
   - tollchain-infrastructure.org
- Regarding the GNU Toolchain infrastrucutre at the LF IT proposal
 - Next steps?
 - Create a working group.
 - Detailed assessment of the current technoloyg and services.
   - Enumerate the features.
 - Wether the GTI TAC or subgroup, working with the LF IT
 - Use the more detailed list to do the analysis and sizing
   of effort and expense for:
   - Steady state provisioning of the services.
   - Transitioning the services.
 - With that plan and budget, the GTI TAC votes on that.
 - Plan goes out for review.
 - Jose: Do I have your permission to be a little bit naive here.
   - The GNU Toolchain projects are GNU projects.
   - The projects have had a historical process.
   - How do we make that decision?
 - Carlos: That would be for the GNU Toolchain projects to decide that.
 - David: Yes, this needs to go out to those projects to make their decisions.
 - Jose: That's clear.
 - Siddhesh: Yes, there is a bit of word soup here. The "Leadership" is the
   general term here because multiple projects use different nomenclature.
 - Joseph: Details of LF services.
   - Each of the individual cron jobs run by gccadmin
   - What do those services do.
   - What are their inputs and ouputs.
   - Similarly we need to understand which ways the git hooks come in and out.
   - Anonymous rsync.
   - Readonly svn, cvs.
   - Misc. legacy.
   - Scripts that update regression markers via direct SQL access.
 - David: Completely agree with you Joseph.
 - Carlos: Before changing the topic. Jose did we answer that topic?
 - Jose: Yes, just raising this because of controversy and a desire for clarity.
 - Carlos: Absolutely, that makes sense. More clarity is good.
 - David: A concrete step. Consensus of next steps?
   - Refine the proposal by enumerating services.
 - Carlos: Agree on setting up a working group.
   - I would want to be on the one for glibc to enumerate services.
 - David: We need the enumeration of current services in detail.
   - There are two here.
 - Siddhesh: Does it make sense to have an in-principle vote early?
   - Have the GNU Toolchain leadership endorse the exploration?
 - David: The support letter is sufficient to indicate the direction.
 - Siddhesh: Jeff Law mentioned voting.
 - Carlos: Yes, for the final decision to move, the projects must make that decision.
 - Create working group to enumerate project services.
   - Jose: Agree. It would be useful.
   - Nick: Agree.
   - Simon: Agree. Not much experience.
   - David: Agree.
   - Frank: 
     - Note: Frank was muted and did not appear to unmute, or be on IRC.
   - Joseph: Agree. Nothing to add. Important first step.
   - Siddhesh: Agree. Its good. I can help out with services like patchwork.
   - Carlos: Agree. Like Jose said, having this is an important task for any project.
 - Action items:
   - Create the working group via GTI TAC mailing list discussion.
     - Identify members.
     - Initial taks of the WG is to enumerate existing services.
   - Create GTI TAC website with storage for notes and meetings.
     - Done via GTI TAC mailing list discussion.

-- 
Cheers,
Carlos.

