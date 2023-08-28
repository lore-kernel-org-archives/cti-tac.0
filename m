Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7E16126
	for <cti-tac@lists.linuxfoundation.org>; Mon, 28 Aug 2023 12:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DD7B4173B
	for <cti-tac@lists.linuxfoundation.org>; Mon, 28 Aug 2023 12:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DD7B4173B
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ienA7qYs
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
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jBQV7TPACme5 for <cti-tac@lists.linuxfoundation.org>;
	Mon, 28 Aug 2023 12:00:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CA53C41737
	for <cti-tac@lists.linuxfoundation.org>; Mon, 28 Aug 2023 12:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA53C41737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693224013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=8913CrIP8WP6uubae76RL9qIq3cSIqNnNLUcXa6h5M0=;
	b=ienA7qYsDQJX0czq2tSrpgDiypRozT4fY13/5QC5hLq93N2fTTOABBYePvex8w3UYPJNKv
	KUKwruBOKIPZnTC2yA6tPhi0bg6fHhFdEHj2tGSwZ4ye8qgAhTX2ho3TE1tJNK23xjnFEj
	Hil/RDymLKtwtNKpU0afCsJDoWxMIx0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-13oaW1x9OtWzEMUl-wAK1w-1; Mon, 28 Aug 2023 08:00:11 -0400
X-MC-Unique: 13oaW1x9OtWzEMUl-wAK1w-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-64f73be2019so41377116d6.1
        for <cti-tac@lists.linuxfoundation.org>; Mon, 28 Aug 2023 05:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693224011; x=1693828811;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8913CrIP8WP6uubae76RL9qIq3cSIqNnNLUcXa6h5M0=;
        b=PrcomhNSf6juItEhA6tOA7Pg9t6y0XL5M0v++47xmLi57N0GugM4ZmjknycT7X9qI9
         v633H6DzK6LdDBedhjv4xoePi0fdFTu0Y9fUV81kU3Q5acHYci1MMt6W7DtqfaAZeMpv
         ZrTJnKa60aJJ2i5BwoEbdz3mBn9w2D1JOpUpw/iPv2VbgMfOBxqNsM7IlCRdmx1yFvcL
         F5Li8Gh8LyzcXf38It5Pofm6jkPog18lP7If7b67hmQKDllU5vwwTpfNf4x5iEWk2OF5
         45Q1vy8Z9GJQlpCoz2MBWxLJFMpliCBe3yOtpNU8hbl0ltuW1CtSmGNFUnbg77Sd4+fq
         D0fg==
X-Gm-Message-State: AOJu0YxyuztWAYN7ljjH8ht6Tubo7e3y4FzTvnO55L76jzQ7S6s4lMaf
	Xr1LIAZGvM2hQIiX3CGKVHu066IdHW8bRfAXTwnnXkXJddIyQUD9Lx15H+LNYSMpfKii+M3ZKcp
	b+W3dLG/Xrzr1Jse58cuvwDhiCK9gAvtSTfEbsAusolAlSDWqBRD64zmUzg==
X-Received: by 2002:a0c:e547:0:b0:63c:fe16:d516 with SMTP id n7-20020a0ce547000000b0063cfe16d516mr26400319qvm.7.1693224009703;
        Mon, 28 Aug 2023 05:00:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXPhSb1POQUMaj34VU/Fr19SJvGS8SayhkEwZsn/P6Fzhte3O4ouxS8JN7UWdjpnDFs67aZ0eHnJxDg90Dkto=
X-Received: by 2002:a0c:e547:0:b0:63c:fe16:d516 with SMTP id
 n7-20020a0ce547000000b0063cfe16d516mr26400264qvm.7.1693224008991; Mon, 28 Aug
 2023 05:00:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Mon, 28 Aug 2023 08:00:00 -0400
Message-ID: <CAEMqeSrpuagLXSYmv1xWX54npSLn__J85gj89UavMS04TGWCxQ@mail.gmail.com>
Subject: Reminder: CTI TAC Meeting on August 30th at 11am EDT
To: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Reminder: CTI TAC Meeting on August 30th at 11am EDT
BBB Conference link:
 https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1
Recurring last Wednesday monthly CTI TAC meeting.
Agenda:
- Standing monthly meeting for review.
- Discuss current TAC topics and progress.

