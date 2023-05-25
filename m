Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2DBE56B
	for <cti-tac@lists.linuxfoundation.org>; Thu, 25 May 2023 11:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C80742AA9
	for <cti-tac@lists.linuxfoundation.org>; Thu, 25 May 2023 11:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C80742AA9
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VCfCJhi/
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
	SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kwd7quHzpn7M for <cti-tac@lists.linuxfoundation.org>;
	Thu, 25 May 2023 11:07:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0666C402E0
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0666C402E0
	for <cti-tac@lists.linuxfoundation.org>; Thu, 25 May 2023 11:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685012822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QbgEPpSKdkgOwpoRyjrUWrF6oZfHdWxfMLnMmKOEbP4=;
	b=VCfCJhi/+Ib+rpNa+IIBET5tKTscDg5wIgDu3bLRhTv+6vQUUA8qXqIPfmeJuWMAjlUewP
	gtOo9Xse4+dHwSnJkua4siVU7WwyuuasA2qhicz+VEz2PR9mK7QQbQUf5wGHXpfJzWlWkp
	zvcL7i+VcyjWtts00Ro7BUvWEdUhXiU=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224--kKNkGF1MD-w9IkvTXfC1w-1; Thu, 25 May 2023 07:07:01 -0400
X-MC-Unique: -kKNkGF1MD-w9IkvTXfC1w-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-5651d8acfe2so9830677b3.2
        for <cti-tac@lists.linuxfoundation.org>; Thu, 25 May 2023 04:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685012821; x=1687604821;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbgEPpSKdkgOwpoRyjrUWrF6oZfHdWxfMLnMmKOEbP4=;
        b=NEu0wd2exhaubnBWGTWQ3JrXH0JgL4p3kHoe8VtDPHw+IZtAD2A3zrx8iBmrXcKjKq
         q/odQTCkMdK0K45HEdVrDa3sQRxdeHggGrVXVz+ITlpoXFInGilZujW1bWUoH4gu3JQ9
         D1f2/cKpuM6aHgis2UBRKx43sfK4l8lqnrYfheB/pZafuj0KLYPx/tXVf06Q7rHgXZ85
         ZwrN9/zeS4wI0yk4XWSXjnhh4zy2k2isgqlIT8hyH34pKUv271KJNKmrCmshDSuWzGZb
         r9IjBnNvuuPQ46F0D6vhdtvq8RyiCqv66DfbHIDmQsnB71hYAHNKGuTn1v75CqutYvU3
         W02g==
X-Gm-Message-State: AC+VfDzE+wauVqeECo71ya+hFw+2GB40hX5/vaLDfSQgbV48kLSpfoeN
	+1ekphHR0WZQZIMrXyflDDu9xgNzWq3urq02vcGceJ2yqdllRZ1XxZK4wM7C3LfYlPGlzOd7Vjn
	uSrf66wknBPSHUsqcqqp5xGMiiXg3fBk=
X-Received: by 2002:a81:bf4f:0:b0:555:d983:f4f0 with SMTP id s15-20020a81bf4f000000b00555d983f4f0mr22090872ywk.24.1685012821132;
        Thu, 25 May 2023 04:07:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4UNLVCRCjuibC9bzS4QEv2zzVNfZn1ug8LDztxTaTuEfy7VlwqP5hWpPv9+vV8WmmvICbU5g==
X-Received: by 2002:a81:bf4f:0:b0:555:d983:f4f0 with SMTP id s15-20020a81bf4f000000b00555d983f4f0mr22090859ywk.24.1685012820844;
        Thu, 25 May 2023 04:07:00 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id n124-20020a0de482000000b0054f6ca85641sm277305ywe.99.2023.05.25.04.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 04:07:00 -0700 (PDT)
Message-ID: <bdc52fd9-fdcb-e57c-65aa-c1f7dc05c0af@redhat.com>
Date: Thu, 25 May 2023 07:06:58 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost of
 glibc migration.
To: Siddhesh Poyarekar <siddhesh@gotplt.org>,
 Brian Behlendorf <bbehlendorf@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Joseph Myers <joseph@codesourcery.com>
Cc: cti-tac@lists.linuxfoundation.org
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
 <20230523-ankle-infer-spurs-55ac6f@meerkat>
 <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com>
 <20230523-banks-calve-rio-844c98@meerkat>
 <7f11ed34-9529-9b3a-e720-64bd3a85542c@codesourcery.com>
 <20230523-cease-candle-debase-dd7485@meerkat>
 <cd8ad55d-38c5-72f1-3464-b5968d1f8fde@codesourcery.com>
 <20230524-december-goon-09e728@meerkat>
 <a4c8b242-7ab1-a0da-fbe0-19cffe1a6054@gotplt.org>
 <e5634ca9-57ed-c3a4-5488-1cb02f98fb72@linuxfoundation.org>
 <26a7467c-c726-9041-2157-2e0b58619b6e@gotplt.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <26a7467c-c726-9041-2157-2e0b58619b6e@gotplt.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/24/23 17:27, Siddhesh Poyarekar wrote:
> On 2023-05-24 14:55, Brian Behlendorf wrote:
>>> Signed commits would be nice, but we're not there yet as a
>>> community.
>> 
>> It's not quite as easy as "hey just add -s to your git commands"
>> but it's not far from that. I'm not a part of the TAC so I won't go
>> further than to suggest that a migration, where there will no doubt
>> have to be some adjustments to process and flow, to introduce other
>> non-zero-effort but non-blocking changes that enhance overall
>> security/integrity.
> 
> The challenge with cryptographic signing of commits is not a
> technical one, there are folks who oppose it on an ideological basis.
> It's probably not that hard to drive consensus in the glibc community
> for this, but that's still going to be an additional hurdle to cross.
> I'm not sure if the initial migration is the right time to tackle
> this.
> 
> Likewise for a process change that requires a single trusted
> gatekeeper.  Even if it has technical merit (I'm still not a 100%
> convinced), it's going to be harder to bring in a non-trivial process
> change like that during the initial migration.

Agreed.

We should avoid contentious issues and cleanup only technical debt.

e.g.

* What are all the git hooks we use?
  * Which can be moved to webhooks?

* Stop supporting CVS/SVN and export tarball dumps.

* Migrate from moinmoin to readthedocs/sphinx.

-- 
Cheers,
Carlos.

