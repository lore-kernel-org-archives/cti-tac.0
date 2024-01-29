Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E626F068
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Jan 2024 18:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706552653; cv=none; b=LvEoPKk59c55dbCscna8YFeJN/JFYhJJRjr8rUBmLT+Rlf5tGUSQRa9WXYWMq89vJKCgMGuUDjf0x3SaLlXvIgLhTolsBmadKX2yqPr/pmjG86ZehetyzyJSfKoZ3qsj5QvyxMbXKkKGdVXRLQZw/D2YKk/HuBY31w1PjZM+WHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706552653; c=relaxed/simple;
	bh=4P0pnJu2pYnsm5RmaF83G+KRD6wVvKdusE4RfO55nb8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=tqEctrAMjuXwD4CH9LvAlm+P/jlYAH3248okLAH7DiaUCH/oexlKYNb3d2MuGWr+zsOF9C/O3/9LI0nMJP1A8cGSSCr5N1Jj4qQWvYvFoNkgqJeK8PJVVVi7n8VFC5hEdM8mbScHwokh3Tyxmma45movLFsC1jpeWMErgByTX74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KKeaFH/8; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KKeaFH/8"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E2F820B6
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Jan 2024 18:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89E2F820B6
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KKeaFH/8
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6nJDVDuxG1l7 for <cti-tac@lists.linuxfoundation.org>;
	Mon, 29 Jan 2024 18:24:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BC9C78206C
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Jan 2024 18:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC9C78206C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706552649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=4P0pnJu2pYnsm5RmaF83G+KRD6wVvKdusE4RfO55nb8=;
	b=KKeaFH/8+hUXpBuIq0SLuK0tLqpeJcMFwwAIsWzv6c606ORJ6iGzmpFMSTx7TZWQc12MXy
	QPXJXmkDl8EQUFLJKH47nxinhjitwzjXkC9ftojaTdD8run9PSb8cf7Hvj1TJUax082nlI
	4aOZo3RGfw/TD/XZte3iuqNzVjHS/9c=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-oYUX4WMVNumjqG3CK-NaFg-1; Mon, 29 Jan 2024 13:24:08 -0500
X-MC-Unique: oYUX4WMVNumjqG3CK-NaFg-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-783dc4137b0so450249885a.0
        for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Jan 2024 10:24:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706552647; x=1707157447;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4P0pnJu2pYnsm5RmaF83G+KRD6wVvKdusE4RfO55nb8=;
        b=R6/EDilEfsdouO5+XHMdu7H0C8f3KW0mzlra7kvhQSUKfFrxjl0U43JgrAY/sHtoaF
         WTMVseuloaYpF0i6cXR06RQMaggL48Cd5d6u4vPLYLwaRAtrRMco2Joxbr+kUGVfQbf3
         S1N8QXcwJTrZ3AqK2l7cbiLceDPAQCq5V6qTraU156RkUy40lcFfgDKHb0Aj3N8zohE3
         ZXqaZJB4inXjcG4/eceuBiVFc69EcXaadmmBEn3jnNX//EOUxdsYKxIhUAYT+MdTMhrT
         vu0kHoUCIK5gZO+ZeWwklHB02kJC//ybc6ivyJ1SR0Mr6r6FOT47l0L/1SqcM92fUJYF
         etew==
X-Gm-Message-State: AOJu0Yx+VPPloaUYySWKWbs42vz3ZkprB7uW5n8w/FylRgjoWUrs1DTl
	FlYoa/9ZdaMBZGOM1BVg7I5glZblrhZBBvok+zfdzbTrN/k9tp88EgbwMVIo6pmpWg584Cm4kln
	SwSLR3PY+50wpdJ4ImYTV3t16VEgNyzWe99EdDAxUBE8LVKXV+3NPSqueYDtyWrWDh9jE5BsY3a
	+sG0Yw9DQUdJWuRfoWEyBbXKxBYJ+yiM4qK7dyyNc3nBe8RVZEyFwYNQ==
X-Received: by 2002:a05:6214:2487:b0:685:57ea:925b with SMTP id gi7-20020a056214248700b0068557ea925bmr7135070qvb.41.1706552647150;
        Mon, 29 Jan 2024 10:24:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc/Qq3bbxva0ln6eYWh5uaruV5RyJ8NrnKNdyyKjFrqlEK5jb8pTK4j7ubXsEmc/q+PXyOrmNdHJ6g8QPhbrE=
X-Received: by 2002:a05:6214:2487:b0:685:57ea:925b with SMTP id
 gi7-20020a056214248700b0068557ea925bmr7135056qvb.41.1706552646841; Mon, 29
 Jan 2024 10:24:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Mon, 29 Jan 2024 13:23:00 -0500
Message-ID: <CAEMqeSq9K0vXx=jk5L-504pENu-W-p_4pTehP+3Uwqq9rKV5Mg@mail.gmail.com>
Subject: Reminder: CTI TAC Meeting on January 31st 2024 at 11am EDT
To: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Reminder: CTI TAC Meeting on January 31st 2024 at 11am EDT

BBB Conference link:
 https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1

Recurring last Wednesday monthly CTI TAC meeting.
Agenda:
- Standing monthly meeting for review.
- Discuss current TAC topics and progress.

Cheers,
Carlos.

