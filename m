Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34872BD590
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Jun 2025 15:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867122; cv=none; b=M+NhNQ8pv8UK4B0eyxsc7FPMh9meX2cO5JF8t2ElIJtk4R7W0yVGmQWwEl1N8KzbRiNF4oN5zVPSSGz7Upue+EygN2SoIuKAUYtPBeRSuz1WOchUGiK9F0H2Uzjc3HJeKWvC+spxVRkG/MgfatWTLRku2bAItLjOusXL3PaHRZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867122; c=relaxed/simple;
	bh=GWkxwoU9j/VoI7Rigq+tHiUtlp9aK71irFna7359E4A=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Bs21i2+jZdjenn3J9wV5MJR29Dqxe54mddyiNDy/ly1/liFZdw2UIbgAW2w5JS1cUEbp1ZgPXjF2Z6bROFTqsZCO6LIe2Ub/fiw4bEC+ofTptAiwgqv9ftOMPvyBs9oDtU4fNKXmXYMQh8Zdcs149MzDkmKHwKskWz5HADkm6X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N99rHxbQ; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N99rHxbQ"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3725D40531
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Jun 2025 15:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kLDISNSeoXj for <cti-tac@lists.linuxfoundation.org>;
 Wed, 25 Jun 2025 15:58:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8AF3E40575
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AF3E40575
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N99rHxbQ
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8AF3E40575
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Jun 2025 15:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750867118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=+7gDOSvJrhG9qGmdc5U4RhDox7I5f1medM9XQoW1Yy8=;
	b=N99rHxbQVIGGtf6a6nHAOUlCbq9Q7r3DGaZRugkk5Kxcu5k/EOfauhk/uA3l0jNbISph4O
	kH4gb5spwNZRl/NVLFsP4/N5HuGWbjhcmmhQ7f0fYvNMGdo/Dy7jk4z88HJGEfMcH0GC31
	r+yQLLbuLMAt4E/UVaOICPYJPsYBjzE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-JwzDwOUcM3SYvCOutInnww-1; Wed, 25 Jun 2025 11:58:35 -0400
X-MC-Unique: JwzDwOUcM3SYvCOutInnww-1
X-Mimecast-MFC-AGG-ID: JwzDwOUcM3SYvCOutInnww_1750867115
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d4133a2081so230092285a.3
        for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Jun 2025 08:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867114; x=1751471914;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7gDOSvJrhG9qGmdc5U4RhDox7I5f1medM9XQoW1Yy8=;
        b=ei9XIMW/T3S5OernP0j2yL38bvVagKHOAT8r5z4W7cg1SEhvtJdEw0jlpJ5KbDWLg6
         Gnu3AigWvtPJZhHZ327m9h2tiXHUNdiRLPmYNW7l6VlL8JRq+P96M7g634xVx9kYu8Kv
         LfLGJ9c5TKgApCSCCoNEfAAGYNkKJnZu5FlujnacbGCSzfnF3DjJJrIiR9m73bbMg+LT
         X2S0/c4GLzZfWYE5zfSrQUddHRsgFnoN6ZHun0kVdozgd0WpTWrsyINkCosj7r7kMfqz
         qc0mCVYVDOKbL6bBzVOpKLcU+8t5clvBjT4A/sV5US5qLexlf7UhYyn2/HsAF7DsAtxi
         mLbw==
X-Gm-Message-State: AOJu0YxBooAwggZVtQbWh/lTikl/x2K9sPtNSG3IYFr+OyMpItlib7Xx
	RjP2hoKu9/1Lm9WZBG4QVDcZjUp4d4cR73hUb3Sy1e2s5GBxUjL8pFTFzZPZNAzMHXFo5Sumncz
	rD2+qG6iyRUN9v7M2ETUC2W+unEFvX4zTGfpF0D3i0ni0hlOMl+gaVciUrqV0LIMh08cHUqUGmu
	VO+iTEpVRrMopDwMyjxSAKjmi6k4Uxj5c5V+a5OwWzrYKFavGEB8rnZA==
X-Gm-Gg: ASbGnctZ69IQEK2KsKRFBY7slSAtcUjhYwOpcvzZSSD5CKLFKUvnoAuWIIcdhXGvDr8
	XXjJn4SCl/eKo/ZxVsBg2KxaWwn/02R1pyC/1VIPUurHbXMJQJjgo7ZBOvko0HucrJoBL13AXGu
	NJvOFRya1AHGba2RMzx0tkFYbR0GEBuZL3Yx4ItFx2Begq9wQM3X9sK3NHbhCOql24BFJQm3UDu
	3jn5KjKbD62fK1glT8+8QMdKHHKfbYqh+qC2d7bIZTJuVfYuPRukkwigl0knyz5s/PINpJXyvQ+
	39lnAOE2cfrvWDYhB15aXw4=
X-Received: by 2002:a05:620a:40c5:b0:7ce:b7fc:6b6f with SMTP id af79cd13be357-7d43bb911a5mr10811885a.58.1750867114639;
        Wed, 25 Jun 2025 08:58:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRM2RcS5EPQulWW9bMsM7hwt9uYDnIzNpX36SgVb3c7zuPweB3cCx7gzznIlYn6/iNv5tRZQ==
X-Received: by 2002:a05:620a:40c5:b0:7ce:b7fc:6b6f with SMTP id af79cd13be357-7d43bb911a5mr10804585a.58.1750867113845;
        Wed, 25 Jun 2025 08:58:33 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f9999fe6sm623813285a.17.2025.06.25.08.58.33
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:58:33 -0700 (PDT)
Message-ID: <89406554-8527-4c63-b863-e8af530d4a1f@redhat.com>
Date: Wed, 25 Jun 2025 11:58:32 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2025-06-25
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 80nPwHna5z66HIbJ76zX1SBoesLNj-vtZy6QpAoEjjc_1750867115
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

​CTI TAC Meeting Notes 2025-06-25

Present:
   * Carlos O'Donell
   * David Edelsohn
   * Kris Borchers (OpenSSF)
   * Josepy Myers
   * Siddhesh Poyarekar

Agenda:
  * [codonell] Slow progress this month as I have focused on GNU Tools Cauldron 2025,
    but I'm handing that off to the OC to run, so it shouldn't take any more of my
    time once ticketing is up.
  * [codonell] Steps taken since last meeting:
   * Siddhesh responded to Sam James about funding.
   * Sam James still had questions about CTI governance model.
   * Carlos got the CTI ADP docs from Kris to review and prep for governance post.
  * [codonell] Thank you Kris for the updated CTI ADP docs.
  * [codonell] I still need to post direct questions about Sourceware progress.
  * [codonell] I want to review the CTI ADP docs and respond in a clean thread about governance.
   * We have existing answers to governance questions that we prepared before.
   * The key piece is that this is just a service offering we walk away from if it doesn't meet our requirements.
  * [codonell] The open question I have is: Can we post the ADP doc publicly?
  * [david] Charter Exhibit B can be published.
  * [codonell] I can recreate it from text.
  * [codonell] Note: Paul Eggert pointed out some papers that NIST SP-800 218 is not perfect.
   * [codonell] I do plan to review those papers.
Next steps:
   * Carlos to post direct questions to current Sourceware progress.
   * Carlos to post direct position on governance for infrastructure.
   * Carlos to update the CTI website with current progress, plus CTI Charter.
   * Sid to still review OpenSSF best practices badge gold and silver for hardware requirements.

-- 
Cheers,
Carlos.

