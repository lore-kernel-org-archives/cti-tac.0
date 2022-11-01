Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D3B7B
	for <gti-tac@lists.linuxfoundation.org>; Tue,  1 Nov 2022 21:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E81281B35
	for <gti-tac@lists.linuxfoundation.org>; Tue,  1 Nov 2022 21:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E81281B35
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=OnM8SuQk
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id brUxPVfTutS5 for <gti-tac@lists.linuxfoundation.org>;
	Tue,  1 Nov 2022 21:55:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E71148190B
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E71148190B
	for <gti-tac@lists.linuxfoundation.org>; Tue,  1 Nov 2022 21:55:44 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id j9so4972246qtv.4
        for <gti-tac@lists.linuxfoundation.org>; Tue, 01 Nov 2022 14:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yCj+uY6sVFnaY/UaZfwqoUf8qyogmRve1T0DuzGUecU=;
        b=OnM8SuQkoQk2WuHG0JCBdSe7MLGo96DioNEBNB2AJ8UnwVUzNOHGRO+9SUQfrC+pzE
         tYVqZi9WwoCkyQM2zN2wdu04+SdEnbz0iV6CiVXhBjl9rNnYmtp+MGW4sQYl6z6mvBY/
         cRDX94sNK/vnNl8/ZMquMRb/V8xK0j/cTZQdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCj+uY6sVFnaY/UaZfwqoUf8qyogmRve1T0DuzGUecU=;
        b=7CLocSigd61lZUddzrZKvyQGgORoVA1qjRcewBaIULBKI9W15aCb2p9Bmh0oSHwesO
         7JyN6BPNw1ARxzhzJnX7jvvzN0a+ZghakbA1Ped9X6Ep0Vawj47bBKKRVC391QZoNf4f
         GUdVAE6tt8OoQGX0Q+XJWOAawIkuOi2VUSfifFyvTqXl2IdW4D6m/NRlp97b/VERhpcH
         /lFH9nVno6DvnM70apaUiPGTT6bnHB04rUDogIOWUBKJ8gr4lixauDpd9bx8Kg6GDVlT
         o0AIe+lVA2bGa6YJLHA3AogEac0NKD7wf0Yv8GrXDyJVUJ/SJqERNxQSrlIEwZhKmwfw
         nX8Q==
X-Gm-Message-State: ACrzQf3MdoF7sXBEl8mli3iwfXHUKTxFkOJ0UMGjSQb1V3O7+gkiOHa2
	Jiju952h+HipPQJpj/nE3N/mGaiN
X-Google-Smtp-Source: AMsMyM4lSuXbnyFkpx33LLZiDWnJ+OMYqIXx4DxhvgfLrv15Bin9GgMz7yR7oMF6C6r2PuR2VBZWnQ==
X-Received: by 2002:a05:622a:5815:b0:3a5:2196:fa78 with SMTP id fg21-20020a05622a581500b003a52196fa78mr11214306qtb.288.1667339743569;
        Tue, 01 Nov 2022 14:55:43 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id y8-20020a05620a25c800b006e6a7c2a269sm7341421qko.22.2022.11.01.14.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 14:55:43 -0700 (PDT)
Date: Tue, 1 Nov 2022 17:55:41 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: gti-tac@lists.linuxfoundation.org
Subject: Re: Technology for hosting the next GTI TAC meeting
Message-ID: <20221101215541.mjxazlondthy2awq@meerkat.local>
References: <25877c78-d2bb-9107-01ed-c0b7a852dbea@redhat.com>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <25877c78-d2bb-9107-01ed-c0b7a852dbea@redhat.com>

On Tue, Nov 01, 2022 at 05:27:55PM -0400, Carlos O'Donell wrote:
> Konstantin,
> 
> What options does the LF have for FOSS meeting hosting?
> 
> Are there any BBB instances currently running that we could use?

There aren't, simply because nobody's asked. :)
I'll investigate what we can do on a short notice.

> There does seem to be a SaaS instance of BBB via Think Modular:
> https://think-modular.com/en/bbb-simultaneous

Thank you for the suggestion, I'll look into it.

Best regards,
Konstantin
