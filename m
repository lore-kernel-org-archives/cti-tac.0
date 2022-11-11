Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0BC24F4F
	for <gti-tac@lists.linuxfoundation.org>; Fri, 11 Nov 2022 17:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72EB64041C
	for <gti-tac@lists.linuxfoundation.org>; Fri, 11 Nov 2022 17:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72EB64041C
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YKO1+VCf
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
	with ESMTP id OSXalH0zT12h for <gti-tac@lists.linuxfoundation.org>;
	Fri, 11 Nov 2022 17:24:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43F5D40167
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 43F5D40167
	for <gti-tac@lists.linuxfoundation.org>; Fri, 11 Nov 2022 17:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668187480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nvkgd7R7Be+6vcNVRUDrA+hQU6PUw2sXtMJIvdACFpc=;
	b=YKO1+VCf2QfJOoRJsJFAfLz4QEtIhDevbR49NPpSsAzEw4TCj3OnqhtIyF1Asy6ku9Sw2y
	LLGZAnRZ1vRi9FSfALVTRVY0U0GNGIZRs8+ISpv/kgoYeK375RtS2Lgrwv1m34B6msip01
	tnvLzIsnZSLaTKARTrph50YMK35+vBA=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-nU4-3uyFOhefNmay5iqUug-1; Fri, 11 Nov 2022 12:24:39 -0500
X-MC-Unique: nU4-3uyFOhefNmay5iqUug-1
Received: by mail-io1-f70.google.com with SMTP id f23-20020a6b5117000000b006dbd4e6a5abso3433846iob.17
        for <gti-tac@lists.linuxfoundation.org>; Fri, 11 Nov 2022 09:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nvkgd7R7Be+6vcNVRUDrA+hQU6PUw2sXtMJIvdACFpc=;
        b=ge4nGJ5czChDs0tw8IWbYMWVNQTUW5lNtE/ZeWFzmtIdTg0gGMm2r3l7+8S/+J8FT6
         gSC/9E8veRzE1bAS9K1oFbKYcKHP/DgKmztsxsSXuq5FdgM0CJer0JfaOq2eaXKJVLhy
         Y+k3jDRnsrz2u6QVavK2cmgDjFJbGj7JFF0qURtzElusotednQzLTKKUdBcVS0BSyXfY
         x4wv5Ro6EMadrjdPzwXaJvTDsJBqhwAnBFfGTW0iUeysyS7UI/Q+fIiIrcVbVzGzdu+t
         L/y70FwM3bMmP+RCiwq/zbTfpuAknCsb5W6ZwsxjN1mKqbt313A2mL8eaHuyPhT41irf
         xQFw==
X-Gm-Message-State: ANoB5pn+LtJk+lg8uaOJnXeB0cQzi3ARbXnKZ6y8cFyxEvjlWoBnz36+
	awIDCPa0jFUsxhRZUTYg5r2bbOMvqaKdALffuLuvM2XBj/4DA9XArVo+zLK726op41bc9B9GnA8
	WaE3+YXEFi3rYJzHFr59D4Lr6I2vFCqYkGmNQLV54i0zzZnlJAdKBsV5Xr3dEAI8IccAPAjsYFP
	kTjnAz
X-Received: by 2002:a05:6638:1b0d:b0:375:217e:d6d8 with SMTP id cb13-20020a0566381b0d00b00375217ed6d8mr1219514jab.290.1668187478657;
        Fri, 11 Nov 2022 09:24:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7g2hwTb6wXfd+O1GpZM6YK9KkQAw3ZdWtitOphArhiiAvbKQ4q4QWXOllvJY9G3XYhiudjVA==
X-Received: by 2002:a05:6638:1b0d:b0:375:217e:d6d8 with SMTP id cb13-20020a0566381b0d00b00375217ed6d8mr1219502jab.290.1668187478347;
        Fri, 11 Nov 2022 09:24:38 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id w22-20020a056638025600b00375147442f3sm983735jaq.16.2022.11.11.09.24.37
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 09:24:37 -0800 (PST)
Message-ID: <7f5ad52e-5da4-bbdf-c762-b07446b39d5f@redhat.com>
Date: Fri, 11 Nov 2022 12:24:36 -0500
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
Subject: Action: Setup a space for the GTI TAC to store notes, recordings etc.
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

TAC,

We discussed this proposal on the 2022-11-09 TAC meeting.

Here is the action with more details. Please review and provide comments.

I'm out for the next 2 weeks, but I wanted to start this ball rolling.

Action:

Setup a space for the GTI TAC to store notes, recordings etc.

Details:

- Transfer toolchains.dev domain to LF IT.
- Setup gitolite on git.toolchains.dev
- Setup repo for GTI TAC git.toolchains.dev/gti/gti-tac.git
- Repo should be sphinx docs with data committed to the repo.
  - In the future we'll all work on the repo to commit TAC notes 
    and working group notes.
- Setup https://gti.toolchains.dev/gti-tac/ to be the website created
  from building the GTI TAC repo.

Next step:

- Ask LF IT to review the details above and provide feedback required
  to implement or change proposal.

-- 
Cheers,
Carlos.

