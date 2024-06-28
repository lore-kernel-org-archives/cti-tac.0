Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039AD2E633
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 18:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719600481; cv=none; b=KHNyyxqgo2Jno/Rj6fVDpSxyKhqJ0XqTN5KIFDAE9Y5V9KRJTY6cUguNg7gbyVHoV1/dl8na4bk55mvI9vHbOHggLSW3FJEQrqWcRSp+7L2CYpvmPZROp++9vXjM+DHS3BBXeEQPZdFCUwMaYkX97Pbj8AjLxeBaBdE/+7SBZ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719600481; c=relaxed/simple;
	bh=FnKgE8ThxuHZwdIc9Zo4N48eFmuCcpDJSq2DLMY129Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MJp8Mv6ocTcPYG3DDHp9Nrg5+ACuvmuWiGwVLWhnF6BN3cKCHIcEtfmT9G3pOROAIzTVkj1ZwBPqUW1jQBvBhl7BJ71lNmVLQAduV0TJ1y2hFPZRIp8qjKTck7gYoGRlFpPBn0aOAQ0RSwZNaz9f9B2OYot7NoNwunByHTbNjmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RlGjcgab; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RlGjcgab"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EFBA419D5
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 18:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EcqdDf8Cx89F for <cti-tac@lists.linuxfoundation.org>;
 Fri, 28 Jun 2024 18:47:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C95A5419DA
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C95A5419DA
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RlGjcgab
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C95A5419DA
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 18:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719600476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z/cGUAh6PnIh9eZBEZojyQ8FeMjFQfZ8gFGSlCHYT0s=;
	b=RlGjcgabf6mRyXvilodxWHJNIAezrEB1zEK0dUuuZaKr+wfuRfYJRmuT87GUSYbciA3/Vm
	MwASvSqiY/D+wIdYTdVpx2PofFX7SJt3AJhUaMHszS1Uo0Ngz4yhRXnoPPr3nM2WdazNB5
	p3tjYuGeXXXNM2vonwO5RWX3tdcre4M=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-ib6Vu8e8PEihZJ0A-SL0YA-1; Fri, 28 Jun 2024 14:47:54 -0400
X-MC-Unique: ib6Vu8e8PEihZJ0A-SL0YA-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-79d543aac5aso125243585a.3
        for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 11:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719600474; x=1720205274;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/cGUAh6PnIh9eZBEZojyQ8FeMjFQfZ8gFGSlCHYT0s=;
        b=Ou9+fC/uBZhyMq154ohHdE9o61wIKD7BCxTbo2bq/JAU7a4anRpFNuCWuswLR7nXsx
         vZEz7Fr3ewmx9567kPHA9FszmNJ6xiJrXYRJM66YI8XylQCQpn8BdeP6mp9SfXXr3KQQ
         ybUMGUvzBy2Chs7VnFrIpDJ6PRsUUQO7tTRtfT6rRqLJ749IcytQElJnCg2P/A0yClG3
         BGLsTRmRtM8jmkJJluEo0SEduOlCxm03OtgBpbhj40tdaACtJKIG4jjovD/RXjHjLXrn
         HRgitgm3seIC01gGOrky8fYzEMm14rvyy4NqXcftufs58ISaQ70jvY0P+St4XdjDoUHi
         8FoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXKRIzBMacBnwDMWHn+kuJTt1ADt/581ktzAmcHHaCoVCWMXQV+1zUWG2/eIM2yljpARYPw+VkSTASpuGZ73WvxfhItr1OJJlsQCBunPxKFGU=
X-Gm-Message-State: AOJu0Yw5YrzTAC297ht00Oc2/xVr7Uew1aPopbOmjQi7kydk4B/kZia/
	kas3nv8m+YJaVod4cyZ1W8APVKHcqkVSH6utlKYJi5znioJEjAhKVKarKGaFRcvh5XX0fzIeiTg
	c9S/VVjC7N0x9EWB+4lnghEdUsol6Kgs8GXzdiv/vaL7kxPsLt1TSPoSuhRbp5jcETMUNUwXoKe
	oo
X-Received: by 2002:a05:620a:579a:b0:79d:69db:e5e7 with SMTP id af79cd13be357-79d69dbe876mr288003185a.43.1719600474096;
        Fri, 28 Jun 2024 11:47:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu/MNkGM7VfUqMxdvgY1A6z9o+EwdjFJWTRmnoZBS5IQof8/zkIPPw2pz7Q46Pv3fPAgJW9w==
X-Received: by 2002:a05:620a:579a:b0:79d:69db:e5e7 with SMTP id af79cd13be357-79d69dbe876mr288001685a.43.1719600473721;
        Fri, 28 Jun 2024 11:47:53 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79d69308aaasm96665785a.112.2024.06.28.11.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 11:47:53 -0700 (PDT)
Message-ID: <db1cef2c-c3d6-4f07-ada4-f849acfee064@redhat.com>
Date: Fri, 28 Jun 2024 14:47:52 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] projects/glibc: Update status.
To: Siddhesh Poyarekar <siddhesh@gotplt.org>,
 cti-tac@lists.linuxfoundation.org
References: <20240628180618.427113-1-carlos@redhat.com>
 <87e77aba-4ae6-433d-9aea-542fabb6dec6@gotplt.org>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
In-Reply-To: <87e77aba-4ae6-433d-9aea-542fabb6dec6@gotplt.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/28/24 2:17 PM, Siddhesh Poyarekar wrote:
> Revisited.  Looks good to me otherwise.
> 
> Reviewed-by: Siddhesh Poyarekar <siddhesh@gotplt.org>

Thanks, ran `make spelling` and fixed the remaining instances.

Pushed!

-- 
Cheers,
Carlos.

