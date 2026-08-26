Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C5F313547
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Aug 2026 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787759947; cv=none; b=FP87SdC7p1DNImifDKkc1DSbtT/O7f3z/dab5uEqqgxy7o0nfmR/XGiCtY049W7US61V0p9yAKC9catAXKzByoWtxO4CFytNLmsr8swuyiN1y5Ufwx/dneZazzmBUHfDyRhb0Rkz5nKvMseYedxz493uTiJ6+vxr/5YslWmnWDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787759947; c=relaxed/simple;
	bh=6E8X57xOtxH1hR65oeq57o4dCErT9R6q5qkiYaZMFg8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=seo79V1bTu9c0D62bFa+Y346SmjEo11W0jCAE4+7RGIAHvnb4Qhf1weaWJ64HuOgK0530VyG8tZC+GM3RS7ya0MRia/WO3CcJjIa6ECW0hJMNClYMsl7dks/vHOI0a6X5Ulwkm/Wp+5qAHgzU3qhPTsyui151N4rPhac400UwK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dBiq8uuV; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UEKNoKxI; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UEKNoKxI; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dBiq8uuV";
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UEKNoKxI";
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UEKNoKxI"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FB1C4053A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Aug 2026 15:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.123
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJxlW7jybPsR for <cti-tac@lists.linuxfoundation.org>;
 Wed, 26 Aug 2026 15:59:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dBiq8uuV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UEKNoKxI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UEKNoKxI
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2766240564
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Aug 2026 15:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787759642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=MNP6q09Pm6l4tChWNzahS9YavvFnRrMxPv3DJs36dX4=;
	b=dBiq8uuVcH2sGXE7fIVF1r25TUqH4dIh7Q2QR67xtvMQqYBNVyDHP2kjcVPT+0wf1LgU69
	vGKb5GrNtneIyI3dis31gqN8SVpbCFN86GxPCX6ImQkkQNJNLsO2tBo205tMWm378CL9HE
	eUXAEydOCoahrreujsapymLFCnSGKzk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787759943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=MNP6q09Pm6l4tChWNzahS9YavvFnRrMxPv3DJs36dX4=;
	b=UEKNoKxIDP8hVamGwalGkus289qwtapbhn1ntLZsgt2cUsE5RaEmKh/53COnd1t1wH0Ett
	FU0O3pCDaJjFgk2zdLwjOmXMLpnTJYrHd6hf+JMErp8BfJ+YNXzYyXGxS8umltEjqEeUgW
	K7cBbh9hY+vEeDDgU+2Oiw8vQ08dcGo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787759943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=MNP6q09Pm6l4tChWNzahS9YavvFnRrMxPv3DJs36dX4=;
	b=UEKNoKxIDP8hVamGwalGkus289qwtapbhn1ntLZsgt2cUsE5RaEmKh/53COnd1t1wH0Ett
	FU0O3pCDaJjFgk2zdLwjOmXMLpnTJYrHd6hf+JMErp8BfJ+YNXzYyXGxS8umltEjqEeUgW
	K7cBbh9hY+vEeDDgU+2Oiw8vQ08dcGo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-nAVXB48jP_SJfjFGBb5UYw-1; Wed, 26 Aug 2026 11:52:39 -0400
X-MC-Unique: nAVXB48jP_SJfjFGBb5UYw-1
X-Mimecast-MFC-AGG-ID: nAVXB48jP_SJfjFGBb5UYw_1787759559
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f946461so95401085a.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Aug 2026 08:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787759559; x=1788364359;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNP6q09Pm6l4tChWNzahS9YavvFnRrMxPv3DJs36dX4=;
        b=dIj2W66LCVL/wcRtWGP80OQ2CVsD6CPJI316otKHZ3F4SGQfvgKc44NUetMXX3e4oT
         wu6dQVNYjqjMTrLE9YV/KYoLnU9SyedOjoqM8fwzybQ4bI9U8J9G1rMLzzNNl8BpFv65
         MENkciXdHRx1PdVX6IhdCoqdRHjplFP2o8c5gHgO2cXOPwYT0hH7m62xYJdC70UR7BOW
         1TcXCmcbn9e5D5c9XZKFoNYIVRMKwT9+RDEjaGpYAMjEERQet04H9cWWRAwR25/BAQA8
         HX9w/EyLwL38H14evRZpRgH3MdUx6txFC9cnYp3SpFKeQmFvmBe+i3IATWOzblmcGY/e
         4Cdw==
X-Gm-Message-State: AFuF++mjykQwUQIPwO0+30l4nuF0Tr01J1ob4BxnBVPJ34MPLSiIhkW/
	Iw9X4RDKQoP1XMJOmEHS3JkQk/kAe3e8Jy5HDZh61W+hWE5aW9/6Bsso+dAdcqtg7B/P6Q+PH68
	UktpiDpxsIZCuSUKDZocI4Ky55gAAN4jJ09lYXkRTRgQVf3XMaPl7VGRJGtaKJ3P5tnyzki6qJI
	D4arlurOBCK8E16bGifBxDR5PkMwcLL2eyLZXvRJSaf29vKZA7yZcW3A==
X-Gm-Gg: AR+sD13PpL7yoaqTMbBxl6cD77WLF3ErLyM71jsYA5B+79XFRAcRcNrj8agLMPGwrtO
	K12EJ5ULvFVTLUOdMxr4Db0Vnx0aiCOMxSd0S8lD1BqpMux45clFOs2oAE4nP2ZQv+iDA08o6rx
	4KAaSEn9kacBQDkE2RZKr8vawgkOou/tNKIVt29lCpZm60BMC4NENNKWhiTLO/InXUF+fS2cggg
	gq2g7BgpOZ0EJl2u+OdqFiEapw3XxGWiAZPLmSqojJsemlVfRtY9GHoMkhKPDR/aG6uvu7Wa8gl
	ytuHqQclsi95jcEjMBpKOsrjdE2w7TYWgW2UobwtOHw4aQE28a1qvF0XT5BhZiej7EvAQyT0niT
	fnkQaWWvey0GPJS2X3GtATtDiG1vM7j9q8zWtOQ3FfY5ffIT3AZqBMSiAUFJOqFFizxvFYBIeIJ
	3R
X-Received: by 2002:a05:620a:1496:b0:92e:59b0:df08 with SMTP id af79cd13be357-937800c84c5mr634453985a.3.1787759559208;
        Wed, 26 Aug 2026 08:52:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1496:b0:92e:59b0:df08 with SMTP id af79cd13be357-937800c84c5mr634446685a.3.1787759558569;
        Wed, 26 Aug 2026 08:52:38 -0700 (PDT)
Received: from [192.168.0.116] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377f072156sm229182185a.30.2026.08.26.08.52.37
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 08:52:37 -0700 (PDT)
Message-ID: <2a401624-db01-4117-bae2-a15c81fae479@redhat.com>
Date: Wed, 26 Aug 2026 11:52:36 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: CTI TAC <cti-tac@lists.linuxfoundation.org>
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2026-08-26
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 hsfHTTi7JQ==
Organization: Red Hat, LLC.
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L6TkzSsOWiOb3FqzVTjtH5A315wz-Kg1iuMQBbaBXjU_1787759559
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Attendees:
  * Carlos O'Donell
  * Joseph Myers
  * Kris Borchers

Regrets:
  * Siddhesh Poyarekar

​Agenda:
  * OpenSSF Community Day registration. Separate registration from OSS EU - https://events.linuxfoundation.org/openssf-community-day-europe/register/
  * CTI talk being presented at OpenSSF CD for funding upstream infrastructure. 15 minute keynote.
  * LF IT SOW signed by OpenSSF and sent over. Covers work until the end of the year.
  * Discussed CY27/CY28 funding and bootstrap. What are the terms for the ADF. Noted 90-day terms on funding. Kris to confirm the 90-day terms.
  * Follow up with sponsors.
  * ACTION: Carlos to setup meeting with recently responded sponsor.
  * ACTION: Carlos to follow up with organization that has offset calendar year sponsoring.
  * ACTION: Carlos to follow up with another sponsor to start a discussion.
  * We'll use the Friday Office Hours for CTI to talk nuts and bolts of the next steps for transition with LF IT.
  * Discussed keys and handling. Reaching out to the developers to request a key for use for write access. Only need to initially handle about 39 active committers in the first step.

-- 
Cheers,
Carlos.

