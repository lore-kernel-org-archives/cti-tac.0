Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1727E18B14
	for <cti-tac@lists.linuxfoundation.org>; Mon, 13 May 2024 16:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715617906; cv=none; b=RL69OvcviPn2rjJy9hUdUQZBjr0BYdpMQ4mciw4ynWHgXDmuC0kot/NAJQ9Car1mvok+GyVVmEVSj1em/iWoYjdaXLkXFjiNeIIFC4TBq7XeEtSgl00VKgH0ObeVoLtZCGPv3pycanlQKFPuzTuqHP42OCK78lbVmLawzu2Gg/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715617906; c=relaxed/simple;
	bh=so3pfWKa1m9bBgx804dICLCiByZiban+0AEyWxLhMaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dD2J+xKUZz9k18um0PtwTDtNzkjumW5fOxM4RJhKcftR5WF+uPUvwn9RnJKGKwo6lW/fm7A8/GNDBhy4Wvmqo2TBgVBSHGWZIBBDeuCQ2tguTKHdMz12YYFJ/6EiotoexJ3ZAGBIuumHg1cMFbduHAYPXv10kAXKxlRx+LmQG+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DQKvsZb9; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DQKvsZb9"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8531482F84
	for <cti-tac@lists.linuxfoundation.org>; Mon, 13 May 2024 16:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.599
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id koH5le0zPbLH for <cti-tac@lists.linuxfoundation.org>;
 Mon, 13 May 2024 16:31:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0E9982F50
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0E9982F50
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DQKvsZb9
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A0E9982F50
	for <cti-tac@lists.linuxfoundation.org>; Mon, 13 May 2024 16:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715617902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hc8elyKer8zYEmC9wu4rmCMdgjaG+iGX8tu+qH99WbE=;
	b=DQKvsZb9cXjVDfRuHsGAOJvu/6hwm2jfx1KLEbnWg2l1sOaeXXsvA60GE7LAmbMkJ13u6b
	pwMba6hb2OVN4hIFf4uAaXo93oQRHRe0u43leIF4r5JKE4BtG6c3sM5jR8oyEnSxEvcsVS
	YP2FonodiTdPez2hkpHZ9m+/avU45xY=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-8RAvemXNPLOsl_mFzUutCg-1; Mon, 13 May 2024 12:31:39 -0400
X-MC-Unique: 8RAvemXNPLOsl_mFzUutCg-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6f107ae438bso1468154a34.0
        for <cti-tac@lists.linuxfoundation.org>; Mon, 13 May 2024 09:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715617898; x=1716222698;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hc8elyKer8zYEmC9wu4rmCMdgjaG+iGX8tu+qH99WbE=;
        b=dDeDQO6IkjZfsM8FLDwp3l4GaSB2oQ1QARWQs9SEDDwn5wRscfSsocN3O6OHlT2rli
         Cg/kFmEYkvs0GjX8Yudr0gBu6ytwjpPWqva5V/mYoUZEFs+SvlWpET/xrvCJC991fcZj
         0uHqatUWaDoYoatZs6ZFH11RaF8SnJMiuVK1uEHtSahl7tJGQ9WPjj+RDjS2q47Z7xxn
         up36sApeTUu2czE6CBV/3ThndaY59mEaQXTc7LeCPZHezlm++DcKJHrmAtqP7b8/FU3b
         Ww2l0dg0ydxd9LZ4bgygqeb2wvUGMe9LbbAOR98Q9zsrej0jPMONkTcOvLDC5KLpp7Cq
         q8rA==
X-Forwarded-Encrypted: i=1; AJvYcCWKqYoaW7UIWmhFX41Zy9ptkmb3qKTgo9HALHxhKTjwjFVJ4eEr8NWh3pSWNiXT7/K/JK+dHjUxj9TMm2febVi41KJUIbxVikBeyOvAs7REur8=
X-Gm-Message-State: AOJu0YydbYfp3NiPzyAy3YhrDwyNruH+n4Eqr24wPk6vZavBucuSR6AN
	vbc0kTpkC1egBHkqRp/T06vc/OYZRTaTfj3tq2rLA412aUgcop8K6x2a2yxRKDbFQO5mxuJusYw
	+xoFylGBVi+6nT9qjYsgOzKun9whL6z0xlaGrNYJ8mq89+LVR36RnJ4Cko3dnJmux8wKM
X-Received: by 2002:a05:6870:c191:b0:23d:30fc:8e8f with SMTP id 586e51a60fabf-24172be02a9mr13573933fac.36.1715617897850;
        Mon, 13 May 2024 09:31:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKAdx/rk7uoyzULWtOfI35kizwtnLAaqrs9Zg/rU669PzFlxMc/ypmKCmBU4fAptJNi3pDsg==
X-Received: by 2002:a05:6870:c191:b0:23d:30fc:8e8f with SMTP id 586e51a60fabf-24172be02a9mr13573917fac.36.1715617897555;
        Mon, 13 May 2024 09:31:37 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e144a98a2sm19163791cf.16.2024.05.13.09.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 09:31:36 -0700 (PDT)
Message-ID: <ee784214-face-436e-8bf1-62346adbc40b@redhat.com>
Date: Mon, 13 May 2024 12:31:34 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hashing out the scope of work
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 cti-tac@lists.linuxfoundation.org
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
From: Carlos O'Donell <carlos@redhat.com>
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
 AgkKCwQWAgMBAh4BAheAFiEEcnNUKzmWLfeymZMUFnkrTqJTQPgFAmStkMYFCQ8AA6UACgkQ
 FnkrTqJTQPjRTxAAnKmRztRqcP4bgMeweR3rMxDEtwQhciDybB7RgBeuZHCbY6Hmqx2so4gH
 2rG9EoBJM1RZKyqztVJ2WbGPzEb4ZAW/AjmttIoN1tSdACGBbd8kPNUzJd+QsCiWGNtyaJw6
 /HTLj9JRdGN16b+DzUJxww3gYZYTTkhSNUVjcrw7hzXU0Zb3z9/evXv26SDbNCqSfhAm7tNE
 8ceH9H8dTcalNUPJO7bgXRhXORj9OciJrMnpPs6P4U5f/IkcVSZS1t+6R0KPWeEUXGlegTFK
 F1cKsSoil8mYajqAheuqbjtPHPh55dHTbG35ngjNSZyiM54PdMW5SR6zog3RAlYnuPg09g21
 n9Y/ihuEZZve57Gp5wHUwNE+RKRByLlRF3Zezz6jKfjLyHqJYK8d8+vuFO1vca5OfxCEf33Y
 8pLhARmHXG6mzRdji1e7Ugob2OQbvM1XWkInA+NyGeqLlE7ZnzVME5kmYVa/+qjdoqEgAqKz
 EdcknAZ0uud8xuAqven5X17+bBY16RZHOysOcBiGGC2E1A8Xni8cO+vH6NTCjK+OAk7UXgWB
 +9MFvsi7WHDJAjVlpOwuRYDWjZ8o8HhkByMAhPEzjySR9G1bzHKNOVQNFpHPTP8a5LJR6nX/
 QdjKAC0bOR1TxNeK6T0h+E0iPnwWIJ6ezimzwdRl0oCbj02giyPOwU0EV5/kGgEQAKvTJke+
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
 eStOolNA+AUCZK2RDAUJDwAD8gAKCRAWeStOolNA+B0MEACVxFO++NroEQxSQ0NCWod3aDmY
 mYn+/08wLTeMP+ajq19FEjU0Lh/GBJl6WlSHeJ5ZJlNSiXZuiSYGMYm73DBaoZlyjbD+H9NL
 LwLXgtfCZYlN6Iu8JRMfk9yevVBay7Be9DkPAk565ggo0UkIjpYftiLF4TUfqnI1yO6QKXgr
 J2DDwlP3iiCYnWFpHdBTB2/BRurpZoRquhRGzgcdGfRDtp16Pzm/u8BjfaU5/AFRjM0IDYQ6
 PaQld0uZSZ0qOn0ts6usJws5gANq4U1oWJlqL/PHOFy9mbwUnKqq0oiWrmj+Mb+Ic6m9fqB3
 5CHWUhxC1QozvkuY/sTsmXnG/mnbq2oFIVcgXDsnrDHf+0GyR+TrE4AQw1Pt2utsmU67LqNB
 Ru/2NbSFgwPv5wWjtNwDVGSZEXlV4qJGjh8S9aaGXhRTwJsnN6qkFS1m6vHKwqnRb5Qy4XDg
 7kDrhFnTWe+XSwQt+HtGvIiXcR3EScJky76YlVsWDtvZMo3NePaC3qV5HAC8d2ZL3sFqxJRu
 sRyjE2l6s0EEK2MUgV/dwodftECrMdGktndVTYPqLnsua/PWWKYwYrNvD8slL6VFkXDZvLLv
 nat9vl9mBm15b76RHvKNlRcPbB9YYCbS5fhN2ObAsVbV1c5TdBCp8lp1Fa3YK0TA+WpNZVHK
 vjq6hMJAjA==
Organization: Red Hat
In-Reply-To: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/24/24 12:45 PM, Konstantin Ryabitsev wrote:
> This is the Scope of Work section of the larger Statement of Work document.
> Please send any comments, adjustments, additions, or clarifications you would
> like to see.
> 
> This SOW focuses on the migration primarily, and the tentative time frame is
> through mid-2025.

I want to note here that I'm ~6 business days behind in reviewing and responding, but I plan
to complete that review this week (of this thread) and prepare outbound communications to
the glibc community to highlight that we're working on this.

Sorry for the delays (got slammed with 4x CVEs in glibc).

-- 
Cheers,
Carlos.

