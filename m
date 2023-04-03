Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552C3747B
	for <gti-tac@lists.linuxfoundation.org>; Mon,  3 Apr 2023 18:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9BDD60C24
	for <gti-tac@lists.linuxfoundation.org>; Mon,  3 Apr 2023 18:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9BDD60C24
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QNC/QKCP
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id grxtF3bYMoXi for <gti-tac@lists.linuxfoundation.org>;
	Mon,  3 Apr 2023 18:04:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC51D60BA9
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EC51D60BA9
	for <gti-tac@lists.linuxfoundation.org>; Mon,  3 Apr 2023 18:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680545072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zIftpsf67oQFIRjqoHDrV0gD3I4BHZMaVWg/nKP3q5s=;
	b=QNC/QKCPlRS5Kb9ZOcsrm4SUVIBZNpT0dcXlVsabNKBkguFQ7UZB3+TVm5px+7x1KIl9PK
	IPv3UChtP0woJ50uONTB1oEeEte1ZR9AoWZIh9IXGg2Ah4fXroDtqc0E5HIzjgMqdPD3sT
	ACgNqGioLgDhaPA8nKZ9/qxiE5Wx8FA=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-rpnS_ckSNUmM47wLkcndvg-1; Mon, 03 Apr 2023 14:04:31 -0400
X-MC-Unique: rpnS_ckSNUmM47wLkcndvg-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-5419fb7d6c7so297657787b3.11
        for <gti-tac@lists.linuxfoundation.org>; Mon, 03 Apr 2023 11:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680545071;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zIftpsf67oQFIRjqoHDrV0gD3I4BHZMaVWg/nKP3q5s=;
        b=tQz6b2nR40h0/7gCRqP3hlDFnJnUcjmqLM6nNttfLE4vzgfd4oiiUaphKV0MeABmGl
         0EHJMufDGzTwFHh6a3sksTB6f5IqNpMZSyaXKzU398iLSwYu3A1FVhtvH3K2yY2JM+4H
         QLoU/l71vC+8aS0efHL+Q4X0WaCCshEIGzdxMm+nKKHaIacGLJ0PHKA9Pn7ZEAyh0Fxz
         vlnUuH99cc3RTFcrM2T5DA2GpRX+HSPdr95LkBjcbDjwIR4oKOKUfZh4pHYRTu8k1wGb
         aYAzupkmh8ChfTz2KTeXyqsf/Csu6o0im3uuKWISFwdd2HSDoy29XutdUba6NAGD4MN/
         F7eQ==
X-Gm-Message-State: AAQBX9c5q/oAm/eraXdsy/oXcHk5YDbKAVpwdhx0VXd69/elD/Emgo8y
	ypSpld6LjDfwfL/B9AMj24Qd7Rg89hZj5dy7kbsn2Uunoy0TvLs/cGUR228epfjmsApHz+F9OGR
	BZ6huXGYZUtonKhvbiyxK1VKe/8HRQz6BKxHfE5lEP39JSkr1OYm2Qv+hiaMTF+NXVV8Rd1k9/y
	vaFTCb2eIQCHSw
X-Received: by 2002:a25:608b:0:b0:b67:59ca:b340 with SMTP id u133-20020a25608b000000b00b6759cab340mr141819ybb.8.1680545070749;
        Mon, 03 Apr 2023 11:04:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yfln7D0NOKx5YRbTFLM7jYkbO6n6/YhQ74optN/YjiaNhxKTsAODq45hFsQzvnxBU4LqrbqQ==
X-Received: by 2002:a25:608b:0:b0:b67:59ca:b340 with SMTP id u133-20020a25608b000000b00b6759cab340mr141796ybb.8.1680545070298;
        Mon, 03 Apr 2023 11:04:30 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id o78-20020a25d751000000b00b7767ca748fsm2692155ybg.44.2023.04.03.11.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 11:04:29 -0700 (PDT)
Message-ID: <74d44891-f436-f949-0efa-bca9b1351ecf@redhat.com>
Date: Mon, 3 Apr 2023 14:04:28 -0400
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: gti-tac@lists.linuxfoundation.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Khahil White <kwhite@linuxfoundation.org>
From: Carlos O'Donell <carlos@redhat.com>
Subject: Size of bread box analysis for gcc, binutils, gdb and glibc total
 migration.
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Konstantin,

I would like to also update the current "size of the IT bread box" analysis
for gcc, binutils, gdb and glibc as a total cost for CY23. This will help
the OpenSSF plan for backstopping the cost.

GCC service enumeration:
https://lore.kernel.org/gti-tac/7e59d8db-7b26-1249-ad5c-67b7f3411e1@codesourcery.com/T/#u

GLIBC service enumeration:
https://lore.kernel.org/gti-tac/13b3266b-a410-77fd-5dfc-4e4994b630cd@redhat.com/T/#u

BINUTILS service enumeration:
https://lore.kernel.org/gti-tac/679ba29a-24c7-6684-a565-0e5d5db05b19@redhat.com/

GDB service enumeration:
https://lore.kernel.org/gti-tac/b755774c-3912-2dac-957c-91f659c95119@efficios.com/

Please send such an updated "size of the bread box" to Brian Behlendorf
at the OpenSSF and Khahil White (on TO:).

-- 
Cheers,
Carlos.

