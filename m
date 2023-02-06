Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6856B7B
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 17:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E275C403A7
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 17:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E275C403A7
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hyRMwmP4
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zCbtcTodoUtJ for <gti-tac@lists.linuxfoundation.org>;
	Mon,  6 Feb 2023 17:28:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 429B140383
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 429B140383
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 17:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675704509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yTbB14wkHovqdKHDl5uIWZIpIJsZ1eoomBF2bv9w2xw=;
	b=hyRMwmP4tVMYvXJP/qnVTvU/99LvIMYzJv1JQmrflO9zyHKKfVEU17JxURS5tLf5Z1Jwgh
	YwwH3fe3yyr50VCVI7B1HW5u0nuDo/PXe3lPiLUojymqXXXnhRqR/LMTNNE7hAQrVeewoJ
	XQ5y6GJUTtjnN31GdD1PKeOIbWPtHxA=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-eFiy5-AWPDipmu4VmR12sw-1; Mon, 06 Feb 2023 12:28:28 -0500
X-MC-Unique: eFiy5-AWPDipmu4VmR12sw-1
Received: by mail-il1-f197.google.com with SMTP id r18-20020a92d992000000b00313b6f93d45so3917993iln.9
        for <gti-tac@lists.linuxfoundation.org>; Mon, 06 Feb 2023 09:28:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yTbB14wkHovqdKHDl5uIWZIpIJsZ1eoomBF2bv9w2xw=;
        b=oSD6YMzG+nE0JY49JddJWT9WUbwawZP/K1iMZT9QE8y5dH2JEv/FNJSGZTc3jPeC33
         3Y5w17BbTujMdPq2fURdmHFcQQXAwAMwj6eTNlAy4WjDG8OC4frRSCy7xosdLbILxjII
         EZcZanKx2dN3HqoECFyVLY6lzTW7Ocn5ZmVYeImakA4LRiWUdbo5VndJPkwGiifR7M3o
         ePD/rNCWH7HUj5HTxgSdLcMD7/TtBHbOs3QG6WrpBRmRUheSlS34k0xKkr1S4Aosbyqt
         5moB7rUIL/GAadLaNucevPXcqOzTRbgFdHq2fgq4fmZ6r9hjWearUJl06uvpFVAb+f6G
         OPTQ==
X-Gm-Message-State: AO0yUKWHsm5ZV65MgtV2WbyJpsh1Nu3MN3aQ9N4R7befov6FVj8TkLeV
	YurjHDbH9cfEUJUaOlQbpxCTzVLPZqz2cFH9o58elZWIuztCTtGBVSm7qsLqNTDiqCel6YYk7DR
	lotXf5V/k5XoyNETnkmnXLL/nPHSSs+QhXtJLZDpND9btU69iox2tNX9OgY03G6HgvUf8MxVUYk
	UHeWYu
X-Received: by 2002:a05:6602:5c1:b0:722:b81a:cccb with SMTP id w1-20020a05660205c100b00722b81acccbmr12626047iox.16.1675704507692;
        Mon, 06 Feb 2023 09:28:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+t+9WQU4hZAioruX9gPIiRrfI2tRBOBNZ3NUMiWPrke62UDFNNZU6ub2K3EAyQozF23LHVDw==
X-Received: by 2002:a05:6602:5c1:b0:722:b81a:cccb with SMTP id w1-20020a05660205c100b00722b81acccbmr12626032iox.16.1675704507337;
        Mon, 06 Feb 2023 09:28:27 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id c31-20020a023f5f000000b00389fb6c2ca5sm3661077jaf.98.2023.02.06.09.28.26
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 09:28:26 -0800 (PST)
Message-ID: <e7563276-8d8a-7cb2-0da5-f838969d9c2d@redhat.com>
Date: Mon, 6 Feb 2023 12:28:25 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: gti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: Planning the next GTI TAC meeting for February 2023?
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

With the binutils and glibc releases out of the way for January,
I would like to schedule the next GTI TAC meeting and possibly
setup a recurring monthly meeting to discuss progress.

Suggestions for dates:
Wednesday February 15th 11am EST / 4pm UTC
Thursday February 16th 11am EST / 4pm UTC
Friday February 17th 11am EST / 4pm UTC

Agenda:
- Review glibc and gdb service notes.
- Discuss status of gcc service requirements.
- Is binutils the same as gdb services?
- Next steps after full service lists are complete.

-- 
Cheers,
Carlos.

