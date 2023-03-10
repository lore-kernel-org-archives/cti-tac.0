Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902B87F4
	for <gti-tac@lists.linuxfoundation.org>; Fri, 10 Mar 2023 04:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D2E3408DC
	for <gti-tac@lists.linuxfoundation.org>; Fri, 10 Mar 2023 04:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D2E3408DC
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CenM/P2F
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
	with ESMTP id eNy6KwfMG1im for <gti-tac@lists.linuxfoundation.org>;
	Fri, 10 Mar 2023 04:50:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9ADB3400EA
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9ADB3400EA
	for <gti-tac@lists.linuxfoundation.org>; Fri, 10 Mar 2023 04:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678423855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9LqiGfpKe03DDPTH1Jw1GuPPxY8rpP7m4CqLygQNNc8=;
	b=CenM/P2FhaK29ll44ATGWaVzFwysJtX360lpPItdviqpOZu7u6t9vWF6NhgcpCo0khEr0H
	RFL9Kxb2vbXSe1PmjFD94Xq23lVlQ3OPI8T+8UcAZ4z3PsTg6ovSDF+7D3HeHtxiYdtFCz
	7j47M+n7zZNpmEfS1K8YtfN7vk6+0Oo=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-J4r_kSx_NqSKTNl2HyqD3Q-1; Thu, 09 Mar 2023 23:50:54 -0500
X-MC-Unique: J4r_kSx_NqSKTNl2HyqD3Q-1
Received: by mail-il1-f197.google.com with SMTP id m7-20020a924b07000000b003170cef3f12so2079288ilg.22
        for <gti-tac@lists.linuxfoundation.org>; Thu, 09 Mar 2023 20:50:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678423853;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LqiGfpKe03DDPTH1Jw1GuPPxY8rpP7m4CqLygQNNc8=;
        b=wG6FFEJVbxeqkw7O9aWiR7hC4M3t+7xnwXVY5agrJBwDMSyM2BD50adh5EmOkoY2Ig
         mpd5Zq8eL6IPtpFDyphCvW2GzFcevQSeo2NFZu/jC1FiUhtS8WKxuByt58Ud1v4t4Xaz
         G9KR8NC55M3PjvmyDXnrM2//0hAR9YYnQqsrud61LnM3ugiSX03HaDt8ddHYyKHuqhPX
         0zki/XIYueWiKDWrks6cAO0rH+L/aaZBT5aoDoY3Q55WmRYRGd7fudew7vXS20qjnuSK
         VdWHEAmL/wAHwziXVw1/LW3y/Shu4r3c0ieijqteVyaQ70VHREcra4qm2G2vyPaDnsKr
         GyDg==
X-Gm-Message-State: AO0yUKXBz+Lxt4yreRtnNxilBYO7Uy5aboHGuX6EYIttY3uag+wHmBmH
	wmFbP6hHmYVCRsqdvEB17THjy0Z1vWOJkvWpIjnRh+J2XXdK9xaR8tnKpwnBWXlEaMSFSwkZPiy
	sZdf17uKmzgBTQdnD6Oo9a7Uwsu5ymTM=
X-Received: by 2002:a05:6e02:20c1:b0:317:994e:5988 with SMTP id 1-20020a056e0220c100b00317994e5988mr21083555ilq.11.1678423853445;
        Thu, 09 Mar 2023 20:50:53 -0800 (PST)
X-Google-Smtp-Source: AK7set93Q0EEkFx9cGe2gXUTIL8/UmAX2MKVycK6hkDXCpqT7MYvewQNkUDsMa9pXhKdvi8pRgSfDg==
X-Received: by 2002:a05:6e02:20c1:b0:317:994e:5988 with SMTP id 1-20020a056e0220c100b00317994e5988mr21083544ilq.11.1678423853120;
        Thu, 09 Mar 2023 20:50:53 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id q25-20020a02a319000000b003e69be53404sm339965jai.150.2023.03.09.20.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 20:50:52 -0800 (PST)
Message-ID: <83b7663a-114d-6fcd-6a62-ed3e79ba65bb@redhat.com>
Date: Thu, 9 Mar 2023 23:50:51 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: GTI TAC Meeting Notes 2023-06-08
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jeff Law <jeffreyalaw@gmail.com>
Cc: gti-tac@lists.linuxfoundation.org
References: <b72a0c4f-fed3-7418-e9d6-7a277bf37b3e@redhat.com>
 <20230308192923.tuxd3ocrbg3dwqf3@nitro.local>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20230308192923.tuxd3ocrbg3dwqf3@nitro.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/8/23 14:29, Konstantin Ryabitsev wrote:
> On Wed, Mar 08, 2023 at 11:44:47AM -0500, Carlos O'Donell wrote:
>> - Carlos: Where does the complexity come from?
>> - Jeff: Mailing list from bugzilla integration. Lots of custom stuff.
> 
> Can someone pass me the details of this integration? I'm currently working on
> bugzilla mailing list integration via lore.kernel.org and I can see if this is
> something I'm already handling.

We haven't finished the gcc service enumeration yet, it's the last project remaining.

We will dig into this and provide you with the details as part of that enumeration.

Off the top of my head:

Normal Bugzilla behaviour:
- Bugzilla issue updates go to the mailing list.
- Email responses to the mailing list messages go back to the referenced bug.

Customization:
- gcc refs/meta/config project.config used to store customization data.
- git commit hooks used to:
  - Send email to mailing list.
  - Update bugzilla if issues referenced in commit.
    e.g. https://gcc.gnu.org/bugzilla/show_bug.cgi?id=109062#c1

The gcc project itself has ~6k lines of python in the git commit
hooks and part of that handles "message" customization.

-- 
Cheers,
Carlos.

