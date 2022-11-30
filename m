Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB636FBD
	for <gti-tac@lists.linuxfoundation.org>; Wed, 30 Nov 2022 18:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5814040C42
	for <gti-tac@lists.linuxfoundation.org>; Wed, 30 Nov 2022 18:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5814040C42
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NPQjX547
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
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IO1pQRTjJ38v for <gti-tac@lists.linuxfoundation.org>;
	Wed, 30 Nov 2022 18:25:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B76E40C38
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0B76E40C38
	for <gti-tac@lists.linuxfoundation.org>; Wed, 30 Nov 2022 18:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669832710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RfkU54P1kYlU0OY5qWNgmnvB4UzSgRQRzQAcpSC0bVg=;
	b=NPQjX547JWPfR7+O1QViVzxBz6qhUaRQViKZ6yvipehneFalf0Vgaz+dPyjAjOKaLjGRSa
	606nZQKbWoTEgQWsxPyzCQIKW13g+JRwZGdS2hPMg+7Q4RKQSgJZwcVUt59J5c3VlYX3wa
	LHsVIqkMEOUiO2NKMaWzOsdA5VBtXUk=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-580-KL4gn1uFM8mZAl8EzcPgEw-1; Wed, 30 Nov 2022 13:25:08 -0500
X-MC-Unique: KL4gn1uFM8mZAl8EzcPgEw-1
Received: by mail-il1-f200.google.com with SMTP id l16-20020a056e02067000b0030325bbd570so4621030ilt.0
        for <gti-tac@lists.linuxfoundation.org>; Wed, 30 Nov 2022 10:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfkU54P1kYlU0OY5qWNgmnvB4UzSgRQRzQAcpSC0bVg=;
        b=yXAw08pGhiaouQ7YrBrPJe63gH7ebf8slz2CbK2CqLt3+D3F5aljsHXNZYL5C0AkKP
         K9MxVwwcdwvQxiTR/f61w+bzs1eBnOmWJlN8NETJBXvFFtvgaOxqC0Mj6QaLUsaCAGQA
         yIzdXmOzIKUuYyH2g0aiq5f3OQYHQynC/RhSEJ02n82dFhaa9FF5Va4xt8n9t51sEeN/
         CMqF9jTWo3ydRBJLqoaHCFmzvY2C3oEpXSVMCaVBz8wiY+BUA6wVYBEi0X9EmzbM61XG
         fCrS7B/qOwJi8Z9NpCG6FfYcbISU4ig70YnJghVH3+C9aP0AkfVYs7m2jtWwFERsYhKO
         FcSA==
X-Gm-Message-State: ANoB5pmrDyNjfjmARJE9QP1Ti77gQafyfUC46HyCZ7mU8YTmzLj0x+V0
	P96Os/gofEWnWDkgAwqvPvALkxP2IXzY2nKTuOu7g0qVA2W4kS29M82fNL65GxV8WTdV8qr7qAM
	IVsVWmShOLvK4zc+c4VWMzfibein7N64=
X-Received: by 2002:a05:6e02:1d8c:b0:300:da4a:f8f6 with SMTP id h12-20020a056e021d8c00b00300da4af8f6mr77359ila.99.1669832707156;
        Wed, 30 Nov 2022 10:25:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4m0dGnBC69acHR6Q3HUfJevQ4gohBoMckQ63Y3gx/Wb09paJ2pGEK1kMUylv3tgGecealZbg==
X-Received: by 2002:a05:6e02:1d8c:b0:300:da4a:f8f6 with SMTP id h12-20020a056e021d8c00b00300da4af8f6mr77353ila.99.1669832706892;
        Wed, 30 Nov 2022 10:25:06 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id c12-20020a02330c000000b0037508cc0bc2sm825895jae.12.2022.11.30.10.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 10:25:06 -0800 (PST)
Message-ID: <385054cf-6062-c379-413f-052627cb1c05@redhat.com>
Date: Wed, 30 Nov 2022 13:25:05 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Testing LF BBB instance for GTI TAC meetings.
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: gti-tac@lists.linuxfoundation.org
References: <957106ad-24b6-e144-1132-faa7f1714371@redhat.com>
 <20221130181102.qnteq5nvbxuiezob@meerkat.local>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20221130181102.qnteq5nvbxuiezob@meerkat.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/30/22 13:11, Konstantin Ryabitsev wrote:
> On Tue, Nov 29, 2022 at 05:08:24PM -0500, Carlos O'Donell wrote:
>> I want to extend a big thank you to the LF IT team for moving
>> forward and setting up a BBB instance that we can try using for
>> the GTI meetings.
>>
>> The previous GTI TAC meeting was hosted by me using 8x8's Meet
>> hosting service (hosted Jitsi). We had discussed using BBB since
>> it is well supported and is empirically more compatible than Jitsi.
>>
>> The BBB instance is here:
>> https://bbb.linuxfoundation.org
>>
>> The GTI TAC room is here:
>> https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1
>>
>> At least two of you tested an earlier BBB instance, and this new
>> instance has been upgraded and updated to avoid previous issues.
>>
>> I will be looking for volunteers to test out the BBB instance :-)
> 
> FYI, the hosting provider is doing some backend work today to complete the
> move, so please don't be alarmed if you get an error in the next few hours.

Thank you for the update.

We'll test tomorrow to give them time to complete the move.

-- 
Cheers,
Carlos.

