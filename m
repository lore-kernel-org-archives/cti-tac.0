Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B58D60862
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 19:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF4D48419A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 19:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF4D48419A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eaehAR+H
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
	with ESMTP id EfvtpmfbeyOO for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 19:58:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36AA384199
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 36AA384199
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 19:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684958293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cgiwfG3kYToVPpcZ0h0USb+6kA5JJZDgMld5A8+bEaE=;
	b=eaehAR+H7nHuELPsrgX2s+DHz7jVAuDrQxJXcUcCv6btpHJ1J8nruoPPWPSiUoIaHpQKXs
	7WtbZsL1YrWRXjnYeaMtd5/lIiM30QgAZk30720o9rZbJ9LiDdcTAQlhLw3ENks266MnP7
	Cpk4Uk4tDyRDuEBeQt5zNCpH41W0QgM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-xMl1lPwKOrmidOgc_ZBKRw-1; Wed, 24 May 2023 15:58:09 -0400
X-MC-Unique: xMl1lPwKOrmidOgc_ZBKRw-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-5654242df11so25703127b3.3
        for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 12:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684958289; x=1687550289;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgiwfG3kYToVPpcZ0h0USb+6kA5JJZDgMld5A8+bEaE=;
        b=DuInYJm/l9TUuh4mnPkxlykiGNzNRphGbzn9q7LpMR5wDUEOPtaodAwlmBw1uB6tzx
         RwYXRVG/nN26OFMfEL2Usq5tlQB6SJ1P9Rsm7nJv1QwhKQt2nfYnExEc3RuDvnHfPtqF
         JJnIq6El7FWhfzCaS4VTu+Vapt7mpxBChKP0I4fKRG+bKcpczo5/oMiIZ5B4D3GcIdI/
         kiTJ/QBI99TS16ZDhQlhmQ0eOrQ2zehHSpOcrA25WPOUfWURgxx/S3T72+W2ckJzwYGL
         YCsnEaYYrgeKaBF6XC4kOpICVDXCRc2TFFlkWJmJahbDcDOw5zwhrha4KKHnd2nCK6aM
         pexA==
X-Gm-Message-State: AC+VfDwFZ0P81OVg4oceC92IdSfMJpOwbPyx9dJoa2QBlitKSMN8AWYZ
	iiYKqggkFlXR/04fNiPGK/GqOyYSGrriiUDppbEcunVbZ/iaOX8fbedrlRvgMICim79W4ct6S9B
	l0tZ4oDHn8F7a2vnmQ8YlY6uXEqfOY8E=
X-Received: by 2002:a0d:e2d3:0:b0:561:904d:27d9 with SMTP id l202-20020a0de2d3000000b00561904d27d9mr18309635ywe.4.1684958288927;
        Wed, 24 May 2023 12:58:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ToiFWU9Y/Y8Nrh0IADJOz7K/CN/LGrW/3dZOWY0BEtIl9qw4UlFDZdoRpti0XXRzJQJAx3g==
X-Received: by 2002:a0d:e2d3:0:b0:561:904d:27d9 with SMTP id l202-20020a0de2d3000000b00561904d27d9mr18309624ywe.4.1684958288638;
        Wed, 24 May 2023 12:58:08 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id k3-20020a0dfa03000000b00562142e68edsm3927638ywf.64.2023.05.24.12.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 12:58:08 -0700 (PDT)
Message-ID: <ed594f9e-92ee-439d-ba76-ce4e2abbcfd3@redhat.com>
Date: Wed, 24 May 2023 15:58:06 -0400
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
To: Joseph Myers <joseph@codesourcery.com>,
 Siddhesh Poyarekar <siddhesh@gotplt.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 cti-tac@lists.linuxfoundation.org
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
 <20230523-ankle-infer-spurs-55ac6f@meerkat>
 <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com>
 <20230523-banks-calve-rio-844c98@meerkat>
 <1d8d7313-515f-2811-a710-5eca2ed42e39@gotplt.org>
 <d1a3b6ca-0a3-374a-9a52-e2839b9b6f1@codesourcery.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <d1a3b6ca-0a3-374a-9a52-e2839b9b6f1@codesourcery.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/24/23 14:44, Joseph Myers wrote:
> On Wed, 24 May 2023, Siddhesh Poyarekar wrote:
> 
>> There's probably a viable middle ground here for glibc, where commits that
>> don't have an entry in patchwork get sent to the list.  Given the current
>> traffic for libc-alpha, it won't add much overhead to libc-alpha and also meet
>> auditing requirements.
> 
> I think this is overly complicating things.  (Though it would be good for 
> glibc to have the check done for GCC that once a commit is in the 
> repository, emails aren't sent out again for a merge of that commit into a 
> user / vendor / development branch.)
> 
>> For the release/* branches, it probably makes more sense to send the commits
>> to libc-stable, thus removing the need for developers to send [committed X.Y]
>> to the list.  This should then limit the utility of glibc-cvs to private
>> branch pushes.  I doubt if anybody cares about pushes to private branches, do
>> they?
> 
> I think commits to user / vendor branches can be of interest.  They may 
> suggest things that would be worth adding to master (even if the original 
> author didn't think of them as appropriate for master, or loses interest 
> in them), for example.
 
And in fact this is how I track Google's public work on the GRTE glibc branches.

-- 
Cheers,
Carlos.

