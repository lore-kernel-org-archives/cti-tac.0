Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17646FDF
	for <gti-tac@lists.linuxfoundation.org>; Mon,  3 Apr 2023 17:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46BB781389
	for <gti-tac@lists.linuxfoundation.org>; Mon,  3 Apr 2023 17:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46BB781389
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QkjiU6Lm
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VFYAnKwL1rwL for <gti-tac@lists.linuxfoundation.org>;
	Mon,  3 Apr 2023 17:28:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDFB681347
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CDFB681347
	for <gti-tac@lists.linuxfoundation.org>; Mon,  3 Apr 2023 17:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680542918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4VEposU/faITtwIayIqE5bLsI4PuwPHIxe/L1lXGgtw=;
	b=QkjiU6Lm1vxmeoWo4SvDWlxnp1NsKxWcLwM7v9Q8LkUwCFb05bPiiYYVVmD4Bbuq3VfiDP
	pGhK8B0vptqlTScsEd+Uo9peyKry/LV/ulUiMaJrEZFbEJwnl42T2syj7pm9mjttjn1mQV
	V/ldWeb6/YeXPN8uij/oQTn55xp/aAY=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-Wi3j0SgHPHuXhqf6ugOlTA-1; Mon, 03 Apr 2023 13:28:37 -0400
X-MC-Unique: Wi3j0SgHPHuXhqf6ugOlTA-1
Received: by mail-yb1-f199.google.com with SMTP id c193-20020a25c0ca000000b00b868826cdfeso4626760ybf.0
        for <gti-tac@lists.linuxfoundation.org>; Mon, 03 Apr 2023 10:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680542916;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4VEposU/faITtwIayIqE5bLsI4PuwPHIxe/L1lXGgtw=;
        b=BFL1jeJVkOUAwrbbUt4n1ckJmCYlR7g94xKHwOrmPp/+8Qg8mgLYwp9ULcAet8OkZb
         TS8m9gg0/pI8T62o37wyXU10+s4GQblWdc8cLJJ8E4rDhWruKz9kVzrEVYa0PvyC1esp
         hvOkcN6R+Hts4Vb7cEn7oWaGM67RbDzm5pNAQwGnGdKI7tCaH5lJgTEmCspD26fZE8Qe
         RUBqUKrYvuHYf2z4RTUBYenk98V85uDLvnCEXcqwMDRMeEhP5+TRshODkQUHewsezhds
         iZpIGScWroWgbOKyoPo1EWLV1qEvXFSfaNtgtZmCyeqnvhDWGbzVDnbav5XwY1HuK/8s
         ptcA==
X-Gm-Message-State: AAQBX9f3eACbX4zqJEdQBBGpIOs3ch79ZZjAfW7zK84H8VdCMbe6SCXG
	jcjrssd5nxTKcSJhZcQMJBZVGXa8VlTM4XLOBHeyGFriimyfe9oExLJznZiAvIKg37uyHRT5Xvn
	T/hLPK2u4p61rgcCqU6YjVw1LQX+7Yr5F2vq8y40=
X-Received: by 2002:a81:5b45:0:b0:541:a189:bc74 with SMTP id p66-20020a815b45000000b00541a189bc74mr32762827ywb.41.1680542916477;
        Mon, 03 Apr 2023 10:28:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yq+KcRFSl3yIrY/i/4K2o5mauSNhWObeL38Tbx4f1ASj2SJOcnoWrevbe9or4qtz/jM//oVQ==
X-Received: by 2002:a81:5b45:0:b0:541:a189:bc74 with SMTP id p66-20020a815b45000000b00541a189bc74mr32762807ywb.41.1680542916147;
        Mon, 03 Apr 2023 10:28:36 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id ck24-20020a05690c0b9800b00549143fb1a5sm1320115ywb.92.2023.04.03.10.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 10:28:35 -0700 (PDT)
Message-ID: <099a21d3-6128-f7be-8bad-acff14e439a6@redhat.com>
Date: Mon, 3 Apr 2023 13:28:34 -0400
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 gti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: Setting up location to store documents for the GTI TAC.
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Konstantin,

At the last GTI TAC 2023-03-08 meeting we discussed setting something
up to store TAC documents.

We discussed setting up gti.toolchain.dev to store those documents
backed by something that the GTI TAC can commit to and update e.g. git
based. I want to stop mailing around "service requirement" documents
and just edit them in place.

I notice that for https://subspace.kernel.org/ you're likely using
Sphinx backed by a git repo.

What are the options you might offer?

-- 
Cheers,
Carlos.

