Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F62063A1
	for <cti-tac@lists.linuxfoundation.org>; Wed,  6 Mar 2024 20:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709757247; cv=none; b=I+5YHvGxmYMNOwErOy3VdfdqywceBcEga9V5pJu67sOnpKOj7e0fdCUCjm4IoJt04RJow7Z2bboKvFC9XMMtq5q3p2Oy2/FiheprZy+88B0ftRBMwhw8hoL8OQ17YZbSQNblDv1FnJt9GCpw3njg5RBKjLrmANNWASScD/Wc6pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709757247; c=relaxed/simple;
	bh=JICtbMiazR5EXAyluhZozbtiy9cuJc12Blre/rUsEuo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZAfNJGQJvFVedZ0ks8GHP86GzMYkG28g1svO6tOM8fVQFazy6hXhhQUq3RJk7/N+t89FagfJ5/2Nt6fdrrGyQuyqMcGQS+WYJ9vLjdKVBur+Z67BDErunFR2cmaDF3ZW8v1R0N30ACqIrR2VBxF5DyvhpjeO5puOKaYlMfQ7ThU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iN4GGnkF; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iN4GGnkF"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E471D81FE3
	for <cti-tac@lists.linuxfoundation.org>; Wed,  6 Mar 2024 20:34:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F54RJ4qb4HIr for <cti-tac@lists.linuxfoundation.org>;
	Wed,  6 Mar 2024 20:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26E8981FB5
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26E8981FB5
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iN4GGnkF
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 26E8981FB5
	for <cti-tac@lists.linuxfoundation.org>; Wed,  6 Mar 2024 20:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709757243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3O+nppD7aUkxyHIW7dxk77UJfUgdPcX81CC7WJYNwp0=;
	b=iN4GGnkFwO/obfaugH0tL44vdpIlT3hsdqGo+QZV4ZxO0w3jWK2RLsJApli3VkNOvs8C/1
	ewg19uGyC5thN2yxsVKjqj5drGWAXYlTgoeVevGF9mlUBgK6kc7aE/lI7+qVDxMlYh0Nr7
	OiXbdeFpWxp8Q++pvJQIO2u9IKSBGHA=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-sIQcjIZlP6qMBOPVvF7-TA-1; Wed, 06 Mar 2024 15:34:01 -0500
X-MC-Unique: sIQcjIZlP6qMBOPVvF7-TA-1
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5a1869a0f74so128953eaf.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 06 Mar 2024 12:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709757241; x=1710362041;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3O+nppD7aUkxyHIW7dxk77UJfUgdPcX81CC7WJYNwp0=;
        b=VQTmvK3PZut3ooRNNHUZSyEeDIfsnmOFRCd2ajA11hLUyZfz2tfiIH0R28nFMAu11s
         3GLhyZzTfaK801HmfoGYioV2iyATQ9hf474lwHaF5+k8aYTJ0VylgQCN+DVJKLqgiry9
         PhBX9pMAIhCNCezosWmGkdcVaAqqYEkr9YbXpW99kHZB5PtnnzoiEf9r3zi2sUWyC4LJ
         o6pGSe6o+UHhATWeijmw9NuE5ty704zxyKJY2P21/94yHUSH4qdi85TGbOus8xUb6/mg
         wPUNa/T+LAZGIqxh+1H8Lf/N3x6ZHEOqzxsOtGOgaX3hFGat//rRVRBvpJK82hI38czN
         jMKg==
X-Gm-Message-State: AOJu0Yxw1iCCQA7xCJ9vlkL2/+8QSiXLZK0QrwmkDxCUf/pNEOnrkq4K
	AfzL3ZBnU87glR7IdGKwn8u7sGzL2z7XWFIqvPggzRtYFjmq16rDhbPGvV+416ZrGFS2jtvM9RS
	PID2OUO87puH2UvQACC9sW1jbcQmHVlFQFSNNK5VNbZCS/Pngo5FDKr04xjVURuauHQ0/
X-Received: by 2002:a05:6358:5910:b0:17c:1e44:a49a with SMTP id g16-20020a056358591000b0017c1e44a49amr6288083rwf.1.1709757240905;
        Wed, 06 Mar 2024 12:34:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhjluYJzG3EQ4vfUZAENYcDAZHEG/JsIyVzBEWRwc09CduTsW9SWDmvxw5awEONAF1VQ2cpg==
X-Received: by 2002:a05:6358:5910:b0:17c:1e44:a49a with SMTP id g16-20020a056358591000b0017c1e44a49amr6288073rwf.1.1709757240634;
        Wed, 06 Mar 2024 12:34:00 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id w4-20020ae9e504000000b00787fed5c768sm6638411qkf.72.2024.03.06.12.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 12:34:00 -0800 (PST)
Message-ID: <4ed0a71b-65fe-43b4-9a27-b2d8d1663264@redhat.com>
Date: Wed, 6 Mar 2024 15:33:59 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Next steps to turn on https://coretoolchain.dev?
From: Carlos O'Donell <carlos@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org
References: <26fa2971-f3c4-4b92-b89d-9157e21f59b7@redhat.com>
 <20240228-functional-impressive-pegasus-ee839b@meerkat>
 <6f509356-b893-40da-971f-bb0fde4484b9@redhat.com>
 <20240229-gregarious-jade-mantis-9d3df2@meerkat>
 <8c0e5054-0e34-46b8-8643-56225288de95@redhat.com>
Organization: Red Hat
In-Reply-To: <8c0e5054-0e34-46b8-8643-56225288de95@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/29/24 21:01, Carlos O'Donell wrote:
> On 2/29/24 19:25, Konstantin Ryabitsev wrote:
>> It's not auto-building yet, but it's a small thing to enable tomorrow. There
>> are a few small tweaks to be done, too, like redirecting 80 to 443, but I ran
>> out of daylight today.
 
I can confirm that the updates do go live almost immediately as the remote side reubilds the
HTML. Thank you for that! It means the edits I'm making should be visible to readers.

-- 
Cheers,
Carlos.

