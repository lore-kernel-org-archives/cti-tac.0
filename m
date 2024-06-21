Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768A8158DB4
	for <cti-tac@lists.linuxfoundation.org>; Fri, 21 Jun 2024 12:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718973772; cv=none; b=WHyBg4NN1G0WEx4oaSv6n5IRDQ7afVvIVzB3+8XO91UbFcE06apaJ1qVdXOo71lLfGqU9rOWHfOYL9ATmqVt4XahbnWZ0aedovN02BZnd/FLC2jN1Ps6dwynWkQzIIG7P7hwnNHNsa4Te37s9gh6WYOfE1nvHF0HwNIj5yxeJcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718973772; c=relaxed/simple;
	bh=WL8LHLbPuZ4HznkS/nps3iBYltmkWhXsLDBsxJKpJs8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=R7hL3E5npxoefFatdmv858beheD95mE2buL6yKMDolrdasPqLliFDENpPetrazz+37wHt61mtOgld7GMab2uNfmxbsjIJExbilwld2V4PI1MuoZRGmpHrBh4JJXfj+6E9x+7z5bOPnj/aPxxm79+gpeB+KhfbhH4LHGpjGjrJT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NJBpwICA; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NJBpwICA"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13B95606BF
	for <cti-tac@lists.linuxfoundation.org>; Fri, 21 Jun 2024 12:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIlxJjKZZZhH for <cti-tac@lists.linuxfoundation.org>;
 Fri, 21 Jun 2024 12:42:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 143996067D
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 143996067D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJBpwICA
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 143996067D
	for <cti-tac@lists.linuxfoundation.org>; Fri, 21 Jun 2024 12:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718973768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=cJYa/a4cYDsMxLcN2X1ygMTJyXwxvPx1TG99tQ7zcRU=;
	b=NJBpwICA7dswTVR4dYCPMC2l7OLMevHfKQwXW4QUYVLs9U42dhZKLXUR10O+z4tjUzej6e
	dydyHFS/CoHG/IzvrRgg7m3WwUs/inSj8Rohk/oZ3du0YxoIDcoJcF9KR9x8qYXkEQIiVF
	qfpVBbOZuI2/1m7ImJUZrKObxaiRPvs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-PndosdXpP0W7IxgPSEWDsQ-1; Fri, 21 Jun 2024 08:42:47 -0400
X-MC-Unique: PndosdXpP0W7IxgPSEWDsQ-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7955f448a2dso217050185a.0
        for <cti-tac@lists.linuxfoundation.org>; Fri, 21 Jun 2024 05:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718973766; x=1719578566;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJYa/a4cYDsMxLcN2X1ygMTJyXwxvPx1TG99tQ7zcRU=;
        b=VGxe+Fhs636YQusvzQHVk+5mA4YPkiw3UjJOXpoBxPGIEdEvwKS/56kYmlVbNnLmyZ
         fraqTnW5I4rpWnbdjTL6tWHK8mDR7bQElpXaeJ4znl3199RkSLcTeUkqxKneCKIqS/rS
         AOxzzBRWBcPAO1nPHPruJZ3gP+FDLjEAOPprtMkRojcG0biaivknm+jevdAgztK6jNHc
         aycXoFNMK4DjDUHa0Hgxolud2t+ECvm1sSYFPvaVX44xOgw7mk4GhL39SQHiQQ9RPaGH
         PQjiHa1iUf4qAqcuOhVfIKeg6cDXLHKJhzSJEVvTUmIvIZ7zTDewa+BymUHiFgUB+i9q
         AFsA==
X-Gm-Message-State: AOJu0YyD256erSskcLW23VJqpb870BVCqk6TuhMaueN62MxDiBzkO8/H
	FuCt088u5nB+6Yt3jAYRkNiuPEpBQVg+okXuTJhEwfDMjAjMdMzHsTdXXpEJgzVPl9n+BZUfp/b
	/jmn9HR4XikrOHfWBcwfZ/d79sUDTlO9YQP6NBRDZRfv6kE4q70Fuvt4cifNm52xzxOq7hJckIH
	0JzIiIaeoFWaGqbr5/g52GppxX8n1GWCKJ6sWDnZ+8uw7l7Zpd5Q==
X-Received: by 2002:a05:620a:2416:b0:797:23c1:4652 with SMTP id af79cd13be357-79bb3e2f53amr920112985a.31.1718973766575;
        Fri, 21 Jun 2024 05:42:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu63EWMEOIy/piaWUN4sAOuYGDR3AQ5E8EBLEEUqtGH51B2q/eJfnKT9DiaO2OYSsRtdiRCg==
X-Received: by 2002:a05:620a:2416:b0:797:23c1:4652 with SMTP id af79cd13be357-79bb3e2f53amr920111585a.31.1718973766144;
        Fri, 21 Jun 2024 05:42:46 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bce91da25sm82947085a.72.2024.06.21.05.42.45
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 05:42:45 -0700 (PDT)
Message-ID: <b3d04984-cec4-456f-a05d-7adccb1c3b3d@redhat.com>
Date: Fri, 21 Jun 2024 08:42:45 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: Migration to CTI services should be an opportunity to reduce
 dependency on git hooks.
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The gcc community was locked out of committing because of
issues with the AdaCore hooks:

https://inbox.sourceware.org/gcc/ZmmK9V1j8F89DLud@tucnak/

This happened again today:

https://inbox.sourceware.org/overseers/3165b74f-4357-4a98-9c25-9d88f253d5a8@foss.st.com/

My strong opinion, particularly for glibc is that we have as
few hooks as possible, and timeout those remote hooks in a
reasonable amount of time.

As we transition the services we should be looking to architect
a safe and robust system that can handle the hooks timing out,
and degrade to a point where information in bugzilla
(which is not critical IMO) can be dropped or updated later
by hand.

-- 
Cheers,
Carlos.

