Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44AF7B
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 17:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 490F8813F7
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 17:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 490F8813F7
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eEfLFX8D
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
	with ESMTP id zeIX3cL_QJeJ for <gti-tac@lists.linuxfoundation.org>;
	Mon,  6 Feb 2023 17:35:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6480C813E8
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6480C813E8
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 17:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675704933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7cwo/8rq5KkiRGTGk+ObSv30aydqSooKtYptJ7VIjRs=;
	b=eEfLFX8DIrn/8Ci8eoWEUIga8+75Xz910PY6OCygmxQTjKMl3C0GclHaj30s4CHohai6Xo
	IYpVCa6D7s5hxF0oB9JgyMy8Nm/WSac16b7o8lH+m5DhAts9Gq+CwF1Ax/KX3Q+r3Ofit7
	4FDg7X9kB0E2JJeTiO+pv8OnFYjljFw=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-574-69On6k-4Pq-OZTeUQZ_fsw-1; Mon, 06 Feb 2023 12:35:31 -0500
X-MC-Unique: 69On6k-4Pq-OZTeUQZ_fsw-1
Received: by mail-il1-f200.google.com with SMTP id z12-20020a92d6cc000000b00310d4433c8cso8471595ilp.6
        for <gti-tac@lists.linuxfoundation.org>; Mon, 06 Feb 2023 09:35:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7cwo/8rq5KkiRGTGk+ObSv30aydqSooKtYptJ7VIjRs=;
        b=bTSR3Izip/9BXS2YNJX5+QEfX86DqXCd4bAufSujWbQW7dNwJOO4vQmDMZe68Qcriu
         wBD3yRgs+Y7WuQ2xN3UUC3Qs7pVpXH2J2wvS2WZuFheV9gvPsUgGRrRtxqpmOdRmxXc4
         9lP9NLi8WsvUf2Rb1mO4x6D+N5ek7S9fgQT89erhG3CkcNt/wV7Nqp8+TRAKpUPi9gzC
         zuBZHRw348qRsAhMEkx5CYArS6xpTWrg+oRVCuutzgrEzeC3+/PZQNzPzUMIxzcA1X3G
         806PWCprY6oVjXqt38gXqSjno98kShZFl/Jqfu59ncKGBFDfwjV1ajYATmHNb1aGU1/P
         nswg==
X-Gm-Message-State: AO0yUKUcauh0kNKqdtooYwObnTFT2sr8v38IczWbaTdkakNGn8JHkwN7
	2D8kXhCoOYT0ve1qzG7F6x133enNDBicjjh5iyTf6R5YYCb+MDOvypGmxVwl+IN7C4vUV2wFdYj
	txc4oeu8uFBMVY4nG033N0dh8yhN896LKQzXdm0+0czu67bUcYku2wS9ihKu9LBfkNMGQIiXNvf
	XcNfEe
X-Received: by 2002:a5d:97d5:0:b0:72b:623a:bc31 with SMTP id k21-20020a5d97d5000000b0072b623abc31mr7289499ios.6.1675704930738;
        Mon, 06 Feb 2023 09:35:30 -0800 (PST)
X-Google-Smtp-Source: AK7set+binNy3BXe33xY9V8ow/zVapoedWpijRuWPg//8vAE+DXe3bNWa3YgFQ713FtffGmlIG/3oQ==
X-Received: by 2002:a5d:97d5:0:b0:72b:623a:bc31 with SMTP id k21-20020a5d97d5000000b0072b623abc31mr7289484ios.6.1675704930441;
        Mon, 06 Feb 2023 09:35:30 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id e4-20020a6b5004000000b006884b050a0asm3140440iob.18.2023.02.06.09.35.29
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 09:35:30 -0800 (PST)
Message-ID: <d8790f60-483b-dfc6-dd7f-cb408334eb40@redhat.com>
Date: Mon, 6 Feb 2023 12:35:29 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: gti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CY23 - Status of service enumeration.
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

My current notes on the status of service enumeration are as follows:

- glibc is fairly complete here:
  https://lore.kernel.org/gti-tac/804cee43-a120-3acf-a302-b1640f2285a9@redhat.com/

- gdb is fairly complete here:
  https://lore.kernel.org/gti-tac/b755774c-3912-2dac-957c-91f659c95119@efficios.com/

- binutils is not yet analyzed, but likely very similar to gdb.

- gcc is not yet analyzed.

I would like to see service enumeration completed this month so we can follow
up and present all the details at our GTI TAC meeting.

Joseph,

Have you had a chance to enumerate the gcc services?

Joel, Simon,

Is binutils going to be any different from gdb?

With the exception of the website?


-- 
Cheers,
Carlos.

