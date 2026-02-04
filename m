Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025323939C2
	for <cti-tac@lists.linuxfoundation.org>; Wed,  4 Feb 2026 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210826; cv=none; b=ibEdmbSUWogis10DO4SCGag8wOZtGiem+negRvh2oaxId5xr1Q0IUDdNJ2NN84WEpo/Ny4XWSZt/CnGzvPA28wwNFkf7KWGx6gytTf/wwiaNXMuzkKfBDLl10t2OHzbTFwuwru/VWAq8SaoLTjLIwA/En8LpszafciO5WHnEIQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210826; c=relaxed/simple;
	bh=+ViTVRFPElyaFt/Bcx5ywEee5GXBzwIs17ltwUZzlag=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=rxXVY40DnyHbQ7Odqtf7Lu0OAhU9C2X63T0cQUZXIZVv9Ag2TZJmm9lLZaltLdj5SPdcKg3EXoljUB1ZSlSJfE4KwxNowhQWTBIG564lDKwf+2h8vxAI762i9j+tv0HIaUx9lXALg75FEWvfdgm6150lvFfM5s038AeS1gcu6n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YLzNZ0OT; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YLzNZ0OT"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A710240C70
	for <cti-tac@lists.linuxfoundation.org>; Wed,  4 Feb 2026 13:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.795
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bO0AZFKIXzhd for <cti-tac@lists.linuxfoundation.org>;
 Wed,  4 Feb 2026 13:13:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8301B40C6F
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8301B40C6F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YLzNZ0OT
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8301B40C6F
	for <cti-tac@lists.linuxfoundation.org>; Wed,  4 Feb 2026 13:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770210823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=SPRkO7HtiFIRBOk1Lh7m+boSh5Z6kZz0JZAWH80q3Rk=;
	b=YLzNZ0OTZdwHwBirvyEPe19vjv8yP7VIlGxp1K99n/F8v0cf9w+Xs0x1V+bX2mVgzujCHZ
	gFTEi5Q/rrlrNb470s70D0PRpuMTQxxe2yTJaxDzSm3Uyo6Vyro6SCeUdFhow1Ca9cKHEv
	7fw+PoNgnp2DZhDBmBo4XjlOvx5Rm8A=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-kfO29425Po2cMO_bctR8Gg-1; Wed, 04 Feb 2026 08:13:41 -0500
X-MC-Unique: kfO29425Po2cMO_bctR8Gg-1
X-Mimecast-MFC-AGG-ID: kfO29425Po2cMO_bctR8Gg_1770210821
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70fadd9a3so2431774085a.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 04 Feb 2026 05:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770210820; x=1770815620;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SPRkO7HtiFIRBOk1Lh7m+boSh5Z6kZz0JZAWH80q3Rk=;
        b=QWFLQEsZ1sUYH7XPxcnM4YjMI2H4re+aBmRtIJW0bQneDlzoR9KlIrdqMlLronVKBf
         E5xZIph75aXA2cermBy00wBGZwbip6dPhdxw5TxjAydA8x10RMtpiX+WI94B0CCsikIO
         rfwn8CBaKf4YPyR50XvvvUuTbQUIhwZpPqMZWfUT4WRQIbLLJDDHeEsxrIwwiCptUP8+
         hXMRNaDXhRB7YIa0FAiIj2EfBrA932VkSDOij2xKix3MHv+68jD1tmm4Y4KjlTlJ7TrO
         C5ie9OVujCFzVOCF1WDjhntaiuhUty9cQ/ljBomioU55B/bRzNRN1B3Ynz9VQT4S1eRd
         Rk6g==
X-Forwarded-Encrypted: i=1; AJvYcCVvZ6oDHSM7o3k/fpAYk2MaJMtYYaN5U4zcQP7CTA1Y0uXvClbuvmQGloU8wvHLB3y0zeA+IVA7@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxOe3k9CozBWsE9xtZ4YOBtGBIaJnJK/aTO21nmbdxqcgaMW5zR
	3LqXRq3O2MIiLrvb7CHLD9EviZSFn1xpI0nzTSFXNkC+kfogFUVOk6XxaTAHtmfKHjQGVJhc+HG
	JRMDsaqeMJS+6G25gPqRHyure3+04CNCKnsWbsCVbPXiW17IjMLqkdTqP6XESM9ufoZvjDdgB0p
	uRpzQ0
X-Gm-Gg: AZuq6aLqWmvasy8iCTCiEc1x0FQTOzkrNwRtwo4M3ZXegrena8omKmpHjjJZ30Fg17A
	wwEw1MLyOeI9nmOYVj7dELKTlfPCdCkHCDBFjDfCMPtJHFT5AVjbTO0IOBwqmMJRiHjcJHXE8kv
	kHplV/6/h7RZmsW72FcdFAlO8og2uduRSxBzuXfhPQWPdCi0DmA1NHhWIeyuA7x89NqJ0p4fI+C
	JSwUE0yph6XMrkfJn+94VaymUxnQ4MPJTcDxX9yyTMwAIdxgCfZkug89v73YHGkC6Y7DGYykXZ1
	4AguW0ECrqn9hRwLXiF5UPnS/niRbKuWKTMlkPivn6p48IvmVeWdsu82YJkTQfzjxi+9lOisWSM
	HyVZ2QOgLl5bW3WltU6IN/V8pcMPMuzZknZHuPdFoSPdokNOAHFChoQztErUVFGyp2O96KmKAb4
	8iCBR3Gqw6hQ==
X-Received: by 2002:a05:620a:5dd8:b0:8ca:305b:747e with SMTP id af79cd13be357-8ca305b74d9mr291650285a.88.1770210820501;
        Wed, 04 Feb 2026 05:13:40 -0800 (PST)
X-Received: by 2002:a05:620a:5dd8:b0:8ca:305b:747e with SMTP id af79cd13be357-8ca305b74d9mr291647285a.88.1770210820117;
        Wed, 04 Feb 2026 05:13:40 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca2fd56cc0sm178176085a.55.2026.02.04.05.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 05:13:39 -0800 (PST)
Message-ID: <27212c44-d257-4d54-b174-dd3e78d02550@redhat.com>
Date: Wed, 4 Feb 2026 08:13:38 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: glibc developers <libc-alpha@sourceware.org>,
 cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: Office Hours for CTI - 2026-02-06 at 1:00pm EST
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
X-Mimecast-MFC-PROC-ID: m2JjPrVMrWLoFfcwi0dqGAG-ztfk--0XE9bpELCfUHM_1770210821
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Office Hours for CTI

Please join us on 2026-02-06 at 1:00pm EST!

This time slot is adjusted for later time zones.

Agenda:
  * Please bring your questions.
  * Discussion of gitolite and branch permission modelling.

CY26: Migrate glibc to CTI services
https://cti.coretoolchain.dev/projects/glibc.html

Video Conferencing Link:
https://bbb.linuxfoundation.org/rooms/gq0-ndw-gku-r2e/join

-- 
Cheers,
Carlos.

