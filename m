Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10425E574
	for <cti-tac@lists.linuxfoundation.org>; Thu, 25 May 2023 11:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F4D084140
	for <cti-tac@lists.linuxfoundation.org>; Thu, 25 May 2023 11:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F4D084140
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ws04n7oR
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
	SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pX_2x7IywvlE for <cti-tac@lists.linuxfoundation.org>;
	Thu, 25 May 2023 11:12:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E47AC8413E
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E47AC8413E
	for <cti-tac@lists.linuxfoundation.org>; Thu, 25 May 2023 11:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685013140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0jsym2htcwIiLyq6nlv59grw9+YoXbCM6t6P8gGpKaM=;
	b=Ws04n7oRnq06rL/MEx1u0OKpXcDqnJoIeeU4Il0iupcMu7X/jZ6ylDOlBpYb1PYn0t/22b
	Ka0GvLode2F/UJKibWOzSDerB/am/xdvCKE3a/hKNztX696n3L8y6myfFroWNfHeFo8pQl
	De37YINgYTORQKfjswPNBOQyRWEreMg=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-ZKKB5QlHNA2nLKGpODBV-A-1; Thu, 25 May 2023 07:12:18 -0400
X-MC-Unique: ZKKB5QlHNA2nLKGpODBV-A-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-5653213f5c0so9112107b3.1
        for <cti-tac@lists.linuxfoundation.org>; Thu, 25 May 2023 04:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685013138; x=1687605138;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jsym2htcwIiLyq6nlv59grw9+YoXbCM6t6P8gGpKaM=;
        b=AmxN4MiXZS09rzj8tmomDYJf9dEfQUWKzBSFgAjXwzxWD/8ICo9fWKpu+S92YCCwwg
         ZvI9vU1cboEu57vJJAq1eaGr1rHjMv9suUG9J3ncy5A03LzZEBTr2W9tm8SIHseK8dAv
         7JX8bcHz4omJ5IdYJBl5j48qDkik77XRvgIuKVELn7ACq+0/+gYbnS7T1qBI03L70gaZ
         tlOXuG6OXkTM1vrk8ix9leKjGsjWzwKtgUPib6M1N/tSYk9dtk1t3xBJdLuPkvWNaHGs
         3hQNrHEVXYFQ6pINgZ7RjW9W48j2Yi6vxw2Bim7Cl6Au72xfbGTKsyoNlp80TkZy6BbN
         bwUg==
X-Gm-Message-State: AC+VfDwmvhfHFUc4yb3UmIBx5GQQe24hsQ5xphlymbea4GUzmeArgyYX
	XVTiaAz8l8s9yvs/xI0qxz+inGhxrJFO3TDWq0xFf2BL23SSSWTU5eBh1X39oPZHeb+Sjkcr/Wj
	Lc+v4BgfnuUNH6DbKA7vdRhBvhTm7kVU=
X-Received: by 2002:a0d:f8c3:0:b0:565:7dbf:c066 with SMTP id i186-20020a0df8c3000000b005657dbfc066mr4629661ywf.26.1685013138481;
        Thu, 25 May 2023 04:12:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5RK/v3srs/bgtiev4FNFdHfhSGgO5uq2sQT+CxHbubSjZZZFvplZOIG41H8SKlhu2GNPtLuw==
X-Received: by 2002:a0d:f8c3:0:b0:565:7dbf:c066 with SMTP id i186-20020a0df8c3000000b005657dbfc066mr4629644ywf.26.1685013138247;
        Thu, 25 May 2023 04:12:18 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id c184-20020a0df3c1000000b00555df877a4csm277164ywf.102.2023.05.25.04.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 04:12:17 -0700 (PDT)
Message-ID: <4ea74598-2ce4-804e-344c-c1465f9082c7@redhat.com>
Date: Thu, 25 May 2023 07:12:16 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost of
 glibc migration.
To: Siddhesh Poyarekar <siddhesh@gotplt.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Joseph Myers <joseph@codesourcery.com>, cti-tac@lists.linuxfoundation.org
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
 <20230523-ankle-infer-spurs-55ac6f@meerkat>
 <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com>
 <20230523-banks-calve-rio-844c98@meerkat>
 <7f11ed34-9529-9b3a-e720-64bd3a85542c@codesourcery.com>
 <20230523-cease-candle-debase-dd7485@meerkat>
 <cd8ad55d-38c5-72f1-3464-b5968d1f8fde@codesourcery.com>
 <20230524-december-goon-09e728@meerkat>
 <a4c8b242-7ab1-a0da-fbe0-19cffe1a6054@gotplt.org>
 <20230524-gloating-diocese-cde658@meerkat>
 <0f264640-83ca-18da-9b8f-e04e7e0fc960@gotplt.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <0f264640-83ca-18da-9b8f-e04e7e0fc960@gotplt.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/24/23 17:12, Siddhesh Poyarekar wrote:
> On 2023-05-24 15:06, Konstantin Ryabitsev wrote:
>> On Wed, May 24, 2023 at 02:13:53PM -0400, Siddhesh Poyarekar wrote:
>>> It looks like the question of who to ultimately trust, either the gatekeeper
>>> committer (or two) who is the only person to have write access to the
>>> repository, or the admin who manages the box.
>>
>> The maintainer's action are in the public, while the admin's actions are
>> hidden.
>>
>>> The gatekeeper committer could also fabricate commits and push to the
>>> central repository in the same way.
>>
>> 1. Not with nearly as much impunity, especially if non-fast-forward pushes are
>>     disallowed.
> 
> If an admin makes a change that needs a fast-forward, anybody trying
> to sync their repos would see the forced update.  I'll admit though
> that it's arguable how many would actually notice the message.

Right. Some of us would, and review the situation.

Let me be clear though, Google *accidentally* force pushed on glibc master branch
on 2023-01-10 and the hooks didn't stop them, and it is a known bug in our hooks.

Joseph noticed and called it out... I didn't notice. Nobody else noticed because
it was the most recent thing in HEAD and nobody had pulled yet.

-- 
Cheers,
Carlos.

