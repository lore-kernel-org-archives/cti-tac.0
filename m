Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A40D3D55B
	for <cti-tac@lists.linuxfoundation.org>; Thu, 28 Mar 2024 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711646404; cv=none; b=YIlvn23kYvVZxpXKm5MmdlFEJv6BHKgIupZb0h96CNVqO3u4U/sDidTLACQCXUfqQkuJXBymo7uoJcb5rg9RuP92TQS5khwwEePuNzT56cn2XRyugbTpMZ8o+XlFY0Sz6W06MfBPxMpqWS4KDuWPp4BYuYidGNfaMS5h+AyZn1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711646404; c=relaxed/simple;
	bh=M1vVXI6Yh++ph0FfcbdPC1+MQttrypIfDmflYS/kn4k=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=s26SoAg4QCPJGQ4HdPljVs6JoIPJ5TYXrBjET1L+4nq9VONcTITQTb3ekbK2DLDXriBfQuJjVbfOkYzjybP6FMB9paEwzUa3Vi1fLfturs9/Y6gveBd7c+4FX8UC8zj6WDsnGL4qaUNX7S2EuPLweviDppfbNQLokGtSrW0tbfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G1Oz0RC0; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G1Oz0RC0"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D10582284
	for <cti-tac@lists.linuxfoundation.org>; Thu, 28 Mar 2024 17:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.599
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qVEWlqSH25v5 for <cti-tac@lists.linuxfoundation.org>;
 Thu, 28 Mar 2024 17:20:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8DAB82260
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8DAB82260
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G1Oz0RC0
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A8DAB82260
	for <cti-tac@lists.linuxfoundation.org>; Thu, 28 Mar 2024 17:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711646400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=OV/vM14fGGUSjuu6Vq+uJsZfAcO4O5LQXq8eZeNm9uM=;
	b=G1Oz0RC0ytNMqBGNL/qTlxznI3jgmfT4UKjHAJnOKZ+9CA/eapJtO7uvMHB8yvw3In8jam
	KBnKsUkhyu7J3vxYbpI+pWfkhajta9ehqoD/RsM1nljh7k7P55sFV1lT4VY6rXkpSvIUXU
	CuXJLkL7v0Z9lLeDj16MqWy9krTmuEA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-aiiRKUaLOLSB_NiFdxSmwg-1; Thu, 28 Mar 2024 13:19:58 -0400
X-MC-Unique: aiiRKUaLOLSB_NiFdxSmwg-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6969e652c3bso14113346d6.3
        for <cti-tac@lists.linuxfoundation.org>; Thu, 28 Mar 2024 10:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711646398; x=1712251198;
        h=content-transfer-encoding:cc:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OV/vM14fGGUSjuu6Vq+uJsZfAcO4O5LQXq8eZeNm9uM=;
        b=GOh1D64ztma77+/pOH+fq4NJiSzKQyNTo2s2vVJlwHFtBVSNBjGf9Tn/gH9/ENn+bQ
         rWJwawfuoV7pwLOXGBphcV/oPEXy2kGG4uJHfAsRS8iFhVYxg3UQzISBjg4gj9zIeATj
         wJ/Kj0+9rprJI9uRHrDrAB4Vbb4mUhkKuGlDQYcU6Y8w4wHzNuPChVqy15gm+JxZp76w
         90U1RqyMFJIV3M1REaBmTPvJicdnN8lRl5JY139GjITXDQvugMHosc9gVyBp2j4dI4ZY
         TIMKkyJU+trsbFe/s7nUClouh/n/p16d/UYPLvg+CcZvtwoJebapywLgva42IDsa2Rnr
         FCBg==
X-Forwarded-Encrypted: i=1; AJvYcCWiQxAWZd23i+KckYX05KmGyrhfwQXq56EUSwZkBxflBYWIldECcOZoUaKEu4K/cSFncj3QNAFfEagz/ESbK/UUl5nGOYFj7RmMNXlC2KAt5vg=
X-Gm-Message-State: AOJu0YzMlqMRm+uiHoCUU68v+2eIJrFLqf4FexEua5XpLKoa4s+p/rCa
	+qUIUipVwcRjFhtdRfFfVJksEoNn6ApnOX5pceR7S2VfY0Ow1EvpLEznXk2hba/D7gkxugERl0P
	dO+6XPCwDRI0i/owjLr4v47+VOW3Oziyykrva3xP4o/ut2TYJBx4W/SyzSXchZT089p+0
X-Received: by 2002:ad4:4eed:0:b0:698:d197:445a with SMTP id dv13-20020ad44eed000000b00698d197445amr1006450qvb.64.1711646397881;
        Thu, 28 Mar 2024 10:19:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDqruoVKNKAvc0m+x3dMZC7vseiC/c48TXU3NBVbY7b2cLae6BMXCNxHsr1ENxheTX4WhZ1w==
X-Received: by 2002:ad4:4eed:0:b0:698:d197:445a with SMTP id dv13-20020ad44eed000000b00698d197445amr1006440qvb.64.1711646397591;
        Thu, 28 Mar 2024 10:19:57 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id oj6-20020a056214440600b00698eced87ffsm41779qvb.43.2024.03.28.10.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 10:19:57 -0700 (PDT)
Message-ID: <be7265ce-3df9-43db-a217-5a036f717382@redhat.com>
Date: Thu, 28 Mar 2024 13:19:56 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adrianne Marcum <amarcum@linuxfoundation.org>
From: Carlos O'Donell <carlos@redhat.com>
Subject: Setting up an LF IT meeting to kick off the glibc service migration
 plan design and SOW.
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
Cc: Bennett Pursell <bpursell@linuxfoundation.org>,
 cti-tac@lists.linuxfoundation.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Adrianne,

Here is the list of invites for the LF IT discussion about the 
service migration plan design and SOW.

Thank you for your help in setting up the invitations and organizing.

We should use BBB for the meeting:
https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1

CTI TAC:
Joseph Myers <joseph@codesourcery.com>
Carlos O'Donell <carlos@redhat.com>
Siddhesh Poyarekar <siddhesh@redhat.com>
David Edelsohn <dje.gcc@gmail.com>

LF IT:
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
(or LF IT delegates that Konstantin suggests)

Optional CTI TAC (optional because they aren't directly involved in glibc):
Joel Brobecker <brobecker@adacore.com>
Jose Marchesi <jose.marchesi@oracle.com>
Simon Marchi <simon.marchi@efficios.com>
Frank Ch. Eigler <fche@redhat.com>
Nick Clifton <nickc@redhat.com>
Jeff Law <jeffreyalaw@gmail.com>

Optional FSF (optional if Ian has time):
Ian Kelling <iank@fsf.org>

Everyone will get to see the migration plan and SOW as we prepare it,
but I'd like a kick-off meeting to sketch out the plan in person.

-- 
Cheers,
Carlos.

