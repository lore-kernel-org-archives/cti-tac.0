Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF9728DCA
	for <cti-tac@lists.linuxfoundation.org>; Thu, 28 Mar 2024 22:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711665854; cv=none; b=dSAruCwLmwbuNyDs7XzM66i3HKG0leu89DpFUdKDv4AXfiCNoTsvYovuFIrTeddri2JcoB5Jqa8qjkhwfczakk7i2s7QwO/Y1r5hNiCKvu+HuubIH3PSF7mQr/6HJwwyHMbgZ/M8UpOxmu6eoHY4ZGGBGsytKn1EfwkPPleOLw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711665854; c=relaxed/simple;
	bh=SJaEgIG4v2/qFKE28WTM4yQCK1BkdB3m0rgind7hHnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mF1cHSWndtQfg6zruqDhJxnjeHQYbqxgQGUlP1fgGC1gbsi9IKw/Fb1HL/RCTCxYmEhkH9SZeDZEnGFY/dl6pGhL2N1yLhXTNeXpGF7qJjCNEi+9+cvGWK/PY+h7OEqn5YQBtxLkV3EJAR5bf3Rq94HNsrhpJv9cqSlfcpFfh14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I8K3kj+E; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I8K3kj+E"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD2918272A
	for <cti-tac@lists.linuxfoundation.org>; Thu, 28 Mar 2024 22:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.599
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zM0XMWALbHa for <cti-tac@lists.linuxfoundation.org>;
 Thu, 28 Mar 2024 22:44:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=codonell@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 34318826FB
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34318826FB
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I8K3kj+E
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 34318826FB
	for <cti-tac@lists.linuxfoundation.org>; Thu, 28 Mar 2024 22:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711665850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SJaEgIG4v2/qFKE28WTM4yQCK1BkdB3m0rgind7hHnA=;
	b=I8K3kj+ECqMXKs3OV3kYCSltxI0MfSPv4F+dINl/BKyvO9huJ1CHE7h7+Jx8bdTIl8OdT6
	FU+VDX/y0c68izkJX+eZiNbM+d7ims5OrG3po4VKTW0RCGZAzim8EJu325sA4fgBCpt12G
	zi44k/vDO9uS3M8s5UETwwKyVbNprnw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-qy0IcAzbM9aZtXK-FqmuvQ-1; Thu, 28 Mar 2024 18:44:09 -0400
X-MC-Unique: qy0IcAzbM9aZtXK-FqmuvQ-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6986f2dba1eso12966066d6.2
        for <cti-tac@lists.linuxfoundation.org>; Thu, 28 Mar 2024 15:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711665848; x=1712270648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJaEgIG4v2/qFKE28WTM4yQCK1BkdB3m0rgind7hHnA=;
        b=gdoSAg6RLqK0kWNZCskxf25hpVoNcrNT5k4VXLIbVb5Wnxmcy2hXBSqrMRTBO7kre2
         T8qac/Soyp8JbjIozc70nr04Ws7/KbRK7PKsGZU69uV+GcTUzJVHSMheob2QPOdP7zBr
         Fav9odjNflrNycfrmvblSwiHi+3EN2LhcRXRZjwqjqIO9APrj2tfVO11bHPwKRCtfLMS
         ss/qV7Q8crmQMsDGRBZMupJdfdJKJ/6ObxywU7zeUc3Bz5LSNcR+NsaArompQm+vORdp
         jFQJPhlXvxuhnWPZQW3pATvhlykY/CCRfUt16EEwYQkNW/KVCbieRVWOHWeq0EUDLs2S
         ZpAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVncj+gaBnIU8e4wxfKWODTbfAPH8QB5MIzBfs4ESMIVgMou10f0zg9Zvte8TRnQX35pGqRIno6RWJjfKss1+B3j31WaHOY1ygTQplbnLn0WxY=
X-Gm-Message-State: AOJu0Yy5XmwcMRY1IpWNXsUAlzvES+bA2NeF4X5+j7L63vn9cO636ZSW
	M4y1QYXB67rr4xGjQZP8jwXkF/ggH+sH9zNPVH+f+091bqvp8ronc/H22EgbOl1fHn0tyIH/bbI
	KdBbyFer7MyPI5yGhSMvR7uG0n/fqM7+A5Kao8ECM86G89bgjX4Tyotw6j5n0zpacvLXeIQv3St
	FSlFpnQ0fFnweyTgGnHDJ+FyytNGVD7zAhgRUFjU8t3DI=
X-Received: by 2002:ad4:584a:0:b0:690:a576:2a2c with SMTP id de10-20020ad4584a000000b00690a5762a2cmr645405qvb.32.1711665848721;
        Thu, 28 Mar 2024 15:44:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9TmMP7VWBnotuwcvgW2avlgH/0wPfF+sHS41X7Qk1yNgEXQkYK8fV2wq4N1v9z6FbALjbjlleGZ31vPM8vC0=
X-Received: by 2002:ad4:584a:0:b0:690:a576:2a2c with SMTP id
 de10-20020ad4584a000000b00690a5762a2cmr645391qvb.32.1711665848463; Thu, 28
 Mar 2024 15:44:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
References: <be7265ce-3df9-43db-a217-5a036f717382@redhat.com> <CAGWvnykD2tjWhvzT0S_62daU__w3Fa54AzRoZfCffzz7d5qTkg@mail.gmail.com>
In-Reply-To: <CAGWvnykD2tjWhvzT0S_62daU__w3Fa54AzRoZfCffzz7d5qTkg@mail.gmail.com>
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Thu, 28 Mar 2024 18:43:57 -0400
Message-ID: <CAEMqeSotXiR29tvVssV5U6+pr3=6U2DSiAzGC_R1rYL5a0sxzw@mail.gmail.com>
Subject: Re: Setting up an LF IT meeting to kick off the glibc service
 migration plan design and SOW.
To: David Edelsohn <dje.gcc@gmail.com>
Cc: Adrianne Marcum <amarcum@linuxfoundation.org>, 
	Bennett Pursell <bpursell@linuxfoundation.org>, cti-tac@lists.linuxfoundation.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 4:23=E2=80=AFPM David Edelsohn <dje.gcc@gmail.com> =
wrote:
> Joseph Myers <josmyers@redhat.com>

Good catch! Joseph Myers <josmyers@redhat.com>, is correct. I thought
I'd fixed that but missed it.

Cheers,
Carlos.

