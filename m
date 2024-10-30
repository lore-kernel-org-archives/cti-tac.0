Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AB72141C9
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 15:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730303975; cv=none; b=FXozJolv/Z5fPvUWk850fJXGv5ybDorcy4XagF5HC/C5SYAmC9UH8qrFf/sjy6OQfXhSdIKqPft2qTiiAhaeYul0Rm6t1ePIhXhh55sw5tDl/HEKgPTivNOOiEaBCZrWcpEBU6CgnE7wNGQVeChYOIDteV2h6DUlkMREv21XhdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730303975; c=relaxed/simple;
	bh=CpYz7VPtoFgt0kmeiqX+ZCBjCetdM9pwBsHAkfByCJM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=qZAIxBLxHd4VlWaj3LDo7fD7Q14RrmCrDTWWyTnFQacVtXgJnVsDpi5ZrS08+E2k3i10e9pbEzlMH56iArh3C6ysayPExdNzCpP9BNSkLzwR4mDw1/8WFC+ugUDRCO14FuA9KaLfJW0wA2yjtiKklfdJLeFwwJ/WsDEZR0RfkSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JaZr4bWc; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JaZr4bWc"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24AD340193
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 15:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hX-6s_fhPLeG for <cti-tac@lists.linuxfoundation.org>;
 Wed, 30 Oct 2024 15:59:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B3D13400FC
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3D13400FC
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JaZr4bWc
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B3D13400FC
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730303970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=DK9n0PipBtdHV13cMt6zG0FudzhT9Ccu/JAJFsFl3SM=;
	b=JaZr4bWcZRf2iq4GqlQltBPKtuUg7jpidjPCST6MqHo3TVcv96cl2rOkvG6kWXeNFLOabt
	9e3z3/aBD41ZDyhA334haumDsLYLv1bikLH5ETddPz3GDDKId3kCiS7Ts36vaEO+jttFWT
	KdT65q8HuYJCOt29rxL06ICwd1M2bHs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-EtbBfR3zMqKEU9MQBAqn8A-1; Wed, 30 Oct 2024 11:59:28 -0400
X-MC-Unique: EtbBfR3zMqKEU9MQBAqn8A-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b14a4e771fso319111185a.3
        for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 08:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730303968; x=1730908768;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DK9n0PipBtdHV13cMt6zG0FudzhT9Ccu/JAJFsFl3SM=;
        b=OzXQOqO7HzK0yFBXKy9AADp1chsisMHfaVYM86xWYsRBAO7bRlW44v2YoE20bOOSzk
         eFdp+RByvyXSMj+Q8dt8/6IHZTkDCgKKOnGeWpRU6JOWCtsKiqyTv6kJ3DIzqT+VIRsz
         OcbsmWYtBU9NE0WIjBkZKykXw8xMVfTPqN2k5izImXULaooqLIgOWqZFhcvJlkVuBuV2
         aGtaRpeXhNfAgjdZXWb/4P3GGCBJXJDCuuLz3t972uzOVx0jHHGubxLoWBHX+r1+Z5gW
         gE85kwHxgxHSOiJQepuhzq3ScchVmllB0THKEGlkySKrZT+25+2MfATefgtpe9n2QRY1
         qaMA==
X-Gm-Message-State: AOJu0YxjXYexaDceDoNzjTgzi+Ky4u+9G/+ZWVbU1wpZ59YxIWWJPVVw
	rjwNFKg8VMhow0dzFyv2mWqiY5F2se0qzyKD/g+BaL5koMZQy/QpjN/OHY9c2v9iV/zppVntbcf
	F9ZJ7I9B99u34PtVjkzKbv5JZMVkEKd/WmPeTN6/+ZNxdLUBSC1EGPdAedEpr/tLlg2xo6zOG/n
	rN50kUzxd5JH9VB5jJNNJ/WNgKDaJCGljQAZOXoeheRp5HL4Vz3A==
X-Received: by 2002:a05:620a:4110:b0:7b1:4d7f:b03b with SMTP id af79cd13be357-7b193f38b9bmr2031790785a.42.1730303968167;
        Wed, 30 Oct 2024 08:59:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMSta/AMfGtHdOEoiK8LjIAQk9tbDhINNsErazKEtf7NWwwsgTOaW60kPqgeE0HRxQ/UB/fQ==
X-Received: by 2002:a05:620a:4110:b0:7b1:4d7f:b03b with SMTP id af79cd13be357-7b193f38b9bmr2031787785a.42.1730303967608;
        Wed, 30 Oct 2024 08:59:27 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d359a47sm521020185a.125.2024.10.30.08.59.27
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 08:59:27 -0700 (PDT)
Message-ID: <1d7c45d0-0587-4ae9-98b4-2b8997236b79@redhat.com>
Date: Wed, 30 Oct 2024 11:59:26 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2024-10-30
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

​CTI TAC Meeting Notes 2024-10-30

Present:
 * Carlos O'Donell
 * Joseph Myers
 * David Edelsohn
 * Siddhesh Poyarekar
 * Adrianne Marcum (OpenSSF)
 * Kris Borchers (OpenSSF)
 
Agenda:
 * Carlos: Posted CY24Q3 update.
  * https://lore.kernel.org/cti-tac/9ee5b9e1-3f84-4d9e-8249-7a4bf8080bb0@redhat.com/
  * David: The requirements from various governments, business partners, that these are requirements coming down from upcoming regulations.
 * Carlos: Present my current view of NIST SP 800-218 and certain steps where we align and where we don't.
 * Carlos: Look at OpenSSF best practices badge and requirements for where we align or don't align with the current infrastructure.
 * Introduction from Kris Borchers (OpenSSF). Experience with several other foundations.
 * Carlos: Added Kris to the official calendar invite.
 * Carlos: Asking Joseph if this layout meets the requirements raised at the previous TAC meeting to call out specific standards and page and item references.
 * Joseph: Yes, but presumable focused on the systems related to CTI and CTIs scope.
 * Carlos: Agreed, but I'm starting by telling a story that SSDF has many reasonable requirements, some which we meet with community process, but then move on to the other requirements.
  * Siddhesh: Definitely need a table. Focus should be a structured table.
 * Carlos: Concern that for entries that are contentious
 * Siddhesh: C++ Compiler Flag guide that the OpenSSF publishes is a structure we could borrow from? What about things that Sourceware cannot provide?
 * Carlos: Noting here https://github.com/ossf/wg-best-practices-os-developers/blob/main/docs/Compiler-Hardening-Guides/Compiler-Options-Hardening-Guide-for-C-and-C%2B%2B.md for reference.
 * Carlos: I'll use the structure of this for the document with a table on top.
 * Carlos: I have a note from downstream that the LLVM Foundation and developers in the organization are pusuing a review of best practices from the OpenSSF. We can do the same?
 * Carlos: Which is the best practices badge for OpenSSF that has silver and gold?
 * David: https://www.bestpractices.dev/en/projects/5321
 * David: Each criteria is at a given level, particularly silver and gold.
 * Next steps:
      * AI: Carlos to complete and publisize the glibc notes about specific NIST SSDF steps.
      * AI: Siddhesh to look at GCC and OpenSSF Best Practices badge and infrastructure requirements.

-- 
Cheers,
Carlos.

