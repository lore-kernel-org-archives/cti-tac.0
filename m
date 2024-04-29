Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29176194C70
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 21:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714427913; cv=none; b=tzaxtHp87418swvzIamNvIS46J6HmBjVjYOw9tXwB3mKRliTEb6k2GETXfzkRzxoMscce1/9poeMipmi65pdu03DLCph1D5Tj1gm8ADJEwBHO019OssH+ThooFWGxGXs0LpdThtGvRacnECiWq8uGjTTP1C7MpyX5cWGcsvSsaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714427913; c=relaxed/simple;
	bh=gU3oy+16KBVOKinsbetEN8H1S6La/HQi6YpixyoLSJ0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qNzasT8xLLR1+AB4gCvSR4TIINqQVuE/7rPfT1afGZ30BgHMMb/QAPtSLEBaGpCftW9KI/zX7Kuwd3x9U2oeqmgSYU6lSrpPrX2luggIIGFGa2v98AsKKmpVfppeb0ZQAct0mCO1/fkeUvjQxnv1mZ0FfBk20C0C0M9CwyD3hDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i4b6Yqtz; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i4b6Yqtz"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A265A608AD
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 21:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mx_3vq3s4Xvj for <cti-tac@lists.linuxfoundation.org>;
 Mon, 29 Apr 2024 21:58:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=josmyers@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D7C6A60644
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7C6A60644
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i4b6Yqtz
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D7C6A60644
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 21:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714427908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dq4xaRYY5bsqTD35Vrdb/f7wSN1ryzoome7KPuF08vI=;
	b=i4b6Yqtz+uOqIiBWqLM1cBa3VQCPjNutxZoYsz+h8lvj/Zaqw0UNRKNuxqbF4qltYvZj6a
	o95LgOED1L4A1sJtC7RpTszI73OwEIi6awXtY7qA1/Z9Nl90/ndHJLjmRj+D0ObYZb4Av9
	LBHEh2vp0tYoXD0N9t0sc1TiadZdJGc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-fY34Kd65NmWIpUdYrs-ISg-1; Mon, 29 Apr 2024 17:58:21 -0400
X-MC-Unique: fY34Kd65NmWIpUdYrs-ISg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-34cc03913a0so1388495f8f.0
        for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 14:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714427900; x=1715032700;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dq4xaRYY5bsqTD35Vrdb/f7wSN1ryzoome7KPuF08vI=;
        b=ZptMti4NjiMiCYJgBjmZ3dgQ+YdlTr00IfHVQnJYlEjKCoV0w9Io/Lrx2tenRN+V07
         l95f6+yqnrXroIxPJapJvLkpEt/Vb2rSrRNLKtHME5KYt2E5nxNY6v4fJr7cyIXBFGn8
         F6tSr7I/5mTUy6ehnhjsQIoEzuRifYYcFxnisFfZZ0N5pUMxq25DHw1gXr3C8R9SAI4x
         AP9VpAj3dBpm5c9IgrAc1WwAyZ7KMzrxzya/iSKlvYNAIXvazSHnVNKW5O76t7fDJDSh
         1PdDQS7cqfihLfW48LR3ui7o8GSlX03nZgOrVAecD3m8dlywB7ojSWw8X6T4ozBbVZWK
         ngGw==
X-Forwarded-Encrypted: i=1; AJvYcCV/oMv5hOpEctNWOcYKaQpOVNhyvXw9T8/wTtSYeMNqeuYHTTq1DQKRbGnqw00X5oYWjwmj0HCZAeJU4/Vb/mPddQ2AYbeKnDl98zwisNf48tI=
X-Gm-Message-State: AOJu0Yxnhwh8W0OtJoN6vhDCKwvRRB0ns1dIFkpHp4xADxR2VR1X6AOd
	7mgozk8EL14zOC+SP362jvoHjwE7Xfb0Q8CrSqmvuXPKsvYEif2oxVBNakSUzmcfGD2/iX0hZbC
	eKHlTLKi6vRhj7vE/q8WGRFxCghf8Pw4L915RexBJYL0QEl6w3wnou9Qw19ViHxc6fLzh0rHP+C
	Er
X-Received: by 2002:adf:e442:0:b0:34d:7d03:45fe with SMTP id t2-20020adfe442000000b0034d7d0345femr107533wrm.23.1714427900201;
        Mon, 29 Apr 2024 14:58:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcehnorPXLhWv1m+a9jJKcfcs8gDtvS0UKUddO/d0RuwWB7NziRGOIMRIzr+LkdfTtARALsg==
X-Received: by 2002:adf:e442:0:b0:34d:7d03:45fe with SMTP id t2-20020adfe442000000b0034d7d0345femr107526wrm.23.1714427899761;
        Mon, 29 Apr 2024 14:58:19 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id u17-20020adfeb51000000b00347321735a6sm30496863wrn.66.2024.04.29.14.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 14:58:19 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.95)
	(envelope-from <josmyers@redhat.com>)
	id 1s1Z0s-003OTU-AH;
	Mon, 29 Apr 2024 21:58:18 +0000
Date: Mon, 29 Apr 2024 21:58:18 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
cc: Siddhesh Poyarekar <siddhesh@gotplt.org>, 
    cti-tac@lists.linuxfoundation.org
Subject: Re: Hashing out the scope of work
In-Reply-To: <20240429-rousing-mamba-of-improvement-cabefb@lemur>
Message-ID: <30dc33a-69de-39e6-fe7d-bd21c99ccecf@redhat.com>
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat> <2293a3bb-5780-ec5a-ca72-e19671dccb51@redhat.com> <20240429-proficient-pastoral-whippet-bcc376@lemur> <6d25ccc7-ef3e-a885-b085-51185c23c91@redhat.com> <060ff9e5-785a-4963-8d92-2638db3228da@gotplt.org>
 <de67e18-d847-717e-a8d-dbfe7d2044d7@redhat.com> <20240429-rousing-mamba-of-improvement-cabefb@lemur>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Apr 2024, Konstantin Ryabitsev wrote:

> For example, for bugzilla we'd need to prepare a query to filter bugs 
> and comments by product and component -- to only include those belonging 
> to glibc. However, how do we go about filtering users? User records are 
> not tied to a specific product or component. We can try to have a large 
> query limiting the users to just those accounts who have commented on 
> glibc bugs, but this is going to be hairy -- someone could have 
> commented on a bug that started out filed under a different 
> product/component.

The simple answer there is not to filter users.  It's OK to have more 
users than necessary in the new database.

We do still need to make sure things don't break if migrating a bug that 
was originally reported under a different product/component, whose history 
might thus show changes of product/component/... from values that 
shouldn't need to exist in the new Bugzilla.  But as long as things don't 
break, it's OK for the history display not to show those details of the 
history that aren't meaningful in a glibc-only context - to show them as a 
change from <missing-product> to glibc, for example.

> The same problem is with patchwork -- migrating just the subset of the 
> database that belongs to glibc lists is going to be very difficult, 
> especially with the kind of data model that patchwork has. Is it the CI 
> data that you want to preserve?

I think it's the details of what patches / patch series still need review 
that's the most valuable part to preserve and migrate.

-- 
Joseph S. Myers
josmyers@redhat.com

