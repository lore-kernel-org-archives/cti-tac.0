Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1F4446AF
	for <cti-tac@lists.linuxfoundation.org>; Mon, 25 Mar 2024 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711371642; cv=none; b=GI8wQLBY8GzG6m2R8reSmfmvo/uNFhMOjgiD5SNGOcJHNmXwihjM1znQvGCD1rX7zL0w/XX3LuinfYuqQX3marRtxEUEH7DYQHP1/awQaZ32sBtoN3Oh5f9sMd4GDAx9Ke8R0tKPLicuMX9idkGO8Kg1Nblq++bUVhdr2Qs5upo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711371642; c=relaxed/simple;
	bh=jm+AXV+/4+iKJQCapMy/nZRjGyZH/+HOu+mxZLuJLXA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=EL1UZTsuY1tKtK199bxk7JQ1JonmjejVbVg5oHfwe7g6JE44bl4V1UtV0MZzSU4pd9io+898S1yMNTA9vZOfSdnkukKymeqmlFFW1mY4hZFiFA45os/s1wGS9pka3ympEbcwFR133npVw/qSWqO5j8DDMcOm1KahPXVvaOzG85k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FT+qwikW; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FT+qwikW"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1309B81A27
	for <cti-tac@lists.linuxfoundation.org>; Mon, 25 Mar 2024 13:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfVgTxtzDh_E for <cti-tac@lists.linuxfoundation.org>;
 Mon, 25 Mar 2024 13:00:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=codonell@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 30D1981B69
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30D1981B69
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FT+qwikW
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 30D1981B69
	for <cti-tac@lists.linuxfoundation.org>; Mon, 25 Mar 2024 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711371639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=jm+AXV+/4+iKJQCapMy/nZRjGyZH/+HOu+mxZLuJLXA=;
	b=FT+qwikW8DNbpvqk2Jw4KXK3KYZlFdIVHa1xPSehc/GESezqltJDz7KTCkClzysrVXJ6Iz
	bY0mNIN3eMsRep6L8TRpi5AEAZTO4efFFB0B2uAw32ZhPn6lOLM+T3urg9DczpNx9XVOEE
	07h9mVonXUoIfRzY/OpgYRa9iqIboRA=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-5tfhc1TqM0aXMCAzcXvHug-1; Mon, 25 Mar 2024 09:00:36 -0400
X-MC-Unique: 5tfhc1TqM0aXMCAzcXvHug-1
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-4d40305ddb3so668998e0c.1
        for <cti-tac@lists.linuxfoundation.org>; Mon, 25 Mar 2024 06:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711371635; x=1711976435;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jm+AXV+/4+iKJQCapMy/nZRjGyZH/+HOu+mxZLuJLXA=;
        b=SneZhsd6MmUD5/fhm5CA4NgV6Y/LJDRlRQNxudVZG7vXLE18CwrJ0sufxpYm28Kycw
         ZNV9G25HouQfDSci8+wEYKykn/eQIsUeSMnYvmgw7CFDheWTJJ3Ws8E2mUiQWX13IZGS
         iRp1pHdWrq13sZ+mjEgWR1wOD95EKD76nTykquJFtR3Z+J8Ov6T+dMCGXCNWXSC0u9BH
         rfrx+A0ca8S09XzvN13Sjf+ZC8gSzfFfavQBCmzkTVTElBxCNAcN90afY8NNCNjncMFn
         UFN7U9BgX2LyTQLVkL1OHwDDd0oXfm1lS+EMZhapEZDiOIsBw4PdvVhfv1CbaqN21BLe
         UOmA==
X-Gm-Message-State: AOJu0Yz29jil1NLyj76N1xGZ5QzgKtFtwetfFf7LNNqZnwYH/t8Gjsn0
	jBgj5axyEGkLJryP7P2kYC5O7jwAwtFTKXV6YC7xg+A94nrJmqXKa5olDB+sAhPMoVJxiR/n+9p
	REh3lkwy5pNtbaxvuViF8bN1ibtq96PU8bmKzGZGVbP2peHcNpVKza36aMwAcVtTjG1QabQvvMT
	WpZ/APxKyDzGV5syvWROdiu8kQEVioSnrd2rE63HHWfv9+9a8P9N3Etg==
X-Received: by 2002:a05:6122:251e:b0:4d8:787c:4a6c with SMTP id cl30-20020a056122251e00b004d8787c4a6cmr4756038vkb.5.1711371635258;
        Mon, 25 Mar 2024 06:00:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfxvgjaYpoTggTOCEyy8e3Nk6wKi9gLZNc4XrXwSh3TQPDvZIJR2DIx8WwWcklc+Z9dF858R6+zeQqezqZq0g=
X-Received: by 2002:a05:6122:251e:b0:4d8:787c:4a6c with SMTP id
 cl30-20020a056122251e00b004d8787c4a6cmr4755968vkb.5.1711371634868; Mon, 25
 Mar 2024 06:00:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Mon, 25 Mar 2024 08:00:00 -0500
Message-ID: <CAEMqeSp5=zM=CNEkg1tNDUdXqJq=KnTjtqQsqj32uBnWENi3Yg@mail.gmail.com>
Subject: Reminder: CTI TAC Meeting on March 27th at 11am EST
To: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Reminder: CTI TAC Meeting on March 27th at 11am EST

BBB Conference link:
 https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1

Recurring last Wednesday monthly CTI TAC meeting.
Agenda:
- Standing monthly meeting for review.
- Discuss current TAC topics and progress.
- Discuss glibc use of CTI services vote.
- Discuss CTI TAC documentation status.

Cheers,
Carlos.

