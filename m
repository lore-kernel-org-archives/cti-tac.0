Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054CA13D2E3
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 23:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709163369; cv=none; b=lDDf9I+gz+wKQhCq24A0cSHKSFWiCuKM/pllTlkZARMpj/+YP+Lv3B7Ayexeg2BJJGyPl8w66v8BxgaBhykUP0uAipras0lpLtvA+hOyzzUi89fVgiu06p1exoyWGMsS2crRBJ0/Xrip6bKxmRQxWBX4PSyr3YQ1ylqaDK7xui8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709163369; c=relaxed/simple;
	bh=y2rFSNttj4pZ149W4u4fPjPuyHQunyCDznP7o/XvS2k=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=PfdUCq2bHVXNp1Xt2c7wNbzzcVfBLUSqwNnm+VUY1CL/awY9JsnQPYf0bkuD2rAK+BpGAXH7g+u2Y1qwHeMg1aWVnpGfWvGsNQP1stI63L1/sdLA4IL8u5629yoOWPwcRHGjbMA9vg2UFBhJ7x4PTkmcLV08VrZQ8Igcw4b7kX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HLPt3OuF; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HLPt3OuF"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8905960E62
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 23:36:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zgFd-jarnbSd for <cti-tac@lists.linuxfoundation.org>;
	Wed, 28 Feb 2024 23:36:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5BDF860E47
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BDF860E47
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HLPt3OuF
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5BDF860E47
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 23:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709163361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WZtBkIss+zW/lIapjxe2xQzDThmm574JYzuScm80C24=;
	b=HLPt3OuF0sMfKyFC2LNcl4C7AweB/mntu94CusySFAFvcopq3SIfE6+edHPpN/mItCfe4y
	O5OZZodeg2hwNitS8BvquesUw5vs+oqNBueVBptxUThmGEVQ4wa9r8h+ILLYV/w0ya81rh
	hmjAm5i1b8TDRXOtXLwXdqsvavbGd+g=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-6qL4W4roMtOZ9nM02_LO6Q-1; Wed, 28 Feb 2024 18:36:00 -0500
X-MC-Unique: 6qL4W4roMtOZ9nM02_LO6Q-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-787ac304610so30605885a.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 15:36:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709163360; x=1709768160;
        h=content-transfer-encoding:organization:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZtBkIss+zW/lIapjxe2xQzDThmm574JYzuScm80C24=;
        b=MPxD0Lhh/XO1dAdjyV2yk7VgvFd/Z78Ctb9B2CE0G+rJ0+WZWCtauLDbFijPx8no/3
         bp8Nce54/TXd3IFVMieY4EmeAJnc62aDPeBRqwzP50rFpKJ6E9F6Z7gs+2FN12ydOiWW
         luAMUTICT9hr4CGwTOf/ppbs8EyIAS+oInwLpQl7MfrwZ8b6RtHWTf//WOUUaUKHTdkW
         He+HFJuXRlLvOQnfYpJZGs00o9L4nJGiNu6OwnOpqFnzZFv8/e5u+vkoQGzOMZWJXUw9
         RAL+tofbMB5OgYyFM8P+qjmh1m/rNVOuQe1bOyIhixg3kEd4alJ3WG84CKs4wLrsrBsN
         6Jag==
X-Gm-Message-State: AOJu0YzyAB4N+/OKRc7TrFY2BJKLxiy9TFtouZ4lE35ZCr47S/1YwhCV
	/bwL3RsTrgYYUJbXZZf2tt0MA8C8mh8YTtffDh0lnT6pKyZfSlk1xRtCNcijdRoYX+ncJgSP3bI
	p/VbePVUJeFPCt819LTUns9umjYhh+LpJVu2AmJLuFlZiN46d9Ciopoim5oe1tU1CSI5s
X-Received: by 2002:a05:620a:530c:b0:787:aa86:b296 with SMTP id oo12-20020a05620a530c00b00787aa86b296mr531098qkn.54.1709163360089;
        Wed, 28 Feb 2024 15:36:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1hPAW8YOAZz+qfxjcRWMiWRgVazrkJSY8UTQzTCAow820NR6lBRrWOYRxz7HyiYLY/LkwLA==
X-Received: by 2002:a05:620a:530c:b0:787:aa86:b296 with SMTP id oo12-20020a05620a530c00b00787aa86b296mr531087qkn.54.1709163359829;
        Wed, 28 Feb 2024 15:35:59 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id f14-20020a05620a15ae00b00787f0356387sm103582qkk.130.2024.02.28.15.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 15:35:59 -0800 (PST)
Message-ID: <67e9372d-9fe8-4a81-b43b-db69ed3c2b06@redhat.com>
Date: Wed, 28 Feb 2024 18:35:58 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Myers <josmyers@redhat.com>,
 Siddhesh Poyarekar <siddhesh@redhat.com>, David Edelsohn
 <dje.gcc@gmail.com>, Nick Clifton <nickc@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: Please review content for cti.coretoolchain.dev.
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Joseph, Siddhesh, David, Nick,

Thank you for agreeing to look over the content.

Please provide feedback on structure and content.

To review the built website you can do:

$ git clone gitolite.coretoolchain.dev:cti/cti.coretoolchain.dev

Then you can build the website with:

$ make html

You can also check spelling with `make spelling` (requires installed
sphinxcontrib-spelling, which on Fedora is as straight forward as
`sudo dnf install python3-sphinxcontrib-spelling`).

Nick,

Please send me the pub key part of the ssh key you want to use to
access the repository?

My next steps with Nick will be:
- Face to face meeting where Nick reads his key to me.
- I will then add the key to the CTI keyring and sign that commit.
- I will then work with LF IT to give Nick access to gitolite
  and write down the procedure in more detail.

My thoughts on this topic are that only one trusted introducer is
required to grant a user access to the repo, but this should not
confer trusted introducer status (I'm using Nick as a test subject
for this process).

-- 
Cheers,
Carlos.

