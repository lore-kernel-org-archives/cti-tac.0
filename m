Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F231E493
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709126809; cv=none; b=k83Sz4NydzAAfSzDGjMwCECFoZR3X+8n8olnq4pBJ56wdmkt/RGOxON1po08svOFqcxLRiQz6pb8QvD0tS/Xa7/nGA9ZkYxh4g2KHKLgjpv9EL6GbW7KLI+cYPPMAy0UEd23dp//TeDFxLiuaMSclIFe7huDNOniaGrh+YI3+zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709126809; c=relaxed/simple;
	bh=IQMG95+JTM7bTQIawyfILdPDNAZe6nEjbuj/TBqRm3E=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=sRX+4K3LFOgT0BswtkCsCgR8JL7sWyzZAYBXj06bMETcO/FuD6u2W1BzLhj3gL+WweIE8coutrrgWB5xZBIn8I4nVhqm9ecFnsDxneOAcd7F2VD/CaQ1qotrynRayvutGtJyEnZrHlzrXBXFHblL8kZ1i4r/xn0Gitaxue5RBeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PDoY3Hnu; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PDoY3Hnu"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C073605FF
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 13:26:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8TL_8MV0qLCh for <cti-tac@lists.linuxfoundation.org>;
	Wed, 28 Feb 2024 13:26:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FEDA605E7
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FEDA605E7
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PDoY3Hnu
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3FEDA605E7
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709126806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ExC66Jbrs1szDeoyuv4YYkjOzt7r/IPSSGw566RQWyw=;
	b=PDoY3HnuUh/gXBKBa/0Rdl5Nn/gW+pzBAnBJZMJL/0vLOVEzJGFkgdS0lG0maZ5gm1EzTv
	q/t7gjbQ+wP5jGFbQnrndv1kM5tkDiFPg7/1YdkOut6VkuR4XDdKlyAqk83yLwPTKEkphY
	ai4zNdAKvHU89Np7DiQTvHksmUL8du4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-n7hfCiKlOE2a3GoHZ9MTVw-1; Wed, 28 Feb 2024 08:26:44 -0500
X-MC-Unique: n7hfCiKlOE2a3GoHZ9MTVw-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-787ba4f2b68so599299785a.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 05:26:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709126804; x=1709731604;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ExC66Jbrs1szDeoyuv4YYkjOzt7r/IPSSGw566RQWyw=;
        b=O9PoXp+GF89bRHrZjfkcvNmWYKLYziqtwiGIbTQR31MhhqZqoGJGnV3cDhmTBswInJ
         lzqy5zujL9B+/B/wCew2x3yRP35yefwJbJSi/d5KbcEDJf+ZGtFxLrK9lrqo1TycJ4T8
         0oII/lOLM09yh5DC8lCSAewn65PE2PJgPUrRAak6R71TFn4WIm/RQXkSW6d4WADZLvMd
         1wjJAwa3V61m7gLmmGySPI2IZmyjrmmxvNl8uVBYazgFgewJA7pBcz5atgtZ9wqc/tXN
         h067pp7acPReaHpmstYgIC0t0Lqbcz2PY4ufdWnbwzzUap9G198lHd+uB2IV/wRBu0z5
         0+cQ==
X-Gm-Message-State: AOJu0Yy+P2bbHPmm1jBvdhAf/NNpU4uo0WqtHd0y41Dkaut3vs/alCGH
	BY2c5t6SKc0BqI1EgnctVQltQsKRM1XHN499d4U7e0gphuReDJjaAj1+/qDN/Irg31MAx/qRxNO
	Rtl0DRHrlq/932LjyUeAdC9pm+F66GSi1PzkY8DAo6ezUMjGbmYtJPE5RuobVIToOmqFIhr38UM
	UxqUX/jfEw3vCGjmGZBAaT02pyYD1qFiRGBKLUMZrEyFDTI5TJbQ==
X-Received: by 2002:a0c:db0e:0:b0:68f:3be2:d08e with SMTP id d14-20020a0cdb0e000000b0068f3be2d08emr4556518qvk.65.1709126803833;
        Wed, 28 Feb 2024 05:26:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFQJlj0MdAowGDULyTeUSnzYn7Wh7XEsBRyiNzPmV6EgC/Bfa1YW5s88H78GOGwCmCZmxLkA==
X-Received: by 2002:a0c:db0e:0:b0:68f:3be2:d08e with SMTP id d14-20020a0cdb0e000000b0068f3be2d08emr4556502qvk.65.1709126803504;
        Wed, 28 Feb 2024 05:26:43 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id c10-20020a05621401ea00b0068f8a00f581sm5135624qvu.106.2024.02.28.05.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 05:26:43 -0800 (PST)
Message-ID: <26fa2971-f3c4-4b92-b89d-9157e21f59b7@redhat.com>
Date: Wed, 28 Feb 2024 08:26:42 -0500
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
Subject: Next steps to turn on https://coretoolchain.dev?
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Konstantin,

I pushed an early sphinx-quickstart to gitolite.coretoolchain.dev.

I've got a lot of the next pass of content ready.

How do we turn on https://coretoolchain.dev?

-- 
Cheers,
Carlos.

