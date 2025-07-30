Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBECC29A9FA
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Jul 2025 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753880410; cv=none; b=GDa+GCDraS3r4DX0EqfjBQK0ISktmxvF8eO8XfhXNWfmyVPzfyWhsiMSUKZ/Nq9tiW6BCB5TsC4VIYPX8/T9zXgDZMvQ5Peb2uk9X4p4bn3im8JYVcBdEu0FLschwrCeK/4NlNuoRy7sg5208C4Wes4FpQqVpXzq5XDg09dXJ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753880410; c=relaxed/simple;
	bh=RhJQSdnbumXcXUV5T2xSTJxx+CAY/k3VHS+S998nchQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=iMcJRm7pX8wYblXuAk/sOnScwe8lGYfmRHPd5/45dYjhN0U3/yafO/buvuN3zWK5D7qc29MxklhvHED9Ihx81hQiwGCbYuDLBohWOK1Szx95i1zNJTolJ9vXzW7G5SQPEwBYojiMemdo3miEbKe+XtwDYVTcwS0QhAiiO5yoHa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b/m8DXPh; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b/m8DXPh"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5729B8290B
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Jul 2025 13:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fU-7cFgfdj7 for <cti-tac@lists.linuxfoundation.org>;
 Wed, 30 Jul 2025 13:00:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=codonell@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A5F5E83D7F
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5F5E83D7F
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b/m8DXPh
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A5F5E83D7F
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Jul 2025 13:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753880407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RhJQSdnbumXcXUV5T2xSTJxx+CAY/k3VHS+S998nchQ=;
	b=b/m8DXPheG10MPCW+uSF+9w2H/A7sJ5zZWaOqD8KzqEJHsx/WdCLbbE5BlhN1v03wqazIP
	fTlf9qnlHYrdYi9Z9txWHjMUXoe4GA9/z2L9e5kqBp3tXeSPR+I/r8bAV0qLIiG8h9TpfV
	G6Ppr6qOhmV36Dj52JqesRGx6aQL4iE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-p2YjNlIzOXWZjsgpJBbZyw-1; Wed, 30 Jul 2025 09:00:06 -0400
X-MC-Unique: p2YjNlIzOXWZjsgpJBbZyw-1
X-Mimecast-MFC-AGG-ID: p2YjNlIzOXWZjsgpJBbZyw_1753880405
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7073140087aso67912486d6.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Jul 2025 06:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880405; x=1754485205;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RhJQSdnbumXcXUV5T2xSTJxx+CAY/k3VHS+S998nchQ=;
        b=UL+jiVumwYXZbPK+h+llXuJ56PVA09qvBNRiHp7cVqgH4bMBK06xkFTKSTs3gySAWw
         a832Mgaq6dMGjbsl2SuG90odQRQffKm+9GQ5mFNQGjmglA79/cgsWso50IIGorIjUOf8
         kIVytUV5fsl321J4wIOZ7a3EXORKAqKxyW5+tRhuXtPMQBq13KYnfXOwCOGyTAcwCaNA
         Z8tdB5mR1Fp3hKi8cTZxIZsoGrtvQBs7jJP60vyy853NYvN0OGhXYbQ5Fvt5HGlaL/3S
         ulDeIwDpghJ2nb6Oeds5kXPuJwbqf2KQ4TV8FJ1ZDfdOSz3eM/42F2oOvOYQ8HPf+/e+
         gMBA==
X-Gm-Message-State: AOJu0Yz3xned1U3OAWVMwrFK18ZpUlYl7YI6nJYUSfYEr2xQELFVuUB/
	mBmlnlIaJEP+uPwkAbp0uKAYCJ5w1ZWyUFCAj5Kj+l+MzD+eMtL5fuA9M7UocMXk+YeFxr+hf6T
	nB+rg/W/kfkUuxUhPuha+ZQatMYrvygACGZ/UTsKJeT3ugMzZahRcrg5ZURORfev1VfUwuKVb2j
	MeS+ZvzGS3jEUY4TZeYKAwIsSv4z2peAPssjMDHdg4DrYT/kfAESlzE+c=
X-Gm-Gg: ASbGncvrg/8+j9vwjNxqva8VBDAH2qyJ8KS81vkHasDWGRW+1NgoUm1YtVlWYl8SBIq
	5/FZHkLybMCMeN9eEyivgF21pNOW9lR3TdhW1KqdJqFNcF75piK2tKjy8Ah74q2zX4745JP9P6e
	02AH5H1Lulf19Kfsrng6Ge
X-Received: by 2002:ad4:596d:0:b0:707:6306:28bf with SMTP id 6a1803df08f44-707672d2c61mr47179266d6.36.1753880404924;
        Wed, 30 Jul 2025 06:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq/k/rgrbAT6LheddgIJ8tkyG7YDn8B2kP49sMi+s3Ny2nN4pZM4q/K4tye1xg7edb1ao8ONEgs7qst1+wvyc=
X-Received: by 2002:ad4:596d:0:b0:707:6306:28bf with SMTP id
 6a1803df08f44-707672d2c61mr47178366d6.36.1753880404161; Wed, 30 Jul 2025
 06:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
References: <20250730125747.1074158-1-carlos@redhat.com>
In-Reply-To: <20250730125747.1074158-1-carlos@redhat.com>
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Wed, 30 Jul 2025 08:59:52 -0400
X-Gm-Features: Ac12FXw0rQby3pyp7jnI8gowX64csBSD20ueGBunMuLBZgCsj-HCRSEVKPx76N4
Message-ID: <CAEMqeSrxZhY-Nvq4LjDZE7TqUdvs9KHyRmCqCSSixD2g1v-d=w@mail.gmail.com>
Subject: Re: [PATCH] gov/charter: Publish existing CTI charter.
To: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YJjiZKc7bgkwcoVu1frnraloU1wjNffRny50Zvt-C7o_1753880405
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 8:57=E2=80=AFAM Carlos O'Donell <carlos@redhat.com>=
 wrote:
>
> Signed-off-by: Carlos O'Donell <carlos@redhat.com>

As discussed in the last CTI TAC meeting we agreed to publish the charter.

This is pushed live so it should show up on the site after a rebuild.

Cheers,
Carlos.

