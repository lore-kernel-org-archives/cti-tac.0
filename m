Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32A2137C43
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709842825; cv=none; b=JSthkD//yftWOvAnS2E7xqELqXfEPCUnZBhvwC2ao8X/obCNozSb62NEPaaS69xg6obIfjEJQ2i1335nErrAQYqJFQ2qQQLfGtDlG/YZ3qvtSw3f0Vt0TC4S9z9wpo1RjAGCm2CKR1+Q3j7bIyJY+JJFDSjLtKJuDTVCysMfSFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709842825; c=relaxed/simple;
	bh=56ul20R+rYOxTWTfPXRhCnB7LI4WvUkHxqdvv71N7GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YxzCmSX4a8eO5vZ5MCHN08oOzej6L+IXaI/FEgr6/saYmJzGVeFB5o8ms7fBJVmIrLRu4DPimRBNz8LbqpnY3zHrn5QKaqDgp5IOq3W2E9ekDBvXf9mJX0OBprxlDbcOFzE+jC0VKoeBgF2oKENhysWBDb4/w3FCdUy9ajxsYKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zo/EdMeX; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zo/EdMeX"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A15E406EA
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:20:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IKwIzt4-wBQb for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 20:20:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 874D3406C6
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 874D3406C6
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zo/EdMeX
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 874D3406C6
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709842821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVS5kZwIHwdG5oUrdmMTlQMsbwfUHS/rlpIS8G7Lzg4=;
	b=Zo/EdMeX/nuYCYmXd9Kh6qhZNVGXI/lzoLDfMDLBMsV88g6UvAdJHyTevW6Q8WA6njqjdz
	62to+d1BclEJUArXjx+Q2lIf3gLNVRr5B2nujzYy7Iz1snl8cqAPJrZOAJBDtwyWkQewFg
	xHD77jz4RuUcIUkm7OsZRcK8AMFtt2A=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-0ieauUJONgWJAl-bGi0nfg-1; Thu, 07 Mar 2024 15:20:19 -0500
X-MC-Unique: 0ieauUJONgWJAl-bGi0nfg-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-68f74aff2b0so1362856d6.1
        for <cti-tac@lists.linuxfoundation.org>; Thu, 07 Mar 2024 12:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709842818; x=1710447618;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mVS5kZwIHwdG5oUrdmMTlQMsbwfUHS/rlpIS8G7Lzg4=;
        b=p/IVWGMQJ0QcbDm7epY6GmxU+iiMuy9Hm4ej3goYFEnU51tx/abCXu76+4Y971zxFG
         +hCCk7YWeASGS17ptqURTJ5ykyO2E5mbkcWND3Y62ge932qBNscMOMAEIfKbTiNyYLb+
         TEILbvlq5NNPiYnSJaocJnRFOhp7CHykMt/s5Al+paDcJgsbRPQCkbCoyDE5tHBuIYG/
         yIMgW24aAyG2MMuVJZer2rBmHUiOXI/Ff906sTR8wqXVca4/rh9U7IqlkH51fwhhbYbV
         z3VY/WLeUz0+r5w7fM2vdn1nQeCd+VYu/7yiZLHbRh1liFL6mdvD/Jlp9IHj0ufaUmJ1
         hl7g==
X-Forwarded-Encrypted: i=1; AJvYcCXgLvr0Rkm8RjTFE8e3pj5GKVEE5wkk29pJ9abmtWGi1o9dQJfhQVYolJYrTBgxMgnyyBXGLFDwzB8o2+kgqhR7k0w1dPoT6bqoBCStPy5bj9c=
X-Gm-Message-State: AOJu0YxRV/yrADVr7i4U44Qtx/ntyYX8s/X1zYF+otfCC8v4fRpNdmCM
	GOScBYn6b8KCkwDjgRaXamzX5TINdhph8qwjpaKcFS5gGRwjT+7GCjsBrjTq288Xd+pHLZ1/Dh3
	WkIlnpSf0YT6hGA7LAYK389cEFC9PyjJkHBy/AJmfy0KI1i3gxHnAlBGQ8QQnfkpYHloQ4BOvgL
	Ey
X-Received: by 2002:a0c:fbcc:0:b0:690:96a3:5da4 with SMTP id n12-20020a0cfbcc000000b0069096a35da4mr6073459qvp.62.1709842818347;
        Thu, 07 Mar 2024 12:20:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcbOKsYJF9Zca0Nh7oheWPrP2leC4bIti6u/Cb9qfhRH3qUhVZfqj1af8clkHwSqrUf2kL7Q==
X-Received: by 2002:a0c:fbcc:0:b0:690:96a3:5da4 with SMTP id n12-20020a0cfbcc000000b0069096a35da4mr6073448qvp.62.1709842818063;
        Thu, 07 Mar 2024 12:20:18 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id lr10-20020a0562145bca00b0068d191dfa9fsm8997451qvb.94.2024.03.07.12.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 12:20:17 -0800 (PST)
Message-ID: <d0a99699-911d-49d9-b638-7a475cee0282@redhat.com>
Date: Thu, 7 Mar 2024 15:20:16 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: suggested website faq addendum
To: "Frank Ch. Eigler" <fche@redhat.com>, cti-tac@lists.linuxfoundation.org
References: <20240307195951.GE5062@redhat.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20240307195951.GE5062@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/7/24 14:59, Frank Ch. Eigler wrote:
> Hi -
> 
> As the website git repo is not public, I'm not able to phrase the
> following as an actual patch.  (Sorry!)

Thanks for the contribution Frank!

The plan is to make a read-only repo, but until then the sources are published
in the same way sphinx sources are published.

For example:
https://cti.coretoolchain.dev/_sources/faq/index.rst.txt
will give you the sources used to build the FAQ for the live version of the page.

Please feel free to provide a diff to the sources so we can look at your suggested
changes.

-- 
Cheers,
Carlos.

