Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36072130AC1
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 21:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709845257; cv=pass; b=K7T3jAw+dOFpyP0Yq8KZjNqsuntogz/NaM8sdXfdfl9VomdoE6G/osepgmgAetMGTPNQbDFaOeUO+RtUWNL1vpD+PcJ1ixQfnZk01J/x5FTvnR2CrYaii0w6qfnLkB9eoD42gaSge83pcnqUh2hCMk7W6h0iYLpOB73EAghDhvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709845257; c=relaxed/simple;
	bh=y1APjq3rQIM1Qc9z4HgTJsTlGyNsDtRgwjAEqEf8S1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dqZhohce1MM03/mAID3UMl7U9qWiEze//UYzgnfe8AZUL8dUcpcPrR+CnlDG8pOiyltp8368qMK5hG588fCVCB1FrEsxkwLtRVxGyfLsaW7Lo2jz6mOf/c7Afyvvf5wxvTDJt7GtCjlWtpDp49tF+MEsdw3n/vRtZzyCV6vqodc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=GFO+Ongn; arc=pass smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="GFO+Ongn"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9774822B9
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 21:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ZRmAMSAqPi1 for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 21:00:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.223.161; helo=seahorse.cherry.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33DE98219F
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33DE98219F
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=GFO+Ongn
Received: from seahorse.cherry.relay.mailchannels.net (seahorse.cherry.relay.mailchannels.net [23.83.223.161])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 33DE98219F
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 21:00:53 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 7FF803607A2;
	Thu,  7 Mar 2024 21:00:53 +0000 (UTC)
Received: from pdx1-sub0-mail-a239.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 12B16361CCB;
	Thu,  7 Mar 2024 21:00:52 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1709845252; a=rsa-sha256;
	cv=none;
	b=lJNG42OKXkOeXgmD8o5tJFOIQBtCYg5G+pugtanmvrL9Ll6Idqaxr4VEv+B4qLLxvupHqn
	/HCMbLQaAKLN/rYCaQu/fI3UscjGILsSHpSrFMK41VUA9zL7kIbImN4JXAgyaQv0zHIXjK
	wXLNbfHXsE9YQt3shjk9LS10l6Q6gs6UTMAesjmU3rtdJCbZJ8PG1h2vEKVy/qQ9UT+O39
	o+Gl49FKlCApCuxf+JA3jlVvv1WCoup18HTEP2M8rln+PhGnGt9G6wKhdferQgJaiUTBsr
	UJlrbnrhjrlCfnPTFBxP9ejEPpYDYVD3XYfPfgtRdW1VdtE24t2UDLAhwfPVBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1709845252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=ARSEwFzokT85ZJQnQVH3DlBBryUAznbl8A5EI3PpRcw=;
	b=Jthi3VTj/rAmENaMYdczQWa053nppddW1NhIRK9rXnOxkqXrQ3IEVRkeKAPmYT4x3uoWQm
	l5WUYMs0BaVHX8bfd643HAubKa2VC5mRgNVmc9dF6VqAZZ8elBfxPzMvRwIiNo4YhsFued
	MIHMcmGR7I+wtviIplVrlfraVwp6h6ChtWzUnvQfK7/tFWX+CtOYxV8gDjsX//H7+YzXfA
	0FtL9cWBIu5HjpGZzE30seBChgdUE+CJqnOiby7/PySU01b0AB0muBWdr3r1N/PMS6eZUq
	4nfIwOvb+1ujt5eUDjBu8plgDGgbC3DJYB2mbIDS1LIMmmratEngxyqQ5OHiGg==
ARC-Authentication-Results: i=1;
	rspamd-5db57bc4b6-hxgsq;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Drop-Grain: 04d6c2425cc1bf8b_1709845253375_2154381270
X-MC-Loop-Signature: 1709845253375:688869109
X-MC-Ingress-Time: 1709845253374
Received: from pdx1-sub0-mail-a239.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.123.27.51 (trex/6.9.2);
	Thu, 07 Mar 2024 21:00:53 +0000
Received: from [192.168.0.182] (unknown [76.68.24.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a239.dreamhost.com (Postfix) with ESMTPSA id 4TrMCR5MNjz3Z;
	Thu,  7 Mar 2024 13:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1709845251;
	bh=ARSEwFzokT85ZJQnQVH3DlBBryUAznbl8A5EI3PpRcw=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=GFO+OngnXZgwSWYVDSMcVvmWdw4TWzU2xSc0zSHPDeMBwhXV2DLD8+l3SG5un8yJE
	 l5ZeVUCdxuXKEF8q4mO0CRthft3uvY7AH2DlLuyPplmvy8r1KqDzx7QYZ8n+q3CQvE
	 W9OAHuhCjD081QSwsN/5UXotZxB9rG3vzz1x6WS5aQJax1mKt6bUDc7zt7BS+hyww9
	 Y7EF7fkkmhwFqvQxCrmmeCqtfExFYR2Kl4Nsxk1Z6xH8q0oQQuYMl3W1XuRjWB9u8H
	 bzzUe9lT3dsH1JQcD5YDwbrl4Yba0Bdkb5LyB9Tz3rOtcH/WwdhFfMxKT2GqZgONh2
	 v7WyzwlBmi0wg==
Message-ID: <44b3846a-d1bd-46fa-bac2-3fc59832ca3e@gotplt.org>
Date: Thu, 7 Mar 2024 16:00:40 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] Add a toplevel README
Content-Language: en-US
To: Carlos O'Donell <carlos@redhat.com>, cti-tac@lists.linuxfoundation.org
References: <20240307193019.4028812-1-siddhesh@gotplt.org>
 <20240307193019.4028812-3-siddhesh@gotplt.org>
 <ac03517b-3ccc-4117-9a5d-edb2893a8220@redhat.com>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <ac03517b-3ccc-4117-9a5d-edb2893a8220@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-07 15:25, Carlos O'Donell wrote:
> On 3/7/24 14:30, Siddhesh Poyarekar wrote:
>> Add basic instructions to allow one to test and later submit changes for
>> review and inclusion.
>>
>> Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
> 
> Content looks good though, you can keep my RB and push so long as you call it README.md.
> 
> Reviewed-by: Carlos O'Donell <carlos@redhat.com>

I'm calling it README.rst instead, since it's more rst than md.  Is that 
fine?

Thanks,
Sid
