Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB4C10960
	for <cti-tac@lists.linuxfoundation.org>; Thu,  8 Jun 2023 11:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D5FD610B6
	for <cti-tac@lists.linuxfoundation.org>; Thu,  8 Jun 2023 11:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D5FD610B6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XPG8/NZX
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
	SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DM0sjCyDUZjT for <cti-tac@lists.linuxfoundation.org>;
	Thu,  8 Jun 2023 11:56:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7186660F9E
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7186660F9E
	for <cti-tac@lists.linuxfoundation.org>; Thu,  8 Jun 2023 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686225381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=On56SNO/xkXaYdVeW0qxZmjc64NbJeCnmZu63CoQyIY=;
	b=XPG8/NZX4649XFC0iepXPNmjp/fHhkZGlotOZzr02mOPux2fSlEbviW8fHriROpzItIQHx
	6bBXfhxP7HychNOgnPe6v5b5/DGXIeMKJ+kuVQA8dMof6urIvrCphqTbOPp4WaxLeqaF29
	H9UaDn1LRhdpSBR9Ki7DyCKLxT9G7TU=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-FxOi6PM_M-6L7O9kFCkBdg-1; Thu, 08 Jun 2023 07:56:18 -0400
X-MC-Unique: FxOi6PM_M-6L7O9kFCkBdg-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-5651d8acfe2so7800187b3.2
        for <cti-tac@lists.linuxfoundation.org>; Thu, 08 Jun 2023 04:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686225377; x=1688817377;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=On56SNO/xkXaYdVeW0qxZmjc64NbJeCnmZu63CoQyIY=;
        b=ERhUhq+ryfDloGgwslgJ19sltibECxvmAa6/Hv4QS9HlqbQ3ZCawigIG1LDMam7bdb
         iClqIFYHNtQC2lYouPqmw6lFWZP/SHDSRqaO3y1cKo0PrsiAzhsleHDu28+gV45x/MFh
         3WOFwTLeuwl/67YBn6MQf7J/rDNQ9i+cNJzujUq4J7taIBRpAZCYIPOC5lbkqjhj9QL8
         QcyhizgaI4boPITthVeM4SKamshGH08jLXAHDoVlMsR362gFnq9crrCxDEa+QfXO2LOl
         slrdD5IXzT+zDsjjlm8fP89A/XSi4XkWJ5DXRG+AaAfyBirVNI6Bz2QpluwAmPb1aWSy
         4/Bw==
X-Gm-Message-State: AC+VfDxBXqJhy3po+rJrFzESsggCzeVvj1rW/ZXfB9yh7yjjiC4iXcvp
	vYYpl4bcJT+R6bT/PMvrvdjsWJGSJwY+9a9KVJ9BieXrg9RCWmtzBLggNNLw1VR0RL/fjhJjFHI
	9yBDHBLTRu/hORg9W0Adxf1057rrzGtn+l0G2dmM=
X-Received: by 2002:a0d:cdc1:0:b0:556:1b32:343b with SMTP id p184-20020a0dcdc1000000b005561b32343bmr9156183ywd.45.1686225377170;
        Thu, 08 Jun 2023 04:56:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4pzcuzB1H5xPS30exzSjMgkpQFP27WwHU2GrjrqH+yNUHkjDBJmOiAO2hIbPhcoyxcXWvEeA==
X-Received: by 2002:a0d:cdc1:0:b0:556:1b32:343b with SMTP id p184-20020a0dcdc1000000b005561b32343bmr9156172ywd.45.1686225376887;
        Thu, 08 Jun 2023 04:56:16 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id t65-20020a815f44000000b005461671a79csm311056ywb.138.2023.06.08.04.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 04:56:16 -0700 (PDT)
Message-ID: <7756a170-f0c0-ac2d-383f-a4c59a31ebe5@redhat.com>
Date: Thu, 8 Jun 2023 07:56:15 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Status of glibc-related service cost review for CTI?
To: David Edelsohn <dje.gcc@gmail.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org
References: <2b961760-b1c5-0bf3-1da4-b76d06cb925f@redhat.com>
 <20230607-lob-grove-nab-0a1320@meerkat>
 <CAGWvnyn5PX2Xvefx8Ev=P_2sNB1sejBKBtqwc4w4xvNBv3idHg@mail.gmail.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <CAGWvnyn5PX2Xvefx8Ev=P_2sNB1sejBKBtqwc4w4xvNBv3idHg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/7/23 19:04, David Edelsohn wrote:
> We thought that LF IT could estimate the cost of the services for just
> GLIBC and separately the total cost for the eventual inclusion of all of
> the GNU Toolchain projects.  If that is impractical, then maybe we need to
> calculate the cost based on a metric for the proportional use of LF IT
> systems by CTI relative to the other tenants, such as the bandwidth,
> transaction to gitolite, mail messages, size of repository, or the cpu
> usage of the VMs providing the services.  I don't mean a variable amount
> each month, but we base it on the proportion of usage of LF IT shared
> services instead of based on independent services in isolation.

Konstantin,

If the services glibc is using are just too small then I'm happy to just have the
"size of the breadbox" estimate for all of the GNU Toolchain projects together.

Any one of these estimates supports our efforts at fundraising.

-- 
Cheers,
Carlos.

