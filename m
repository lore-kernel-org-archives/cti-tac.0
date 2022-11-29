Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAE0BA50
	for <gti-tac@lists.linuxfoundation.org>; Tue, 29 Nov 2022 22:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76C4140243
	for <gti-tac@lists.linuxfoundation.org>; Tue, 29 Nov 2022 22:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76C4140243
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MHClipIg
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Luob2yp2L__M for <gti-tac@lists.linuxfoundation.org>;
	Tue, 29 Nov 2022 22:08:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FA3A401E9
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3FA3A401E9
	for <gti-tac@lists.linuxfoundation.org>; Tue, 29 Nov 2022 22:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669759710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oFHtKglO09QJlYnXPO98bHeh69lkcv2R06Uxp4CKXac=;
	b=MHClipIgqpxTuSL/LYWy4UjQE94ogoPRzxPjkvGN8VNwuDyxrtA/D9RbgjDcQHZfVoK6+X
	wn2HVkRwHHqWkw06rHKlCm8IoGD3ELwuPFXxWE623KLd4/Lhdv6KTSO2T+lHh6p5LsUAEI
	4WgWn5FptUxn3yFFdM0/cZ8hUxlwVaA=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-75-Fh9uSCyoOQS8RaWQnbtIbA-1; Tue, 29 Nov 2022 17:08:26 -0500
X-MC-Unique: Fh9uSCyoOQS8RaWQnbtIbA-1
Received: by mail-il1-f200.google.com with SMTP id g4-20020a92cda4000000b00301ff06da14so13368209ild.11
        for <gti-tac@lists.linuxfoundation.org>; Tue, 29 Nov 2022 14:08:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFHtKglO09QJlYnXPO98bHeh69lkcv2R06Uxp4CKXac=;
        b=okIjsIuxdkr/HDhnbdHphvF/J2AcmFtAdpyj6Y5NwdMJ1f/GWiTom7ZUgskAoGhq+t
         cRmNMR5YsQQmJvWgg/ViePnGES2tTwDNGjWItygdrSaHgJEZdahrdOALJMPHSKbtym3q
         ZDFbqQKYLhLVdTx5O0KML7LYJIzF0kFFrG97MjhKx/g3NSQILv6ywq0ma8vobNsGx3xF
         cdroLepVFSq4Hwvj8m2DOGNmblEgARI+kwUSJvMvaDytfNpkxAV2oDFEFi9QANZBpfwy
         MKd9NJaK/Qwtg7EL31IXFSE961QigSap+eCjVhJDLe+JEo7UrJnbrnmuVg2Idm3TQ32M
         PvFg==
X-Gm-Message-State: ANoB5pnS5dk4Yum+DtKWowU14F0Rk1hmmXT+fv6KoZHHJm/4rl02s4+I
	hTUeUDRW6lPTCXEpGeXKQNEggdejvPVlJGlKdjXsLw3L/mo/I03p+km/f5BtERliRlQ5nPnIhou
	NCc79xkZzVyELzEWiulxyUKkdvv+KQ9Hf1TfEKj8holnddCa/Xlq//CoNXSvpwH0rM7Mx/kmYxC
	3rmZXJ
X-Received: by 2002:a92:da4c:0:b0:300:d9e7:bb69 with SMTP id p12-20020a92da4c000000b00300d9e7bb69mr22647201ilq.11.1669759706090;
        Tue, 29 Nov 2022 14:08:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4vjKs2JdzblFwPAVYgwI1GZb7bKC8Iub7WcIxzPkcYDcENdnWXjEJO1CnGYgQvLVeMh2hGlw==
X-Received: by 2002:a92:da4c:0:b0:300:d9e7:bb69 with SMTP id p12-20020a92da4c000000b00300d9e7bb69mr22647191ilq.11.1669759705825;
        Tue, 29 Nov 2022 14:08:25 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id a4-20020a5d9544000000b006a102cb4900sm5912706ios.39.2022.11.29.14.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 14:08:25 -0800 (PST)
Message-ID: <957106ad-24b6-e144-1132-faa7f1714371@redhat.com>
Date: Tue, 29 Nov 2022 17:08:24 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: gti-tac@lists.linuxfoundation.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
From: Carlos O'Donell <carlos@redhat.com>
Subject: Testing LF BBB instance for GTI TAC meetings.
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I want to extend a big thank you to the LF IT team for moving
forward and setting up a BBB instance that we can try using for
the GTI meetings.

The previous GTI TAC meeting was hosted by me using 8x8's Meet
hosting service (hosted Jitsi). We had discussed using BBB since
it is well supported and is empirically more compatible than Jitsi.

The BBB instance is here:
https://bbb.linuxfoundation.org

The GTI TAC room is here:
https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1

At least two of you tested an earlier BBB instance, and this new
instance has been upgraded and updated to avoid previous issues.

I will be looking for volunteers to test out the BBB instance :-)

-- 
Cheers,
Carlos.

