Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE43B1C36
	for <gti-tac@lists.linuxfoundation.org>; Wed, 26 Oct 2022 20:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 399FD40157
	for <gti-tac@lists.linuxfoundation.org>; Wed, 26 Oct 2022 20:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 399FD40157
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VN3uBKY7
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
	with ESMTP id Fwa93IHz9neO for <gti-tac@lists.linuxfoundation.org>;
	Wed, 26 Oct 2022 20:57:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD374400BB
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AD374400BB
	for <gti-tac@lists.linuxfoundation.org>; Wed, 26 Oct 2022 20:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666817878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a20yOjAqZejGlYKUrrzbGsBsJ3VmV7P1qHiyqdkxfvs=;
	b=VN3uBKY7i7kBAi/kqbL161mgIQfABK2oFBHj5KG/H5912UazpanjsoUYBSFE+9LOvPEjPQ
	whMeZA+88oQGATAxqv8OLLPRd9o8BQvwNL8+8y0DiY8sakYiKa96+S6HAsxRTNPe6BiR9E
	cFQvi7u4hK6AFNbMWZ3cxHmDz1WBFYc=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-SPZSD1mxN3GrwAaIHDrgfg-1; Wed, 26 Oct 2022 16:57:57 -0400
X-MC-Unique: SPZSD1mxN3GrwAaIHDrgfg-1
Received: by mail-il1-f199.google.com with SMTP id z13-20020a921a4d000000b00300564f869aso4294888ill.20
        for <gti-tac@lists.linuxfoundation.org>; Wed, 26 Oct 2022 13:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a20yOjAqZejGlYKUrrzbGsBsJ3VmV7P1qHiyqdkxfvs=;
        b=aKhvFTPH2OcgLwMRIF1q3HYPFOaBNCyUCT3+wcmutQIqOsWxWqr8ILtkOQ6SKyML9n
         HiBF2xj0q/POth2hm4fo9gtELEclQxCZJdrxMrxSxiPoDbYCZPZZA7etJOLSqWkKbns+
         DDvBKoxzmsPLUvcb6YvW8cpUuvLLDKWGFGFN7bkbbqekzkNaPbmdapOBo/PdnqWEpoqS
         5Xahqt5qBJE5DbYmhuIdHXDc/R9BllNCjjk6gDw9Z0OoHDxVDRnjC11Gh7MwmPeMi/Rb
         ypcaztbD74dHnCWQo4DTIojNAE8B3mzVCKG8ig709mTK/PcApXYemdXOib6S1wkL8oyV
         L/vw==
X-Gm-Message-State: ACrzQf2neI6+DzlzMPuThdhMJfXEpQbktkYf9hQGNCPFQIKLuBqds39g
	33+dXBCR8M7PYA8mDRQLVk2MDTvKfbTBIzpFpXdeLIzI6/Gr9q38MUjZDLMR8UaY13fSRZTiOaO
	E//6a5MTtJC/Iqo4OapV9FMsRhhIOi5w=
X-Received: by 2002:a02:b80f:0:b0:363:bad1:26fe with SMTP id o15-20020a02b80f000000b00363bad126femr28470136jam.282.1666817876569;
        Wed, 26 Oct 2022 13:57:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4VVe/tRNxbkvK0j0NlEz1Aq+WDH9oD5c5E1475SwTcmSKpRkywAhCWpIFSNXBB5CBP/fpXdQ==
X-Received: by 2002:a02:b80f:0:b0:363:bad1:26fe with SMTP id o15-20020a02b80f000000b00363bad126femr28470123jam.282.1666817876385;
        Wed, 26 Oct 2022 13:57:56 -0700 (PDT)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id u19-20020a02c953000000b003566ff0eb13sm2317923jao.34.2022.10.26.13.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 13:57:55 -0700 (PDT)
Message-ID: <4725ce10-21c4-693d-808c-b211dccc2d2d@redhat.com>
Date: Wed, 26 Oct 2022 16:57:54 -0400
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Welcome to the new gti-tac list
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 gti-tac@lists.linuxfoundation.org
References: <20221026174440.3gds72wx6wzlet3p@meerkat.local>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20221026174440.3gds72wx6wzlet3p@meerkat.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/22 13:44, Konstantin Ryabitsev wrote:
> Hello:
> 
> The gti-tac list is moving to a slightly different address in order to provide
> free-as-in-freedom hosting using mlmmj and public-inbox. The new address is:
> 
> gti-tac@lists.linuxfoundation.org
> 
> List posting is restricted to subscribers, but archives are publicly available
> at the following address:
> 
> https://lore.kernel.org/gti-tac/
> 
> Please let me know if you have any questions.

Thank you for setting up the list!

Sending this email mostly to test delivery.

-- 
Cheers,
Carlos.

