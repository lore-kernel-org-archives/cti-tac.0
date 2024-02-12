Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846663F9EA
	for <cti-tac@lists.linuxfoundation.org>; Mon, 12 Feb 2024 17:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757725; cv=none; b=KQPq9zwHm4UvE326wl8IZ/I9KykpMegZ416H7oEpK/NXF3hQu66GcVh3Lp5LkUYzJuqN8K6Cv4MTGvmaDAdF89No8Z2TXDt50RjJ+UDgDsYoeL8WpL8WV/LD6UXuulNMv7XWe3EzSje/LBfVjpzcPgiRLzrQdCZ1i9QNNk46o6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757725; c=relaxed/simple;
	bh=qjyNy7FemmsiGP6sXFLN4BcLwhlZwamnJuUOk2Mx8Ik=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=lAmG0ACF2hxWFZ4XHWRc4U2EfgPAfvYpqoVZCO7NTCen+W4fEz46vIG2z6asDJCz8mb2vFdeB2ODIfjhscuIPG8ehnRv3gXgTLyFCKZKjPFKd6sOYLiy/h53A3RK8ymRdTCi488eS0kN53p9B9I0YoCXSoz/6BTSZoALIVSSVIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YF076g5j; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YF076g5j"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B30340683
	for <cti-tac@lists.linuxfoundation.org>; Mon, 12 Feb 2024 17:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.599
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7S2FhZ-tpNA8 for <cti-tac@lists.linuxfoundation.org>;
	Mon, 12 Feb 2024 17:08:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1EF3541DEE
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EF3541DEE
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YF076g5j
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1EF3541DEE
	for <cti-tac@lists.linuxfoundation.org>; Mon, 12 Feb 2024 17:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707757721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YyUsLOdGDWKWSr1Uewl87JoV3tiw7+hkJvNyAZloVh4=;
	b=YF076g5jkjEn38QLRMKw6BqFxlhqyHwu5F1jHOX1LulcWrkjOLpYK78J4lXDPdFvJ83CNy
	9SCuF4n6Qa6W8l4og2N1vAw8kYicsM4Ymbd8i3yEiC5R09wV/Da0v/DPGGz+CQE97jlri3
	fcFSc1yPD0wFEeTWlVotmbJil9sAxSQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-5k3SKWNYNwm76MFqnHRCxg-1; Mon, 12 Feb 2024 12:08:40 -0500
X-MC-Unique: 5k3SKWNYNwm76MFqnHRCxg-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-68c7e6ffdd3so38213426d6.3
        for <cti-tac@lists.linuxfoundation.org>; Mon, 12 Feb 2024 09:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757719; x=1708362519;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YyUsLOdGDWKWSr1Uewl87JoV3tiw7+hkJvNyAZloVh4=;
        b=n62NiZjpUqAnHXWkXKL+tc50R25aYnHASADetgnUiktlblGn9zAiCp8lkzvspIjFMW
         hIzXR/UnDJ9uoLtthRTycte3WtWe059pyxb/wsAnys3X1PqlMGK6923NU7g+K+oLhb9e
         h7ZwBvoQg9ARyVPkadzHZrESEuaAplFthXGRuxkh/a2S0qBmBPzHMQz/0N89OSYhcSzQ
         6gty9ZRv5HTyWLBTxYGBJokKe5tVOjVT/hOKGQIM72n/mLSsiV0H/dH57EN7i4+BH1dm
         dgXYbc2oNlwBkb3grl++73SP/io6at1fi8N9r4P503QbMLp/c1DCRb5ceyUL2z5nS+UT
         OyRQ==
X-Gm-Message-State: AOJu0YyIXa8+K+PcybY7c1JczVW/TxY4ydjZz47UJCmwyh/8uXvs9ZYW
	ocPhlde4Zr7aJqXvT262CoPCSa+l3uhzYVVHti+lKUVQdyqgjFD8SMoV5xZIJPOhgvzASdg0tBQ
	9G0b5h8JO/vVvt2Spgl0+4+AB0SKWA4s5GyAe2oApaZcb2QUPXwaMU0L+rovPgR3sYXngLvC6Mx
	mzPM5wbWbjZvm0ROxladwoW8M+pb5KgFskExndMwFi8MN74DyeTw==
X-Received: by 2002:a0c:e38c:0:b0:684:b789:5508 with SMTP id a12-20020a0ce38c000000b00684b7895508mr7251155qvl.31.1707757719322;
        Mon, 12 Feb 2024 09:08:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUQuCtw+j8YmbKYtyF5psZtmPhPghcEBhMLRZCTh/fn2+7wddykzOZGVlOpzZaEHChJCBgYg==
X-Received: by 2002:a0c:e38c:0:b0:684:b789:5508 with SMTP id a12-20020a0ce38c000000b00684b7895508mr7251138qvl.31.1707757719034;
        Mon, 12 Feb 2024 09:08:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUpGRbew5pHtZxZOSjXyCBiv+neR6EZ+nvkDq0zkwLpWJ8wjK4sDS4gH6cUvSKBlZhuc24dN9MQoPMs5on90HnNbXGnLGPJcM+jO+bMPxw=
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id b17-20020a0ccd11000000b0068cc143e310sm326162qvm.143.2024.02.12.09.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:08:38 -0800 (PST)
Message-ID: <81e9ba37-3d9e-44ac-a1c4-06a34854f9d2@redhat.com>
Date: Mon, 12 Feb 2024 12:08:37 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
From: Carlos O'Donell <carlos@redhat.com>
Subject: Initial commit to CTI website
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The repo was empty so I pushed an initial commit using Picollo theme.

It's a stock setup and I'll start posting here diffs for review.

commit 5fbfd1d8f7391dd40fd9aeec0d775165a30cffc5 (HEAD -> main, origin/main)
Author: Carlos O'Donell <carlos@redhat.com>
Date:   Mon Feb 12 11:56:27 2024 -0500

    Initial setup with sphinx-quickstart
    
    Modify default to use Picollo theme and build site.
    
    Signed-off-by: Carlos O'Donell <carlos@redhat.com>

-- 
Cheers,
Carlos.

