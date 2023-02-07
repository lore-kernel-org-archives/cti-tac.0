Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93538322A
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 13:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B55C60F74
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 13:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B55C60F74
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=goLRCzPf
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
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CyVkKnLcmQa0 for <gti-tac@lists.linuxfoundation.org>;
	Tue,  7 Feb 2023 13:55:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74A5E60F58
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 74A5E60F58
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 13:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675778152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uX08qE64HPIvyh94BYVd3TJ18YOo132OGzRSaY2Ch1Q=;
	b=goLRCzPf2NIncnQHB7lEoNTpO9CtRiXASU4L00Z48Ab7ubNO6WBs5AL4AixIVAEFxjQrF/
	Usoyb44W4WS/2jL3Ewx73gvSlm32KaOJ7f0AoO+PSvNbWGP7Zf3RtajzTskAqYys4OIY19
	sWv/lylPw4EsDUdPdyyJ1dVYJkKGY2g=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-fVR_wyYiNYS5jb5NSMo9Tg-1; Tue, 07 Feb 2023 08:55:50 -0500
X-MC-Unique: fVR_wyYiNYS5jb5NSMo9Tg-1
Received: by mail-io1-f69.google.com with SMTP id k4-20020a6b7e44000000b0071e11cafea7so9218979ioq.15
        for <gti-tac@lists.linuxfoundation.org>; Tue, 07 Feb 2023 05:55:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uX08qE64HPIvyh94BYVd3TJ18YOo132OGzRSaY2Ch1Q=;
        b=Xbp3flNcxsLMgXLBQ7CkopLgAszUcNxNGrneDpcMR0ATc28LwcdbCOCUmy9Q7w0jXS
         rDG2WZqQ2G8Sd8Hz0hXiV/tDUEDQivIgbc47+7QjstgD8U4XfsMDq/iU8S+f1dRpktrv
         MiRxJS+o++9l2aiZ1kd3Nn2ZFv6NleAgFd5keGT8dNcTxekwtm9dT1YfW2pmDD60SE2z
         WByaZElXNJ2XCQaNWkzYbqv6jVnvO5VJZ1vwF0NP+ddc89NLdBWlFYFrLOoLovNUR+Wz
         FDUoYQw80FTYOzIfswRORlDizvgglqTgshk1tLrwyTnHkQE7furu2FmyWYnfxsic+zZR
         ooLQ==
X-Gm-Message-State: AO0yUKXGmHN8klvu1VeqtJK9QAUmtpXvohyz0bKSZ1lC0grCPOksdwQo
	8mrmPoiaNKk344o/xaVrtbf1qJIx3oOsBgSr7PXKbk9FeBTeUWgNJMS7lAJBTibAd+CF3D/u/KO
	isGXkpTSz3jwVgP1jsocNM81hml0vIn6zdNvL
X-Received: by 2002:a05:6e02:1d07:b0:313:ba27:44a with SMTP id i7-20020a056e021d0700b00313ba27044amr4182383ila.32.1675778149902;
        Tue, 07 Feb 2023 05:55:49 -0800 (PST)
X-Google-Smtp-Source: AK7set/FrebUTZ2Yws4ci1f1DRFJOvPAdovdMCuAkssiB8I8F/793J6YCnr+Ejq7kihNUhnvjmlQYA==
X-Received: by 2002:a05:6e02:1d07:b0:313:ba27:44a with SMTP id i7-20020a056e021d0700b00313ba27044amr4182367ila.32.1675778149574;
        Tue, 07 Feb 2023 05:55:49 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id w193-20020a022aca000000b003a5de29178esm4538046jaw.104.2023.02.07.05.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 05:55:49 -0800 (PST)
Message-ID: <5bc78ab3-f8e8-c7e3-2f73-05617bbc6c6e@redhat.com>
Date: Tue, 7 Feb 2023 08:55:48 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: CY23 - Status of service enumeration.
To: Nick Clifton <nickc@redhat.com>, Simon Marchi
 <simon.marchi@efficios.com>, gti-tac@lists.linuxfoundation.org
References: <d8790f60-483b-dfc6-dd7f-cb408334eb40@redhat.com>
 <bc978ef9-3d6e-d032-252b-3aae460c895a@efficios.com>
 <4718eb70-b843-0f46-9555-cbba58f70713@redhat.com>
 <5e2916df-018d-e591-4301-910c0ac269d1@redhat.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <5e2916df-018d-e591-4301-910c0ac269d1@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/7/23 07:55, Nick Clifton wrote:
> Hi Carlos,
> 
>>>> Is binutils going to be any different from gdb?
>>> I don't know about the binutils process.  Perhaps we can ask Nick
>>> Clifton to review our list for GDB and complement it with any
>>> information specific for binutils?
> 
> It is basically the same.  We use the same git repository as GDB,
> the same bugzilla and buildbot systems and the same website hosting.
> 
> There are a few discrepancies however:
> 
>   * The website contents are not generated by scripts, instead
>     they are hand made.  The documentation parts of the binutils
>     web site are created by building the docs locally and then
>     uploading to the site.
> 
>   * We are not using patchwork at the moment.  Given the relatively
>     light patch review load for the binutils, it may never be used.
> 
>   * We do not currently have daily snapshots of the binutils sources
>     although these used to happen in the (long distant) past.
> 
>   * Not quite as many mailing lists as GDB, but basically similar.
> 
> Do you want a full list similar to the one produced by Simon and Joel
> or is this discrepancy information sufficient ?

It would be great to have a full list similar to the gdb one :-)

-- 
Cheers,
Carlos.

