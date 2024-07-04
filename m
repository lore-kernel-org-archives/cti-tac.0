Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7921ACE96
	for <cti-tac@lists.linuxfoundation.org>; Thu,  4 Jul 2024 11:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720093513; cv=none; b=fWqpAierK0B43iIws3CkVHgWLzrp1fhQA45bB/r08yfUBP3REvi4s+T96gZIQf0Dr61XATn81CDgZLJNxa6ACyRYl76EPB+nMCVmFIjpJUIlgg0nPwO8aV83+TKEROMfzNDkg2o5f+aV7kE2N90xBSp+PoESNbEhNST8O2aaFa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720093513; c=relaxed/simple;
	bh=IzObRpW2GhbYKmfuhwnY0Og6IFdbLNfiOvUIdkQ0Jf4=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=F0QQNMaGGzXRzD89nllmFbA/+DfWBC2gBYi1/ozEjE9bMskc0nVK/wXSantCBWXqq8Un6pew5oqE4LyJOHomG215K1RInqOZ3xPYlwLzSH3TfT+SK6MVmy5RbQSs4gunJeEw9JodwiKZjoxaUWdH+kPhia301BmcojOIpb/W5Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g1/kxfDO; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g1/kxfDO"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E88DE84467
	for <cti-tac@lists.linuxfoundation.org>; Thu,  4 Jul 2024 11:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1aTYEJENKVx for <cti-tac@lists.linuxfoundation.org>;
 Thu,  4 Jul 2024 11:45:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8499A841C5
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8499A841C5
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g1/kxfDO
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8499A841C5
	for <cti-tac@lists.linuxfoundation.org>; Thu,  4 Jul 2024 11:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720093509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=TT5VaIBphlewHzBlyIqjsfDJVowsZlCkcAFDa/zqlns=;
	b=g1/kxfDOY6JktoVZKtDH5gjSQWNKw7weElXYMk1yeqYeyBmew42r5HD4OTxdC4oxAz5wUB
	ctUnSos7exv8oPJa3UYLbs8H7bw6+jz10e/1THntkaSdNKxJVuahFkvV+ikRtlkRtHMttC
	nYMbu5G22l4gEGWw+AXiCYfzyNxnVsE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-393S1OMGPqqiuXS-SaTmdg-1; Thu, 04 Jul 2024 07:45:07 -0400
X-MC-Unique: 393S1OMGPqqiuXS-SaTmdg-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6b5e486dbd6so8749496d6.3
        for <cti-tac@lists.linuxfoundation.org>; Thu, 04 Jul 2024 04:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720093506; x=1720698306;
        h=content-transfer-encoding:organization:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TT5VaIBphlewHzBlyIqjsfDJVowsZlCkcAFDa/zqlns=;
        b=D7A3XITzUM67K+PkxnQWY5zBzahMIITF2J2WoLU6he0hv+kLiqqLm+UyvoDXEhZLta
         CwTds96EULnlP8cMFZTcIhwTY3lgLmaJ4j01FhNNFD+Q0kJi4hKq8s63P10jk/WPvLAN
         akhUfZqAwL++l2aGIJwsbV/DElVXDI6GYlG8ekq/NEy6unCl+3brHR8VJoEmGuT0j2p2
         H7mpIVp9+F+fxpmfr1668xcitFa3/aYeu+TD/9wMquCBZaxDcu5EvHqn32nOjao9GkDt
         IYhpFIdUqt1FrArNFhbtBwQojddKjUbOjK+R+/Go/l0rJx0wcFRr5XY1/Y8k1uxouFq+
         whPg==
X-Gm-Message-State: AOJu0YzaLSh9mIBHLQH161/Vkn55LcL3l7scxKIwqFQjarzNNfVlNb5X
	dmaMM5Y82UCTHc34kLLGxl74YT5wtgBYgYzy6vfQBe5x/zuAxTLOjv77bE036WN/R2MUIHZyzDu
	/30xm8uRsCiFqBuoMgfqCQp2LV2Khh31wnqKooBY8+ocT7yDuRTfF5DqjUKlDgDFPzLxSJOijOr
	Bhv7SbGIhEZaYHJy2sD3PvpcYo7Sj7JGI0lKL38XQGzW1VAgTK2g==
X-Received: by 2002:a05:6214:2527:b0:6b5:da50:ac15 with SMTP id 6a1803df08f44-6b5ecfc8d42mr14871246d6.38.1720093506450;
        Thu, 04 Jul 2024 04:45:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlEBHMwNlg4oeTTdpndvf+O/K/qxSDfl5AT0f23luUZtxA17ZNKShRQcRljQZ2LM2937HBeA==
X-Received: by 2002:a05:6214:2527:b0:6b5:da50:ac15 with SMTP id 6a1803df08f44-6b5ecfc8d42mr14870966d6.38.1720093506012;
        Thu, 04 Jul 2024 04:45:06 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b5ae3ceecdsm55671006d6.45.2024.07.04.04.45.05
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 04:45:05 -0700 (PDT)
Message-ID: <49eadaac-4893-4f89-853a-109029f239ba@redhat.com>
Date: Thu, 4 Jul 2024 07:45:04 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: FYI, CTI to present to OpenSSF on July 23rd.
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Just a reminder, more to myself, that CTI is set to present to the
OpenSSF TAC on July 23rd.

With the SOW finalized I think we have some very good progress to
report, along with starting to hash out the glibc transition timeline.

If anyone on the CTI TAC would like to help putting together materials
for the OpenSSF TAC please reach out to me and I'd be happy to help
support.

-- 
Cheers,
Carlos.

