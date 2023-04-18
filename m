Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1EB2904
	for <gti-tac@lists.linuxfoundation.org>; Tue, 18 Apr 2023 16:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75B9283C38
	for <gti-tac@lists.linuxfoundation.org>; Tue, 18 Apr 2023 16:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75B9283C38
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ty2mI3iB
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
	with ESMTP id om3haseiW95l for <gti-tac@lists.linuxfoundation.org>;
	Tue, 18 Apr 2023 16:59:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8251583C30
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8251583C30
	for <gti-tac@lists.linuxfoundation.org>; Tue, 18 Apr 2023 16:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681837188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gshUf4xyGeXG3kT+IW76BRc9AkMRDW9kvgRzjPqOBNM=;
	b=Ty2mI3iBL3IdQZHj8fd/d/UkB2PnzQzhmCDCKXIZtWqFNUJvYmxnmYt50KEe6JEON22jr6
	oLaTGp6IM3REiWiwIY5SPy6rySuJHdC8i9ZQPH1W4N6xTbqFROX/ifFj6t4yLY9UBv9gNA
	XFPDBDKnu1mEEbb3BPBdlHPVlUu7104=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-Fg5Ra51VOhaBMmpBSXsm5w-1; Tue, 18 Apr 2023 12:59:39 -0400
X-MC-Unique: Fg5Ra51VOhaBMmpBSXsm5w-1
Received: by mail-yb1-f200.google.com with SMTP id n66-20020a254045000000b00b95a177fbe4so1537944yba.18
        for <gti-tac@lists.linuxfoundation.org>; Tue, 18 Apr 2023 09:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681837179; x=1684429179;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gshUf4xyGeXG3kT+IW76BRc9AkMRDW9kvgRzjPqOBNM=;
        b=X3MH34AQOJpzEdP4nDRW+7nKJkBJicLQbkwtwtgb8G/+tr5hLZlzojAh33CdeiE1ra
         RuureOOp+v+Fi5b0MWn6QS+eJRuPpivKejt9dYUlqLrBOxwYjXy6qjwNOlHDNIQoIdsm
         A9EPcPudoZxiydKjG5mD42Po9tik1AjWnFJnTgTpEwnP/Pt+2VTtqrtMbYwym4U4/jAT
         0naWKUUOj0VXGBUEpDu03dSKNfMtT49mSQTsZypoFgcEHbOBvG91z4KVJgACeAEMMg0V
         wErpWN0ZZwhIi9q1MakOq9o5WIQfB5ZixIz5xmSVyX3REUNriAjXjzZauMULnKBLegit
         2nuA==
X-Gm-Message-State: AAQBX9cMyxmDkfl0NES0qdh8E5uoNaOg48YU9fo9zkmmOO8RlIA7uD6n
	H1mL40GQlUJp55HGRQ1V/M6X/68izTmeGXCxwEDdnmeTxM+k0FPRMpUCyqc1y0PsYlmskJqzv9M
	4t6UVTgtX3X1Ww8EOpkBl2tc6CqxR2dTdLcuZoELIn3rRm4s/piyEyOZ3Czjy81w6EfbAV6PY33
	BHMRwz3mctT0SR
X-Received: by 2002:a0d:eac6:0:b0:546:4626:bfc5 with SMTP id t189-20020a0deac6000000b005464626bfc5mr513679ywe.31.1681837178791;
        Tue, 18 Apr 2023 09:59:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350YkEOGekbnqp+X6E0ietV0lwKXVFpvUOui1ZMDJmBa5bIJpoiP6h4MQSPeSRs/aorhhG9jb2w==
X-Received: by 2002:a0d:eac6:0:b0:546:4626:bfc5 with SMTP id t189-20020a0deac6000000b005464626bfc5mr513669ywe.31.1681837178470;
        Tue, 18 Apr 2023 09:59:38 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id i195-20020a816dcc000000b00555be5a354dsm281381ywc.52.2023.04.18.09.59.37
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 09:59:37 -0700 (PDT)
Message-ID: <52435f3a-b722-22d4-538c-3f2ad628813b@redhat.com>
Date: Tue, 18 Apr 2023 12:59:37 -0400
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: gti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: Share status update to OpenSSF TAC on Tuesday May 16th at 11am ET.
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

GTI TAC,

In 2023 we have several opportunities to share GTI TAC status to the
OpenSSF TAC. The OpenSSF TAC has representatives industry wide.

The next presentation slot for GTI is on Tuesday May 16th at 11am ET.
It's a short 10 minute slot.

I think this is a great opportunity to share status and get feedback
from the broader OpenSSF community.

Presenting status breaks down into the following steps:

- Summarize progress to date.
  - Write down any open questions we might have.

- Present progress to the OpenSSF TAC.
  - Ask for feedback on anything we think would be useful or valuable.

I would be happy to work with someone to wordsmith a high-level update.

Would anyone like to volunteer to write up a summary to date?

Would anyone like to present to the OpenSSF TAC?

-- 
Cheers,
Carlos.

