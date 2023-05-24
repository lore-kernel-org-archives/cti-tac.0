Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5691760858
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 12:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8C5083EF1
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 12:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8C5083EF1
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bg4RfSie
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
	with ESMTP id rT9dklZktTYT for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 12:57:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C4A983A8B
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1C4A983A8B
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 12:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684933058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q7SO4tegTUAvH7oukEDx016ANzXJ+ek28ho4skkInGM=;
	b=bg4RfSieQVr8lmzLK+h+5IAJ701omjl5AzRv8qf1PEs7u2EACL4TQXhhOZDinY7TaQ4h9z
	S59h+QjSUBq8qcw+1xx1GVLGiQuPP70VpYbl5/cIZt75XXaR8fEPSZT9JZOZ8XPEs6V0T6
	11KXdcWfVoeDjRVf4n7GYNhdaYcs1Uo=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-fX17CYUuOO2AOxFlEd6AdQ-1; Wed, 24 May 2023 08:57:37 -0400
X-MC-Unique: fX17CYUuOO2AOxFlEd6AdQ-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-56183784dd3so10468857b3.3
        for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 05:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684933056; x=1687525056;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7SO4tegTUAvH7oukEDx016ANzXJ+ek28ho4skkInGM=;
        b=SsBL3FN+MP47G7pdJjmdm2zKkPyOdl/gimIPRgq3cm/YLtZFxIKlnuJddXBTOI8c8c
         aOYWDn+vIC2AZtCXr9yvkIReluNngTQjwiSC8qMlOU+xyVVYRRPZ6JIaoigKNDlAatEN
         XIWy6Jj53KU6/sOeqs+wAwnDNd5ge3PvHU3ZcoK88zt6u2arp6NVhd5zbSPBw3nYNMVt
         KyryzXem1pXAFsNOhFRTlzRB9e7oGVk94L02IMfTcuRjed8kRhL8zRwQs6frriPjFep6
         1J4aoYJT8jBsGHIsDHmWutk3PQuLMS99C/YbQ/CmSdHUYhtxSFlAlJz0RHc9onZp5adS
         aOWw==
X-Gm-Message-State: AC+VfDxmJcyblES4b7V4kYukuqrzZDCil0ieKVHRzd5bcT+nl/TISiUa
	Ska69Fnn7UypkA+/GmWSr8ESr8Mao6Iou4wQe8GA1ENYQGxzFrnbMYZ/oeEXjlDMMseclVKFmsl
	NCUf51uS7EzfWfu0S9I3gQRSnsOSyxf0=
X-Received: by 2002:a81:7d84:0:b0:565:421a:3879 with SMTP id y126-20020a817d84000000b00565421a3879mr5653470ywc.52.1684933056441;
        Wed, 24 May 2023 05:57:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6t4kVXCjm2/BN8WhBVFg7xG/Sg6+hTlisp4ArBDxTHgBwjDmA+wXo/6XCpsBVqvRr73ZSOkQ==
X-Received: by 2002:a81:7d84:0:b0:565:421a:3879 with SMTP id y126-20020a817d84000000b00565421a3879mr5653460ywc.52.1684933056231;
        Wed, 24 May 2023 05:57:36 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id w67-20020a0ded46000000b00561d6e4ae8esm65186ywe.71.2023.05.24.05.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 05:57:35 -0700 (PDT)
Message-ID: <50134537-f7ad-e618-cf86-937d185f3e4d@redhat.com>
Date: Wed, 24 May 2023 08:57:34 -0400
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
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
 <20230523-ankle-infer-spurs-55ac6f@meerkat>
 <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/23/23 15:34, Joseph Myers wrote:
> A server can't ensure that the user's clone has any particular custom 
> configuration.  We have some optional configuration 
> (gcc-git-customization.sh), but there's no requirement to use it.  
> Checking on push is much more reliable than expecting custom configuration 
> on the user's side.
 
Is this a case where we are looking to solve a community enforcement issue with a technical
solution?

If we removed all the hooks, what is the consequence of a commit that is wrong? Can we just
fix the sources with a subsequent commit? Add a light-weight linting check in 'make check'
that additionally reports this?

-- 
Cheers,
Carlos.

