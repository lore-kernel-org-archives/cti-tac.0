Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AF62561
	for <gti-tac@lists.linuxfoundation.org>; Wed,  8 Feb 2023 13:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E288181F9E
	for <gti-tac@lists.linuxfoundation.org>; Wed,  8 Feb 2023 13:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E288181F9E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=huY/RfKk
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.103
X-Spam-Level:
X-Spam-Status: No, score=-2.103 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l2AQ5_9cIaJw for <gti-tac@lists.linuxfoundation.org>;
	Wed,  8 Feb 2023 13:42:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16F3C81F92
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 16F3C81F92
	for <gti-tac@lists.linuxfoundation.org>; Wed,  8 Feb 2023 13:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675863763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tYOqoeyMMWR7OSXs718iKBMoTJ3WWshc61B1/hYM3pI=;
	b=huY/RfKk1iuOzFc9nHNXVLON69meHjFIoLKQNPMZagVlhZUHLmHnOOGLGHkrq7BeQIybwf
	vjGozcMPPYDgaahm+3M6SsYJ0F6/JX5Xn3oRwe6AkdME1QGs3wPFSg9ALUlHQRWY4uJE5Q
	2stBqF9U96nsx9ZuBceZGLbrChheg/g=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-RXc6jxpjNK6qmsayezciBA-1; Wed, 08 Feb 2023 08:42:42 -0500
X-MC-Unique: RXc6jxpjNK6qmsayezciBA-1
Received: by mail-qk1-f200.google.com with SMTP id h13-20020a05620a244d00b006fb713618b8so12103000qkn.0
        for <gti-tac@lists.linuxfoundation.org>; Wed, 08 Feb 2023 05:42:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tYOqoeyMMWR7OSXs718iKBMoTJ3WWshc61B1/hYM3pI=;
        b=RlwYXog1/KlMlMoU5UwkiQ0q4QJ2eni9/2aU3HKKO7tGtfTEtXiGQQj8LKh4S5drBO
         /b3rroLmDGRziq65EZA6tlT0O6PPRWvPr3O1nFsRsZl8+GfRSgHRbnN7eUGYX2XnJTZ8
         AOt0WlK18Ap0GRVHf3C+v/RlXZkP9Snx0ySt7cv1UFaF76ez4VzqrC8Mb28xhbn3gh43
         4EA9v7EMrvnaEgQQ9ytSgCSNJBumdc7Tl+3POb8/QPCE7YSk0u6qeIhVsw4MtO/VyGwh
         gqmOU6iRBS2pEwT0awi946QnO/F4Kj0AVqNXxpijW65tjafMfTTLBDvqnQklGfCxa1F4
         2g5A==
X-Gm-Message-State: AO0yUKV7HLm7sLXbtq7L50dwErF9k1c5LzbdmN/DGMHAxyhh1d1cEzuG
	5Z03E+/L6aA7i2eW8kJPRcuAILkNWG+7xIrS8oQg9otlGlU7B/6lNhtpg0vJhM8R34bniEfcrAv
	XWgaeiLf/VIFaj5FlSZG7rnwnJXRnJVo=
X-Received: by 2002:ac8:7f10:0:b0:3b6:9c63:5ca1 with SMTP id f16-20020ac87f10000000b003b69c635ca1mr12054829qtk.43.1675863762259;
        Wed, 08 Feb 2023 05:42:42 -0800 (PST)
X-Google-Smtp-Source: AK7set9f4vWMoh8z2gO2GU714CnPjgXBDsyqqOflh6emH4Ocey2ZFRxCIFdfODD+7BwnEbtxeHqPBg==
X-Received: by 2002:ac8:7f10:0:b0:3b6:9c63:5ca1 with SMTP id f16-20020ac87f10000000b003b69c635ca1mr12054792qtk.43.1675863761961;
        Wed, 08 Feb 2023 05:42:41 -0800 (PST)
Received: from [192.168.1.18] ([79.123.83.169])
        by smtp.gmail.com with ESMTPSA id m1-20020aed27c1000000b003b6382f66b1sm11414122qtg.29.2023.02.08.05.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 05:42:41 -0800 (PST)
Message-ID: <de7c1a4a-5cb1-5090-9e53-f420d53d4af0@redhat.com>
Date: Wed, 8 Feb 2023 13:42:39 +0000
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: CY23 - Status of service enumeration.
To: Carlos O'Donell <carlos@redhat.com>,
 Simon Marchi <simon.marchi@efficios.com>, gti-tac@lists.linuxfoundation.org
References: <d8790f60-483b-dfc6-dd7f-cb408334eb40@redhat.com>
 <bc978ef9-3d6e-d032-252b-3aae460c895a@efficios.com>
 <4718eb70-b843-0f46-9555-cbba58f70713@redhat.com>
 <5e2916df-018d-e591-4301-910c0ac269d1@redhat.com>
 <5bc78ab3-f8e8-c7e3-2f73-05617bbc6c6e@redhat.com>
 <679ba29a-24c7-6684-a565-0e5d5db05b19@redhat.com>
 <e10610f2-9c15-8fa4-ddd0-d010aa72203e@redhat.com>
From: Nick Clifton <nickc@redhat.com>
In-Reply-To: <e10610f2-9c15-8fa4-ddd0-d010aa72203e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlos,

> Are there any cron scripts that binutils might be using directly?

None.  At least none that I could find on sourceware.

Cheers
   Nick

