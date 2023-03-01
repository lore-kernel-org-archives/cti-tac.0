Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CF946BD
	for <gti-tac@lists.linuxfoundation.org>; Wed,  1 Mar 2023 15:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60D0D81E53
	for <gti-tac@lists.linuxfoundation.org>; Wed,  1 Mar 2023 15:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60D0D81E53
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BJa6sByO
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
	with ESMTP id xxic2LOgmT3U for <gti-tac@lists.linuxfoundation.org>;
	Wed,  1 Mar 2023 15:17:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFFEB81768
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AFFEB81768
	for <gti-tac@lists.linuxfoundation.org>; Wed,  1 Mar 2023 15:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677683822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gtQXmjXy2/iJb8ZXCsaD1WmvtUfijqBBTm639g0ZQo0=;
	b=BJa6sByOe5FhhQIGl7+C5m4D2LsDbhzTVnUYQoXpu+EwBHq8oj+uavTLGLPcs+C8u5kTng
	XkiAUOUs6HbmkDsfp8Qahs+6qUHKbup2rpjCG/1HyMXp7qRFnwtKJdTyJMpnYHRTTGndoc
	eztx7KA4X3ng4mwmreLOxvie/HUV7SE=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-gkBT0HiON7GogT8cpMBkHg-1; Wed, 01 Mar 2023 10:17:00 -0500
X-MC-Unique: gkBT0HiON7GogT8cpMBkHg-1
Received: by mail-io1-f72.google.com with SMTP id a21-20020a5d9595000000b0074c9dc19e16so8652429ioo.15
        for <gti-tac@lists.linuxfoundation.org>; Wed, 01 Mar 2023 07:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677683819;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtQXmjXy2/iJb8ZXCsaD1WmvtUfijqBBTm639g0ZQo0=;
        b=ZF0zLAyVQhiu1ExAineumEKskAw81cRwkSZ0gyR/Z4qx/W+XN8bH1KIiVROqgW1sKp
         yDzsT2cJYV8Qeh/iAy4P4niHd6GMJcU6lnQOwGfR7mU4g4vTcErPN1Qsje5V7i6SKzPL
         GOK7rQRePiR/zkRF47UxGFQz3DNFtWWHctH7Cu7yE9YjT5A5qwT2ezVxzqaMNL65Lq41
         rOjVm9Oty8zg6Z2wVQkT3HYe26pmzC0lFpeF8CRlYUF2fWiZYnejSbZybwIh2iZo5sfl
         d9s4Sv+2PCzMPUIv90HR9wPoHKUN7LF1/r/gEQBR+//WjDkmDf+Xn8+9m8CuqQq7cL6U
         yIFA==
X-Gm-Message-State: AO0yUKUx63XeC2wc1aBifxEIrQAYAlCChV8casXSBym1KjPt7+3dSTg7
	Ifp4vcvWxpwU7gfMRmY7+z95VvtwLxjOikd3nFkF0GJWtJAgKBWrmAZdVNoEcqnA+4c0LoC/rSF
	J019R3xl4GQlwrmJhXjYOGvsvHV38eCl5ei0iTtHr3btEW/SaflnRJlQHKi5JHwMPuV4rixAyPY
	WS83fzSWavHA==
X-Received: by 2002:a05:6e02:2184:b0:317:9b10:d88c with SMTP id j4-20020a056e02218400b003179b10d88cmr966076ila.21.1677683818721;
        Wed, 01 Mar 2023 07:16:58 -0800 (PST)
X-Google-Smtp-Source: AK7set/ROHMiF2sjafbWhcggvb1dtoAbLlofPMuLZ6DU8OzsvCsl5wq/BiAvLjyeGJdaV6J7GFmEDw==
X-Received: by 2002:a05:6e02:2184:b0:317:9b10:d88c with SMTP id j4-20020a056e02218400b003179b10d88cmr966043ila.21.1677683818272;
        Wed, 01 Mar 2023 07:16:58 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id v10-20020a02cbaa000000b0039c492ae300sm3710038jap.114.2023.03.01.07.16.57
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 07:16:57 -0800 (PST)
Message-ID: <db67f1f9-320c-18fc-f196-5923cc622c0a@redhat.com>
Date: Wed, 1 Mar 2023 10:16:57 -0500
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
Subject: Planning the next GTI TAC meeting for March 8th.
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Team,

I would like to setup a GTI TAC meeting for March 8th at 11am EST / 4pm GMT.

Does that work?

Agenda:

- Pick a time for regular monthly meetings.
- glibc: Next steps for glibc, and the process for migrating a whole
         project to LF infrastructure
  - Going to the LF IT core projects team and asking for review of
    glibc services and cost.
  - Approval from GTI.
  - Community discussion.
  - GNU Maintainer decision.
- Setting up gti.toolchain.dev to hold documents and notes from the
  meetings?

Please add your agenda items.

-- 
Cheers,
Carlos.

