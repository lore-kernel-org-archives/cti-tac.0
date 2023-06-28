Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AFA7E2
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Jun 2023 00:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB81160B44
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Jun 2023 00:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB81160B44
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xw71IPZA
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eyS0sF7b6fTU for <cti-tac@lists.linuxfoundation.org>;
	Wed, 28 Jun 2023 00:50:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F27260B3F
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9F27260B3F
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Jun 2023 00:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687913442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zc12xGT3+WtEaB51QqkLqRH10mJpcqZW7/cO+sZLNXc=;
	b=Xw71IPZAi/N6T79IbHn75Ri9NmkmoXWoTyx2sykiMxM6JQDGoxAnzmDpJVzXoOkMYShjHB
	v8XpRTXpkUl+kZIV74pgOPCxQt2IkAYMu87xO2fSkFS67acfe1dCMf4iPrHnb9LzYVLmzQ
	SGQnjHagAnhEumAvItLSGH+oJE30m+4=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-4ybSWlinMEKgHs8KidiOvQ-1; Tue, 27 Jun 2023 20:50:40 -0400
X-MC-Unique: 4ybSWlinMEKgHs8KidiOvQ-1
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-c22664c3df7so952026276.1
        for <cti-tac@lists.linuxfoundation.org>; Tue, 27 Jun 2023 17:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687913440; x=1690505440;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc12xGT3+WtEaB51QqkLqRH10mJpcqZW7/cO+sZLNXc=;
        b=PaRfNvyXQyeut8MzABIgj6RYcQwfvGaKIKxW02O60mAOtNjGI8AE3P8Uoh0viTQkun
         daceZ/lgs8xo6bWVIsRxAsW/VoeGnpEIzFriyUt9gUINITBELtSuZ5dFIfdgOwhDvrlB
         cHsLxhxZZRVkI3KhtDxjlMZxelzgACu2OWCp3oO2nzJqYZK5JYuFsr1VAmjK4G0t38P5
         IiW1HTsT5mwlEZCEf/O5YRzRy2TO3vahXOhk6puKfSUqIpM5K3PBbmNxI2OoK2oukzFa
         oeyzdErhCqFpJP4HH1KtnQUDcGKBOdYCgpRyTjRAP62HqanOCmsD6BGEJ5MA7a8E5dlY
         MWrQ==
X-Gm-Message-State: AC+VfDz62U3Hiu+kngGviJTSDhgomXbk/M6pweHLxS4wtGYy6tAAM7dY
	DRYVxfcsiGee2mt/6pEWFw6Iv7DczyruhMeQtVrjp3hKcPU/Bd9NOmRqS2kTq7/yRzMlmmo2uVD
	j+vrMamVm6mufaivbKM81UHAAV6+rG9JDGH15HCfDUgXPOu+QY2bj6ALAcZ/SsPlyBEUngrPwtg
	pdJ8FLuKR5KPGn
X-Received: by 2002:a25:4d56:0:b0:c0f:3557:9790 with SMTP id a83-20020a254d56000000b00c0f35579790mr13652515ybb.14.1687913439827;
        Tue, 27 Jun 2023 17:50:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6WvpnjEd7EZ4Nx7LDelCJSR+4+Wgz99LbrpI4jchLiJrx8xk+A5ktdZPrqeWXbFMw0EdkMGA==
X-Received: by 2002:a25:4d56:0:b0:c0f:3557:9790 with SMTP id a83-20020a254d56000000b00c0f35579790mr13652501ybb.14.1687913439447;
        Tue, 27 Jun 2023 17:50:39 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id p79-20020a0de652000000b00573a2a0808esm2109008ywe.77.2023.06.27.17.50.38
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 17:50:38 -0700 (PDT)
Message-ID: <63637023-77dc-5146-3d45-3d67666abd5e@redhat.com>
Date: Tue, 27 Jun 2023 20:50:38 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: Reminder of regular CTI TAC meeting on Wednesday July 28th at 11am
 EDT
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reminder of regular CTI TAC meeting on Wednesday July 28th at 11am EDT

Agenda:
- Status of update to the glibc community.
  - Carlos will talk about current status and writeup.
  - Not yet sent to libc-alpha, but plan to finish this week.
- Space for CTI TAC documents.
  - Should we have a web presence to put up documents?

-- 
Cheers,
Carlos.

