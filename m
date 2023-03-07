Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E1836E
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Mar 2023 04:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D67E74017C
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Mar 2023 04:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D67E74017C
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hA/RniCo
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
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AK7_KrnBJw7n for <gti-tac@lists.linuxfoundation.org>;
	Tue,  7 Mar 2023 04:17:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A422E400F5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A422E400F5
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Mar 2023 04:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678162674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NuY4+dIaJuOrbZtBhWQTq/qHTYukSW5+OxGH/NOYIMM=;
	b=hA/RniConuf3H3YLzCDkKv4xVzQ5rWH5ZYbPXKurxdH25BbJABKpDgGN7qkh4dZoZmKSf3
	9hYHtmCj+0gzYmdV2n4NdIgX6XfdYg3oV/OeCHWe3HlQ30EJNr+jcnjdt7Ch+FcddtNJ1o
	360mzwPmdRnzCfAAH07MRgREh3wG7z4=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-8Cy2nGGFOg6FnXPCsw2TYw-1; Mon, 06 Mar 2023 23:17:53 -0500
X-MC-Unique: 8Cy2nGGFOg6FnXPCsw2TYw-1
Received: by mail-il1-f200.google.com with SMTP id t16-20020a92c0d0000000b00319bb6f4282so6332303ilf.20
        for <gti-tac@lists.linuxfoundation.org>; Mon, 06 Mar 2023 20:17:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678162672;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuY4+dIaJuOrbZtBhWQTq/qHTYukSW5+OxGH/NOYIMM=;
        b=KrM/uGx2moC01fNmhnFZ35uN2z0zQ+GoyNz5voX8799kvgJbxUznGHEGSNVBd3Wjfg
         NdYRf1MRP7q0HoxkXNqIXNerfYyvXVoQfuzi6/VPwttyiGc5K/w+ThBjE0U8QF8Jviux
         4jbEebXgl03YM0aTk9T04IZu5xJkss3+XF4EoShk5uo8ioiJgyZ/KdHL41LFx593KOwk
         iaZvy95XI5memzWBzwgprN0W5/cQC2wsZJEFxrneev3xJAFrgVTzbzVNRov9QKY5bctd
         FovpPCZGB8i9W/566TXI2wpyrNUbY3XapPS1utrB11mxk5CPZFOxLTLNHuqnoN8B7gat
         wkWw==
X-Gm-Message-State: AO0yUKVXEPim05Etz3a0G00Q/XlwAiMPtstmcDOliBfHyNj66Vf4M2y+
	u611qeQKBL9axPxzoiJhO9n6JKICE56jRYh1k7h0TkDY+taWEgAYK6Etwt45fvZRdC9i640t56e
	ITVpD/xnU+USmoFDcOtTzK3oyySxNReo=
X-Received: by 2002:a05:6e02:1b0b:b0:314:20e6:133c with SMTP id i11-20020a056e021b0b00b0031420e6133cmr10327318ilv.3.1678162672560;
        Mon, 06 Mar 2023 20:17:52 -0800 (PST)
X-Google-Smtp-Source: AK7set+C4pdYW1+wCCsBZ9bbtF9LO0sQfhg7Ex/h2dQjdJqlNol3+hAqKTd4UF5OCq4uImF7EtPh3A==
X-Received: by 2002:a05:6e02:1b0b:b0:314:20e6:133c with SMTP id i11-20020a056e021b0b00b0031420e6133cmr10327309ilv.3.1678162672225;
        Mon, 06 Mar 2023 20:17:52 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id q23-20020a02c8d7000000b003a60da2bf58sm3707995jao.39.2023.03.06.20.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 20:17:51 -0800 (PST)
Message-ID: <e2750d02-eec0-ef13-9dcc-2de2ff56bb9e@redhat.com>
Date: Mon, 6 Mar 2023 23:17:50 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Planning the next GTI TAC meeting for March 8th.
To: "Jose E. Marchesi" <jemarch@gnu.org>,
 Simon Marchi <simon.marchi@efficios.com>
Cc: gti-tac@lists.linuxfoundation.org
References: <db67f1f9-320c-18fc-f196-5923cc622c0a@redhat.com>
 <256fbbba-4b71-4fc0-3646-2c338253ba34@efficios.com> <87356l7tix.fsf@gnu.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <87356l7tix.fsf@gnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/3/23 10:18, Jose E. Marchesi wrote:
> 
>> On 3/1/23 10:16, Carlos O'Donell wrote:
>>> Team,
>>>
>>> I would like to setup a GTI TAC meeting for March 8th at 11am EST / 4pm GMT.
>>>
>>> Does that work?
>>
>> Works for me.
> 
> Same here.
> 

I've scheduled the slot for those on the TAC that can to meet
and discuss some of the items face to face.

I'll post summaries here to the list of what was discussed.

The agenda is to talk about how to keep moving forward with
the GTI agenda to support the projects that want that support
and how to make incremental progress.

-- 
Cheers,
Carlos.

