Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD2313B2BD
	for <cti-tac@lists.linuxfoundation.org>; Thu, 15 Feb 2024 20:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708030518; cv=none; b=S1/jnKO0NFdvY+ruWmZOA21WbGxdAXigHlBDNnAYxa/zMnOm38ldjaZIRPBTQ0ogd5XfSJc/Q3V7BwMg99bPttm9dO7IAuN2EFdPru0cUoo1M7nAVCNMPDyN9tD+vzWWo2hK2Ynz+Oh7HSVh8lGJXkUrmmukF9aYurTKSs3gimY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708030518; c=relaxed/simple;
	bh=xcwkeLjU1vDl9drqGHvHWJXIqpyKdnz4Z1ZMLsK3qQs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dsAT5z0x1+rJdQy5cj+CaifcWkoaKCXigvnficgAL8qsWH3v+3yl4X79gQLzlX4P0AFFZ1gWfCD32MWPtLPv2tYOhZImVYim+wBAkTfRXI/TpgbpN8dV3DJW0mT7HKTnTI5uMhhgopa0ySRM/5KF/oraoU1TAedZJPiccT2uRDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fdEnbJCv; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fdEnbJCv"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16B76606B3
	for <cti-tac@lists.linuxfoundation.org>; Thu, 15 Feb 2024 20:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnezaYe7AGFV for <cti-tac@lists.linuxfoundation.org>;
	Thu, 15 Feb 2024 20:55:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=josmyers@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B33A606B0
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B33A606B0
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fdEnbJCv
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4B33A606B0
	for <cti-tac@lists.linuxfoundation.org>; Thu, 15 Feb 2024 20:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708030514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G2lO22OgrYTjh3p2GoZz10t+0CXUI8X6cGqZwHlnwIU=;
	b=fdEnbJCvAqc0Fn0WNA260opEZW3Edn1xNlV5fjxtPM9d8DAIIGsMhsKTYb0zxzIJf+eIMQ
	1dLqV5O43U8oqHwK+FHeMp4NuOt3wo9fvH2C1tv6ZWNhDYzfFEDPaKenD53akJUKYlVeBC
	h/XwGAPQsTV4g/uxPx2jn0RM3A/L/vg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-B_Tqn_AJNFyF7QNUfy7bvA-1; Thu, 15 Feb 2024 15:55:13 -0500
X-MC-Unique: B_Tqn_AJNFyF7QNUfy7bvA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40d62d3ae0cso7249495e9.2
        for <cti-tac@lists.linuxfoundation.org>; Thu, 15 Feb 2024 12:55:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708030512; x=1708635312;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2lO22OgrYTjh3p2GoZz10t+0CXUI8X6cGqZwHlnwIU=;
        b=ch/uHrlLrTBHGWjeDgnLBjnjBEYYWfd5tjGcfp6G8uAlQHvGtF5KtkPUl2BfaKXjmQ
         WCHVvcW+L8wVZ3KWKdcX46mJryCdBjDmtnkoEADQta/wWK9f9tNGFRW9Kx2Yf9fiy0O9
         M6ABy0EK6w2y9EcV6e3+AHK04/5nAQqIUDEnyFEFuOZO+beaL/tG6XHvOMS0Ma1XJkwt
         JQqYF6ZNN2SQoyRvZGoKAIGkKlTHilOJRseSfXYJ8JdWxIoEhdwfQGRWnWvRAKtzt5Bf
         9ZytfIaIvJIbJ+md9vC0uQUEc/8kBxb5sdWRDmADKwLmgnPwVJ2Zb10hPkA2nCAwMadu
         rR3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUH02IQg3Gb2yJWlaUMF5oopMjwXhi/I5tn03vW7IBLkXU5f/6nXEc0Lm2tGawEyt99x89qgVes7YLJC5oe98IWadCsunfTiuhLW6aYBsuivc4=
X-Gm-Message-State: AOJu0Yz6ncubI+RIknrUHG90COqVLh+YP/i4xR8Xxu6Oi6o6W5aQZoYg
	u0r0OgQYnzRDnG2vcZ8K+i0DpAbmxC/TscneVisPy16ZlaXyLuQqNVeXx9K8ZqeQumaZnZLdUp7
	eJkBNQ6LFOD5Ge2RlwioSmqxmlX5MmXjvy+KhUEzuzipZASe0pMkWKornnJbCzWBfJ6qO
X-Received: by 2002:a05:600c:4f4e:b0:411:e5e2:105f with SMTP id m14-20020a05600c4f4e00b00411e5e2105fmr2160210wmq.26.1708030511957;
        Thu, 15 Feb 2024 12:55:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8t5F2j2Uw9y/ltjwz7Q150bnMrudl3315N6em+wy45mQ5xPsd5D+gB7IpO9sbMafi7xi8Vg==
X-Received: by 2002:a05:600c:4f4e:b0:411:e5e2:105f with SMTP id m14-20020a05600c4f4e00b00411e5e2105fmr2160201wmq.26.1708030511518;
        Thu, 15 Feb 2024 12:55:11 -0800 (PST)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id i6-20020a05600c354600b004107686650esm228994wmq.36.2024.02.15.12.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 12:55:11 -0800 (PST)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.95)
	(envelope-from <josmyers@redhat.com>)
	id 1railB-002Qsh-QI;
	Thu, 15 Feb 2024 20:55:09 +0000
Date: Thu, 15 Feb 2024 20:55:09 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Carlos O'Donell <carlos@redhat.com>
cc: Siddhesh Poyarekar <siddhesh@redhat.com>, 
    David Edelsohn <dje.gcc@gmail.com>, 
    Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
    cti-tac@lists.linuxfoundation.org
Subject: Re: Meeting to add David Edelsohn to the trusted introducers list
 for the CTI repos.
In-Reply-To: <034863fa-201e-4f06-a6b2-f799011cfb77@redhat.com>
Message-ID: <12eb3516-8df9-d771-de20-faf3e3c8f235@redhat.com>
References: <a263ae8e-6d86-48f3-a4f2-98e4560a8035@redhat.com> <CAGWvny=YNRCLK02Lh7QCwsuP4T7btJqrtiydpG6ZFM8jM+9VxA@mail.gmail.com> <CAAmeS-bm2-dtzPok9dif6-U2FJ0cajyv0LhV0J6JPhSmzOX5Lg@mail.gmail.com> <034863fa-201e-4f06-a6b2-f799011cfb77@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Feb 2024, Carlos O'Donell wrote:

> I've sent a meeting invite for Friday February 16th at 1230h EDT.

I send my apologies for absence from this meeting (assuming you actually 
mean EST).

-- 
Joseph S. Myers
josmyers@redhat.com

