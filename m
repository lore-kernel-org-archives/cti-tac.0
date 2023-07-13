Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABAB20FB7
	for <cti-tac@lists.linuxfoundation.org>; Thu, 13 Jul 2023 21:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70A6D4044A
	for <cti-tac@lists.linuxfoundation.org>; Thu, 13 Jul 2023 21:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70A6D4044A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TPOHvSc+
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HER-WC7rGqtI for <cti-tac@lists.linuxfoundation.org>;
	Thu, 13 Jul 2023 21:59:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2594D40420
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2594D40420
	for <cti-tac@lists.linuxfoundation.org>; Thu, 13 Jul 2023 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689285582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=la4yP6QLJ8eHtUPrGgOP4/dkPO+mNi5rP118nFSDDP8=;
	b=TPOHvSc+3hj3OuRItyxpCjX7A1aJzwtLWqpQ7hyp2jIAvyBt7NOCzHE2dp4y8mK03LRfRw
	/IAAMa/MSqNTCXg8HIqnTP0/12QsnZ7wCPPD+RPipj+3S5x4c4/0fBDg8kBTfG2sSDZQ00
	NH2HScPwf3cOGxiCP9amBfmA1JLj5TA=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-RRfbj780NmGbU7oaAAEezQ-1; Thu, 13 Jul 2023 17:59:41 -0400
X-MC-Unique: RRfbj780NmGbU7oaAAEezQ-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-569e7aec37bso10335627b3.2
        for <cti-tac@lists.linuxfoundation.org>; Thu, 13 Jul 2023 14:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689285580; x=1691877580;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=la4yP6QLJ8eHtUPrGgOP4/dkPO+mNi5rP118nFSDDP8=;
        b=aCbgoLPYxEZYVpZXQkKRSjl/IWZEIqB1B57NEornerv9XoK3D/HsEcNJdQFi74euMj
         ENw4W+KRJyCXgXIRjOC+TXvAlUDSMJrMGsX3C0SoDRKYHfX31n7JDkL8pCiJra1hfCV+
         B9311PxnzgqGQh0UXERYrcAwkJxLGEwy9kwMr8TfjcVO2mtA4Ewi69D4/zqT+xKSvPfU
         g0/jKvaDj0Fl4Vqa7Y9Ul5hapLnWV87TIMnJ7dL5cGd1nAZ2Fp4G8mY1+AgG5EZBlfe6
         /gbpaezsQOzWWBWOJ8pO5HbG+oEdGnXKoY+kchWTjlX/GHwLUR4jSNKBn3eJ6bCow1Hr
         ErBQ==
X-Gm-Message-State: ABy/qLZZQaH+OGaipF6j79t5Sk9j3m7/N+cZCtb4+Mbpu2SgseBV5tGy
	CYBPNs6cLY/AQnxqju0fDkl2qPgAxz5RdpKwxVP2lynNKWZjWRAooi8bpfpO6TSQbuYZDqjjCba
	peSX31nUnbCVzXHatGJp1ArAIfY2Q/ejOxjx9chlTN3dj9ggagWixKxdy6oax/wJQJE9tYOTRwd
	PTExTBZgQD+VnZ
X-Received: by 2002:a81:65c1:0:b0:570:7b4d:f694 with SMTP id z184-20020a8165c1000000b005707b4df694mr3231462ywb.3.1689285580821;
        Thu, 13 Jul 2023 14:59:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG9+K5iz+3qY/xMCS6doy+DD1MJqnAINWlRBiUmrMuj2fvd6DoOzZ1SW5RNUoX7nCF4pdDLNQ==
X-Received: by 2002:a81:65c1:0:b0:570:7b4d:f694 with SMTP id z184-20020a8165c1000000b005707b4df694mr3231444ywb.3.1689285580498;
        Thu, 13 Jul 2023 14:59:40 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id b7-20020a0dc007000000b0057a0e5b18e0sm1962184ywd.142.2023.07.13.14.59.39
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 14:59:40 -0700 (PDT)
Message-ID: <3ad0f345-a86e-11f3-e877-ba7b0c2e23e3@redhat.com>
Date: Thu, 13 Jul 2023 17:59:39 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI update sent to glibc community.
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

TAC,

I have sent our analysis and update to the glibc community:
https://inbox.sourceware.org/libc-alpha/45e98807-908f-0968-b6fe-5dbb0af265b1@redhat.com/T/#u

-- 
Cheers,
Carlos.

