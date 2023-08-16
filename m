Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E80FC01
	for <cti-tac@lists.linuxfoundation.org>; Wed, 16 Aug 2023 13:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 086A181339
	for <cti-tac@lists.linuxfoundation.org>; Wed, 16 Aug 2023 13:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 086A181339
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cimAL/MS
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
	with ESMTP id FrpgKeyD3p5z for <cti-tac@lists.linuxfoundation.org>;
	Wed, 16 Aug 2023 13:35:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4E8C481330
	for <cti-tac@lists.linuxfoundation.org>; Wed, 16 Aug 2023 13:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E8C481330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692192936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=08uVTmx/2xuOEFzT11MuPl9u20j9p3K9dCjSytaL4CQ=;
	b=cimAL/MS/M+IeY5SBjTwXD+ff/AwcVEk4hHQJsSUj2YQu3b/+xgfFXTfRjGMpWNkI3bwyP
	yshCYaInJHZmih5ixLgn3avWiiRQzifYUn1V5FHAwk42+HCTqbvQwzVXSYDPseD/RNJTLq
	YBkCaAeTMvzZ+PVlt7a1L1Yi+DOQaHg=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-IOTn5iiQPC6P9rHoRMvFiQ-1; Wed, 16 Aug 2023 09:35:35 -0400
X-MC-Unique: IOTn5iiQPC6P9rHoRMvFiQ-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6b9d3ce1a56so7191923a34.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 16 Aug 2023 06:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692192933; x=1692797733;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08uVTmx/2xuOEFzT11MuPl9u20j9p3K9dCjSytaL4CQ=;
        b=FOQfIIdnhKYhXkedey6lpAP0J81IW4qwo6R3KDcqFloEg6Kh+6aNsYZhbvADJkiN8+
         UBY5sdMNuwMh10AfchVkBBGFZ/ZT9BTCiFdL77q3JumYliMiLZiz2j3w30nYuVQbgbiy
         myRGBiv4ZDOWWFzkUKUY+/CelmeH7X3xLcCGkBguLyXVtAhZa6GKbzHybcUX191w5ylh
         GEq3h/feicDBUQv5urwURTnCTJNlaQO8Ast+7RUxeycwB+wy+0IqWxJWfj6JbXvGPMXY
         jSfaT+5cZINGPBARBVIrWVEDlpB5gQ+c95QPCFego62VhXcT2djeOaynilHNdQKOkJak
         GBxw==
X-Gm-Message-State: AOJu0Yxb9JbPnB3afeXNvgb4MY7e+NEovQXkycIEd/tgBatN4SHO+tyH
	vd3QXZ+0kM/m+TJEbop9e7NMqcxwisB/dBp9KxrbJHbc+p7dbRaKOgNvMJkVdvf/dNzUmH9Wwn0
	a5m7Imt/8CJW+41iQCXLGOfH2WBq54As/60u1wEwBtuOGVfsAQjP1jqoyu+A6/psKlzRiyNNIIo
	QLIry6x54znInt
X-Received: by 2002:a05:6830:1407:b0:6bc:63ca:a245 with SMTP id v7-20020a056830140700b006bc63caa245mr1789645otp.10.1692192933532;
        Wed, 16 Aug 2023 06:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxJdy7ekoDe6kRZ2QY3g//d3Pb2oCI+vnNjtGqhgs2e0iD9gpyiEiyt5QwK0w6SrX7WsX4kw==
X-Received: by 2002:a05:6830:1407:b0:6bc:63ca:a245 with SMTP id v7-20020a056830140700b006bc63caa245mr1789630otp.10.1692192933149;
        Wed, 16 Aug 2023 06:35:33 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 77-20020a250b50000000b00d71c764379fsm264681ybl.55.2023.08.16.06.35.32
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 06:35:32 -0700 (PDT)
Message-ID: <e6560aab-5f01-b8f8-0e37-ea9bfe8b6951@redhat.com>
Date: Wed, 16 Aug 2023 09:35:31 -0400
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
Subject: Share status update to OpenSSF TAC on Tuesday August 22nd at 11am ET.
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

CTI TAC,

In 2023 we have several opportunities to share GTI TAC status to the
OpenSSF TAC. The OpenSSF TAC has representatives industry wide.

The next presentation slot for CTI is on Tuesday August 22nd at 11am EDT.
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

The next presentation is November 14th, 2023, and I'll send another
"share status" email as we approach that date.

-- 
Cheers,
Carlos.

