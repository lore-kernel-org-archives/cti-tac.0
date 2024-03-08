Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922F136139
	for <cti-tac@lists.linuxfoundation.org>; Fri,  8 Mar 2024 22:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709938414; cv=none; b=jTP2bRMHuzut4T5hyqomYe7OPia6U3IqB5BfoJCRGkeokqAi0YI6qiaRXCJj1N/1zZdpZAazUBDvGG5b2DYMPM3f77v9bkxAm68RdhlefH8BA7KrRXaZkPKqaS8isZctK14xqsP8qoBz4OhJ+3XEpbnr+I0yCAXuY7fxXG2PrJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709938414; c=relaxed/simple;
	bh=XK4O6Dg0MATID1ELpbfPRu8y+EEAj8TJz+/Avlin49g=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=HUp1JK5x5RMYIbMNUy7t0IGnt9fntFHwKAycLWZs8AInSfU8UkIFB4UwDJYDK63csrvQs+2pEq5AXDWyJD2YKj9KtkmbgtjZmIgwLuIrRuq+TnEe0BzCunqgM4hpqiEbwG62ZuOLF6Kgbs4fAottPNqpYbeNBUif0FtM+41KJxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X8Q1rAvo; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X8Q1rAvo"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 139AB835B1
	for <cti-tac@lists.linuxfoundation.org>; Fri,  8 Mar 2024 22:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLdRVLmQp8Dk for <cti-tac@lists.linuxfoundation.org>;
	Fri,  8 Mar 2024 22:53:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9322C835A9
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9322C835A9
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X8Q1rAvo
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9322C835A9
	for <cti-tac@lists.linuxfoundation.org>; Fri,  8 Mar 2024 22:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709938410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XEIFNG/Er0j2p2E9cS6ZReKZ4J4+gw2GTyNUtgn5nYw=;
	b=X8Q1rAvo70l5DXTXL5Jz+hCCE0XfsR0qHcgJ9R0Zk00zIPBh/g5ZySdA4FCPjskDaMaTo0
	eWRdxwI+XT3HkPdkXxVrFhaksS3nc1bUp/ImOSB+ZxFAEN5Li31B6raqMaeuzHjJ94oKMh
	6z6Chc38v2M7WtCmwE1ekhG4whNjhf8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-qjTVXEnENxCg384e8_cbpA-1; Fri, 08 Mar 2024 17:53:28 -0500
X-MC-Unique: qjTVXEnENxCg384e8_cbpA-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-42ef98ebb0cso49745351cf.1
        for <cti-tac@lists.linuxfoundation.org>; Fri, 08 Mar 2024 14:53:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709938408; x=1710543208;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XEIFNG/Er0j2p2E9cS6ZReKZ4J4+gw2GTyNUtgn5nYw=;
        b=t7FvtJZYY4lzyy/XKwfN97iGy/zYDofTo7Lykp4cuHzGa1aZfWcBNVYLc+0q7rAoV7
         Rhj8yoYD6mvIcU+7FPK/pCMN+X7/UbYjXTWne4pRW9SJZt2WH4q9jhbe4c8kWneUW9YB
         tgEYKU2CJpibLD75VzONU4OWdzJxgmiOLUaMV4mc+WmWlgAZIEUgqe8wyRylkOLTflTc
         nkHh1hmFuqIBn+dhb6nCEnCb+FSYr/J7kEn3YwFPm2vcgCHwr7dqWNGeqCPh3Gv4eO1s
         CMJnY3mja5L4nGkU2YzoW7rq1lCfiC3Wa/RCGFwC+Ay2ZrEfkHVuGqK4Cg6hTV8vIH1i
         1drg==
X-Gm-Message-State: AOJu0YwhUS3VJkw00J+a+qgmFxQT3i0Uk9UFCmPHMHEWF39JuOtrKHVP
	aqxVtq0GjzYV4o2/7AusM4mpQ8pO1IgdXCVbwabck0SdJKDc97bF25fpwY5TbZrfTLUqPt4sBke
	E6j0ljYS4bntOGZ9o32AoqLC2URQv6+LlXTX0CEtCYFvtJWRsAM3J3Cyx8kmFxTRe+QrLrSJiUt
	nl5ygoIe04gCOVgxDyOOUAff7S6QWWFDElLBGwmqSrKplSiDu7fQ==
X-Received: by 2002:ac8:5992:0:b0:42e:f48d:f826 with SMTP id e18-20020ac85992000000b0042ef48df826mr2529309qte.16.1709938408033;
        Fri, 08 Mar 2024 14:53:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4gzaSt1Ux2t8MdV/JBZPDZP7JCzCQn9GzUQj9B+SLwZB0p8CLeSmJuA9jQeD1uXP7f6LeCw==
X-Received: by 2002:ac8:5992:0:b0:42e:f48d:f826 with SMTP id e18-20020ac85992000000b0042ef48df826mr2529263qte.16.1709938407596;
        Fri, 08 Mar 2024 14:53:27 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id s9-20020ac85ec9000000b0042ef4b5f4fbsm232208qtx.38.2024.03.08.14.53.27
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 14:53:27 -0800 (PST)
Message-ID: <9451ae83-0cf9-4e1d-8408-f2c9acb46586@redhat.com>
Date: Fri, 8 Mar 2024 17:53:26 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: First round of feedback incorporated into
 https://cti.coretoolchain.dev/
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

TAC,

I've completed the first round of edits given feedback from the CTI TAC
and I'll be passing the live site URL to Paul Eggert and the glibc
stewards for review. This is to meet my March 8th deadline for moving
this forward with the glibc stewards.

Siddhesh,

Thank you for all of your cleanups and feedback, as far as I can tell
your feedback has been incorporated by yourself. We coordinated this
via the list and reviewed the content.

David,

Thank you for your feedback on the site structure. I've incorporated
as much as I could right now and I think the site is much better
because of your suggestions. Please have another look. There are still
good suggestions from you that I need to review and consider, but I
time boxed what I could do.

Joseph,

Please feel free to provide any feedback. I don't have any from you
yet.

Nick,

Given my schedule I haven't had a chance to get you authenticated
access to the repository, but we've solved that by getting read-only
anonymous access in place:
https://git.coretoolchain.dev/

-- 
Cheers,
Carlos.

Note: Graphics are drawn by myself and so we have no license issues
with them, but they are just temporary place holders. We can replace
them at any time. I was aiming for something like what PSF has:
https://www.python.org/psf-landing/

