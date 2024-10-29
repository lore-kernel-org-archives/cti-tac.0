Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4503019258A
	for <cti-tac@lists.linuxfoundation.org>; Tue, 29 Oct 2024 22:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730239482; cv=none; b=grs3O3aL1Hs+DYy8zUV0tm13LqUec1cjeZdRr9IkeX+wUQp44kKJVbC31fQg6ubNo6IyEm3SMr+TX+A5PZhbov/3wf58rETOvUBKztY/tWPyfnPcKSccyXaTwdYPYHsZTi+3aqjeBR7T6c8QcXZw2cfXdSbKf28RUvXcT/VGtTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730239482; c=relaxed/simple;
	bh=i+2w2TwRmc69mdCwdP6IXJd7dGKz08dq7TiPo2vbSGM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=bkL4WJOXERZmXIO8HwpxafUxla31UkzPD5Kl9lUc8X/qicZRZZbilPzbXGoDc5+IGjnU+1FkEdwf4CHmERIzT1iC3NqDbiqjBnk5GsPk90hK0m+Uyw8a017MvYASLIxkkSQThmarw0a263LEuJLli7PKdGa5J1P+6cknVnGYQ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FdjxiD1H; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FdjxiD1H"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D68FB403D7
	for <cti-tac@lists.linuxfoundation.org>; Tue, 29 Oct 2024 22:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8K82pqZRD8He for <cti-tac@lists.linuxfoundation.org>;
 Tue, 29 Oct 2024 22:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=codonell@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB29B403C9
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB29B403C9
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FdjxiD1H
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CB29B403C9
	for <cti-tac@lists.linuxfoundation.org>; Tue, 29 Oct 2024 22:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730239477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=i+2w2TwRmc69mdCwdP6IXJd7dGKz08dq7TiPo2vbSGM=;
	b=FdjxiD1HahBVmxFYvobaO7yu7cjdsmIXCD/X8U4HVXzsdDXE+lcF95bjfNMwJQt9KvGCcU
	Hu+tB+WyWa/0FlbKoJAsbiw0ChtQn1yaFSOf5XLLBF34uvifwx5Q8cZS8pKpzKSeaG2cwz
	RtLpOzfe67WzDr3+iiyu+t4VoOeySe4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-RpIKFbWCMMOt2eLBA9Ooqw-1; Tue, 29 Oct 2024 18:04:29 -0400
X-MC-Unique: RpIKFbWCMMOt2eLBA9Ooqw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6cbe5637d8fso86408616d6.2
        for <cti-tac@lists.linuxfoundation.org>; Tue, 29 Oct 2024 15:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730239468; x=1730844268;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i+2w2TwRmc69mdCwdP6IXJd7dGKz08dq7TiPo2vbSGM=;
        b=Q0Yp0IHihYrkd2UURipZcqUXJC5OHGBLEnp+bmd1q1fxy9bkft86u4Npmlj4mNeyje
         v3ZxLfVvO/Y7b+uBB/Rie2eDPg/ysHMu9PNbYAnz9ZLXK5FfcWLaDZR8rtYe7Y08LueS
         ov2Ui84OCnVbTnJ+A9zcgg5NuuQEG+D3sjktkzOQdY0ikrToC2oVGg4z31oR2mPSc9q1
         UQ98RCx/qif/OLM2x8eRQifH82fJ7TOoXF3IHrPLihVlVIw5TwmpVmb1Wbkdowz9crja
         ZXWIGC14cpn5Wxf6qlgtXywNW/vBiqKNiPDgcy0l6D4PYHtccFy4JVaKoymb3qUTQzRZ
         v24w==
X-Gm-Message-State: AOJu0Yz8DvLitEOwocPfyaGS8gsws5CVerHErNG6OH52qRVFROPEfMhg
	PnSyaoNlO75x1WMWSNM0y13VWCEE7wOEI+Vw0fUhMU3UplJSv0hnIZ0c06iQgfJ1nJvXefFWqWZ
	zlSVjiQp7VqRQkeENNLdTvbyLgNhml2+0K13W0nJ0rnmDuo3VjdwVP/aiw8WRjTdb9+LO6NL7pv
	ddwlmdRTxszWe7xHrdgLLvOcXdSUwVz+jcqoRVmZamzzxZRy4FA6SG6Q==
X-Received: by 2002:a05:6214:3d97:b0:6cd:fd25:c426 with SMTP id 6a1803df08f44-6d18583750fmr202411126d6.36.1730239468301;
        Tue, 29 Oct 2024 15:04:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZg5O6krkXvpLuGLRLevcD5/hKkALg0uqbx0RMwgtorppSPqiinsrxFaavJLovgeITaAbvGL0QRiLh/Ln3gH0=
X-Received: by 2002:a05:6214:3d97:b0:6cd:fd25:c426 with SMTP id
 6a1803df08f44-6d18583750fmr202410886d6.36.1730239468040; Tue, 29 Oct 2024
 15:04:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Tue, 29 Oct 2024 18:04:15 -0400
Message-ID: <CAEMqeSo5fPHSkpun+Mws9n2STdensnUpN_j6JbeAopKB087aGw@mail.gmail.com>
Subject: Reminder: CTI TAC Meeting on October 30th at 11am EDT
To: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Reminder: CTI TAC Meeting on October 30th at 11am EDT

BBB Conference link:
 https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1

Recurring last Wednesday monthly CTI TAC meeting.
Agenda:
- Standing monthly meeting for review.
- Discuss current TAC topics and progress.
- Discuss next steps for glibc and conversations with the FSF.

Cheers,
Carlos.

