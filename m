Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490122F28
	for <gti-tac@lists.linuxfoundation.org>; Tue, 15 Nov 2022 19:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E089D81D65
	for <gti-tac@lists.linuxfoundation.org>; Tue, 15 Nov 2022 19:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E089D81D65
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bLbFhNv9
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
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JdDlAHHkKL2A for <gti-tac@lists.linuxfoundation.org>;
	Tue, 15 Nov 2022 19:42:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3310081DF0
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3310081DF0
	for <gti-tac@lists.linuxfoundation.org>; Tue, 15 Nov 2022 19:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668541334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=07RCVXTfm4UQtdfh7Dkw0weuUgRrangBE0bXbJyza5U=;
	b=bLbFhNv9WD+FUaoW6vspwM0S+QHRKazFsbaRrivoWo6H7H6bhdw8YJ79PS1G0DEyQYqyBs
	xXMrM0+arKvz//iYjQHA66LeFDKrGmHNpHsHG1hw1MkHSZXXD1EIXfdGbQHTv75/Z5hYnA
	VAuzT/8MLavSsiosGYAeENMCUAQB1SI=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-RwTvjuQ6NjKC2OQot44a7A-1; Tue, 15 Nov 2022 14:42:13 -0500
X-MC-Unique: RwTvjuQ6NjKC2OQot44a7A-1
Received: by mail-il1-f199.google.com with SMTP id d2-20020a056e020be200b00300ecc7e0d4so11729382ilu.5
        for <gti-tac@lists.linuxfoundation.org>; Tue, 15 Nov 2022 11:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07RCVXTfm4UQtdfh7Dkw0weuUgRrangBE0bXbJyza5U=;
        b=ACpZb9knj6aTxQiEd+V6lFle/6bAwMh7gR6AGb7lPE+xv8A+/nooB4ts74DfVEfctf
         hrROXP6io9dcIB8zeP2VgrHKTiFCDIqKvLQKTyRbTMMgtyB7oARSEiLHdKAR2VcEC5tP
         +NzZwkhg+0e2uSU90N52YuGw6olf4kG1kUxl40aGdg/hwxFrqeqhTnPEYWr65r+vjhMe
         qvGgxMNpzdJNvUtEcJ1oABWLRX2Fqw1NWuMOgr0pkhUXpizXoe/XmkyH0EYmUMCXBtW+
         DB4IrQefh56VkLNaFsdlUOxcVLbMkfk8ZPJgSfGuoQQJcC4X9Ey7KOUtPwiw4Vu7Lecb
         lBCw==
X-Gm-Message-State: ANoB5ploVLQfYXF1EszGbxH62IVv6HaeRUmGnkx8FYT6zG4skKPmHQJt
	T+RgJESaH8WiCJSjrONisLuN3V0yF0VebGYqMCFHOA07uP2ZJOAv0VXvUYLYvVoxWk1yAn0yI9C
	MG5q9ZRTWi/FJxAj15gMxSq7yCFKiJYk=
X-Received: by 2002:a05:6e02:120e:b0:2fc:cea6:7d9f with SMTP id a14-20020a056e02120e00b002fccea67d9fmr8962901ilq.89.1668541331122;
        Tue, 15 Nov 2022 11:42:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6JGdeMP9ftLrCCOZAryw2UESNGwkcRl0/NnwRjhCiG+rKJW+07CluuPRMA1RfE/0pxjhTZ1A==
X-Received: by 2002:a05:6e02:120e:b0:2fc:cea6:7d9f with SMTP id a14-20020a056e02120e00b002fccea67d9fmr8962897ilq.89.1668541330872;
        Tue, 15 Nov 2022 11:42:10 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id h9-20020a92c089000000b00302838b3b08sm338470ile.49.2022.11.15.11.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 11:42:10 -0800 (PST)
Message-ID: <ce1a98c9-a512-855d-3ad2-53ae69e0847e@redhat.com>
Date: Tue, 15 Nov 2022 14:42:09 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Action: Setup working group for the GNU Toolchain proposal to
 migrate to LF IT managed services
To: Joseph Myers <joseph@codesourcery.com>
Cc: gti-tac@lists.linuxfoundation.org
References: <3a81d482-c952-d501-f495-485f00400e85@redhat.com>
 <d8eabe-31ec-873d-7893-915e6d2fd6e@codesourcery.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <d8eabe-31ec-873d-7893-915e6d2fd6e@codesourcery.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/22 18:36, Joseph Myers wrote:
> On Fri, 11 Nov 2022, Carlos O'Donell wrote:
> 
>> Next step:
>>
>> - Seek volunteers. Please respond to this email if you want to volunteer
>>   to be on the "LF IT managed services" working group and help enumerate
>>   services.
> 
> I'll volunteer to be on it, but, as noted at the meeting, I don't expect 
> to do much on the enumeration before January.
> 

I will also volunteer to be on it, and I can start documenting right away for all the
services I know glibc needs.

-- 
Cheers,
Carlos.

