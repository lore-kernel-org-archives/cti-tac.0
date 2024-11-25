Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7194A376E0
	for <cti-tac@lists.linuxfoundation.org>; Mon, 25 Nov 2024 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732543269; cv=none; b=L73sQA1dnV4+XIddArdicsoKNsasw5pIBrkjm6FBSQ/5vUl0VkdDSyitDBkgJbjDo+vL1Jpj3HJX818+JlXDcLj7gtuI4raiXRTarl5zFdm0sCMhNoVRta9eOUrVdy4LSt/OML0/bXTHO45WjffZw9d7u21t3DaSlu4oPUANEvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732543269; c=relaxed/simple;
	bh=MP6NYwfRoX/MQKXL67vzPhbeXMt0W1NTloWfTQKj+2k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WqhiTEWxfUpv7yJ998UoKl3a1qeD8+rdKMubO02BMvmlcg/UenKN26cDDCPpVrmA45/a8eLhk6M71Ls0n/eMGtsiADBSYxhKcVJ8NHqXnUXjj2g6Tw91qdWpxE+h0LvDyEb9AoBChdUe3X0gjo0IH3eUBEhjewRKYha669LoxhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RAm2iltT; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RAm2iltT"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBE3142FF1
	for <cti-tac@lists.linuxfoundation.org>; Mon, 25 Nov 2024 14:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ey_qex0I5W2b for <cti-tac@lists.linuxfoundation.org>;
 Mon, 25 Nov 2024 14:01:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=codonell@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E9DB40C58
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E9DB40C58
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RAm2iltT
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7E9DB40C58
	for <cti-tac@lists.linuxfoundation.org>; Mon, 25 Nov 2024 14:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732543262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=MP6NYwfRoX/MQKXL67vzPhbeXMt0W1NTloWfTQKj+2k=;
	b=RAm2iltTTcqJkETcijKrnzm0VTqcmOGnI3OPnOxGAUY8M2C0vPhXQcWYQV/u4htzLLVGwM
	1JpszaM9mrZQP/+x37wJc/18fMwdgyxqO6YQpRt1mAPcWCaqtMn7xjA2TyWmfx27TdkYJr
	yayz4jCTK9/aAvCHeWN2vwfX83GvNOU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-kbmsN_WxP3ur_b8pFZHChw-1; Mon, 25 Nov 2024 09:00:58 -0500
X-MC-Unique: kbmsN_WxP3ur_b8pFZHChw-1
X-Mimecast-MFC-AGG-ID: kbmsN_WxP3ur_b8pFZHChw
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d366683f4aso71006316d6.3
        for <cti-tac@lists.linuxfoundation.org>; Mon, 25 Nov 2024 06:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732543256; x=1733148056;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MP6NYwfRoX/MQKXL67vzPhbeXMt0W1NTloWfTQKj+2k=;
        b=GKKCaP6RZLajKD8GTgwiWf0nbZkHWJjEvkYzwsd2WAjslgLQBr+uPjXZGeOG/hnWMY
         PVjmFGm2/D67WpURWZZt2tJWxxjvJsKFv0UXjReBG0TVNr957Ie8ktNn7JydBtjx1CvO
         MyxA4GlOpbJSeTV323L+si8VQSLEyhpYp9S0VDBjHS9lhUmQpnuvayH4GlQLN5VuqHxZ
         AT68EXSgVfjsJrym+ZUkdfLESpSXW1G5+BQvRubQur8+Gg2RFc6IXkkU6/ln1cRvc3Q7
         t5ix4/nZ1oJNZfYQsa6T8TGlX6MHFMY+Xo3bqMhJJTbKsXmi5f+Bwjj8ejGwK734gkqI
         X7wg==
X-Gm-Message-State: AOJu0YwOtGNzEMBiQwyImXIgJgIq3FZcmkrjOwfWBVIQUf+PBKh7SkzH
	k5yKVVnII2oX2wSg9ZS2iRYDgTFy2uDR6oTtccCWkdH3gEBEKAw5kx3GcYDpDcJJuT06fNJDNw4
	lYyLZTzHKJgQMJ1UalRupiM8FoOTvMuHDpZ5VekcLAr2z0/tkoAdxaenUcgN6bIj4ruzzINqCRK
	a9UIV6pk+KzRGpIEbRlMRBnrKn7+7OR/kWXivXtOb/2nJ7n2nxMDex1A==
X-Gm-Gg: ASbGncuyZfC0ZH0YjOQSDdJGIOUhj3MdKKApZfKl2Yu2ZNVb+2l6952EidSzu59PXlx
	mIvtA3QJhtT11ZR436rv2ZnxBzxoJzR0=
X-Received: by 2002:a05:6214:cc4:b0:6d4:1d6f:8fb9 with SMTP id 6a1803df08f44-6d451362880mr260169106d6.47.1732543256341;
        Mon, 25 Nov 2024 06:00:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGytWlQnDhaJgyCgLhVSESz95/hhTnyS6B37KEpKmAKkY7vwR6HJhqJT1UUwowG7njQl5/Rc6t/fABQNfKOg+E=
X-Received: by 2002:a05:6214:cc4:b0:6d4:1d6f:8fb9 with SMTP id
 6a1803df08f44-6d451362880mr260167636d6.47.1732543255065; Mon, 25 Nov 2024
 06:00:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Mon, 25 Nov 2024 10:00:00 -0400
Message-ID: <CAEMqeSrqsq5Dhqjdye6ZZuz-z-UyFW4eOZPT5OcFUDLhR5-geQ@mail.gmail.com>
Subject: Reminder: CTI TAC Meeting on November 27th at 11am EDT
To: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zQsDlhz5xkCSnK9hYENUXw_fIEKnM14cTFFx36lpkII_1732543257
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Reminder: CTI TAC Meeting on November 27th at 11am EDT

BBB Conference link:
 https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1

Recurring last Wednesday monthly CTI TAC meeting.
Agenda:
- Standing monthly meeting for review.
- Discuss current TAC topics and progress.
- Discuss glibc use of CTI services.

Cheers,
Carlos.

