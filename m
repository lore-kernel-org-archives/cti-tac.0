Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3488060862
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 20:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDD3A424E3
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 20:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDD3A424E3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EosqnpYl
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
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BqJcFqDrN4J8 for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 20:27:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7BAF424DE
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C7BAF424DE
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 20:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684960027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MEeaobZPdxQVkrgf/wib5Y7r1XVy98mZEE+mLdnLT8w=;
	b=EosqnpYlNFjo5Mhv1Y2nCsgW5TvLCRmwFEpKegGkxLBXMY0Kk3MzgZwbiytH9QAEIQ/QNp
	4pzZzsdMJe74AESz+6jopWx4P4f5G/ISv5IeaPJ8WGjlMlt1ZpD1CZUtZZNqP/8/V+XtlX
	SjiwFrXgJ6jTNwHqhIR9Kz/hlij5kgY=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-OxlFsjhrN7awzKKmfvmQfA-1; Wed, 24 May 2023 16:27:06 -0400
X-MC-Unique: OxlFsjhrN7awzKKmfvmQfA-1
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-babb53e6952so2891058276.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 13:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684960025; x=1687552025;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MEeaobZPdxQVkrgf/wib5Y7r1XVy98mZEE+mLdnLT8w=;
        b=SC8MwKSIuVcur8CZ+MtYMp/XOdiCZlPNDEo3VH0B2Qv4uvlI0s5LADBlc5GUgmozPj
         +Oclz3xA/Px7abHKukzHieSVQB98VrUpMNLHT2AOo2rIjd+VvaUCxCqdn8aEvs0xcWES
         +O1pLoHWJRYs5D/E+yeOxbT35oB41O7JtjyEP7ZNAAjO2NN2p2jExEYZmAu1VkDSinHZ
         s+6mDstt7hGjMyWMTLNiivu0Ywtqfe4ZiXtgO08vzzJPyk2k8CGM9wNYPvSjQ5Lb8Ge2
         kQ6oHzoLKvtSoQz0JYuTCl98v4ePSvMEXqZFMt3jHk255IT2xLkNp/hEyqt5sBV02hVs
         96yQ==
X-Gm-Message-State: AC+VfDxjBZ9P8nUz0tqxGFm0HvhdB0MKMGsYwEk1Ul12s9GB57CNk4ct
	gaiN3xYlFqnQna2CBeq5972v9TAqMAxPEB0WvVp1SR7vu+Dioz7usOA0ujD1VDvURmp30wZgyWz
	L0AD9Z+vGaDIQ/l3a8SO+t6sYi7YMZz8LjfJ8ZxLbF2+6+wvPt5WkCgsHSfLi4+baz55JPcnavz
	ul7baySoqmNngB
X-Received: by 2002:a25:5006:0:b0:ba7:b446:f5a4 with SMTP id e6-20020a255006000000b00ba7b446f5a4mr1081321ybb.8.1684960025514;
        Wed, 24 May 2023 13:27:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4nOB85gEQFzkGJE/q5uGN7i6QE7kKLG0XjQmAnJwkPqXH+eQshBCAUNDaDVaN0psTEoq1IMg==
X-Received: by 2002:a25:5006:0:b0:ba7:b446:f5a4 with SMTP id e6-20020a255006000000b00ba7b446f5a4mr1081309ybb.8.1684960025160;
        Wed, 24 May 2023 13:27:05 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id e73-20020a25504c000000b00b9eeffa1abfsm2942050ybb.39.2023.05.24.13.27.04
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 13:27:04 -0700 (PDT)
Message-ID: <f0575b74-7ee9-bfb3-3993-f0ce689d4526@redhat.com>
Date: Wed, 24 May 2023 16:27:03 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Share status update to OpenSSF TAC on Tuesday May 16th at 11am
 ET.
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
References: <52435f3a-b722-22d4-538c-3f2ad628813b@redhat.com>
Organization: Red Hat
In-Reply-To: <52435f3a-b722-22d4-538c-3f2ad628813b@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/18/23 12:59, Carlos O'Donell wrote:
> GTI TAC,
> 
> In 2023 we have several opportunities to share GTI TAC status to the
> OpenSSF TAC. The OpenSSF TAC has representatives industry wide.
> 
> The next presentation slot for GTI is on Tuesday May 16th at 11am ET.
> It's a short 10 minute slot.
> 
> I think this is a great opportunity to share status and get feedback
> from the broader OpenSSF community.
> 
> Presenting status breaks down into the following steps:
> 
> - Summarize progress to date.
>   - Write down any open questions we might have.
> 
> - Present progress to the OpenSSF TAC.
>   - Ask for feedback on anything we think would be useful or valuable.
> 
> I would be happy to work with someone to wordsmith a high-level update.
> 
> Would anyone like to volunteer to write up a summary to date?
> 
> Would anyone like to present to the OpenSSF TAC?
 
FYI, David and I provided a status update to the OpenSSF TAC on May 16th.

Generally speaking we presented:

Status:

* Services working group has produced final analysis services for 4 of 4 toolchain components (2023-03-30)
 * Last service was gcc and probably the most complicated in terms of required services.
* Estimate cost for all services for 4 toolchain projects from LF IT (2023-04-03)
* Estimate cost for all services for 1 toolchain project from LF IT (2023-04-03)
* Plan is to move forward with service migration for one project at time.
 * Need to engage glibc community to discuss.
* CY23 funding discussions ongoing with OpenSSF and LF membership

CY23:

* LF IT provides estimate of costs for providing services and transitioning services.
* Design a 1-page leaflet for the Toolchain Infrastructure project to highlight the value of the project to sponsors.
* GTI TAC votes on LF IT proposal
* GNU Toolchain SC / Stewards decide on proposal
* GTI Funding approval TBD
* Execute transition, if approved

-- 
Cheers,
Carlos.

