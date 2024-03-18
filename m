Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD653214
	for <cti-tac@lists.linuxfoundation.org>; Mon, 18 Mar 2024 04:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710737879; cv=none; b=psC+TpNLJ5pVMqcySZO6GIo+rTE0uVYsbi/TtPJddldyeheqahYqk0/b3t1/O32HKPAeI+UKYk1ekCNILwiDSTiH9ZAcxczHU0P4QD7FtDBh5UYj0dEkxDCh4fUKoZKIvuGE/LCoorVTWHv0H/9C4KNaY1INt1iL0z21w5mVI7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710737879; c=relaxed/simple;
	bh=14Xcjg1kmIbwKa28XNHS2OyDPYq8pOZrOco9+CLImuc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=mVFCUIcF7BelxUoavJXFugpKJZ5cMDA1DUCx/rfz1SiP33jBoCLiIWSLtDf0S030Dkw1fLBTOrsKu40su+g/c7osr6yvDhvFXN2He4BqffxNBW+PnP6L+KlM9496x01C3uv7Cu3NFFrKK9XnSR/7+MxCrAy5YoZedNwKGD2Cka0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YAey8LgZ; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YAey8LgZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 293384056D
	for <cti-tac@lists.linuxfoundation.org>; Mon, 18 Mar 2024 04:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NNVXzA_rMQAh for <cti-tac@lists.linuxfoundation.org>;
	Mon, 18 Mar 2024 04:57:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=codonell@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D29F4056C
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D29F4056C
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YAey8LgZ
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4D29F4056C
	for <cti-tac@lists.linuxfoundation.org>; Mon, 18 Mar 2024 04:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710737875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=14Xcjg1kmIbwKa28XNHS2OyDPYq8pOZrOco9+CLImuc=;
	b=YAey8LgZ63k2w/XwnJsOX4ge7ZvlS0R9tzvKh8iCDst071FTJmrQWQKhiEq5CWCfbW+/NB
	xfs89G0ikECz39FfmiZt76AHzrLHEqaNVCZDyDv1I+0uigUs5x5CEyJG7KYg7yja4QejTT
	AFPbh6qyqRYN09bt/m5o32Q5oDTvXpc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-g1tr_QjRPg-92fCejtnB4g-1; Mon, 18 Mar 2024 00:57:53 -0400
X-MC-Unique: g1tr_QjRPg-92fCejtnB4g-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-68f7572bc3dso73529146d6.0
        for <cti-tac@lists.linuxfoundation.org>; Sun, 17 Mar 2024 21:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710737872; x=1711342672;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=14Xcjg1kmIbwKa28XNHS2OyDPYq8pOZrOco9+CLImuc=;
        b=dvAYsLxFZpADSJ51EWvhDfnwzK6NbhkZET+fSVH3/b8VJ2oWH5wyET6y7osbYx/PnW
         SgBu6pczAFNsv+OxegZCOvwwCjbjFJ+XJ06qPu7dn5xw10hBfbRqcwmy3kUiPj38bcM+
         2oIVtdjLPIduVMkdMnvXoN1oM4sge7irubl5CHOvCdT2U4OcRWVn2rg2t1pgIrjKZS1Q
         3cfZTfb1WHP1glewB8HG2JenC6CxlM3RlIZO9x+f4sIu8c2i50ig7u7VXJoSRJPPSESd
         k3TXcKQLF6dhFXJPEwuDq0DDX3dzEx+a0bvvUbniCkBEeT1NZvai6YEI/OpLWdN6+Y+e
         pK/A==
X-Gm-Message-State: AOJu0YxY5NLmg/t6IFiTbEDM/5RD1g2gRljaHIw9z8J3+H2la2wcaSNI
	TiLN0+E6jau4wFHuS3+OyoVDEw8+pMWXs5sgoiMO0UeIpRW/T0wM1h4XWd26ACMVHfWznIb3Zfa
	DizhFDX/SRCkQueK/249BA3JD3LDx814DaTW1s3WmZS59qMt0l04iwRy0iZls+6QumDzFpovP2W
	4Y2z6Wl1N5BY9miwYHCMo6uAaIcCh1C1uxB7yHTm9d6yTDOVXx0iWYzw==
X-Received: by 2002:a05:6214:bc1:b0:690:4942:dd89 with SMTP id ff1-20020a0562140bc100b006904942dd89mr10708897qvb.28.1710737872729;
        Sun, 17 Mar 2024 21:57:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH7gCUEvcvfA2tE/mCMk8vizadIs8ba5mgg6VJ8LEDia5FEjp8Rm+tPyy89nQMB7FdbRAmB+ghud71tEWyoKc=
X-Received: by 2002:a05:6214:bc1:b0:690:4942:dd89 with SMTP id
 ff1-20020a0562140bc100b006904942dd89mr10708894qvb.28.1710737872470; Sun, 17
 Mar 2024 21:57:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Mon, 18 Mar 2024 00:57:41 -0400
Message-ID: <CAEMqeSr3i5CJU8xAn1fsFwrfQ8KCwRwPS8sm9T1v_h+vO-ztig@mail.gmail.com>
Subject: FYI, Tuesday March 19th 1100h ET - Present progress to OpenSSF TAC
To: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

TAC,

Just a reminder that we are presenting on Tuesday March 19th at 1100h
to the OpenSSF TAC on our current progress.

There isn't anything that we haven't already talked about here,
particularly that the CTI site is live at (cti.toolchain.dev) and that
I've asked Paul Eggert to review to see if this meets Paul's
requirements. We are at 50% of the glibc maintainers voting Yay to use
the new services, so I do plan to start working in earnest with LF IT
and Sourceware to define what a migration plan looks like.

Cheers,
Carlos.

