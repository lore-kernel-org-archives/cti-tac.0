Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD72D60849
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 20:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DCBB84134
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 20:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DCBB84134
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZhRWMxEW
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
	with ESMTP id R17y9kBD2qRL for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 20:50:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6526A84036
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6526A84036
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 20:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684961449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oyq6ncubbL4d6Jn0bzzoRUQuSHd246hgato10UgIzi0=;
	b=ZhRWMxEWtsLIV/twF69tUCESD6qi5cq4JAYtMCVpduUS0bT52WcQrCviRSbrZXbo+iDdKx
	nDki+gVSxWcjd4ImQr1Jhx7z3oM/ANiwGn22WtrjBSAKFc3+ZLciTFPaFT82xcxMCIJzlZ
	jERYk9BwJTeSohq1Y3LaIdWRenBzXHg=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-2lh2l-8TN66IvXNxpnuBxg-1; Wed, 24 May 2023 16:50:48 -0400
X-MC-Unique: 2lh2l-8TN66IvXNxpnuBxg-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-55d9a9d19c9so33422047b3.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 13:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684961447; x=1687553447;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oyq6ncubbL4d6Jn0bzzoRUQuSHd246hgato10UgIzi0=;
        b=b2O3AA+INiKjmHwvuSWU8WECzH5bgoR6tDyvR5BsP5StwVoMn6qQJj5kg0iV76JVJF
         KI0U7USp+9GLVBUsHtg4DVgzWGlmpQ1L8rVie2G40SSsXdZmWRGKzJBfKMsY5eRf89QC
         0lYQO/s2DNEUt+pCEQPZjj4dJfxQ9ffJNJQcQfQqY0eeFF575HIkF3hoWdSPJ+Y7hSc/
         X4+QKGL+0Mlq1CD77bmQvsTijUHgzKpphanHnnFM2g1RP88RphlZ3Ukl93SBwB0dvHTt
         FUrjUijGpslPkyONpGkq073p/BjeJ3W059yMGp1/CmglTMoRSL2TLoMfA1XcdICwHWhJ
         x3bg==
X-Gm-Message-State: AC+VfDwJkt44PJOX/ld/z59vojpp5xW4tz6iZUK+5TyY71Nt+qx45Uh4
	ktKAkMYlwyzFf6u2ASAbckVpgbIvOWYOfxyh5XKywdcRPpUmGQMkE6c9urBEDZ0msdv9Tz5LL0c
	Uakr6lFs6TxfECdn6r+8PVTJ49M7hUDGSAae3eHE=
X-Received: by 2002:a81:7341:0:b0:561:e724:eb3 with SMTP id o62-20020a817341000000b00561e7240eb3mr17659044ywc.17.1684961447320;
        Wed, 24 May 2023 13:50:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6vExcE/i2EgQUsQp2kqP3pEJGoVdomjrGiwwOSLx4njOUOU3VE2HYoq7Hg1I+dAF91iApZGA==
X-Received: by 2002:a81:7341:0:b0:561:e724:eb3 with SMTP id o62-20020a817341000000b00561e7240eb3mr17659032ywc.17.1684961447071;
        Wed, 24 May 2023 13:50:47 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id n80-20020a0dcb53000000b0055a373a7e5asm3981998ywd.131.2023.05.24.13.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 13:50:46 -0700 (PDT)
Message-ID: <3d664367-8be4-8910-380d-10076cc97762@redhat.com>
Date: Wed, 24 May 2023 16:50:45 -0400
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
To: Ian Kelling <iank@fsf.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org,
 Khahil White <kwhite@linuxfoundation.org>
References: <13b3266b-a410-77fd-5dfc-4e4994b630cd@redhat.com>
 <20230519-rebate-guru-b0528e@meerkat> <87wn108jqr.fsf@fsf.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <87wn108jqr.fsf@fsf.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/22/23 10:37, Ian Kelling wrote:
> 
> Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:
> 
>> In the case when we can't use the git tag note process, we can also do tarball
>> uploads using our own "kup" tool that is done over ssh and uses the gitolite
>> permission framework. I'm quite shocked that someone in the world still uses
>> FTP for any uploads. :)
> 
> GNU already has a system for release uploads to https://ftp.gnu.org that
> works very well and I help maintain it.

Agreed, and I use it for glibc to upload release tarballs.

However, the tarball release process is quite heavy-weight for release branch maintenance.

In addition the downstreams sync from git release branch -> distro git to get the 
rolling release updates.

So all the other discussions about trusting git become relevant here.

-- 
Cheers,
Carlos.

