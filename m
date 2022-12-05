Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0F515C9E
	for <gti-tac@lists.linuxfoundation.org>; Mon,  5 Dec 2022 21:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1513141522
	for <gti-tac@lists.linuxfoundation.org>; Mon,  5 Dec 2022 21:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1513141522
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SjB+FE8P
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
	with ESMTP id i6KExBVSbORf for <gti-tac@lists.linuxfoundation.org>;
	Mon,  5 Dec 2022 21:55:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB2744151D
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EB2744151D
	for <gti-tac@lists.linuxfoundation.org>; Mon,  5 Dec 2022 21:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670277312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GbD6WrZK8m05zbn9aq5Cw5mYEUgdvkupsoCWDayjLO8=;
	b=SjB+FE8Pi3cMPbvmG2nz6dOd7MxRmfwJmzgrVaY0m3AsEdPu6UKQHh6Zqmmld3VYn2HtVk
	8SebyzWLZ/MfCET6f9zmO2xwKKFVCMYaIk/rCO8JxrPWZKa43fevKpN7oDx0J0PGXkBHoB
	z+rW3cDllWjYt3iCvTVZeQe78tJTESY=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-70-FHrgp__fPQ6S0a_fMaYk_A-1; Mon, 05 Dec 2022 16:55:11 -0500
X-MC-Unique: FHrgp__fPQ6S0a_fMaYk_A-1
Received: by mail-io1-f70.google.com with SMTP id h11-20020a6b7a0b000000b006e0004fc167so4834761iom.5
        for <gti-tac@lists.linuxfoundation.org>; Mon, 05 Dec 2022 13:55:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GbD6WrZK8m05zbn9aq5Cw5mYEUgdvkupsoCWDayjLO8=;
        b=MhO/GBnkWDwwOD0JuutbmtXLUcfKSOuRCqSKdNGEu5CttwL8NgytFlh9VUBMFnvIZD
         zyOGC4nlpqrQUn+Tm+u1DyaBFa3JD50Lj5+EruCtNymO3IoH0z9emO+GXfVsXoozeiiT
         5BnFkKqhaGIzunuIgH8+EA55SxQyERd1a1O6+ouyVpMr5gbrxj6JhjtpRcfLyiGRvLpu
         1blhKw6iPVl7syaON6i6sLD1QnXo2Xup0jdtveeHbCBPEyQHq0n5jpNr8g6bJpYyH+1Y
         pc412DlBHn01Ap4+vvBHJvWML6/eCCVibzfti34TG0bts+HTBqo6s5P17dGPqCmYf3vJ
         mSRw==
X-Gm-Message-State: ANoB5plccnAJEp8Hv8dHidt2fa12moL1PdNbveoO9rSLEtMOxwIV88LW
	5Hzx0Bi4bx3lA5W0YdOQffd/wEN86YGRVpOD8KovJ0O1L2i6y6O/VXsizJosOGRIlr0Z9BijclO
	W6pp3wCwNUsmW2JJnySvOkJU6PmpeUk8UkcZPI8zZ3taHdujt16jDDkgNgKK9RukUBf3r4311zF
	N7iHIY
X-Received: by 2002:a05:6638:3a15:b0:389:4219:c44f with SMTP id cn21-20020a0566383a1500b003894219c44fmr23713270jab.134.1670277310839;
        Mon, 05 Dec 2022 13:55:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf67ALYerBW/Iv/5RxTjYwOXTPVcmIttQWq7IStUofLG52RXNGTIqgdL7s7GCflXrXIwGkO/LQ==
X-Received: by 2002:a05:6638:3a15:b0:389:4219:c44f with SMTP id cn21-20020a0566383a1500b003894219c44fmr23713262jab.134.1670277310594;
        Mon, 05 Dec 2022 13:55:10 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id o11-20020a02220b000000b003495b85a3b9sm6139577jao.178.2022.12.05.13.55.09
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 13:55:10 -0800 (PST)
Message-ID: <eb102456-b185-97bc-e526-958f6add2643@redhat.com>
Date: Mon, 5 Dec 2022 16:55:09 -0500
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
Subject: Status of the LF BBB instance.
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Just reminder that the LF has a BBB instance up and running:
https://bbb.linuxfoundation.org

Status of testing the LF BBB instance:

- Siddhesh Poyarekar, Jason Merrill and myself tested the LF BBB instance
  and it worked quite well. We had a video issue but we'll sort that out.

- I've asked the LF IT team for a cost breakdown of using the LF BBB
  instance. Regardless of who pays for the service we should be accounting
  for the cost in our GTI documents in the event we need to pay the full
  cost.

- I've asked for a "glibc" room in the LF BBB instance so we can test this
  for Monday patch review meetings. This should be a good test of the
  instance with ~6 community reviewers attending weekly to go over patches.

  - Follows up on Siddhesh's suggestion to test with glibc patch review.

-- 
Cheers,
Carlos.

