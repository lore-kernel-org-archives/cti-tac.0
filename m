Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437BC6AB7
	for <cti-tac@lists.linuxfoundation.org>; Wed,  7 Jun 2023 11:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F1248206B
	for <cti-tac@lists.linuxfoundation.org>; Wed,  7 Jun 2023 11:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F1248206B
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WK3aTWNQ
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
	with ESMTP id U--d_0l4GR4u for <cti-tac@lists.linuxfoundation.org>;
	Wed,  7 Jun 2023 11:27:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B188381EA5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B188381EA5
	for <cti-tac@lists.linuxfoundation.org>; Wed,  7 Jun 2023 11:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686137245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DuVljvszVQFm74F2if5sY+wtNY5GawgKQ1g2k5d67OI=;
	b=WK3aTWNQ63yJk7DDNR97lRLgt09WejJo2dMX7UIskvxBlLCOmF8xhv3LpRkzHAxkT96mVO
	fRyhiCusEM2YiTi+c6tQ8fsjpU3jFxKD6+n/20VaL+1RY2W8lfdOF0fB9/Eu/IwJCbulqW
	zwrHwU/FHRUKNKYIfA6jyP7H31DlSNU=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-DSfNBbdQNDup6fvKMm5ZsQ-1; Wed, 07 Jun 2023 07:27:24 -0400
X-MC-Unique: DSfNBbdQNDup6fvKMm5ZsQ-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-568a8704f6dso109631577b3.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 07 Jun 2023 04:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686137243; x=1688729243;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DuVljvszVQFm74F2if5sY+wtNY5GawgKQ1g2k5d67OI=;
        b=jCo6+zYHDFfzGCw47rTg6+QHyrq+lVDgiYSEYzP8xvWCzGiNo4k5F6eMM8jmjPZOt6
         I0Fz0F6EFvsO75UIbyP7Ykpy7r8+E7b1sZqU0FFcczYveWkwd22/InuLVM4GEMDVmpJO
         Ri3zEDPpVJLWgkDbFsHQZoGZoD7ZfM4ouWLt6ba0eQWIMtbOm9UMI5miBfcksyCGNq4g
         H2l0KZWEsaJidOxvardwIF6b+jIym9Pjh3T/PdqgFJHcMzXVfsBhElG3mH4wqD+G4RNV
         m1phmF4tigfpaDOSVxMqmrRzGzEqUa3Wnsks1dlMMVQsKdAfliIY0tNQBGRZknw8tfYT
         ST+w==
X-Gm-Message-State: AC+VfDw63bpRqAS5/ycOfp8+HFFC8U9xX3M3VsuGiw0rAtA2nDwDflHT
	qPoVUoMGOCvOzD8qV5KiT4X/znr3bPGZ20TIEbDWN/GqvvKWjV8oPHL4hKrFKcXxXAzwWCVrNqN
	pMWfhgvDXm/3biK0pabC0FYEyCtbQZtgtmG5psUZcNwfSHASTcKzTWOG3dim+vgh4clfn4Pn5/T
	8CaPKUlHvBp/dF
X-Received: by 2002:a81:9485:0:b0:565:f14b:6cdb with SMTP id l127-20020a819485000000b00565f14b6cdbmr6633435ywg.21.1686137243243;
        Wed, 07 Jun 2023 04:27:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7cmCXpMDcgDvRLeJKYKgfahdLAjUV5svP10pZalYYKMlr9Ufty4ZhPgA9gJis2FPvVmIJ0CQ==
X-Received: by 2002:a81:9485:0:b0:565:f14b:6cdb with SMTP id l127-20020a819485000000b00565f14b6cdbmr6633419ywg.21.1686137242940;
        Wed, 07 Jun 2023 04:27:22 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id o64-20020a0dcc43000000b00565ebcdcc95sm4740376ywd.84.2023.06.07.04.27.22
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 04:27:22 -0700 (PDT)
Message-ID: <adbc1924-a91e-a4fb-f08a-54fd45b9df7b@redhat.com>
Date: Wed, 7 Jun 2023 07:27:21 -0400
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
Subject: =?UTF-8?Q?Martin_Li=c5=a1ka=27s_SUSE_email_bouncing=2e?=
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In February Martin stepped down from GCC and indicated that
he was moving on to another position.

Martin's SUSE email has been removed from the TAC mailing list 
because it was bouncing (I've had it bounce for me).

I am going to reach out to him and see if his interest and
time available for the TAC has changed.

-- 
Cheers,
Carlos.

