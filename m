Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EE463B3
	for <cti-tac@lists.linuxfoundation.org>; Fri, 11 Aug 2023 16:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E7CD404B2
	for <cti-tac@lists.linuxfoundation.org>; Fri, 11 Aug 2023 16:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E7CD404B2
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LmeoDNa9
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
	SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7rZBCG4QWrvE for <cti-tac@lists.linuxfoundation.org>;
	Fri, 11 Aug 2023 16:49:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0AC9340186
	for <cti-tac@lists.linuxfoundation.org>; Fri, 11 Aug 2023 16:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AC9340186
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691772564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1khfeZEW5PUxl6g7DmA0pEGurr1VZJqwVbnI9kbrChM=;
	b=LmeoDNa9Nedx0/NfXH/m4CDFDiwngs+LqlH2f9Fl8FwzGFMc3lkCWP77WxO0pCDCGAzFkJ
	TXEowHxrh3CHS+obBdCUFcmEqM7WCpmBVKcDIqBR7LS8to39ASFjLCF6hMrjbwooaY35Lk
	AZYdlFiJwJlAiepUZCsHr02axOo1kus=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-yM8LGq9nM8usutUUWRZSZg-1; Fri, 11 Aug 2023 12:49:23 -0400
X-MC-Unique: yM8LGq9nM8usutUUWRZSZg-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1c0ed6a6df5so1916073fac.1
        for <cti-tac@lists.linuxfoundation.org>; Fri, 11 Aug 2023 09:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691772562; x=1692377362;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1khfeZEW5PUxl6g7DmA0pEGurr1VZJqwVbnI9kbrChM=;
        b=dg8kxZr+8izk4x35U5FSleyVZHddapIQxVWXn//8ragleVfsMrDAFGzq2KyahtCjVM
         GTJH8m/VsZxeslj+fLIeAeVwXrF9WRwmhe2dNhAF6JNyzbe41tBB1zzk5eVp9Y0KUXYf
         vubu3N9hG4DihwQ7JOk63qzKUTI5+P/7QgW9AKDA4nxFiBmvH1HVnmqLOMesbOAtrc+G
         lnbh6Iq6ObsNp0At4eW9mJ3fjN3WFsMgJuplWauT7kKLHrFMtzE7yqBU16fpaXyOpce5
         se4rrjGS/4KoZ9Jw50d6kJb9QcqG4Xox1BkTe5U78TGCiPbLOgi94W3+OetIl5Una5/f
         KYjA==
X-Gm-Message-State: AOJu0Yyc2Hub6bT4xq2IXNFKFrDSXZTnf4bMbI+7UUyZJtTpFzar0He2
	Rs2SpGX3QtwhrcTF8oOsXyWmZv7ppod7iZJwMIQNv2Tnw2mMMNa9BX2ReDSHJ391Jfrob+LJ3P/
	Fa/ZyNArUR9OLxjTjVcaeuhMUGG1HUCo=
X-Received: by 2002:a05:6358:948b:b0:135:615a:309d with SMTP id i11-20020a056358948b00b00135615a309dmr2943622rwb.7.1691772562702;
        Fri, 11 Aug 2023 09:49:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbaHZBe4IRipWIxRmQ8T7Jtbq0bj+7N4NZqZMMSNCcpHJ42qleFHQT4JdrPR0LzKScIoCYrA==
X-Received: by 2002:a05:6358:948b:b0:135:615a:309d with SMTP id i11-20020a056358948b00b00135615a309dmr2943611rwb.7.1691772562437;
        Fri, 11 Aug 2023 09:49:22 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id p185-20020a2542c2000000b00d1890dac6a7sm1007399yba.29.2023.08.11.09.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Aug 2023 09:49:21 -0700 (PDT)
Message-ID: <059d464d-4975-8362-e60d-36bdabc0a304@redhat.com>
Date: Fri, 11 Aug 2023 12:49:20 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Resources for glibc CNA
To: Siddhesh Poyarekar <siddhesh@gotplt.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 David Edelsohn <dje.gcc@gmail.com>
Cc: cti-tac@lists.linuxfoundation.org
References: <3b30c81d-e328-0379-d7b8-92bfbe322b39@gotplt.org>
 <20230810-container-startup-099fa7@meerkat>
 <3e9faab8-7272-dba1-d84d-60008ab95375@gotplt.org>
 <20230810-slingshot-kilt-01ce9b@meerkat>
 <5ff7a8f2-225e-eec0-44c6-afaf08f5944a@redhat.com>
 <69b52888-bc8e-d98e-a588-16f12939a9b5@gotplt.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <69b52888-bc8e-d98e-a588-16f12939a9b5@gotplt.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/11/23 11:28, Siddhesh Poyarekar wrote:
> On 2023-08-10 17:33, Carlos O'Donell wrote:
>> I don't have a strong opinion here, but I would rather start
>> *simple* and _then_ scale up to remail only if we need it. If we
>> can just use gpg/pgp then I would prefer that.
> 
> Maybe we could start with a regular, private mailing list and publish
> keys of some security team members to give reporters the option to
> use them if they need to encrypt their communication.  Team members
> that get contacted may need to act as pigeons between the mailing
> list and the reporter though.  We could start like this and see how
> quickly this gets painful.  I don't like the idea of sharing a subkey
> among multiple people :/

I don't like sharing any keys either.

I think we would publish the keys of the current group and update that as people
leave and join the group.
 
>> I agree we need to settle on the domain name, and I would also pick
>> "toolchain.dev" since we want to use that for other CTI projects,
>> and a landing page like "advisories.toolchain.dev" would be fine.
> 
> [bikeshed] security.toolchain.dev because we'll need a security
> policy page too, even if it just means pointing to or replicating the
> contents of our SECURITY.md.

Sure. Blue shed is fine with me.

>>>>> For the publication, I usually strongly advise a simple
>>>>> static site that can withstand very high traffic. I believe
>>>>> there is general consensus that "toolchain.dev" is the domain
>>>>> to be used for CTI purposes, so something could be published
>>>>> on advisories.toolchain.dev or similar.
>>>> 
>>>> Ack, a static site would be perfect, perhaps with markdown
>>>> pages and git access, similar to our plan for the wiki.
>>> 
>>> Another option is a restricted public advisories mailing list
>>> with a public-inbox frontend (similar to lore.kernel.org). This
>>> would provide you with both pull-based and push-based
>>> subscription options.
>> 
>> I like the static site backed by git better because it allows us to
>> do all kinds of git-based auditing and review. I get the appeal of
>> a mailing list, but I'd still end up committing something 
>> somewhere, and then sending an email via an API. Might as well just
>> commit and regenerate the pages.
>> 
> 
> ... and git allows us to edit advisories too.  In fact, all of
> security.toolchain.dev could just be a repo with:

Agreed 100% on a repo with md files or rst to publish with sphinx and readthedocs.

-- 
Cheers,
Carlos.

