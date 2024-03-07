Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701F41386AF
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709844340; cv=none; b=uoUAliAJltdP8zFflH9dVOXQ27oxI22NjBlaJlldiLPA80/sWwHrOxmvdK92lHmvhwiONcQvOXmZgSXC7uZQiCFksDAWfvRnX6dL4zrN6XAPvBkO9hkV0UVQ1qOslWZ4bCqwt9f4I5TtK7q1JNTp6zDXBRH9bRKjahm9MtJvOXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709844340; c=relaxed/simple;
	bh=KD6vEgespvc57MmDFuRrZZpb1h+am4t6Us0FySf+TqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iTRPxurPuX3749JK6WoIwF8wtbKj7xSKJhRSMIpkeugPXYBEQvPHtNsyNn4wKGEu/xe7Q6EY8SUZF4I+Bg1UC3OVZ6BtUyU8nuTgyyP5wb1TkwGf1+2vUCUXB8yMuqvuJXQ995waKPQNCKK3o8tm51mCY364xZwt0Up9b/BkXeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gc5chU4k; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gc5chU4k"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A44F41BBD
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tl0Zfh4EC2aH for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 20:45:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 100AE418A3
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 100AE418A3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gc5chU4k
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 100AE418A3
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709844336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gb677rllMsSWs/JL6uC3WOmGMogE1OQlXin5rQhQDXI=;
	b=gc5chU4kYDWcQh2yNdS1caFxu4ef6LQU3Ey0SG0qeTjpfnG1jO9aSFCP3drjiKkOqu5E6p
	MWhA/R0vID2rvUES4R37M4vckriVFUqAaBpBk/N3SsCRIjpsuRT7/w2ETSeGqvSZQv7wC7
	OL+oUiJvUOwtBHYbfWkSnszCEbYyRvo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-S8mBOHKjM9aDHiiBxRuGxw-1; Thu, 07 Mar 2024 15:45:35 -0500
X-MC-Unique: S8mBOHKjM9aDHiiBxRuGxw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-68fa064556eso11663186d6.3
        for <cti-tac@lists.linuxfoundation.org>; Thu, 07 Mar 2024 12:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709844335; x=1710449135;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gb677rllMsSWs/JL6uC3WOmGMogE1OQlXin5rQhQDXI=;
        b=LRkAwpGRjA7VX9BehYFsOyHEBZmUWQWvrrIpDumCvRo2HK4jFRdicKYhyVyxaoVgsJ
         3Ri2uu3duWRpWD8LLaH2+nnXkcyghKUYeoPLIRNNGwOUMMxJYMarqQ94TnIE4sfY6Jk3
         PnR7eZzIkoQ4bvblWzajaQelXlybqr1rLaCnzRyPCC3GW/KDaF7EgHER4uIS29OpoVkp
         f8VgD2fRtXJ4V/L9a75a0upH7Ga7FDaQC77Yk1yPddLCPUe/ikrmTu8ElZK6CVFIjawi
         YHB3gHiC9he2vAhz/WzLH7Nu6yz/0nxh/a2h9ewRXnNzLUyxIWbGSFLhncf1O/+1JeQA
         flNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgZGebbSt/rJBtxFBUGAqPwHka/x3K/eKHXAk7/lOYCPirusQ6m0m1X2MPQ0NV9+hkrI0HU5BoTDtx394hs/iJxUWkUGmVwZX38iraF80oqUU=
X-Gm-Message-State: AOJu0YydSIHePwb8N9J+9soZ8BTU8Pv+1sQAbZRrVQ73s5NbiB9D6cfp
	3vZBYWHgl4skl4dsWO9LjWP4GvH4emDba11eTVY07+v5Ty7CLOIREl+lHL+5RPrT35wMs+J1n3h
	jrLhWJbezI+DHRiVFMgHCR8L/iW0e+RKaiMT9uw7KZleAWCJs54uuptAXDEikDo7m/3GfQ6Q1OG
	kO
X-Received: by 2002:a05:622a:18a3:b0:42e:586d:1234 with SMTP id v35-20020a05622a18a300b0042e586d1234mr10235235qtc.28.1709844334816;
        Thu, 07 Mar 2024 12:45:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvqwL7WttulYro8jYkylGCXGxFOtcpW8GFLTJujklxyocFA/CxmEDefPX+IMq4obgFqojU1Q==
X-Received: by 2002:a05:622a:18a3:b0:42e:586d:1234 with SMTP id v35-20020a05622a18a300b0042e586d1234mr10235226qtc.28.1709844334566;
        Thu, 07 Mar 2024 12:45:34 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id g2-20020a05620a108200b007884103dfcesm1926180qkk.87.2024.03.07.12.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 12:45:33 -0800 (PST)
Message-ID: <ec47504e-2153-447f-96fb-caa252caadb0@redhat.com>
Date: Thu, 7 Mar 2024 15:45:33 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] projects/glibc: slightly adjust the structure
To: Siddhesh Poyarekar <siddhesh@gotplt.org>,
 cti-tac@lists.linuxfoundation.org
References: <20240307193019.4028812-1-siddhesh@gotplt.org>
 <20240307193019.4028812-2-siddhesh@gotplt.org>
 <191eb22c-ec30-4f01-a7b9-b7b9fa5ae0fb@redhat.com>
 <664e0f5c-db4c-42b4-a9d5-36f6c015268f@gotplt.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <664e0f5c-db4c-42b4-a9d5-36f6c015268f@gotplt.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/7/24 15:38, Siddhesh Poyarekar wrote:
> On 2024-03-07 15:22, Carlos O'Donell wrote:
>>> * Mailing lists @@ -81,7 +88,7 @@ The following is the suggested
>>> list of services to be migrated (with notes): * Isolate BBB from
>>> other services. The current list of glibc services were put
>>> together as part of the -CTI TAC `glibc service enumeration
>>> <./enum>`_. +CTI TAC `glibc service enumeration <./enum.html>`_.
>> 
>> I don't think this is correct.
>> 
>> I agree the website link is broken, but it has to be a
>> cross-document reference that works when generated as html (rather
>> than assume html).
>> 
> 
> Oops, looks like it just needed a :doc: prefix and not the .html
> suffix.  OK if I fix this up and add your R-b?

Yes. You have my R-b for all cases where you fix this in a non-html-specific way
where I otherwise rejected it.

Reviewed-by: Carlos O'Donell <carlos@redhat.com>

-- 
Cheers,
Carlos.

