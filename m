Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2307D28E04
	for <cti-tac@lists.linuxfoundation.org>; Mon, 27 Nov 2023 17:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P8ElyFMi"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DB9C405FA
	for <cti-tac@lists.linuxfoundation.org>; Mon, 27 Nov 2023 17:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DB9C405FA
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P8ElyFMi
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.599
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vlkMp9VdAPvv for <cti-tac@lists.linuxfoundation.org>;
	Mon, 27 Nov 2023 17:55:44 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A5FE440396
	for <cti-tac@lists.linuxfoundation.org>; Mon, 27 Nov 2023 17:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5FE440396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701107743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=Qt51zR5pu75UZBmxd1xUqZpMn+iF88X2i10KsrH8N0c=;
	b=P8ElyFMiq4hOSbhZ5XZ6rDVAdndk5E8IruMZ3kH3yffloprwPKC6yijZsIQm8ES4GMJ2ak
	0W3Ep5oQreKFVezvJ+aovVCGtfpIdve4b+CKgFRNFVc1ZgSiqqPbsj1P3V4dzwoHx+s+/c
	uSGFSEx8YbPSHEQsmmmT4R62EVmOgYg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-giZR1dGYPF6SaG9qOd1R3A-1; Mon, 27 Nov 2023 12:55:41 -0500
X-MC-Unique: giZR1dGYPF6SaG9qOd1R3A-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-67a1904ee33so42489796d6.2
        for <cti-tac@lists.linuxfoundation.org>; Mon, 27 Nov 2023 09:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701107741; x=1701712541;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qt51zR5pu75UZBmxd1xUqZpMn+iF88X2i10KsrH8N0c=;
        b=qv5X/nVpAxXK5v1wb9df29BoTxCMTrF7nujWyurEgwB2kn6bQ3p8aZxrc6Tlz4ZVYE
         AB+4A1blcE02jnFNjNxkCMwlHYDbbmZyX1yrXf13GWEaun8Q7yp1EERpCuP+rBYl+zvm
         w8nIT5nhdI08LLwHj2L8meIB9JRLszKmfxSlZ+de5ebTooeHNXwla/iJYkQd6baFINp7
         h+tD4cs/tNhp6v3b0vqeFIT/Jwqmlc0mbmzeTSUAZm/xAJu6/lZyjUgdl0UsTxOTRbf3
         BIcLq6vnNlxwrA47EhYt5T9xnD5ZApYPAtFk4x/n4OiQgJtlnfi8riMJujC4FkDGlzvA
         GVmw==
X-Gm-Message-State: AOJu0YwWGtoCs8aq25/w9R+3Mp6YTMkn77SeeCARdMtAUNPBlyaAfbtK
	XmtjMkuwc3VMsmY9n2WRcaFDCAWXqQCjXmMh2QdCVTivvkgT/qVuYLrIBSFVKNH9gk6joSynNi7
	Np+7c/EP7xjUCr/XfzoaVOo0BSr1cvEtzMaHM0g7b+kXUM54d/EAMcLt8bg==
X-Received: by 2002:a05:6214:20a7:b0:679:e804:b9c1 with SMTP id 7-20020a05621420a700b00679e804b9c1mr14174879qvd.28.1701107741136;
        Mon, 27 Nov 2023 09:55:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLl1e2HE5x86D8HISxrtxjROkAI6byYM3AnhARfPG/2/tKHXY70MVGpyPNocTsUtnLB4ClEJDyOvIqgg7P9NU=
X-Received: by 2002:a05:6214:20a7:b0:679:e804:b9c1 with SMTP id
 7-20020a05621420a700b00679e804b9c1mr14174867qvd.28.1701107740883; Mon, 27 Nov
 2023 09:55:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Mon, 27 Nov 2023 13:54:00 -0400
Message-ID: <CAEMqeSrhJdTScpBZFW=Pz5omoLH60AM40jRRUKmXy02SPb=KPQ@mail.gmail.com>
Subject: Reminder: CTI TAC Meeting on November 29th at 11am EDT
To: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Reminder: CTI TAC Meeting on November 29th at 11am EDT

BBB Conference link:
 https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1

Recurring last Wednesday monthly CTI TAC meeting.
Agenda:
- Standing monthly meeting for review.
- Discuss current TAC topics and progress.

Cheers,
Carlos.

