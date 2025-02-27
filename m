Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25045224246
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Feb 2025 13:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740661628; cv=none; b=dvFHIFqMj1R175RQ7xUR8Fxifdo6JtsD9pCffYAo048AlTdheqgDItzu6X42ODHW95kuq6vLcBbxEYajUYHeCCVlxdftuc3HEOXraT8q6xa8bCf4LqVbGNls9g5V7f7x9jA+jzbhq5RW7MF7vqo+H04MNSfIxXBp5duDsiobkqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740661628; c=relaxed/simple;
	bh=f4hjAUnFbS6F07aVMy+SrAB25OSeXdPWJfm6gPU20tQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=exPYvNMadVpEWYpcGYpm5K+KTB5rFhh/EHC5LgcyVx3VsbmLN+Y5nXs6IMKjm/1EwUNLbnN+5FjS8BrjCV3in6k6MJO3V+Hzn+mNOezlXy9p7ga71QDcxJPHzdzh7EQzzY5LufLFAOZwYVNe19BW54SAT/D0tUtdd5PxA3PwDhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MgYqB7CZ; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MgYqB7CZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7AD440D48
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Feb 2025 13:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zg1xFKj2Izs6 for <cti-tac@lists.linuxfoundation.org>;
 Thu, 27 Feb 2025 13:07:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F4EF40DAE
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F4EF40DAE
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MgYqB7CZ
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6F4EF40DAE
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Feb 2025 13:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740661623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=wL4uxVKmvEEAkXVhbMeNjh+6ti655SyFV6shfyHodKE=;
	b=MgYqB7CZWyM0cKxGqvtv5s9mBNvYOkXSGAPpQy+MMiMKLmTfbhsFv8bM9GLufllUXkdR6C
	TRR570BmvTvgxhTYJObec2vUjTfosuJVY/hlFM6a9HHUNfiVmWes6gWv6nAuuFt5U1bV+2
	yCFaNnkuFdoz5qA8BcfROm+/OHBvvt0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-0ZONy5iYMpiBmBbPWGR4hg-1; Thu, 27 Feb 2025 08:07:02 -0500
X-MC-Unique: 0ZONy5iYMpiBmBbPWGR4hg-1
X-Mimecast-MFC-AGG-ID: 0ZONy5iYMpiBmBbPWGR4hg_1740661622
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e664e086f1so18189916d6.2
        for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Feb 2025 05:07:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740661621; x=1741266421;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wL4uxVKmvEEAkXVhbMeNjh+6ti655SyFV6shfyHodKE=;
        b=K5KFCa5q8AwCdCwgY0e2++JDe2mQYWACLY2JrxQJalFnnj522e6ThgLIcjWKW1X3hs
         R4m9oM1mmWphe1Cm6vaEfMIasqqj+ZS14pbn9oRAHn9nuKYKVzKjOiEzN1uOD2nzthHe
         bv4fIH9s1xI5w/zgVEGMMw+4U9wLl8SDr6SR86K2kfkdCsE2nwUoRO0ke/7U6HG64h74
         qtKcM8l9E5ea9Jl+xJmpkhUbnpi5USEielcG+PhynFYxAyiLORekgi97i++HuNlpb14c
         nIY/h3EWMIwBfL8yk9YVusH3s/DZ7qd+7jDt6ZGIKsT4GeOmAIducYTnDqZwwZgkCGDU
         a1qg==
X-Gm-Message-State: AOJu0YyYVgThS3V1T0Y5UcMJPukqhz9FR9HSeaTIkgOGNvPIm3YyL7C2
	eWIRTvEsNcRQz/+EYOUEMgnVxKXyGAoKGcIeAl23PKnYs1eIZNlCBeIYP9MDF4fXqhKhv+jaZxV
	lRKWiSxLcUaC95iwVGU40mZlIR/oYTAeQlRBC7GswSipyrNkqe8A7MkGVvJy5hnheuKyI/sOQwm
	BnZUeUjGwIT6DJpJmq9nhPAcJidrc6+mGKHdtDWy8jHF/olqOspQ==
X-Gm-Gg: ASbGncsdqNVVOCAz5z2dCJBECy57jYWzuJDaDnKy3G1wBCh+Eq81d1y4r1h7W+A0SPc
	IeFJwwUMmlYZRVAy7598udGIbF6ouuKLPm8qQEoBgOQpjgyk4OT63CM1kRTBZHaiiltL4nWXTMF
	LIwn/J0LxxQfxtAeE6h1iThb2lHFBAqogW8md9n8T5Y88spJWTKwFD/18quw/+L/o3pu1V4M+ZZ
	1Urid8YIys1bWEx3PISueIy8p8+k0pUyLL1QrIR6i1oqUyk4ur+PAeFJn+Q8WUO2n9j9q/zLPBK
	kSy4vWpQOsYuXI+o
X-Received: by 2002:a05:6214:2a48:b0:6d8:8fdd:9791 with SMTP id 6a1803df08f44-6e6b010ef3cmr330638776d6.25.1740661621384;
        Thu, 27 Feb 2025 05:07:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPiQLVfh2vVRVR2ItAvzN4+pvbl2DIhzZ1nUIfEjCGonAybVVn4JodzRz6/6KpZ+hJAo1skA==
X-Received: by 2002:a05:6214:2a48:b0:6d8:8fdd:9791 with SMTP id 6a1803df08f44-6e6b010ef3cmr330637046d6.25.1740661619374;
        Thu, 27 Feb 2025 05:06:59 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976ec0f8sm9563716d6.120.2025.02.27.05.06.58
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 05:06:58 -0800 (PST)
Message-ID: <3e2d354a-5366-42c9-8083-0596fafe23fa@redhat.com>
Date: Thu, 27 Feb 2025 08:06:57 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2025-02-26
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
 AgkKCwQWAgMBAh4BAheAFiEEcnNUKzmWLfeymZMUFnkrTqJTQPgFAmagDwgFCRDhXm4ACgkQ
 FnkrTqJTQPgLlw/+JD7l4tj8l8hAMUlszrlIT6IhKSODzjrGO+6d9Y6T9vyE2kk4Xbn+kdJf
 uBl+wj2+U15MsQe9Z4RwowIB3YHHXgj53M2OjqOAY/sRWXZVDfmVj03hqW8D7zFxjc0SZ9cI
 TI0MwrDWc+Fr3naXeo7HhgjUmULfPndxb8NHVV4Ds2DTkZoUMwB8l3dboD+nKi5GbfVBf3Q5
 cBw0CPkxPl0hxD9sr5IMgWIKVLtvztMIXv2xWAavqk8pQjk0zCYd46GcA8d9pZuac24e9NbM
 ZzTxu6cP0sKhub1JFIadyBHtJnEV/8Auc8nXJ63QY3h0QVCJYV35gQeejEdMD94in2XTkxk0
 A/xCp32bmSZv5flsmdAIv5LK4jTKLvzd6BSy/v7qlpgQ7sNaxQ/JRd+8YuBIiUVIp/kgGezD
 qtGZSpvPCFuG3LxsdvAu7JAzBY3sfBd2lSGOeHX/JK0nQ6s97j4HlSuXIabSOdsCI5UGSOq5
 thbIqfK3ewUSUB0yGvWf7EyuZugtCZOaFGpvcT3ix9/sP1fTRlJl+bNjMcO8GwedDoy85oeg
 yLCEV9gejCr+NijLfPYtb1s8o0hYu13uBojFyBv+bkUI5hTQaVLacq7VglA/QLOy/3mtM2v5
 4OEotiNXbKypHFKnoks/MFpP4xdwxGX5jU4MgFg80aPFGr0oZVXOwU0EV5/kGgEQAKvTJke+
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
 eStOolNA+AUCZqAPEAUJEOFedgAKCRAWeStOolNA+D38D/9WnZY9fUmPhZVwpDnhIXvlXgqX
 cspZJEBWNS5ArFn8CLcje7z9hzX3+86lqkEeohTmlgtTg4ctZzM+XKyWSiqHCRCR+FX5SKaa
 1VveBtwvjTSVmtV1m0rNHEvUZ5x47A8NadWqYi6uOQ22FhEqUOiwJ7EHzk4w9W3gT1913XT1
 vmkCn6FtQcrQvJT7pP+oA0YIVs8ADayJcqWHM+Ez7L2fpfAzBDhIS7dq2MYU8LQOQAsx1y7H
 6njp5dN/OI/aN/RL6XeX1Kxl4Xe+hc+tq457fLAUnmaevUldvKThuj+5/Cd4DW25MxaqinfY
 m/U6pBQ4ZwQPGWA0f+GKiJcLosSRXxIuEdZAl82ht+KgT3zhV/BvQRmrD6wX3ywPkJap8h4K
 ibwz3r6NbHKdCX22ok58oE8NAWtmTRTKXDhh8oWOKdIYjX6jJzdb/F8rPNoEY3UiYbaNTxt5
 TE9VD+yWilYO796HMXjXenCOlghy3HFmZbsQ4N+FlG6LQD7cnwm56kcrJk1IlnQXOSOd2BA2
 qNbM1Ohry3B+1F4Oaee+ZKH2C5y7Kx0y3m1b5X7Wpx76H5BeUAp6dQi6nNYeqM9PglZIMvSe
 O4uRThl5mMDx8MXQz6M9qQ5anYwre+/TudTfCzcTpgXod1wEqi2ErJ5jNgh18DRlSQ3tbDvG
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0icHwJowYbmFY8ooviDWOT5TJNcICNp-Z-HiwXcZM6A_1740661622
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

​CTI TAC Meeting Notes 2025-02-26

Present:
 * Carlos O'Donell, David Edelsohn, Siddhesh Poyarekar
 * Kris Bochers (OpenSSF)

Regrets:
 * Joseph Myers (out for WG14 ISO meeting).
    
Agenda:
 * Carlos: Still writing updates for the glibc community.
  * Posted weekly status reports. Made progress. Will continue to keep writing.
 * Carlos: We should update Steve Fernandez on CTI.
 * Carlos: Should we present to Steve on CTI? 5-10m?
 * Kris: A presentation can be scheduled. Can you give me a handful of dates?
 * AI: Carlos to gather handeful of dates from TAC members and send to Kris.
 * Carlos: It was raised to me that infrastructure providers for the project might need to look at EU CRA "obligations of open-source software stewards"
  * Noted that there is a FOSDEM talk to review: https://media.fsfe.org/w/6jiM2FH33GxjHWoGCNBHUK
  * Kris: The OpenSSF has a team reviewing CRA - Global Cyber Policy WG.
   * https://github.com/ossf/wg-globalcyberpolicy/
  * Carlos: Thanks, I'll review the meetings notes.
 * Carlos: CY25Q1 CTI update going to be "Here is the policy document?"
  * The message here is that we have updated policy documents to answer questions raised.
Next steps:
 * AI: Carlos to get dates to send to Kris for a meeting with Steve.
 * Carlos still working on policy docs. Will be writing more this Friday and I'll post. Over the day of writing I'll check how many items I get through.
 * Sid to still review OpenSSF best practices badge gold and silver for hardware requirements.

-- 
Cheers,
Carlos.

