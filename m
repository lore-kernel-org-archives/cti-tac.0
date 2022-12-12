Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BE71847
	for <gti-tac@lists.linuxfoundation.org>; Mon, 12 Dec 2022 04:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17E0E60C05
	for <gti-tac@lists.linuxfoundation.org>; Mon, 12 Dec 2022 04:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17E0E60C05
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=adacore.com header.i=@adacore.com header.a=rsa-sha256 header.s=google header.b=RfhjV2lw
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHtkYPcC2WTJ for <gti-tac@lists.linuxfoundation.org>;
	Mon, 12 Dec 2022 04:44:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1233160BCB
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1233160BCB
	for <gti-tac@lists.linuxfoundation.org>; Mon, 12 Dec 2022 04:44:06 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id h8-20020a1c2108000000b003d1efd60b65so4179381wmh.0
        for <gti-tac@lists.linuxfoundation.org>; Sun, 11 Dec 2022 20:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adacore.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8Pij8jo6IW4o/ZLQRSCZ8femXYguOas4+jbyzUqsDs=;
        b=RfhjV2lwIPEgYxrM8C4G6GcdT7dvK+U7mz64eM0uNvwry9plT+oIcll1dd01pgTWdX
         RIrQ6f/HhJ/437HyYfGnpLJpWLyxkTjUqElWB4+vwhz4HbDzSPPP2A5TK/M628/zXOMo
         BAxLbLbaFxlsFxMeFinJh/LHL/si5wUXtkybVlZogCy0e6yibIqGIY7kpIlpFQJosUu/
         ickgmoXFkxwXsQxslT9cgt3IjeKZea/ADOnVFI/m+b/8mBbfFhYROLLLZF9yCY/e7D0w
         y/TyhBX9RvuYMEXlIKpBNAXuOIcpN7M+FgdfCjXqPOHNnoTjTgTUoMeIWktfUjjJmVnE
         5FUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8Pij8jo6IW4o/ZLQRSCZ8femXYguOas4+jbyzUqsDs=;
        b=nlHAYct6kFGVG3Ttk7qZIbuh9nzuNtsMzEzw8OOPLVJ89PlLslbff77CgBbYKIkGQl
         MBXahWCCRBn4w4WbUAPyDAxVo5yRbk2IZvIhD+f9ov+Md1iqdHz+SRlWffvVo23B8Z/V
         6dpPF/Kn3SSjDCvWmiYZ0xKu4YhJ2dAq8kHHihHus//v0T7e8eGD+8lMca8yZcfIlHgQ
         /2FLTR1j3+P1WpGXxMSPnpvpiAEO7Vi7mjQLVytBk04l4f47IYCVI7dpn3ZcYdXq27sm
         Ye3M5S13tQk+vCXbb0HbbTzXOflsT0l4FnHLe1IXtBvkLXI1mfeXf/8D367iNY7KNSvR
         MZuA==
X-Gm-Message-State: ANoB5pmzJvNA0Bt0OVZ2qLU7L5+hXaTnxxzHIkA/KSLwuytinpWC2tlN
	o5ZzYoRCKcmRv2bul+DSMJHS
X-Google-Smtp-Source: AA0mqf6u+BQ3oX36K6nFXSZJaWMW58whZIjdnf5VxAYxNy16OYApqPuEdGcngchGj+VB3H0h+1iJDA==
X-Received: by 2002:a05:600c:35c3:b0:3d2:1bf6:5796 with SMTP id r3-20020a05600c35c300b003d21bf65796mr4856741wmq.35.1670820245253;
        Sun, 11 Dec 2022 20:44:05 -0800 (PST)
Received: from takamaka.gnat.com ([2a01:cb22:1d5:1100:3dde:7681:7cac:6c2b])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b003b4fe03c881sm8241270wmq.48.2022.12.11.20.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 20:44:04 -0800 (PST)
Received: by takamaka.gnat.com (Postfix, from userid 1000)
	id 9E61C81D0B; Mon, 12 Dec 2022 08:44:02 +0400 (+04)
Date: Mon, 12 Dec 2022 08:44:02 +0400
From: Joel Brobecker <brobecker@adacore.com>
To: David Edelsohn <dje.gcc@gmail.com>
Cc: Joseph Myers <joseph@codesourcery.com>,
	Joel Brobecker <brobecker@adacore.com>,
	Carlos O'Donell <carlos@redhat.com>,
	gti-tac@lists.linuxfoundation.org
Subject: Re: Action: Setup working group for the GNU Toolchain proposal to
 migrate to LF IT managed services
Message-ID: <Y5axkvVO6IlhyJ5Z@adacore.com>
References: <3a81d482-c952-d501-f495-485f00400e85@redhat.com>
 <Y3rxAYa/oc5s/R/7@adacore.com>
 <da126be7-475f-e2ed-fb4f-4493271db5f3@codesourcery.com>
 <CAGWvnyn-age684gnQB+ViF52BEHPSN5rvZ8hfjsVvDsf1omsRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGWvnyn-age684gnQB+ViF52BEHPSN5rvZ8hfjsVvDsf1omsRw@mail.gmail.com>

> Joel and Simon,
> 
> Can the GDB analysis be updated to the level of detail that Carlos provided
> for GLIBC in his separate message?

I was planning on looking at this over the weekend, but unfortunately
it was too full. I will try to do it next weekend.

-- 
Joel
