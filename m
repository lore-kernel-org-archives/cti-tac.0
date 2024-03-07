Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA37F131E3C
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 22:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709849060; cv=none; b=CC4RPQWMEgid/ulURY91z78QjKkEB/3y3CQ7kZtUpKsqiu3JnEhuPuUEWd3+bCTLPCi8zGsqmD+RU3PY8NxJpznLxOjyENdxQBBToH/Lpvr6lqsbdKp2i5xfWSR6JPmuAsDldr3Iot6/JcfHwH1YeWOtfe2w+4L3Ft65pBkoyFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709849060; c=relaxed/simple;
	bh=58i7QL7e10NazHGBfxZ/520W7hHfpggzjcp46rtKzO8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=n/x152ur9V0idG7JOt2B/SX2N3jdrS0YcMJ+yz2D1ekO5jsxmV22UzTKQ52ggg5lTOFo5y0jsV/HMhkG0b8CvMpTIjcQzd3cgNaAdFXzNbow9p1syUzeKlWIWa+4J+TS2S7FTHZyVUfUat0JcHBQyAh/xs7i6EKJ0uJk3NPpXyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CBJbgE9V; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CBJbgE9V"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BCCC60AAE
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 22:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.601
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lv_mk8365imi for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 22:04:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DEF44608DE
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEF44608DE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CBJbgE9V
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DEF44608DE
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 22:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709849056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jHEXJIjAj86QRzPwA7YIEb/KOk2EX5FAYT535Z1X8Zs=;
	b=CBJbgE9Vu2lfYq/oYL5P9ifnxaBvtLwc6FKu1dQoxF8iejfaTvFsG1fPbsEW0f8tgTU/3D
	0f9/XT8BOafq0ypkYNrz7EetlF1GaF9rcdzDcpExDUnVM+tHQ0P/7jVljP+QoVK/+vAH1U
	9bX6ZE/ANbelbRWHYS4OaGVRSs3B9Ws=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-ppVpPUoON6KvIsvSrb3T9w-1; Thu, 07 Mar 2024 17:04:14 -0500
X-MC-Unique: ppVpPUoON6KvIsvSrb3T9w-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-42eeee47028so11690861cf.3
        for <cti-tac@lists.linuxfoundation.org>; Thu, 07 Mar 2024 14:04:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709849053; x=1710453853;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jHEXJIjAj86QRzPwA7YIEb/KOk2EX5FAYT535Z1X8Zs=;
        b=aKBGnvHm8LwSJb4yljwaYas+KnyQ6K0CNPAvOp0mSSBQDhLLykORzEypC0ZS+8QMoN
         CMTVb4gN8RQYYWsfTgMl9Kpxx7lci/hgBnufDQOFXBTEhvqIXzqyxnjdojPPFxpYpKHY
         ptEgxmGs6QfpCqcWnDGzWTQOEhCegFo954XBWhN6jFiS82S8tzk4J2UbDNwp9rlhVlYa
         VRsuPnVZ0sbARzpVfbGMCvo2tce9wTk7GsyZTFbAq1FJJzGAjM9rrNQkgFAtBSHtsQWN
         Vjdq4DlB6/RkBOm6tMgF/BfS0PcGTIiKrvqWFzxdlU9TnWUOCtO6Ky9r9ohCYnVWA14A
         UY2Q==
X-Gm-Message-State: AOJu0YwGEGH10Opqdr7YosB7FFgGOhEPrUYnVP21AfvJcbWkhHazCyQB
	4d+y9qx+dAqrUj4W+HM5xxGdBZTuCJWcNo4DYbsxqD+yA7zgbzfyZCne6xC7AMQJMgqDxLk2Oid
	ZH5xL+jP9QLNIN92AryjsCjS3OpTjEvB4zuvwOHAJJMKnxr/SaIjFgQogIfaKwliUWUK4EV5Zr+
	5ba6vX7HseIMt6vaH2TvVTCnPAfVaK6ZvKjroXXNzfyluuqK/79g==
X-Received: by 2002:a05:622a:350:b0:42e:ecab:582 with SMTP id r16-20020a05622a035000b0042eecab0582mr10018172qtw.68.1709849053215;
        Thu, 07 Mar 2024 14:04:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGas9yjhpkIUa4qtZSa5NPgxfrm7sAMtJ7kCan3qd/FYejN0irEu/WbPjCKP4gYYMDusvUthQ==
X-Received: by 2002:a05:622a:350:b0:42e:ecab:582 with SMTP id r16-20020a05622a035000b0042eecab0582mr10018148qtw.68.1709849052742;
        Thu, 07 Mar 2024 14:04:12 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id p1-20020a05622a00c100b0042f0008b8b7sm3242020qtw.35.2024.03.07.14.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 14:04:12 -0800 (PST)
Message-ID: <312f9b73-3055-44fb-bde6-1b631b189cb5@redhat.com>
Date: Thu, 7 Mar 2024 17:04:11 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
From: Carlos O'Donell <carlos@redhat.com>
Subject: Anonymous read-only access to CTI website gitolite repo?
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Konstantin,

How do we setup anonymous read-only git acccess to the CTI website?

That way we can get contributions from outside the TAC.

-- 
Cheers,
Carlos.

