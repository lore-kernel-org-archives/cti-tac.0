Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB996171D5
	for <cti-tac@lists.linuxfoundation.org>; Wed, 31 May 2023 15:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3889541F52
	for <cti-tac@lists.linuxfoundation.org>; Wed, 31 May 2023 15:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3889541F52
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LfL95A9U
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zq1vonf2OBfZ for <cti-tac@lists.linuxfoundation.org>;
	Wed, 31 May 2023 15:47:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CEB341299
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5CEB341299
	for <cti-tac@lists.linuxfoundation.org>; Wed, 31 May 2023 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685548074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4HnESij5XtBv/S37aKw7jjODltavAsuNjIv+HDJEFso=;
	b=LfL95A9UCMLeGa9tWmra/56wJlrioft4aEA1qWIFnXTSCFALMa3AD/WoERBb0tWRdre6z8
	RmDiSLhAL6uwWa6e2+pwmrtIb/8H5rn5jZkfcrD6mrhpLDqDU3t3LRn8ZLUdZaUfcuGEEU
	BbnS1kxJVAvvBh24og8xDy2CRqB0ZVM=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-Rog-JaY8Mx6yZLiIZEFJAA-1; Wed, 31 May 2023 11:47:53 -0400
X-MC-Unique: Rog-JaY8Mx6yZLiIZEFJAA-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6b0c60a9f2cso1877217a34.3
        for <cti-tac@lists.linuxfoundation.org>; Wed, 31 May 2023 08:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685548071; x=1688140071;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4HnESij5XtBv/S37aKw7jjODltavAsuNjIv+HDJEFso=;
        b=gU4mcWLq5rcGOvoxtHpWvDVpeIs/euFb2+/HmJlE3CxljruoEa/LZXXkWB4E9QJVqF
         J9J6Ap1rq3pmRl5vyXVzhtv8WBDRS1V1oaS2xYYB0lUo9k+Ag4Lf6xd0HcGWPKLrRdC/
         T6RQbOjdZaBPuKBIW/q79+efJfXJNx0+cydJwVTkb2KXpE7+9SKOljSIup6ibePnCcNr
         re/YgWPcVP8Q6oO6wbA8KHG+CF/xVoiO2YfsZPT9UHy2gTUV+D26NRdru0dOLy77SBsz
         vCSBnsakeolXiVHjluC7rixSyD8zkGfWCxUPsWCeKGzwUqsGnaYiM4mneu0n58uTfS5+
         UxwQ==
X-Gm-Message-State: AC+VfDyJJBoarz2shi3fk0mpAEOxeSkLOfnv0I4nLzmCGJ/w8a9pXR9s
	lSqCCEJbGFNpdh5U06utAqoYnimjnApFUgxNO2SqLtWdlfn47sJpHhGp56lFLTUAC8uAe1FRWoH
	wMOcR4ct09DU7S4ksmONlPxgIsvCTMLV0jf/iWReEK3iasEDsiVTce51aJYO/mqlqQdFZzgvxZs
	ncg8Y7F8+YQxpd
X-Received: by 2002:a05:6871:40e:b0:1a2:146f:67b1 with SMTP id d14-20020a056871040e00b001a2146f67b1mr348953oag.40.1685548071507;
        Wed, 31 May 2023 08:47:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ72a/S5zqLS+NXbngODWUTI1eHvElYx1fAlQe7eU1H5qHExwJqMfh8c1WtruQLljRwGeUovPw==
X-Received: by 2002:a05:6871:40e:b0:1a2:146f:67b1 with SMTP id d14-20020a056871040e00b001a2146f67b1mr348940oag.40.1685548071100;
        Wed, 31 May 2023 08:47:51 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id n63-20020a0de442000000b00545b02d4af5sm4791709ywe.48.2023.05.31.08.47.50
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 08:47:50 -0700 (PDT)
Message-ID: <47d5d7a0-60ab-b400-2f75-880fdaae0738@redhat.com>
Date: Wed, 31 May 2023 11:47:49 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2023-05-31
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Present TAC members:
- Joseph Myers
- David Edelsohn
- Siddhesh Poyarekar
- Carlos O'Donell

Agenda: 
- Discuss current status and updates. 
- glibc: Next steps for glibc. 
- Pick a time for regular monthly meetings

Notes:
 * Discussed the project name change from GTI to CTI 
   in order to support the more general scope of
   "Core Toolchain Infrastructure" which can support 
   the GNU Toolchain projects.
 * Discussed how to proceed with glibc as a project that 
   could move forward and use CTI services.
 * Siddhesh: We have significantly different workflow from 
   the kernel in terms of committers that have access to the 
   sources. Do we need to resolve that?
 * Carlos: I don't think we need to resolve this, but Konstantin's 
   comments are a concern about security, and it certainly needs improvement.
 * David: We don't want to change everything up front, but we eventually
   can address these issues.
 * Joseph: Should include the obsolete things in the discussion.
   The extra services that are identified should be listed.
 * Joseph: Checks in the git hooks are even more important when
   you have many committers vs just a few.
 * Joseph: There are still migration issues that need to be sorted out.
 * Carlos: AI for me is to put together list of services + legacy
   services to be migrated and start discussion on glibc libc-alpha list.
 * David: What is missing is that we need a focal point for the details 
   of the glibc transition. Do we have additional people that we can
   engage with to review the transition plan?
 * Carlos: Agree with David, we should explicitly call out that we're 
   looking for volunteers from the community to resolve specific details.
 * Carlos: Is a next step also to ask Konstantin for a status update on
   services used by glibc from CTI (LF IT)?
 * Carlos: AI to send email to Konstantin for a status update on glibc costs.
 * Discussed time slot preferences for meetings. Wednesday 11am EDT works.
   - Will review on list.
 * Discussed monthly meeting to carry status to all TAC members.

-- 
Cheers,
Carlos.

