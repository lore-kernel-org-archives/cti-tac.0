Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610D115E5DC
	for <cti-tac@lists.linuxfoundation.org>; Mon, 27 May 2024 12:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716812556; cv=none; b=uIwTgD83IqQhMgh1ViaP0axH0+6s3MBrt2elkbEJIPWmGyDdL/eTmb4p2KP5y2XOntf+p9lDja9ALsSQfYN32AsywyCKRiWH2Qem9DxxNyQoetOAVyAAkCr3LhUVSr12xh1m9cUZ56ezFKXUzY96LKyNSKSQfESUYuPIPlEKilw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716812556; c=relaxed/simple;
	bh=sJ1jqB9O1BWiDKeD+2czQ2nQEicuixmtvyEIUTILOkc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=kx3x3FH+TNLLLqDGpN8Z8M5nBfSo1DJisU0fiAYvv4qcDdrIHv5G2wy9AT3Vm1VM3/ATeIjiY8pT2XNbx/VzScW2Q/AMnFAg2Y+pBHG0nAhMtY92+GST7OUOkFLevQ46YQ9lu9cN/30oXTyHzl3Z0wkaXBHE4IGe+YDFVlWsN2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S1VlouAm; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S1VlouAm"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3268606AE
	for <cti-tac@lists.linuxfoundation.org>; Mon, 27 May 2024 12:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZANvIQc3MqR for <cti-tac@lists.linuxfoundation.org>;
 Mon, 27 May 2024 12:22:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=codonell@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 180946068B
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 180946068B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S1VlouAm
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 180946068B
	for <cti-tac@lists.linuxfoundation.org>; Mon, 27 May 2024 12:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716812550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=sJ1jqB9O1BWiDKeD+2czQ2nQEicuixmtvyEIUTILOkc=;
	b=S1VlouAmQQ4WT//0dVUCNgl9xEA+L3PM5Hdb6xdxcGxQAKh2eZj5SeuxejmYccZVz7Qu0D
	OO+KlVuChIpTUNmeP3FSk1JQJaGHwQt69Yhm84hJZ6h8r6IqJQknyag3pAv91jtQbculhw
	axsgDKuS/AFKG5EZZY8TeD9ocP//kjk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-J2D32V1QO1ihVewXjfbGRg-1; Mon, 27 May 2024 08:22:28 -0400
X-MC-Unique: J2D32V1QO1ihVewXjfbGRg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-794857a353eso305173385a.3
        for <cti-tac@lists.linuxfoundation.org>; Mon, 27 May 2024 05:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716812547; x=1717417347;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJ1jqB9O1BWiDKeD+2czQ2nQEicuixmtvyEIUTILOkc=;
        b=tXtSumP3yx8p4oCYWhPQymXu1+Zcpeu3VXTCJyRWfQGHVJCPbGIPgNm4vH6rbs/dHy
         2ZDqTDLx0f+wZdQ9OEyYAo17U8LPJRsUBwcho9+yTLi2j1QmgDpMfz95V7l4ors1dcWe
         Ga6+PQaXWwxQWVlIdu0Y9Tlvpg85IiCGl1mroCxh+inVGwhuMsAt6iqTv76UhY5Ou9Ow
         A9pqzqWCFwb3RGv7tBOmgWa7WlrrG+dUx21zIGE+GNYUa4BtSxEBQYB3RKaXYGtv9zBD
         hzIheZ+QHgfJu8qPjUspox7MQqBVFHwEOYhFX2/1cJgzqNCvc9iVfr6BmRBf9utcpjLK
         ucAw==
X-Gm-Message-State: AOJu0Yzd47ppokpK3m4hrE5Ye67FN8AxW6L4s50+E5wc0zF63KA7lhuk
	AE8qVPNPIblv7kWjfHxbv0Dx1AY1niRmhJOf0deuhw37WYYcYJIMZfSoXg5g2rNq/XU3uEfUsSp
	b3ZD8/R6iodcOiOjD8m6lESq/0mo+rozPG1kpaiTtRimj0iS+BVXWdZT4wPu4gjvgdazoH6cGUp
	uIx/ZzW0SWVz9rilOLdNetB7KRhSzZb8x5kfVCKmWwD7Tk1K8CiWtm3Q==
X-Received: by 2002:a05:6214:5b0c:b0:6ad:8475:94e with SMTP id 6a1803df08f44-6ad84750aa3mr20639656d6.30.1716812547112;
        Mon, 27 May 2024 05:22:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+EjwHh4DbY0lZgjnG9QegTdA38LA28nBdAxSLNkNDceGton5bQTe8aas3iJLi/f7ZWqnvb32VgsDt8eWuFd4=
X-Received: by 2002:a05:6214:5b0c:b0:6ad:8475:94e with SMTP id
 6a1803df08f44-6ad84750aa3mr20639476d6.30.1716812546562; Mon, 27 May 2024
 05:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Mon, 27 May 2024 08:21:00 -0400
Message-ID: <CAEMqeSrmiLdNQE-9am=fdDu82o2JQq0LZjSXC2448iTWA=fGNw@mail.gmail.com>
Subject: Reminder: CTI TAC Meeting on May 29th at 11am EDT
To: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Reminder: CTI TAC Meeting on May 29th at 11am EDT

BBB Conference link:
 https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1

Recurring last Wednesday monthly CTI TAC meeting.
Agenda:
- Standing monthly meeting for review.
- Discuss current TAC topics and progress.
- Discuss glibc use of CTI services and LF IT SOW and progress.

Cheers,
Carlos.

