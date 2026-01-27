Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C4C2BE034
	for <cti-tac@lists.linuxfoundation.org>; Tue, 27 Jan 2026 16:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532522; cv=none; b=GZlFEOz3msScnowvr9Aix4eJtIKx0+dE8v4LarH4VxJGbNYNMBWJWIK12L406kZFUaoSVyIPMtgf01GlA8Gv18pCm9dls2pUFveTRNvTx4c397WUY2ikAlRLNNUmMJMv2uysUxpfirNf5OYEDVmJyKC63L/xEFdwejnr5i+CKVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532522; c=relaxed/simple;
	bh=HhQ8RSi+MOxGGvKRVOVUXZhk5zqQHGGzkDuAVpxeygA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=TZJiPmGfzem7DHJxydCJYuZQmEX2EXCcWcJq/mKKn3WacSdhpbId2Xq+7p4tduuzGO35WzUnmzo/AlvmXB7icksLVYKoYYcv2JciLq5325+N3AsNypKGbZmMfwgU0dYNfNUvswOjzH33VoTP6dpNJCqvav5nP2QkNKW8BOUnwqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VQz0gcyu; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VQz0gcyu"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 309276103B
	for <cti-tac@lists.linuxfoundation.org>; Tue, 27 Jan 2026 16:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.795
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIkw5fbsBigZ for <cti-tac@lists.linuxfoundation.org>;
 Tue, 27 Jan 2026 16:48:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1614760E73
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1614760E73
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VQz0gcyu
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1614760E73
	for <cti-tac@lists.linuxfoundation.org>; Tue, 27 Jan 2026 16:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769532517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=JH33lAH88gA33DCfA2ixjhDdtvo3DajeOvQs/5zP198=;
	b=VQz0gcyubuBw9WnPOeNTYI9uxoHkqdbyWirCOUZUq0LqY3Eeww9Ye20KFlzeMZkT2sZ5jT
	ptRYVdnRo4gYT3lxBavLbljT4o2ulpAMRmchYHaULcNGlYhrzHlBv3nZSlRMmBJGPfHvZe
	eo3de5wiqBW0vHLcQw617HsOZGHLAQY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-ddZbAG06OPy2JCy8vDkZXQ-1; Tue, 27 Jan 2026 11:48:35 -0500
X-MC-Unique: ddZbAG06OPy2JCy8vDkZXQ-1
X-Mimecast-MFC-AGG-ID: ddZbAG06OPy2JCy8vDkZXQ_1769532515
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a344b86f7so217421006d6.0
        for <cti-tac@lists.linuxfoundation.org>; Tue, 27 Jan 2026 08:48:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532514; x=1770137314;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JH33lAH88gA33DCfA2ixjhDdtvo3DajeOvQs/5zP198=;
        b=RJJh7BHePOWJJ6AZ3bY5tctE1G+19MFJffBVRJ45qVH1cP3deyT3BX7mB5frHeNzih
         a9/m2LpozBu91bpap2cUkAtbb/eU05qt/DPM4ETB3+UpJgYWfO44GHDhsGOv8XoFXGxP
         bVPIUBxlcKOhpECbpedcfFBMwh5WJfjqNc1D3H81i/3N4AMMpQ5IKoRC5EXrRcTbCPyJ
         UNc/CVl/7OljhtT6EkksXQ75jNf2ulMimEBC7iZ5buaHO2C8le7uMQz4pRkGlw/TIsOy
         cH+bZI+mnmcjTWybS6jvMuHEXGIVEeEiX4W25Pfm8vGu1LzNBiQqkuUGOa9SZLmXkAtA
         n8rA==
X-Gm-Message-State: AOJu0YxqSZDG0rn2KPBKJUqKee+pSdmV3Gu6lCB4kpoqXuHX7Or28/vJ
	ZFaxxN/4qLOcmdCSYftqamaCXCfBeBJ2Yg/4RU9GYVbj+txSnILts7HA+wVdamo7UJ3O15pGjfD
	+jQkgFJQaIIUFE/ftv7NnjaeBOIhqboU7h7XBMYVKKNtDh+soMWvS4DmT3qjL2l3xYwzTQg5Ulj
	SDyJqaYfavXk3uxmX33/sCbzd8MNC1e9zAE0Pdm9go5w/pFUA5HSaVYg==
X-Gm-Gg: AZuq6aLmFhPU863OL4rOhcbd3pidQvy0m666FAmf8t9nc59I6jbs4qtXncV4uza+AbD
	ATOvBO5+FGurp/+b9DZ/ls/q1kXSOcX4v5T6JAj/D5Y26QOnnJFDBaX2OaTArHqEDztFQLXHaOR
	iXXSUdFq3MuJt1voSY1o/OGbQvCOzZ3+7uoaPbS60jqWCzBfuon/VnfPuvaxf2RpHTztWQHmMIW
	NvUogerzcmUXeUNXbVM/ogd2eiDCHSCYf3auq3YrT3rLdgFBdQxB5vvj5sooF6nD0yNtV/N3vuU
	pnxSVWtFfN/ju1VKYT7/y/ogLVMqswLJMjLA2KBdePMm0i40KdsqwwxUdyHWJoi7rTW9mvLuAYo
	gmDw5oWhoxtYASaA5jGqiqYcQIVnpGFre+H+sQ4EiK2m1YFkFASE0GD7uESeLAb6tqYaMz+zQap
	IzfbS+CYGSog==
X-Received: by 2002:a05:6214:5009:b0:88e:9f73:2c08 with SMTP id 6a1803df08f44-894cc7d8afcmr32840636d6.5.1769532514631;
        Tue, 27 Jan 2026 08:48:34 -0800 (PST)
X-Received: by 2002:a05:6214:5009:b0:88e:9f73:2c08 with SMTP id 6a1803df08f44-894cc7d8afcmr32840376d6.5.1769532514216;
        Tue, 27 Jan 2026 08:48:34 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d49c2bsm6989685a.46.2026.01.27.08.48.33
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 08:48:33 -0800 (PST)
Message-ID: <b2d53e13-d047-41ae-83ce-ce35b353fa67@redhat.com>
Date: Tue, 27 Jan 2026 11:48:32 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: Reminder: CTI TAC meeting January 28th.
Autocrypt: addr=carlos@redhat.com; keydata=
 xsFNBFef5BoBEACvJ15QMMZh4stKHbz0rs78XsOdxuug37dumTx6ngrDCwZ61k7nHQ+uxLuo
 QvLSc6YJGBEfiNFbs1hvhRFNR7xJbzRYmin7kJZZ/06fH2cgTkQhN0mRBP8KsKKT+7SvvBL7
 85ZfAhArWf5m5Tl0CktZ8yoG8g9dM4SgdvdSdzZUaWBVHc6TjdAb9YEQ1/jpyfHsQp+PWLuQ
 ZI8nZUm+I3IBDLkbbuJVQklKzpT1b8yxVSsHCyIPFRqDDUjPL5G4WnUVy529OzfrciBvHdxG
 sYYDV8FX7fv6V/S3eL6qmZbObivIbLD2NbeDqw6vNpr+aehEwgwNbMVuVfH1PVHJV8Qkgxg4
 PqPgQC7GbIhxxYroGbLJCQ41j25M+oqCO/XW/FUu/9x0vY5w0RsZFhlmSP5lBDcaiy3SUgp3
 MSTePGuxpPlLVMePxKvabSS7EErLKlrAEmDgnUYYdPqGCefA+5N9Rn2JPfP7SoQEp2pHhEyM
 6Xg9x7TJ+JNuDowQCgwussmeDt2ZUeMl3s1f6/XePfTd3l8c8Yn5Fc8reRa28dFANU6oXiZf
 7/h3iQXPg81BsLMJK3aA/nyajRrNxL8dHIx7BjKX0/gxpOozlUHZHl73KhAvrBRaqLrr2tIP
 LkKrf3d7wdz4llg4NAGIU4ERdTTne1QAwS6x2tNa9GO9tXGPawARAQABzSpDYXJsb3MgTydE
 b25lbGwgKFdvcmspIDxjYXJsb3NAcmVkaGF0LmNvbT7CwZUEEwEIAD8CGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEEcnNUKzmWLfeymZMUFnkrTqJTQPgFAmiCl2sFCRLD5s0ACgkQ
 FnkrTqJTQPjADA/9EtX1AuwVtpdGqaAqaW3lrOPSqJk5NiI3LiZQFpgVOrMs9VF1BEOGpv2h
 Cy54VjgUGYX4YnnoocC9FCmUkVqUPPkNJr3iElNJF3oAU/MtLCZCDxeJQY8vRRh4idpc61CO
 EnE4bl7nFnPiK1YzZhN1nvdIqvKXkzfFPdHUyejoFso3qX1eMfBf7GciPwT9gjIDovUwHN6n
 0qsYPxl/eFKleN2hPLDfrucfs/398zAbL5N0EVwrmtG4OZeV6SyN6HiSy7knLW9bg7TMvN8P
 vvEAJ5CbpgEW90JMGAqb10VAjs2vZehXh+gEqVSAfEjT6rVWZBzUzYCl89eaN+usMDIi7NN0
 CqIVv6NKH0dIswYC8J5hPeeV2q52d2s1g8NzJHL/3s7Hc+ot10DsOeoJA2bXhuH3LCveQHzs
 7Pi0Pm9olLEVVfoo0E2K+oYzb1t1qHBPiR9zcccW7sCFZhDjVtBbFdXXp+bQ+3tqiveMttUB
 NPKl5AFDoa/0Uc2L7piGQ0fqUaHT24BmOGmlEUUWueqFbln0033t1L02i8lPAMo4Fu1k1akP
 3s0x/e/TOaKY9qJb7h5rFe130HrNQS2TzOSKCjaKmCvRxlDRz8xYdVnEmlTvIeG38apgTNJ+
 moD6aE3qj81BqD1LaR7Dfw07F1TPKbtzswaB+al/iWsK8uOl6P7OwU0EV5/kGgEQAKvTJke+
 QSjATmz11ALKle/SSEpUwL5QOpt3xomEATcYAamww0HADfGTKdUR+aWgOK3vqu6Sicr1zbuZ
 jHCs2GaIgRoqh1HKVgCmaJYjizvidHluqrox6qqc9PG0bWb0f5xGQw+X2z+bEinzv4qaep1G
 1OuYgvG49OpHTgZMiJq9ncHCxkD2VEJKgMywGJ4Agdl+NWVn0T7w6J+/5QmBIE8hh4NzpYfr
 xzWCJ9iZ3skG4zBGB4YEacc3+oeEoybc10h6tqhQNrtIiSRJH+SUJvOiNH8oMXPLAjfFVy3d
 4BOgyxJhE0UhmQIQHMJxCBw81fQD10d0dcru0rAIEldEpt2UXqOr0rOALDievMF/2BKQiOA7
 PbMC3/dwuNHDlClQzdjil8O7UsIgf3IMFaIbQoUEvjlgf5cm9a94gWABcfI1xadAq9vcIB5v
 +9fM71xDgdELnZThTd8LByrG99ExVMcG2PZYXJllVDQDZqYA1PjD9e0yHq5whJi3BrZgwDaL
 5vYZEb1EMyH+BQLO3Zw/Caj8W6mooGHgNveRQ1g9FYn3NUp7UvS22Zt/KW4pCpbgkQZefxup
 KO6QVNwwggV44cTQ37z5onGbNPD8+2k2mmC0OEtGBkj+VH39tRk+uLOcuXlGNSVk3xOyxni0
 Nk9M0GvTvPKoah9gkvL/+AofN/31ABEBAAHCwXwEGAEIACYCGwwWIQRyc1QrOZYt97KZkxQW
 eStOolNA+AUCaIKXfAUJEsPm4gAKCRAWeStOolNA+B0WEACEIb+2+irwJzvzwVKha7oB5Dub
 GCvnHLvvXShYDoHzvajTnLTULWAepp05NiAxI8cP9QNpmj8PPzh1eJ4A53vXogWftATT9N7V
 WEAqVLo3wYAILfnzIOxr5qro148eY++pLMVxHhqrbol4D0CBG+WSAUZdAhK3hKeuA91sUjGa
 iSpwnihXhegHzeFcRgyaC+NhQsj8EoUpdSQtlmea5FxcV0jxiAdPS/8TvBsalMHNQTqOBr+Q
 eyGauXNrS3wT7qVbwNRVdRPHC61qR6RH1TPHAPorZ5p/XQisuxyLXDOJZR0yCsxvqoRWDTJu
 fb8xLrfLxy/LqtE5JNzG1OJL1Bbu9wwiXTkTyj82Zg1KmrDSdSZUvGa3Q7kk5dG38Iel8LEF
 a/Ri/cYKhk7XjJ8xHBMB6KCJueItjyv2qG7vokhxm8ep0XQNVR+rIKVJH60TKIKonLXNYfK/
 znfxUttwFIjjLso6WPHxRjPr1ot1AbgDbuFspRbG7mR2H20ZLjgLPWWAsiHfjyktQ7Dk0hjv
 r0uSJR1R7X5Cdh3uJCl02Rp1jTZNBDWGVdxA8MSY1ej0yOO+VI8OukA75K0u72wvJD4Dg+Sq
 6mzR3XVZmF7FAZNTSV+1GCekJlnCSp4M8HItrojuEtrdH8Ba4WWxK+cIKejqzhwKFpQYBLg9
 m/A+1AHg4g==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ka3YjNlCiLNjs5juSsyvkzmBt6JgZkef1GM7R7hDgSw_1769532515
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

TAC,

Just a reminder that regularly scheduled TAC meetings resume tomorrow.

-- 
Cheers,
Carlos.

