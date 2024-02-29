Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD3A1419A9
	for <cti-tac@lists.linuxfoundation.org>; Thu, 29 Feb 2024 14:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709218553; cv=none; b=UF/TqrpUpMZN5saclReRYm+KGVI+L6AvCxDzsZhA8SxfZpDyzin7U6ze0jJtcSrTi1Xbq5pRYSjkNoNgDCQZ9RKsRk2gdaybWPILDhZCizWezljtDHbxLzeDS2+Py1sYO0NQGkQRi1BC99iTP2hWjT8GxhKtjcvOIxDDnVvPepE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709218553; c=relaxed/simple;
	bh=cSLF2/tTN8wSSemZeUbez5K9oYyWmvox9KFPTlXh/IU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=oV+hSFcgBeFOVfdTOZvvULkvbIaY9boEMt1xdd4rDPI9Vv+7YnJRsGDCss7VPxWVmPxUygvJ0hqgo3apcMfEMegqnxxkkrjo+7CycBneEXzC+A2HVH4xnXvLilF4ThxnFhOyZx20rgZhlNNUJ1PUdnx7VzfWrMzzshX6SC/TFH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TtmMHd31; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TtmMHd31"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6169B4185D
	for <cti-tac@lists.linuxfoundation.org>; Thu, 29 Feb 2024 14:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id upqnOnzeIxQv for <cti-tac@lists.linuxfoundation.org>;
	Thu, 29 Feb 2024 14:55:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F1BA41857
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F1BA41857
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TtmMHd31
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9F1BA41857
	for <cti-tac@lists.linuxfoundation.org>; Thu, 29 Feb 2024 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709218549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BopHp1fjNdOgMW/HtjZicH/O+0Zs23WAOPKC9hRJ18o=;
	b=TtmMHd31x/BNf1Plz24m9gHIN3qWmd1/EmzKqCr3O3XzpmO5qtd75OdrjYkjomttDIQykf
	PSFETDpW5cbgbxg2ucqrawPFN0FzMtV2tkEhd8OGz2CC9k1tDdTFT9ZxMYDwZ3Wiohexn/
	3QqFivT8VuglYKLBLrFiyn5Q99DMl+M=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-Lp_p6h7FPXmNZJszb-kZAA-1; Thu, 29 Feb 2024 09:55:48 -0500
X-MC-Unique: Lp_p6h7FPXmNZJszb-kZAA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6800e52d47aso47320046d6.1
        for <cti-tac@lists.linuxfoundation.org>; Thu, 29 Feb 2024 06:55:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709218547; x=1709823347;
        h=content-transfer-encoding:cc:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BopHp1fjNdOgMW/HtjZicH/O+0Zs23WAOPKC9hRJ18o=;
        b=DFz1RIwtX6omS009d8hAzFsanoICgb3kcrltNNEg0d5m7+BZcAUWd+kKSPKeb2IkEv
         sum7Wrq1Fe7A+2/5x7wtRVCs7w5rd7l92PKrFajjv1jr4SFpe83d2gXOMIRlmMsw0GSU
         OmU5permUIV2zW3oN+kpN4mNE46OSqLkK6dV0R2mjWwtoWSBZBZNfbA0JqdUT92RC6Uh
         /Mozvs77MLumBgvA0kuZIb3B4yHOMdYAYlimhxuIuZwTTG2INngavOGYkuzT2KeiGf+A
         0VnqMDdiWBoGe3McDlLCxCLyLkTLlpR7ADW5xEOi5P5Heqe8mJi8nKpSrGqArG0HdqTC
         hWlg==
X-Gm-Message-State: AOJu0Yx52Hma0eU+ZEqCi072Tk6oldACt/eD93X150hM2G28+ywWlAt6
	qm5gSxz3dTjP6/7DAmk9C92wNePzT9dee8uLc9g3nCVC3eR0j4/3+JVeOT5UxIAl52D2a1jKuVJ
	R+/kjj4pi5jAlx8pIc5wh7Tu5noSxgJZMlwB7InoR1xzqGh5TUdeoNSJCrBFYAu5N/nY9DWEmUz
	DB
X-Received: by 2002:ad4:5de8:0:b0:68f:e6ca:634c with SMTP id jn8-20020ad45de8000000b0068fe6ca634cmr3048259qvb.8.1709218547295;
        Thu, 29 Feb 2024 06:55:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHndWDh+Q7Z0Zuq1nlMycshVv6SaCwUN9Y7pEelKk5ITFjif+co5p5E01+EXWqKZ0frQDpa2g==
X-Received: by 2002:ad4:5de8:0:b0:68f:e6ca:634c with SMTP id jn8-20020ad45de8000000b0068fe6ca634cmr3048240qvb.8.1709218547001;
        Thu, 29 Feb 2024 06:55:47 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id ej19-20020ad45a53000000b0068f65b22b0fsm808334qvb.82.2024.02.29.06.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 06:55:46 -0800 (PST)
Message-ID: <343c164c-a49a-4ece-97b8-a28eb7b84da2@redhat.com>
Date: Thu, 29 Feb 2024 09:55:45 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
From: Carlos O'Donell <carlos@redhat.com>
Subject: General keyring process questions.
Organization: Red Hat
Cc: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Konstantin,

I'm dog-fooding the trusted introducer process with one of the CTI TAC
members as a way to work out the kinks for the general developer
workflow of adding and removing people.

Questions:

- Does adding a key to allowed-signers give access to also update
  allowed-signers itself?

  - The answer I epxect is "No" because I want a distinction between
    community "admin" and community "developer" (which write access
    to the repository).

  - I assume the answer is that only trusted indtroducers can update
    the keyring, and that the keyring is only an intermediary keyring
    because it doesn't look like a normal gitolite admin repo.
    
- What is the syntax of allowed-signers?

  - What does 'namespace="git"' mean?

- Are new account requests sent to it-coreprojects-helpdesk@linuxfoundation.org?

- What are the implications of selecting a username?

  - I assume the answer is that the username is not visible anywhere, but
    is the username used during the ssh connection to the gitolite server
    and as such is the name used in the gitolite admin repo with the keys?

- How do we authorize group membership?

  - How do we know what groups to request in the email to LF IT?

  - Group membership is a gitolite repo policy detail and some groups may
    have distinct project policy e.g. web repo vs. code repo.

    How do we enforce that policy?

    For example, a gitolite project will usually have an admin repo with
    configuration and keys, and the code repos. In the current setup it
    LF IT is the maintainer of the admin repo, and the community maintains
    the keyring and content repos. If we have several content repos, how
    do we authorize only access to one of them? Is that encoded in the
    allowed-signers in some way?

-- 
Cheers,
Carlos.

