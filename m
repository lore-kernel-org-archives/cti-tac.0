Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7533C156669
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Jul 2024 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722268199; cv=none; b=M9D1arn+oPm79hy7Qg5xprG0mrOkPAfvkaF8IdPyuhnf55Ftp9UBSZKaaXh0QphGqZD8r94+RLYuEGILeKM7dxTcScDtLqvT+LMWaahhqPdEyn+53ubOppAXxOBpw/OVoLXDIvA28ToF59F7tHegzc9ZOELT997surSW0Ni6uYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722268199; c=relaxed/simple;
	bh=Kjq/VPIhuCQmevXHfKJWhUzOXgUvWFDDy/cDrPc3nr4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=OyASfsuK3P+3DrHQpQmxCZZ7dwDsTvrUsxrGAE5+fL/QITAum9S+E3JW/oeqvEVCvEo+mfPFEiTmHqeWxWKqi5+KjN+HpmRyCHBPXLEl2Wu1pcLGPCy0JLOajakvyd4fuHZ9FEhrY12WiQj0it01U4khATFZqopGofB5vXlpPQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bF5W8as7; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bF5W8as7"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 344EA40265
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Jul 2024 15:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5OL6hM-laj6 for <cti-tac@lists.linuxfoundation.org>;
 Mon, 29 Jul 2024 15:49:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=codonell@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C30340258
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C30340258
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bF5W8as7
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2C30340258
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Jul 2024 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722268195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=Kjq/VPIhuCQmevXHfKJWhUzOXgUvWFDDy/cDrPc3nr4=;
	b=bF5W8as71sY8YJFKSEr8CWxKuRrzKUk4w7qDLtfvXDW+dKhTRiigRCNBDV9puvDTSn2u8C
	NCazXmCzX3Tod7FjbFfd6zxheLErE5wAnu6VAAtXYFzRd+Fd0BhHlzEdrol+cs7djq6LiS
	CZSGVz+7lEHncroFuRBCQdDvdtUKGQQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-AFZCZZmgPAek2ssw4TM0vg-1; Mon, 29 Jul 2024 11:49:53 -0400
X-MC-Unique: AFZCZZmgPAek2ssw4TM0vg-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6b7a1c45abbso66309316d6.0
        for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Jul 2024 08:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722268192; x=1722872992;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kjq/VPIhuCQmevXHfKJWhUzOXgUvWFDDy/cDrPc3nr4=;
        b=c6BShzof0sutgY/dYGK2u2Q5y1h2HNw7zVtYdZ/jRPaSCmBvR/UoobJAdqj/GWF8wH
         vnL0EUaJmrpQZfaDmnaLsVbCj/ZuX0Mz3znOGImaa/7tKhX5I75aqLcKd6DFVsu6hL/z
         wn6BgOeEv2mkoIwOG9vOYiZlpaoS8/+8Mu+82P/bDaOd+bwurDw9tkjoLLxkSEzmRJ51
         R3abd+5+Htmzq4UcTyj7xIS/xUDu4sloVjyNjYm3i1poRIK3tM2TJNXbVUf/ZHCzf0gD
         c2LtCrLTlGO7M2L8PZwo0NVshxvqv9wtPT/MNX2VZYKN04ZAOdojIY7A/N3aHEzYjHsL
         5nSA==
X-Gm-Message-State: AOJu0YwTC69aywefm5NMYx3CkONtODoSOC7sP1VnAo3BXqWI/eqRe9LE
	lZ/b8QS5GtdI1E7c3vlHoOOuT4fAAGDtqihnlI5bjEU49mBUFs7q6Eup6D9VbDec6mEtygjL/WK
	8nq8PHCaicWTPA9F3kCnuxxMkHQH7l0qd9HHuChB4ldlzWF6abMksf9vC4J7blI5fIbF4+3PCnP
	hLvphK0n6Q2nQTqS86L1Byc95J+PUezgtwIBrmnfYOGH1zo0SSYzStIg==
X-Received: by 2002:a05:6214:2584:b0:6b7:551b:7800 with SMTP id 6a1803df08f44-6bb56353584mr169707356d6.19.1722268192352;
        Mon, 29 Jul 2024 08:49:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrQajNjPJeMiXxUEZsV1XPq+Gu50sQSIMBs2/5n31u8SPanVH0k5yoDwytAkGwI7TezLakpKdJIXjMxNl16Mg=
X-Received: by 2002:a05:6214:2584:b0:6b7:551b:7800 with SMTP id
 6a1803df08f44-6bb56353584mr169706906d6.19.1722268191946; Mon, 29 Jul 2024
 08:49:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Mon, 29 Jul 2024 11:49:40 -0400
Message-ID: <CAEMqeSqnULg7UM4_wnwfPAAtNLgvndD=V1wojc5AAtU9kcaXnA@mail.gmail.com>
Subject: Reminder: CTI TAC Meeting on July 31st at 11am EDT
To: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Reminder: CTI TAC Meeting on July 31st at 11am EDT

BBB Conference link:
 https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1

Recurring last Wednesday monthly CTI TAC meeting.
Agenda:
- Standing monthly meeting for review.
- Discuss current TAC topics and progress.
- Discuss glibc use of CTI services and LF IT SOW and progress.

Cheers,
Carlos.

