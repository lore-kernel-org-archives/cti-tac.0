Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6271B1292FF
	for <cti-tac@lists.linuxfoundation.org>; Mon, 26 Feb 2024 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708970436; cv=none; b=m3u8zUgwmRN7woSPTmZiH9oTcAdQdt/5ItxXy5jAhcv5Jbku0Wod/+b1hUZS7HG71CbCxK+nCRTI6jA1XpFQj+s5n6oQCQZneAeuSE5KQl/de7xDX5yBwibJ+Lef0qUN69r/uxKcCyM1AN4kofuqupMR5DoOaA8LHorR4abyu0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708970436; c=relaxed/simple;
	bh=8AqsECD86GGo7gDgtAjPVX2RT9KiYWqq/rKbajnqN7E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Qdbe1g0d0qs9DuvE06bYJWfRW1n6PvWtDZ2eWNYHCNYPv29Me2MWOdEhUK0bMsbrqH9FI+4oZcD/IVBZ39s8ygYCP3Yw+7SfABfK65/48pe+MWuihwshBm7z/MJL19BEPr83DShu4wyKMKG1UCxmTHx9719ix61aQF/oI756FaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZgdS36oX; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZgdS36oX"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04C3540B13
	for <cti-tac@lists.linuxfoundation.org>; Mon, 26 Feb 2024 18:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TV23_oo_pr-Q for <cti-tac@lists.linuxfoundation.org>;
	Mon, 26 Feb 2024 18:00:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=codonell@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D99BF40B02
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D99BF40B02
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZgdS36oX
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D99BF40B02
	for <cti-tac@lists.linuxfoundation.org>; Mon, 26 Feb 2024 18:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708970432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=8AqsECD86GGo7gDgtAjPVX2RT9KiYWqq/rKbajnqN7E=;
	b=ZgdS36oX1vzhyRb3vNxJQyDiwOJW1e3t6hhK4kQ+YR7ykwdJNYHkEp70UvLOzyGX4a2w27
	SsKqQt2TabgTLKLJKmw4pzFnU8y6nr4B0KTVTlhM6rSxVqrgmwyGzVox+Qg84m0pxjOBJL
	BVyRwcj7UhdIYiODyB+PAAHYJXk9xv0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-ZY02inuGPpKzNHqk-oGU6A-1; Mon, 26 Feb 2024 13:00:31 -0500
X-MC-Unique: ZY02inuGPpKzNHqk-oGU6A-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-787ca6e2f28so242264385a.0
        for <cti-tac@lists.linuxfoundation.org>; Mon, 26 Feb 2024 10:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708970430; x=1709575230;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8AqsECD86GGo7gDgtAjPVX2RT9KiYWqq/rKbajnqN7E=;
        b=nN/oiVSv3Y06sJ05qTQm73CUS91S24tRrHit0118M3M9NiJLD8pa8pcKwHAB9j4fMr
         XzvRz/HWQ4ePq+mpPCJZLLt0ElZ01poGGMOpdwp95NnhYe0Abvw/IrkUktkT+KtJluZ3
         Vj1f9dEkScV89UdKlL4JyiScFl/2SqYwvpxawfUSkF3xheRDyOuzZJKSSZMK9FHK05TQ
         st5Ip5rKUVSDPyyZleJDGcyf72u8kt5GeK1FU7zksvt1sA2h///MvXsiYFKFX6vepQZB
         DtDuq0I03vFep+RUVNMA2tvVQvRxn07NpEfu41/oWnbY66DolZYGCWEhuAzZdoHbNCBC
         EYDg==
X-Gm-Message-State: AOJu0YwoVGzmKtSXi2i+xsE79Xj81QD1nUPfFGrKEgpYgKB195UbNmqP
	EeNZUDXKdyndkI4/McPPTAEFwp83nDUT9BQZWGW026P1JmJli4+yg/XNKJmXgd8sSYyIGe40jeJ
	21o7KXCVhptDnFOQUVEG8k9CrPRPUjLP6rSDN38fad3jrG3KTfJrkxDqYJMvSTODtB/rUoIx3bE
	9bydJgyEMVYtalMWBHbyDU+175MLBKtd4oyCSFuZ7l9w+EY+4szZ9d1A==
X-Received: by 2002:ad4:5c69:0:b0:690:1704:6261 with SMTP id i9-20020ad45c69000000b0069017046261mr2090348qvh.43.1708970429720;
        Mon, 26 Feb 2024 10:00:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoAYgnsEdD3jdlGnfaiipB/PHiR7aMFm1dGOmoYrok61k5MzB+li2x3dsUTA0xGQxH2g2q5Mgll9BFl2R+XdI=
X-Received: by 2002:ad4:5c69:0:b0:690:1704:6261 with SMTP id
 i9-20020ad45c69000000b0069017046261mr2090327qvh.43.1708970429369; Mon, 26 Feb
 2024 10:00:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Mon, 26 Feb 2024 13:00:00 -0500
Message-ID: <CAEMqeSpvH82+SjtGivNkG6WNujwfsEaj-Jzo1ZnQ-63+6RoEsQ@mail.gmail.com>
Subject: Reminder: CTI TAC Meeting on February 28th at 11am EDT
To: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Reminder: CTI TAC Meeting on February 28th at 11am EDT

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

