Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C691836D9
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 May 2024 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716998509; cv=none; b=iWDeCAE7a/20cdFQ3Oy+90KnU4zfgylKpQz1p/zzpgFELUbNcP+W3ck3HkAZx8x13v5ydzJ2lMig2eOazl0nuWwU1zyHQGXqoOwbn4lr0C/lCkFS8mXfbGZwXy1xSZoAFTmV9Ox7CuUYE7rKFJNYjeb0Fvwliv+f0b93+xIYj28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716998509; c=relaxed/simple;
	bh=dfAeGLt1gbKs6vl1KkjtYYFMk5e8qsADIEeKQnOa7xk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=qunClgH/fWS01wTzEGxvcG/NEHoPeY6BSGb+zPKEHVDaX3SHGpKJBHElbCHR8Nhs9qUuWr0ADqWYRD4NYP/S49uVJZ0JLsXb4VHOUHDwZ1Rv++LG+uTGWv4wq07YpzaTaAUrQW4yR/lMSS2DtrMHbFVVvJD1DLDjCkHScuxJf+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U5tmDoXT; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U5tmDoXT"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C395B408F9
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 May 2024 16:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzAtQ_eJP2B1 for <cti-tac@lists.linuxfoundation.org>;
 Wed, 29 May 2024 16:01:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE0A44095A
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE0A44095A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U5tmDoXT
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CE0A44095A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 29 May 2024 16:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716998503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=s9aD7JwmC+Va8mHiR9eq57L91uXv0M9XoAGjc7LQRP8=;
	b=U5tmDoXTls78OUEDUz9zbZ6JPdGCLbznjyK0iH2LJC0GZNr/wGoS4MYWHzCLYu59z9WC66
	X3qzqKWIJCQ3dt3ToBaMB54guL6oKG77dSM6B19hLcr+82cSQP+xAVX94RvSbjd8TYTlY+
	pa7T7DK7BKX5urqeGR86mHCFvITvpDs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-IwSb8GlqPwOXtZ1rQrqASw-1; Wed, 29 May 2024 12:01:41 -0400
X-MC-Unique: IwSb8GlqPwOXtZ1rQrqASw-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-794e752ff3cso24206885a.3
        for <cti-tac@lists.linuxfoundation.org>; Wed, 29 May 2024 09:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716998500; x=1717603300;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s9aD7JwmC+Va8mHiR9eq57L91uXv0M9XoAGjc7LQRP8=;
        b=wMubj086mrdEMAKxi+AVoFWDIwO4n3qnxhaE7pZNETZhIEbVCZMb8rziopjsbB8vqu
         6+IqMeYiVV7h/N4s4iYZKuRv8D3d6YYnKKO+/GQ7Hql+FpLE9zq/XHyuG9QWOaK7f1oZ
         lycIFwHHlsJZtqDbnT59cGwwg8TbNd0CCseuauTolju/2tZjK0OANhqOX5+fNGVaJI5e
         93oFAVDq+KQ9bUUbmk+0a2PY8FJp6QNdCmY1eMTY4KB39t7v9W2Xy9oDtusAEpzNcD5x
         ye8yzEWbWp89tg8raBWfIjJWyIplM7g8hdU6RHayZAk1QKq7o05c456/kEgbK/8jfRI3
         9GQA==
X-Gm-Message-State: AOJu0YwMbogSUjaGTOR9QpKjdpcw/DPGN95SCyYMYv4327nmbbADx9zT
	m7erh2E4WwQTN38N11SU9Ma+7wvborQwM36nWjIHHi2/K6Np0xYVWUJnSeRA1ciJc8Ajg+zPaWj
	Vwy+3jlOGaS92TRSZCs4mFoBGfRuMD8okRnaf0u8o5bmiJvv3QrFwPyiMER7S6LzOsuQnXgvCdt
	7Vi0dCIFaY1e02ppSuYVek8ziVq10vRHX6ACgDU+hcwADS085xug==
X-Received: by 2002:a05:620a:1da7:b0:794:b341:8d95 with SMTP id af79cd13be357-794b3418da3mr1258361285a.64.1716998499487;
        Wed, 29 May 2024 09:01:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo4hdRKG0c7zsukGfa2F6khV5edc3Z5J5aebfgow9yN5ue1yxgX+B70YtMcxyMzIlUtnHJDw==
X-Received: by 2002:a05:620a:1da7:b0:794:b341:8d95 with SMTP id af79cd13be357-794b3418da3mr1258354185a.64.1716998498388;
        Wed, 29 May 2024 09:01:38 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abd4406esm480962785a.128.2024.05.29.09.01.37
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 09:01:37 -0700 (PDT)
Message-ID: <69862ea2-d7e2-4fdc-91a6-a80525ecf423@redhat.com>
Date: Wed, 29 May 2024 12:01:37 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2024-05-29
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

CTI TAC Meeting Notes 2024-05-29

Present:
 * Carlos O'Donell
 * Nick Clifton
 * Konstantin Ryabitsev (LF IT)
 * David Edelsohn
 * Joseph Myers
 * Siddhesh Poyarekar
 * Bennet Pursell (OpenSSF)
 * Ian Kelling (FSF)
  
 Agenda:
 * Schedule going forward.
   * Done. In progress: LF IT put together statement of work.
   * Done. CTI TAC reviewed SOW and provided feedback.
   * In progress: Finalize remaining SOW items. Discuss in CTI TAC meeting.
   * In progress: 2024-05-31: Sharing early draft plan with the community.
 * Next steps revised:
  * In Progress: Review LF IT SOW with CTI TAC and finalize SOW.
  * Early June / Late May 2024-05-31 - Share early draft plan with the glibc community.
  * Early June 2024-06-10 - Agreed migration plan.
  * June - OpenSSF GC read out of the plan and SOW and costs.
  * August 15th - OpenSSF GB meeting

Audio was uncharacteristically on the fritz so we ran the whole meeting via public chat.

[10:55] Welcome to Linux Foundation BBB conferencing.Powered by Linux Foundation.
[10:55] To invite someone to the meeting, send them this link: https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1
[11:04] Siddhesh Poyarekar: Choppy audio for me too.
[11:04] Konstantin Ryabitsev: we may be having BBB issues
[11:04] Nick Clifton: same here - I can hear but the audio is choppy
[11:04] Konstantin Ryabitsev: Not sure how we can fix this if it's the service having troubles.
[11:05] Carlos O'Donell: So is everyone choppy for everyone then?
[11:05] Konstantin Ryabitsev: let's drop cameras
[11:05] Carlos O'Donell: Turning off camera.
[11:05] David Edelsohn: definitely choppy for me also
[11:05] Joseph Myers: Choppy here as well.
[11:06] Siddhesh Poyarekar: The three of us are on the same side of the Atlantic
[11:06] Carlos O'Donell: Choppy here too. Monday morning it was not choppy though, ran the glibc patch review then.
[11:06] Konstantin Ryabitsev: I can flag this with the provider, but we won't get this fixed in time.
[11:06] Carlos O'Donell: We can do the meeting by typing :-)
[11:06] Siddhesh Poyarekar: Maybe even the same side of the lake system.
[11:06] Carlos O'Donell: (1) How do we close out the final SOW entries?
[11:07] Carlos O'Donell: I made some suggestions. Does KR need time to review those suggestions and respond?
[11:07] Konstantin Ryabitsev: It's really down to "I cannot provide an ETA/estimate because this has never been done before, afaict"
[11:08] Carlos O'Donell: Let me ask a follow-on question.
[11:08] Carlos O'Donell: (1.1) Can we manage one-service-instance per project? Is that feasible? It makes isolation better and future transitions better.
[11:09] Konstantin Ryabitsev: which service are we talking about?
[11:09] Carlos O'Donell: Primarily bugzilla and patchwork.
[11:09] Carlos O'Donell: Which are the worst to import/export.
[11:09] Konstantin Ryabitsev: it won't be worth it money-wise.
[11:10] Konstantin Ryabitsev: nothing really preventing it from the technical perspective, but the instances/containers running each service will be underpowered and unable to take spike loads.
[11:10] Konstantin Ryabitsev: especially bugzilla, which suffers from "someone linked this bug on a public forum, and suddenly the load is 200"
[11:11] Konstantin Ryabitsev: we can try horizontal autoscaling, but it's challenging with the perl codebase that doesn't expect this.
[11:12] Carlos O'Donell: I am OK with not handling spike load if it is only for 1 project at a time, the benefit of splitting per project bugzillas and patchwork instances.
[11:12] Carlos O'Donell: So long as git, and other services don't also fall over.
[11:12] Konstantin Ryabitsev: patchwork should not be a challenge
[11:12] Joseph Myers: I think it's clear that after the transition we want a Bugzilla database that only has glibc and not any other active projects in that database (that's talking about bug numbering etc. rather than any other form of isolation). The previous discussions were about how to get there with all the existing glibc bugs in that database.
[11:12] Carlos O'Donell: e.g. strong isolation, resilience.
[11:13] Carlos O'Donell: @Joseph, Yes, my suggestion is just to create a "glibc only bugzilla" and import everything and use the BZ UX to delete all the other projects (which is can in theory do, and I've deleted other things in bugzilla before).
[11:14] Konstantin Ryabitsev: another concern there was with bugzilla accounts and how to port them over without it potentially being a tricky issue with privacy. People who created accounts on the sourceware bugzilla may object to having their PII being given to a wholly different org.
[11:15] Carlos O'Donell: Service provides have changed continually over the years from Cygnus, to Red Hat to IBM.
[11:15] Joseph Myers: I guess it's hard to have some kind of proxy in front of Bugzilla, that caches things for not-logged-in users so they might get a view of a bug that's a few seconds out of date during a "DDOS because someone linked to a bug from Mastodon" but Bugzilla itself doesn't see all those requests?
[11:15] Konstantin Ryabitsev: triggers one of the hard problems, which is "cache invalidation" :)
[11:16] David Edelsohn: The current "organization" is somewhat fuzzy.
[11:16] Konstantin Ryabitsev: I think bugzilla Harmony does it a bit better with memcache.
[11:16] Carlos O'Donell: Yes, bz can use memcached.
[11:17] Konstantin Ryabitsev: Also, when it comes to isolation, we can isolate frontends, but I don't recommend isolating database backends. They can all run in a separate namespace, but on the same server instance.
[11:17] Siddhesh Poyarekar: That should be fine.
[11:17] Joseph Myers: Yes, assuming each database user has no access to the databases for other instances.
[11:18] Carlos O'Donell: @Konstantin, Back your question about PII, we are being clear and up front with the community that the service provider is changing. So I believe this is OK, but if people don't want their account migrated we can delete it for them at their request.
[11:18] Carlos O'Donell: Document a "delete my account" process.
[11:18] Konstantin Ryabitsev: OK. My experience deleting accounts with bugzilla ranks as "terrible", so I suggest instead changing their login information to deleted_account_{datetime}@example.com
[11:19] Carlos O'Donell: Correct.
[11:19] Carlos O'Donell: Disable the account.
[11:20] Konstantin Ryabitsev: So, if the process is: 1. port bugzilla over from the database dump, 2. use the frontend to delete any products/components not relevant to the project
[11:20] Konstantin Ryabitsev: that should work
[11:20] Carlos O'Donell: Correct.
[11:20] Carlos O'Donell: And we do that for each migrated project, so it retains their old bugs.
[11:21] Carlos O'Donell: Each project gets a unique isolated instance.
[11:21] Carlos O'Donell: @Joseph, Does this meet your requirements for the transition? I was trying to get to consensus among the TAC here.
[11:21] Konstantin Ryabitsev: I assume there is no single-sign-on requirement for bugzilla?
[11:22] Joseph Myers: Plus set the bug number for the next new bug to 100000, for projects migrated from Sourceware Bugzilla. And mark all open bugs for the migrated project CLOSED in the Sourceware Bugzilla, with an automatic comment pointing to the new location.
[11:22] Carlos O'Donell: @Joseph, Agreed.
[11:22] Siddhesh Poyarekar: None at the moment, but once we migrate fully, SSO could be a future enhancement.
[11:22] Carlos O'Donell: @Konstantin, There is no SSO requirement. That would be a future CTI TAC discussion and scoping.
[11:22] Joseph Myers: No SSO requirement, though I think some people might like SSO.
[11:23] Konstantin Ryabitsev: note, that if you have different instances for different CTI projects, that will also mean a different login for each bugzilla/patchwork.
[11:23] Carlos O'Donell: We have that today between gcc and glibc (two bugzillas)
[11:23] Carlos O'Donell: etc.
[11:23] Joseph Myers: Yes. People could choose to use the same password on both instances if they wish, without much security impact.
[11:23] Konstantin Ryabitsev: just highlighting potential friction points for the community, as I see them.
[11:24] Carlos O'Donell: Agreed, there is friction, but no more friction than before, and at the time we copy the database everyone will have the same login?
[11:24] Siddhesh Poyarekar: While there's overlap between people doing dev across GNU tools projects, a significant number tends to develop for only a subset of the projects.
[11:24] Konstantin Ryabitsev: whatever login info is in the db dump
[11:25] Carlos O'Donell: Corred.
[11:25] Carlos O'Donell: Correct.
[11:26] Carlos O'Donell: Again: (1.1) Can we manage one-service-instance per project? Is that feasible? It makes isolation better and future transitions better. Consensus: We agree that this should work to resolve the issues with retaining old bug information, and is technical feasible, and also provides isolation from DDoS per-project instances. Noted: Friction for multiple logins, and inability to handle spike loads (an issue we can look at in the future). Does that seem about right?
[11:27] David Edelsohn: +1
[11:27] Siddhesh Poyarekar: +1
[11:27] Joseph Myers: Yes, that looks right.
[11:27] Konstantin Ryabitsev: Sure, that sounds good to me.
[11:28] Nick Clifton: +1
[11:28] Carlos O'Donell: That closes out "2. Bug tracking software (Bugzilla)" in the SOW list.
[11:29] Carlos O'Donell: (2) 6. Patch tracking services (Patchwork) - I propose exactly the same solution for patchwork, where I already know Django can easily delete not-needed projects and the database remains consistent, there is broader industry use in Django of this feature in the UX. Do we agree that this would also work? Same friction issues on login, and same benefits of isolated services.
[11:31] Joseph Myers: Yes, that seems OK. (For Patchwork I'm fine with either "copy everything then delete other projects after copy" or "replay just the currently open patches" - whereas for Bugzilla I'd like all past glibc bugs, open and closed, to be in the new database.)
[11:31] Konstantin Ryabitsev: Yes, that will work -- with a caveat that the system feeding mail to the individual projects in the backend will be shared. There is no impact on isolation, as it's an internal instance.
[11:31] Siddhesh Poyarekar: So basically a single patchwork@coretoolchains.dev signed up to all of those MLs?
[11:32] Konstantin Ryabitsev: no, we feed from the public-inbox archives
[11:32] Konstantin Ryabitsev: it's a much less insane process than feeding it from postfix
[11:32] Siddhesh Poyarekar: That should be fine.
[11:33] Siddhesh Poyarekar: Patchwork automation bots (e.g. trybots) will need to be able to talk to different patchwork instances.
[11:33] Carlos O'Donell: Just to reiterate then: Mail service remains a singular service, public-inbox feeds into distinct patchwork instances that start with the the full database load and are then cleaned up.
[11:33] Konstantin Ryabitsev: I'm still not sure you really want really ancient patches in your patchwork system.
[11:34] Konstantin Ryabitsev: they are just dead weight, for the most part.
[11:34] Carlos O'Donell: Historical data is useful for tracking a variety of project health metrics, and I use the patchwork rest API for that. We probably only look at the last several months of patches.
[11:35] Siddhesh Poyarekar: Our patch review policy says that patches older than 2 years are archived, so that should allow us to easily clip it at the 2 year mark.
[11:35] Siddhesh Poyarekar: https://sourceware.org/glibc/wiki/Patch%20Review%20Workflow
[11:35] Carlos O'Donell: Yes, I don't object to clipping at 2 years.
[11:35] Carlos O'Donell: I don't know how to do that with manage.py in patchwork.
[11:35] Carlos O'Donell: I think we're trying hard to make the process of import/export easy without any custom work.
[11:36] Carlos O'Donell: So lets just dump, import, clean, and move on?
[11:36] Konstantin Ryabitsev: It's straightforward to delete old patches from the database.
[11:36] Siddhesh Poyarekar: in fact, if we can mark all patches that fail to apply to latest trunk as Changes Requested, it'll allow us to clip at the 1 year mark.
[11:36] Joseph Myers: As I said, my concern for patchwork is keeping the active patches rather than what exactly happens with those that are no longer active.
[11:37] Siddhesh Poyarekar: To keep it simple, we could simply dump, import and then delete everything that is older than a year.
[11:38] Konstantin Ryabitsev: We don't have to decide this right now. There are still concerns with that, such as -- does anything like to patchwork entries.
[11:38] Konstantin Ryabitsev: s/like/link/
[11:39] Siddhesh Poyarekar: FWIW, the glibc patch volume is not that high; I'm not sure if we'll save all that much space from dropping ~3 years worth of patches.
[11:39] Carlos O'Donell: We have no requirements on patchwork entries being fixed, and there is no community process that requires it. There are obviously links to the sourceware patchwork instance in flight, but new links should go to the new service.
[11:39] Konstantin Ryabitsev: My preferred solution has always been to work with patchwork maintainers instead of making direct surgery edits on the db.
[11:39] Carlos O'Donell: @Konstantin, I agree completely.
[11:39] Carlos O'Donell: We should not directly edit the db, but Django is the admin interface.
[11:39] Konstantin Ryabitsev: I've suggested that there is a process to remove archived patches from the db, replacing them with a link to the public mail archive.
[11:40] Konstantin Ryabitsev: But patchwork developers haven't had much chance to work on it -- which may change now that one of them is employed by Collabora specifically to work on patchwork.
[11:41] Carlos O'Donell: So do we have consensus on per-project patchwork instances to isolate and simplify the process?
[11:41] Konstantin Ryabitsev: So, in general, I'm okay if we follow the same process to copy the database dump and delete projects via the django interface.
[11:41] Carlos O'Donell: +1
[11:41] Siddhesh Poyarekar: That sounds reasonable to me.
[11:41] David Edelsohn: +1
[11:42] Joseph Myers: OK.
[11:42] Siddhesh Poyarekar: @Carlos, who is on the hook to update the trybots?
[11:42] Siddhesh Poyarekar: We'll have to get DJ and Maxim into the picture for this at some point.
[11:43] Carlos O'Donell: https://sourceware.org/glibc/wiki/PreCommitCI <- Every bot must have an owner, and they will migrate it.
[11:44] Carlos O'Donell: Again: (2) 6. Patch tracking services (Patchwork) - I propose exactly the same solution for patchwork, where I already know Django can easily delete not-needed projects and the database remains consistent, there is broader industry use in Django of this feature in the UX. Do we agree that this would also work? Same friction issues on login, and same benefits of isolated services. Consensus: It is acceptable to have per-patchwork services following the same principles as the bugzilla discussion. Noted: Similar friction on accounts and logins.
[11:45] Carlos O'Donell: That closes out "6. Patch tracking services (Patchwork)" in the SOW list.
[11:45] Carlos O'Donell: @Konstantin, May you please take the action item to send out the SOW again with the amended work for items 2 and 6? Is that our next step, and then we can agree to that on the list?
[11:46] Konstantin Ryabitsev: Sure, will do.
[11:46] Siddhesh Poyarekar: Maybe also add a note to cull inactive/unverified users before migration; we tend to have loads of those in the sourceware patchwork instance.
[11:46] Carlos O'Donell: I delete them from the database regularly.
[11:46] Carlos O'Donell: That is a process we can hash out later.
[11:47] Carlos O'Donell: e.g. deleting unverified users after a certain amount of time to reduce the user database size.
[11:47] Carlos O'Donell: Or disable logins and handle it differently.
[11:47] Konstantin Ryabitsev: honestly, user database size is not something I would worry about.
[11:48] Konstantin Ryabitsev: it's identifying spammers and blocking them.
[11:48] Carlos O'Donell: I agree, this is not something we need to discuss as part of the migration IMO.
[11:48] Siddhesh Poyarekar: /me nods
[11:48] Konstantin Ryabitsev: we have a bugjunker bot that flags all new users posting links. It's been my todo item to integrate that with IRC for a rapid response.
[11:49] Carlos O'Donell: Cool.
[11:49] Carlos O'Donell: I think this means the SOW can be completed and I can make a public post hopefully this week?
[11:50] Carlos O'Donell: To share with the community.
[11:50] Joseph Myers: We restricted user account creation for GCC Bugzilla when spammers were opening bugs faster than the REST interface could mark them as spam / close them.
[11:50] Joseph Myers: (GCC has contrib/mark_spam.py to mark all bugs in a given range as spam, which dates from that time.)
[11:51] Carlos O'Donell: @Bennett, Any questions from your side? I want to get the SOW agreed and then public post to the community to start a period of feedback gathering.
[11:51] Carlos O'Donell: "Shared Notes" contains updated timelines.
[11:52] Bennett Pursell: With the SOW, would that include the cost estimates (although maybe not the detailed line items)?
[11:53] Konstantin Ryabitsev: First, I'll send the updated scope of work for the approval. Once I receive that, I will put that into the SOW with the updated prices/eta's.
[11:54] Carlos O'Donell: If the price breakdown is confidential then that's OK with me, but I would like a single final price to show the community.
[11:55] Carlos O'Donell: NOTE: 6 minutes to the top of top of the hour.
[11:55] Bennett Pursell: Okay, I will need some kind of estimate on what we would look to spend this year, but that doesn't need to be public.  I imagine that we could use whatever is made public, but can probably discuss offline with Konstantin if it can't be made public.
[11:56] Carlos O'Donell: Agreed. Whatever is business confidential can be kept as such, but a round figure is good to talk to the community about.
[11:56] Carlos O'Donell: CTI TAC, I need review for this FAQ update: https://lore.kernel.org/cti-tac/20240529135110.3917584-1-carlos@redhat.com/T/#u this answers Frank's questions and meet's Joseph's request to answer Frank's questions.
[11:56] Carlos O'Donell: @Joseph, Review of the FAQ update would be appreciated.
[11:57] Carlos O'Donell: @Ian Kelling, Anything that you would like to raise?
[11:58] Carlos O'Donell: NOTE: 3 minutes to the top of the hour. Resolving the SOW items first was highest priority. Sorry for not giving too much time for raising issues.
[11:58] Konstantin Ryabitsev: (did not get better)
[11:59] Carlos O'Donell: OK, that's a wrap. I'll post online.
[11:59] Konstantin Ryabitsev: +1, thanks!
[11:59] Carlos O'Donell: AI's with Konstanin (SOW update) and the TAC (FAQ review please)
[11:59] Carlos O'Donell: Bye!

-- 
Cheers,
Carlos.

