Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15573132463
	for <cti-tac@lists.linuxfoundation.org>; Fri, 16 Feb 2024 17:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708105108; cv=none; b=mNNfjZSBB/ha6K5zJnV6K/85WHVqpqJQzuVh0LIwBepyAAwNYN2y1IGuOv/XwR9JtUt9mKIWw9oXQAWVeyJpDf9rvHSkJJ6qXxxrMD2iAfCUHQvCyTfaYy04OjarkjZaXWeeYnzdSjCB9zVc8A+GG/w4oBEGsZ2KE2fNfoL4BKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708105108; c=relaxed/simple;
	bh=I/gcZSw9kytY/6f+v8zCfO0zQEb2JtomwjGj040yKwA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=tOJ+NHfFioQ9Qyd0l1i7n5NFB3RCcwABbGKO7b+tnt7V2xj1MZbQYZaIntMDvx9k37hlAFoJajY3GNdPNzFSDW4t1KSt0Sfc/+5GD1076hTSSfbd9tIx8WbseQwg5Zpqpk/+GEr1tkvf2mf4zkbmhpaq4+ABOsl4Nn1ORmNWzS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aMeMUSe5; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aMeMUSe5"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 947AA41C5F
	for <cti-tac@lists.linuxfoundation.org>; Fri, 16 Feb 2024 17:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.599
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kIfT5nZDUaTV for <cti-tac@lists.linuxfoundation.org>;
	Fri, 16 Feb 2024 17:38:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B485041C70
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B485041C70
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aMeMUSe5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B485041C70
	for <cti-tac@lists.linuxfoundation.org>; Fri, 16 Feb 2024 17:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708105104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8aIBHtu0iplaT4M0d3dk5PRXJC0/QXJd0DAWStlp4BM=;
	b=aMeMUSe5VJZGUR5S6P+lpbw6pHOTHnw3bdBi1otZ35YSAOy1wXIBRRdySVCLQ6b39FVh/4
	toylKsrpwrOWp2mDFVRCYx6JljkqPDSsTlHUbxyGR+ln2ZG2xNF9/TQynsO8V1C4hP1mdz
	bss4OEEv+tIUG6AxImUvTgZzpLG7ADs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-ZoUXvrLiMjuwP8ftqbbHPQ-1; Fri, 16 Feb 2024 12:38:22 -0500
X-MC-Unique: ZoUXvrLiMjuwP8ftqbbHPQ-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7833761135dso290956285a.0
        for <cti-tac@lists.linuxfoundation.org>; Fri, 16 Feb 2024 09:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708105102; x=1708709902;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8aIBHtu0iplaT4M0d3dk5PRXJC0/QXJd0DAWStlp4BM=;
        b=pPxK5fhI/7F9Y1KM0NYOTZn73d6+EanFb80rTsULQSIfzgSSqf/lAQLcV8739p+LLn
         SgsMfw2Fo6wJ0DlWz6oVxgh2C3xuCuDUFjdsoslCp9EHuMJi84Rni3mS7BLn4CaODrOP
         dvE481Mq39DuwzGYxjpn7YRr3B+s4/tyRm0cTgLzz7ug8dzAY1lhfADkdI86cmb8uKtZ
         vOz4u1+N7dYQBe9gvlQ72+m2uqyF1IEoprp7RvMju+loAlP0lwVoLa5wmDPcaWI5qyV9
         0PjfGJQd4k6ok9Q5nwPvCGwqfMXdNY3X0ksPj6ACwJYTPNcef7mWxl8rb65ySRavI9/A
         kwmA==
X-Gm-Message-State: AOJu0Yx8l5F+EGww6icAoVAMAzNmqsCdtOy/K/BF6VB+3/LqD6zbLMr7
	w5ibx6t3jDYJ6THw11OrGCkrUQE9mAuctMEL16mCbgzVZLwOEdquH6aqbnitnKLyLfljKD2ut0Q
	0SxCnLEVZIKLC79C/9qaEx0iDxKIbU0Ys0an+mCK5qB2QnjPFs8wmHHoHRHzbGYC+G6+zUQkjVw
	zLnzIDlS567bZOUQ+6bms0GyqqivyYXa7C/X3NBRnhYo5tLncHOA==
X-Received: by 2002:ac8:5dcd:0:b0:42d:ad3f:6c3f with SMTP id e13-20020ac85dcd000000b0042dad3f6c3fmr5959400qtx.49.1708105102136;
        Fri, 16 Feb 2024 09:38:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOEatvjCjmVyNXujHwpBhOGa3xQk5D2yqm5e461gqH8YAfeiUnbmtdu3+NoQFVfs3X2xW0sA==
X-Received: by 2002:ac8:5dcd:0:b0:42d:ad3f:6c3f with SMTP id e13-20020ac85dcd000000b0042dad3f6c3fmr5959379qtx.49.1708105101745;
        Fri, 16 Feb 2024 09:38:21 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id s13-20020ac8758d000000b0042c6c103f7bsm125008qtq.37.2024.02.16.09.38.21
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 09:38:21 -0800 (PST)
Message-ID: <7cbc3da4-e129-4922-8636-632e7c64227d@redhat.com>
Date: Fri, 16 Feb 2024 12:38:20 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: Minutes from Key Reading meeting on 2024-02-16
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Meeting notes:
~~~
* Carlos and Siddhesh were present to confirm that David Edelsohn on video was present and actually there in person.
* Konstantin from LF IT was present as well to witness the key reading.
* David Edelsohn reading the key.
* David read the following key: SHA256:zkS1TzJkFI9X8gG6h0t9DWNle6IIhVC8Z7JTrXkuf2I
* Konstantin confirmed the key matches what he copied.
* Next step is for David to email it-coreprojects-helpdesk@linuxfoundation.org with the public key.
~~~

Once David emails the public key to LF IT then he will be added
as a trusted introducer for the CTI git repo and can help add
others to the repo.

Thank you everyone!

Currently we have 4 trusted introducers for repo:
* Joseph Myers
* Siddhesh Poyarekar
* David Edelsohn (soon to be added)
* Carlos O'Donell (myself)

-- 
Cheers,
Carlos.

