Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362FB28E7
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 12:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DBC981394
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 12:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DBC981394
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S436d37y
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
	with ESMTP id 1I2WBeVJSH0t for <gti-tac@lists.linuxfoundation.org>;
	Tue,  7 Feb 2023 12:55:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E861181393
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E861181393
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 12:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675774545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xA+6oYnNqlEs1SvAo1ccbyYRJ8z13KlMydqJWcRDEYE=;
	b=S436d37yU3sIE1BERRCWgcFkyaGQJzJEZJc7+ELTV/KD2sBbVbz3j55s1Jxjoecak/eK6q
	K3JQYPz8ClXUwNEj9AlwCbXeTOeV+FUJMN/rQZPOj3GYiNvUtIUntL7o57/y4frxEyC/BQ
	QRci8PWPV4/XK5QCKH+ADv9nb3KNMrE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-580-Eaf7e1rrM0ekSaU4V7YRaA-1; Tue, 07 Feb 2023 07:55:44 -0500
X-MC-Unique: Eaf7e1rrM0ekSaU4V7YRaA-1
Received: by mail-qv1-f71.google.com with SMTP id c10-20020a05621401ea00b004c72d0e92bcso7527439qvu.12
        for <gti-tac@lists.linuxfoundation.org>; Tue, 07 Feb 2023 04:55:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xA+6oYnNqlEs1SvAo1ccbyYRJ8z13KlMydqJWcRDEYE=;
        b=DYCDOAoKrM/kutVvYt3bHcU1OK6Z4Hw4dQ7dzWe+gzK8QYB68gN8I0JZgIqLUJu8Aj
         TVaF1G/JqWArs2HSru4m+7nEd9m/QTL0IFqo5UH5183OT74G1t46CLHy8dWEQtaKjUpG
         lMGOIg3D4B4356IC0ov30ZtG72+vX+vKr/J4NOdHx52oj4Wcw7wzg1uwHazOKudGtawg
         HuXQw/EMXypSXgw1fpD8xiMlGf8Wp6TpZNVPWrvAKusFLhqgvp28mX8r6ww3O548MNml
         59IEyS5BkdKwBjwttwB+pbgxOMWV8fR8PqiLFtXHMcJv82aBe3nBTCTqPrNFl9z0ovuA
         dGtw==
X-Gm-Message-State: AO0yUKUo4TTbyT/k6cfCGpbpBlqhAn7mHAIxrQTTrbEerUTodD1LaD1f
	Zq2Ty+11MAzn9mlOXwGlFDLHMrZvJuO8feETcWZ2I9zU7iqhmNd1yjaSQhRN3fQWTsPIWMtk+XK
	iEkioO7U3Z7zHqQ5dd7+aIvdxgdHUe/hUbQKB
X-Received: by 2002:a05:622a:1101:b0:3a7:e9a2:4f4a with SMTP id e1-20020a05622a110100b003a7e9a24f4amr5895563qty.8.1675774543557;
        Tue, 07 Feb 2023 04:55:43 -0800 (PST)
X-Google-Smtp-Source: AK7set83B4GPkxDFlTJHZkUW3MHEFHRfFnbaVmIjS0GedzFDIiI1vHhKZhAJzhkdTPxPZK6PHcBrCg==
X-Received: by 2002:a05:622a:1101:b0:3a7:e9a2:4f4a with SMTP id e1-20020a05622a110100b003a7e9a24f4amr5895537qty.8.1675774543350;
        Tue, 07 Feb 2023 04:55:43 -0800 (PST)
Received: from [192.168.1.18] ([79.123.83.169])
        by smtp.gmail.com with ESMTPSA id t15-20020a05620a450f00b006fa43e139b5sm9502204qkp.59.2023.02.07.04.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 04:55:42 -0800 (PST)
Message-ID: <5e2916df-018d-e591-4301-910c0ac269d1@redhat.com>
Date: Tue, 7 Feb 2023 12:55:41 +0000
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Carlos O'Donell <carlos@redhat.com>,
 Simon Marchi <simon.marchi@efficios.com>, gti-tac@lists.linuxfoundation.org
References: <d8790f60-483b-dfc6-dd7f-cb408334eb40@redhat.com>
 <bc978ef9-3d6e-d032-252b-3aae460c895a@efficios.com>
 <4718eb70-b843-0f46-9555-cbba58f70713@redhat.com>
From: Nick Clifton <nickc@redhat.com>
Subject: Re: CY23 - Status of service enumeration.
In-Reply-To: <4718eb70-b843-0f46-9555-cbba58f70713@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlos,

>>> Is binutils going to be any different from gdb?
>> I don't know about the binutils process.  Perhaps we can ask Nick
>> Clifton to review our list for GDB and complement it with any
>> information specific for binutils?

It is basically the same.  We use the same git repository as GDB,
the same bugzilla and buildbot systems and the same website hosting.

There are a few discrepancies however:

   * The website contents are not generated by scripts, instead
     they are hand made.  The documentation parts of the binutils
     web site are created by building the docs locally and then
     uploading to the site.

   * We are not using patchwork at the moment.  Given the relatively
     light patch review load for the binutils, it may never be used.

   * We do not currently have daily snapshots of the binutils sources
     although these used to happen in the (long distant) past.

   * Not quite as many mailing lists as GDB, but basically similar.

Do you want a full list similar to the one produced by Simon and Joel
or is this discrepancy information sufficient ?

Cheers
   Nick

