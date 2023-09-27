Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A699F50B
	for <cti-tac@lists.linuxfoundation.org>; Wed, 27 Sep 2023 15:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C311E82B34
	for <cti-tac@lists.linuxfoundation.org>; Wed, 27 Sep 2023 15:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C311E82B34
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XT7tZTBU
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2w3vTTui0DW for <cti-tac@lists.linuxfoundation.org>;
	Wed, 27 Sep 2023 15:44:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A3F9282AED
	for <cti-tac@lists.linuxfoundation.org>; Wed, 27 Sep 2023 15:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3F9282AED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695829497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+RL3Ktfs4fCCGhkI67G21keraz4x3kZkM1m2y5ZfvJs=;
	b=XT7tZTBU9GD68jsISWvrqNN3/Vi+7edYGbdYuS1kbRR0K6eM4huDZvMxiqjwWLdAlFuCg3
	ABxTkifD0kAoi3goNJ7+g4kdFGH0pzGjHrkM2p5hrKWbsENeAOK4RPAHd/V3urNoZ8P3q+
	0yehN5/2CWTmNQHvBaUOSEGF0+qo1cY=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-yU02etICM36cq5m2YdchuA-1; Wed, 27 Sep 2023 11:44:56 -0400
X-MC-Unique: yU02etICM36cq5m2YdchuA-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-59f8315aabfso134097507b3.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 27 Sep 2023 08:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695829495; x=1696434295;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+RL3Ktfs4fCCGhkI67G21keraz4x3kZkM1m2y5ZfvJs=;
        b=shGTogZVWEduK58hN6747omxAFCQQxil4Su62YndGMnwZvvw8iPNG/ELFI78nUPK/X
         PXBp6XKp5y8lk34LMc5q/Zn5kJtA/YRYiQaH2mEBpe763zKKzIqXQFpF2GEKxtr30uTY
         Z+ndKkbpU2CULROaO4pdrPTFLMnQ+LyK6d5t5tElUMvfA65uNhExEEr66A2QsuUq5isu
         AHZ9dbPLBHQDE1JHV/65spBaY0ZamqGXD31IX5ARw1MGyqGIgIb3NNXLfnytMDCIBN6v
         x36K3QQKK/XtjMLkYgpqXi+IrfZIueBXvLWntdmVIB24MRbpIQcwkxefoseRY6VvLSd6
         Sstg==
X-Gm-Message-State: AOJu0Yz+pcI8FHNWrLIOpk13ofoJeKQDLYorvKskh2GLtTPrjLYUnqV/
	grSQD1AiPTI1Y4XKi+tq4Xv2SYTOMkDO16ws772tEvXwbcZUZ6ERUOObt/I4dui8d+0XQ61nHJf
	QINuGT4+GzelMDyZPP8LkanH/N76zjT4dTJzEWO2cyWN3mFoUtTpdv7fB2+j8is8dCBGthW/f4t
	VezQfAT05oQ/4S
X-Received: by 2002:a0d:e044:0:b0:58f:bda3:8dd with SMTP id j65-20020a0de044000000b0058fbda308ddmr2858651ywe.32.1695829495341;
        Wed, 27 Sep 2023 08:44:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/oDZ3lB00FNjTZY0dyjeaMXC4YTSKIRIGGHyIfdsmKf3oEcBgeLn7boSJ30Q9GZZN2YjLQw==
X-Received: by 2002:a0d:e044:0:b0:58f:bda3:8dd with SMTP id j65-20020a0de044000000b0058fbda308ddmr2858630ywe.32.1695829494875;
        Wed, 27 Sep 2023 08:44:54 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id g1-20020a81ae41000000b0059f766f9750sm2020520ywk.124.2023.09.27.08.44.54
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 08:44:54 -0700 (PDT)
Message-ID: <e29a4962-d139-990d-9d90-cb7813074548@redhat.com>
Date: Wed, 27 Sep 2023 11:44:53 -0400
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
Subject: CTI TAC Meeting Notes 2023-09-27
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

CTI TAC Meeting Notes 2023-09-27

Present TAC members:
 * Carlos O'Donell
 * Nick Clifton
 * Joseph Myers    
 * Siddhesh Poyarekar
 * David Edelsohn
 * Bennett Pursell (OpenSSF)
 * Adrianne Marcum (OpenSSF)

Agenda:
 * Status of glibc discussions with stewards and the community.
 * Last status: Seeking consensus among the glibc GNU Maintainers/Stewards for use of CTI services.
 * Carlos: It has been a month since the request to review the use of CTI services.
 * Carlos: Several stewards had not commented on the proposal and I have reached out for them to comment.
 * Feedback from Alex, Paul, Joseph, Maxim and Carlos.
 * Carlos: Feedback from Paul is to document more of the requirements and what is agreed upon.
 * Joseph: It would help if the LF IT were able to engage in the discussions to discussion the value of replication.
   * Having LF IT engage in the discussion to improve service replication.
 * Carlos: Feedback from Alex is best answered by using the GNU Ethical Repo Criteria (https://www.gnu.org/software/repo-criteria.en.html)
 * Carlos: For Paul Eggert the feedback is that we need to document more of the requirements and requests to LF IT.
 * Siddhesh: Suggest encoding the requirement publicly as the CTI TAC.
 * Siddhesh: Do we have an agreement that can include forcing the CTI to use non-FOSS?
 * Carlos: No.
 * David: All of our initial discussions have started with FOSS as our base requirements.
 * David: We have always had an informal agreement with Cygnus, Red Hat, IBM, and others to always use FOSS.
 * Siddhesh: If we don't have anything encoded into a contract then the CTI TAC can be the place where we encode that.
 * Carlos: I agree we can add process to CTI TAC to raise issues regarding non-FOSS usage.
 * David: We have public meetings for CTI TAC and the CTI Board so the community can attend to raise issues.
 * Carlos: I have 2 action items:
  * 1. Raise with LF IT to review repo criteria.
  * 2. Raise with LF IT and David Edelsohn to setup cti.toolchain.dev to host public documents.
 * Siddhesh: FYI, I continue to move forward the glibc CNA process.
  * Will use sourceware infrastructure for now and will need migration when we make the move from sourceware to LF IT.

Action items:
 * Create cti.toolchain.dev and document what we have and what we know for the community to have a place to review documents.
  * Involves LF IT to setup domain and infrastructure for documents.
 * Next meetings:
    October 12-13th - Prep pre-reads for OpenSSF Board meeting.
    October 23rd - OpenSSF Board meeting. Pre-reads ready a week prior.
    October 25th - CTI TAC meeting
    November 28th - OpenSSF TAC meeting with CTI TAC presenting.
 
-- 
Cheers,
Carlos.

