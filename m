Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20922341F
	for <cti-tac@lists.linuxfoundation.org>; Thu,  1 Jun 2023 12:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 062C3841E5
	for <cti-tac@lists.linuxfoundation.org>; Thu,  1 Jun 2023 12:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 062C3841E5
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VBs0P42O
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vPzDl36IPrcx for <cti-tac@lists.linuxfoundation.org>;
	Thu,  1 Jun 2023 12:18:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26A0683C9A
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 26A0683C9A
	for <cti-tac@lists.linuxfoundation.org>; Thu,  1 Jun 2023 12:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685621904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G5h81pL5IPankA3EqfPoY9bXVP6KAjGSki8vsD+yKw0=;
	b=VBs0P42ONL3L4MvvNopWvUo4OO/ZghbkKxtEBWBgzGoEASOQWte/T+NprzUEeBktkF6Ds6
	y89DaDtz54PG15sR9by+KrJVWo7p2r8ku/0SH75nZDTRkThSaLcMRiLwUGgcbUQvWuX/Ui
	/JbpENf0Fo9Y1RQmyE7QkBeTDZf99Dg=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-O2aC44LsNEi9Nc96XyBu_g-1; Thu, 01 Jun 2023 08:18:23 -0400
X-MC-Unique: O2aC44LsNEi9Nc96XyBu_g-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-568fa455b8fso10926627b3.3
        for <cti-tac@lists.linuxfoundation.org>; Thu, 01 Jun 2023 05:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685621902; x=1688213902;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G5h81pL5IPankA3EqfPoY9bXVP6KAjGSki8vsD+yKw0=;
        b=kFBfRBDC3vg+4rQJNULrsxHfIfUqjYj4xJarQAjw+KxNQY71Cr5G9ExTJtO6X+zxVM
         SshFptDgXymWMKO/UNAParAho/A4ayGSt9tL4DI8+SzJeMb1uqFYy42fzkHS/XHb922x
         xoGt8z2ZyKn+qzaIUWAC/oSftEybVxWHECdzfGrsyOT2s1OuVfWE6cFy8/X9bZMkzXSQ
         6egZiaoiXY49Gp3batyA5GvFe5nx/kjWizxv+7n+lw1ochyOFSS1GZvd/5rDFvpYMd3a
         iQwBRjkvZv7jmFk6RvreVB61aW36IZn4UQB3is3IP2vDnjeDv/lgYmmjL+lRGKk//1z7
         MztQ==
X-Gm-Message-State: AC+VfDxa1P8ppDGRog8ZYhcGYRvqYZdfPaEGlwtWhV29k6WP3DQagOKU
	pMg/nrX0YwXr9pyq2n+guQ7fbZbA0VjEvTOjdBuSyBusU1uiaMi3uYh1iqAaE/ZemPieYdoUoAI
	XDfq6u+ZJ86nsH79rCrCBYdf5DQmmE11D8WMlqsQWSYNBaNnVWOSIRWNgeNmONCpgH/hzveuUwi
	LwniM1OBSdiOck
X-Received: by 2002:a0d:d412:0:b0:565:8c16:a0e1 with SMTP id w18-20020a0dd412000000b005658c16a0e1mr10488172ywd.13.1685621902525;
        Thu, 01 Jun 2023 05:18:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ74Uy/0MUhnbL0lc1cKgUkUWDqSXDbqaja37907BhH+XxsHRPuHrVINunOGOlsCvZ50mdBa5A==
X-Received: by 2002:a0d:d412:0:b0:565:8c16:a0e1 with SMTP id w18-20020a0dd412000000b005658c16a0e1mr10488161ywd.13.1685621902228;
        Thu, 01 Jun 2023 05:18:22 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id w1-20020a818601000000b00565cf40238csm4829382ywf.110.2023.06.01.05.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 05:18:21 -0700 (PDT)
Message-ID: <2b961760-b1c5-0bf3-1da4-b76d06cb925f@redhat.com>
Date: Thu, 1 Jun 2023 08:18:20 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: cti-tac@lists.linuxfoundation.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
From: Carlos O'Donell <carlos@redhat.com>
Subject: Status of glibc-related service cost review for CTI?
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Konstantin,

This issue came up in today's CTI TAC meeting and I took the AI to email you here.

Do we have an update on the status of the cost of CTI supporting glibc's service requirements?

Is glibc too small to even count?

Does it make it hard to estimate?

Would you rather budget this or estimate a price based on load or resources used?

We have a similar outstanding question to ensure the LF's BBB instance stays funded for glibc
community patch review meetings, CTI TAC meetings, and possibly Office Hours for the projects.

-- 
Cheers,
Carlos.

