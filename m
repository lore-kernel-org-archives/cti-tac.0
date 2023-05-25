Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD881FBEA
	for <cti-tac@lists.linuxfoundation.org>; Thu, 25 May 2023 11:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46B7342AA9
	for <cti-tac@lists.linuxfoundation.org>; Thu, 25 May 2023 11:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46B7342AA9
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hVQVrF6g
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
	with ESMTP id 0GMB2fKnnVBp for <cti-tac@lists.linuxfoundation.org>;
	Thu, 25 May 2023 11:03:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 402DC402E0
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 402DC402E0
	for <cti-tac@lists.linuxfoundation.org>; Thu, 25 May 2023 11:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685012579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Ln5f9bA/0Dx7oVrN8bNV6KHH1dll+oCwM8qgvcbfX8=;
	b=hVQVrF6gwymMYwSKPmfcoc2FiivBndOJeckRR84B9mm3G12MomOC7soWCetS6JaYj8U2Em
	haZx3BHr/xMbAKWGu9C8wsg6fKIivsfyTqb3zv7vIZGcRkljdQBwYztCiIapjuB44OhP9C
	f1ZSUsWC0+FZQBWsR19S4Zj8nYhkD9s=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-iPik_QMMNc-XpjuoNoenjw-1; Thu, 25 May 2023 07:02:58 -0400
X-MC-Unique: iPik_QMMNc-XpjuoNoenjw-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-561bad0999aso11390267b3.0
        for <cti-tac@lists.linuxfoundation.org>; Thu, 25 May 2023 04:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685012577; x=1687604577;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ln5f9bA/0Dx7oVrN8bNV6KHH1dll+oCwM8qgvcbfX8=;
        b=NOC7RK/hljZ7HE4lbSRyZkBV7rx2LVQLjk76uHzXde115GjBu8nRTDNWZulrdN+ycQ
         C36+LGqeMxvC77NB1PqbnPtOPSq+172xZyPMk7J1FBzCExb9R6KoYOse56vfAluhtTgl
         ZoRCvfIijkRfjBMcsYtTqAPXHL7mXCu6BFQOt7njMgGsZ1Gs5HiIPnjPh831nZP9VPj5
         vsAPHEzmCNw+Sc/TaD9ijWXeQ3IvOK++EfZXM0Lwwi1qHlrOayr0Wh1ypF/S25Pxs4oo
         3BfcCSBoM9voxuIa19MUeJfomEDMZafi24BR8CSM4sB8k7/eRcaWFLCDUVZ7m6lHdGJ2
         ncOQ==
X-Gm-Message-State: AC+VfDzazZQXAd7yhn4QH4txCnugul9FZzeAxege9BZXszapZXTpZvSB
	KFosDvh3a6jHw0eRHPwNWXQmaV1vGzrC5FZPBndXbHE5U+98mT0ezPsTQeUkeOjEL1IGs4yvysA
	ccqDopod54JzgLxXN+XseW8R476Octyw=
X-Received: by 2002:a81:6903:0:b0:539:1b13:3d64 with SMTP id e3-20020a816903000000b005391b133d64mr21561515ywc.48.1685012577659;
        Thu, 25 May 2023 04:02:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4l4CtGTOMlOAQdfv+fWXUJOM60p597PnWUeIKJ3vR7Pt1wPk7H8o94L9B1PzZYY3NqoUe5uQ==
X-Received: by 2002:a81:6903:0:b0:539:1b13:3d64 with SMTP id e3-20020a816903000000b005391b133d64mr21561494ywc.48.1685012577387;
        Thu, 25 May 2023 04:02:57 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id r66-20020a815d45000000b0055a777e3c50sm281497ywb.62.2023.05.25.04.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 04:02:56 -0700 (PDT)
Message-ID: <54f9b741-52a2-ced0-5a8f-1ed2475b4cb6@redhat.com>
Date: Thu, 25 May 2023 07:02:55 -0400
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
To: Ian Kelling <iank@fsf.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 cti-tac@lists.linuxfoundation.org, Khahil White <kwhite@linuxfoundation.org>
References: <13b3266b-a410-77fd-5dfc-4e4994b630cd@redhat.com>
 <20230519-rebate-guru-b0528e@meerkat> <87wn108jqr.fsf@fsf.org>
 <3d664367-8be4-8910-380d-10076cc97762@redhat.com> <877csx8k7g.fsf@fsf.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <877csx8k7g.fsf@fsf.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/24/23 17:53, Ian Kelling wrote:
> 
> Carlos O'Donell <carlos@redhat.com> writes:
> 
>> On 5/22/23 10:37, Ian Kelling wrote:
>>>
>>> GNU already has a system for release uploads to https://ftp.gnu.org that
>>> works very well and I help maintain it.
>>
>> Agreed, and I use it for glibc to upload release tarballs.
>>
>> However, the tarball release process is quite heavy-weight for release branch maintenance.
>>
>> In addition the downstreams sync from git release branch -> distro git to get the 
>> rolling release updates.
>>
>> So all the other discussions about trusting git become relevant here.
> 
> Yes, that all makes sense to me.

Just for clarity, and quoting again from my service evaluation for glibc:
~~~
* Release tarballs (ftp upload of gpg-signed release tarballs)
  https://ftp.gnu.org/gnu/libc/
  * Use gnupload script to gpg sign uploaded tarballs.
   * Uses ncftpput to place files into /incoming directories.
   * Network ftp access required.
  * Managed by the GNU Project/FSF.
  * Migration notes:
   * No migration required, would continue to upload to FSF.
   * Longer term discussion to use something more advanced.
   * Though good to have a backup following kernel best practice.
~~~

I noted that no migration is required here, but a backup has value.
If the backup, kput, used my ssh key via gitolite then it's already
using something I have setup as a maintainer to access git.

Several of the GNU Toolchain projects today upload to sourceware.org
*and* gnu.org. After the upload is complete we have mirroring from
other sources. So only the service of "upload" during a release window
could be improved by having an alternative.

The longer term discussion point there is specifically about what I
raised there, that release branch maintenance via tarballs is much
heavier than needed. Upstream uses git. Downstream uses git. And we
want a git to git mirror-style setup. In Fedora we would call this
"source-git" (as opposted to "dist-git" which contains rpm spec
files and configuration information). Today we sync Fedora Rawhide
dist-git weekly from upstream glibc git in order to have weekly
CI/CD. This conversation is something I can have with the GNU Project
and attempt to document best practice.

-- 
Cheers,
Carlos.

