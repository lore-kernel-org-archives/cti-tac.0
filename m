Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B27079F0
	for <gti-tac@lists.linuxfoundation.org>; Wed,  8 Mar 2023 16:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0B628133C
	for <gti-tac@lists.linuxfoundation.org>; Wed,  8 Mar 2023 16:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0B628133C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iKiqGa7W
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ntY7AB60q7mD for <gti-tac@lists.linuxfoundation.org>;
	Wed,  8 Mar 2023 16:44:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01CED8132F
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 01CED8132F
	for <gti-tac@lists.linuxfoundation.org>; Wed,  8 Mar 2023 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678293891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/gZ7xTGNeSx67e1+hg1ogeSCsIotQLqvf0smmYrhO1Y=;
	b=iKiqGa7Wm3Qk3tyEGmCm4zGtWihejjQU461YZjRJpddQfT4H7gOuxBi5BDIO+rH+lsrS5P
	WGIWCYGmcimsZz5s2H65mm00JkhUWo9kY6y/mbolw7oymFT0NO03qWXAZsf1QJpCPPJZUW
	VE1opgWTFAA0fiormm92RrXwOWoFD1E=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-zG1kPLZ4OiS6okNg06UgiA-1; Wed, 08 Mar 2023 11:44:49 -0500
X-MC-Unique: zG1kPLZ4OiS6okNg06UgiA-1
Received: by mail-il1-f197.google.com with SMTP id g14-20020a92dd8e000000b00316ea7ce6d3so8832802iln.15
        for <gti-tac@lists.linuxfoundation.org>; Wed, 08 Mar 2023 08:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678293889;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gZ7xTGNeSx67e1+hg1ogeSCsIotQLqvf0smmYrhO1Y=;
        b=QSdGecC0PcFhbfyq8QWyouBQZlWkuf6xMCbf25V8mAyC7LPmBMaWCt3YzGxgKBROza
         Xifl6EgvHIWGM7MTJ8WKYnxMzbQ6gS2EVgOYpJ9I/jVW1a4wUhmnLQDs9eKJdBpGTANy
         VD/vk1eJ2Sa+LjSVV7O20SGxdo91iUy0OGXUSnQAuxd1lOtIJaLECt46Ied2mAyTm8mj
         V5SfaFjpnwHKloaoWyNzsVm5A9NfMlXr9SYP48fenjxArvdGqGmAlkoBFy07FACBXUuV
         y6WmHP5ASLoyW/pMXI5hN3zVqPgqHhM3lJqHS4K7vdPwUwcz5pW3cORL3X8+pJ8513XL
         56gQ==
X-Gm-Message-State: AO0yUKUAVyLd0nCoU1Pg9/0XEiDRFF2T+SXAvNgDFboDfo7aYSsWe6/A
	XUdJBzrXMd8VtW8FEdOa0Cq4JGdmyJiLt6zTx93I/eLyfilq3Mc6x6zBzhk2/LetuyQC4ltEj0r
	N8AGd3RnWALY2WAkxTwv4J04M36LiTmVIMAwMArk4rklOut2/McJNxZ7q+RrfzXi/xiinErTxmV
	ZQifQ6hPU2Gou8
X-Received: by 2002:a05:6e02:198d:b0:317:9202:2f22 with SMTP id g13-20020a056e02198d00b0031792022f22mr1752049ilf.8.1678293888799;
        Wed, 08 Mar 2023 08:44:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8qfLyIFfic+fN37CTMB37YT+CSjXMSRHUpr5iP2Qj6PBpJq1f+20Smc0NIytJEoyvzAIT/4Q==
X-Received: by 2002:a05:6e02:198d:b0:317:9202:2f22 with SMTP id g13-20020a056e02198d00b0031792022f22mr1752030ilf.8.1678293888386;
        Wed, 08 Mar 2023 08:44:48 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id o14-20020a92dace000000b00313f1b861b7sm4569965ilq.51.2023.03.08.08.44.47
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 08:44:48 -0800 (PST)
Message-ID: <b72a0c4f-fed3-7418-e9d6-7a277bf37b3e@redhat.com>
Date: Wed, 8 Mar 2023 11:44:47 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: gti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: GTI TAC Meeting Notes 2023-06-08
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Agenda: 
- Pick a time for regular monthly meetings.
- glibc: Next steps for glibc, and the process for migrating a whole project to LF infrastructure  
- Going to the LF IT core projects team and asking for review of glibc services and cost.  
- Approval from GTI.  
- Community discussion.  
- GNU Maintainer decision.
- Setting up gti.toolchain.dev to hold documents and notes from the  meetings?

2023-06-08:
- Welcome to Khahil White (Linux Foundation Program Manager on OpenSSF and AlphaOmega)
- Welcome to David Wheeler (Linux Foundation)
- Current status is 3/4 projects have detailed service enumeration complete.
- Gcc still missing for service enumeration.
- Carlos: I'll reach out to Joseph again about gcc service enumeration.
- David: GCC by far is likely the most complicated.
- Carlos: Where does the complexity come from?
- Jeff: Mailing list from bugzilla integration. Lots of custom stuff.
- Suggestion from Carlos to the GTI TAC - Run through glibc from start to finish.
- Carlos: Working through one project as a first target.
- Simon: Bringing binutils probably means bringing gdb.
- Jeff: Yes, they share a repo.
- Joseph: Seems reasonable as a project to start with.
- Siddhesh: Buildbot repository not in use anymore.
- Migrating glibc seems like a good first project.
- David: Make it clear with the OpenSSF that scaling up is not going to be 4x the cost because services are going to be shared.
- Asked Khahil White if this works for the OpenSSF, that we don't want to scare anyone into thinking this is 4x the cost.
- Joseph: I still intend to work on it, but I need to get time for that.
- Joseph: Do we want read-only access to old rcs/cvs?
- Joseph: Anonymous rsync?
- AI: Carlos to review existing glibc rcs/cvs/rsync and shut down those services.
- Joseph: Migrate services vs. bugzilla (two of them, gcc + classpath, the other has loads of stuff).
- Next Steps:
     - One last pass over glibc services with an eye towards adding legacy services that will be shutdown.
     - Take the glibc services list to LF IT core Project for pricing and explain that we want to tackle this on a project-by-project basis.
     - Ask LF IT to setup gti.toolchain.dev for use to store docs and minutes presentation.

-- 
Cheers,
Carlos.

