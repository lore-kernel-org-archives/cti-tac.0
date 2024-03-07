Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2830812E1FA
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 21:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709848464; cv=pass; b=Vmw3D27kk/CFJlKrGxmtvK1fHR7TNN5E9xJogrCBLGPFeLW1IeLndTeB2Rg8JyRcrnXFASzfFSq9Hi8KATC4qwS5+cW5/2obQQKj0BiNDarNS5R1NSTxsiapfnFfEQvafodL0t9A3ecPwMXrSQw3xm5Z2nrhciyZVZsSuJaxME0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709848464; c=relaxed/simple;
	bh=Pv4kLrgP/pli8aXVLU/XnlfzjlgxwVAJV3qpuSDTh7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gSKNyaVGxeejNMVKRwH4JqbqS4umGaZViKPu6j9LzR4XiVSy0EfhQhxT7I7cUIaoZLMfGJJZe/68o357hsrexv47eNZpC8z9pRBfoonXZITZ2DIUErPYaKrrRISfRo8yJliNiDP4tCOt8giQ8AzcIMEAvUz+ZaT8Q+83lTDPQsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=lTXaMKri; arc=pass smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="lTXaMKri"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A99B94063D
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 21:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7IRJrlkd1v8H for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 21:54:22 +0000 (UTC)
X-Greylist: delayed 8632 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 07 Mar 2024 21:54:21 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9090840176
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9090840176
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=lTXaMKri
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.209.24; helo=buffalo.birch.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
Received: from buffalo.birch.relay.mailchannels.net (buffalo.birch.relay.mailchannels.net [23.83.209.24])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9090840176
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 21:54:21 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 7CEA184182B;
	Thu,  7 Mar 2024 21:54:20 +0000 (UTC)
Received: from pdx1-sub0-mail-a239.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id C904C8437A1;
	Thu,  7 Mar 2024 21:54:19 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1709848459; a=rsa-sha256;
	cv=none;
	b=XTG77IUMNSMM6jTt+7q/mur4mumw+fbOAFxH/1nVQbqk+22L0hNirSpuooRoZHhsVwtnDm
	25CEE5g1OnQp05xGpUZTeF2gI3h/qvXU7U8DEzJNp6AjyTvRnb8KDaRxfzuPNKziMBpVNs
	jxd3E71kmPKmKYPEJqh1Q//vj2FjEmsVLXlRNd/L2waJLAOdSApT1IgxMqwvJLPnpOgCKs
	1CBQLxw1fF6P3CXrbv5T4RZMua/VYHt22hjTGHRsx73+karcYnB6p8tPb/Av834QsrD3+j
	SKpyH3R09v3liFOxRjILk+i+H6YcZQa4oqdjgsVU9tOh8XsdM/gZFiiAgIvDxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1709848459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=wrENXWO77wArFfuI9wFjhSyETZL1g7sY9YNTiQTX2aI=;
	b=g4K4kRtDyvrUTBbDc0iFlFD63BFjA5K20YNdVDhd6MWFwgqN54s0AzUqVZ6A4/IVomuSIN
	IwUdbeW+wDqe8FxcgMUuTEOaVJM0dSWY2U8n1rURr2Ps3OZ/fYsSdQyj50KyHWpgsDMmko
	s36sHZpDjHz6/x4yk1T32yJBt2F2Anf4lYqXIKVggLhb7FA2wTwrGCuq5Pfni2AE2LXSCt
	QMmb50oL0Tq3Yd2pqP4gqyWY/2FKlXIW8fseomdJ4E94nVC2rr1ghYhaV2/OUMifvJLXn4
	ssVw/06TOuTxDCwB4Bb2Gtawg8QPwxexjJ0b6YpPy83IPcQIsMzI88Wq0cP+mA==
ARC-Authentication-Results: i=1;
	rspamd-67fb46fddd-wfwjw;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Fearful-Cooing: 6b6b903a142fe767_1709848460067_4005431091
X-MC-Loop-Signature: 1709848460067:3931048237
X-MC-Ingress-Time: 1709848460067
Received: from pdx1-sub0-mail-a239.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.104.192.90 (trex/6.9.2);
	Thu, 07 Mar 2024 21:54:20 +0000
Received: from [192.168.0.182] (bras-base-toroon4834w-grc-23-76-68-24-30.dsl.bell.ca [76.68.24.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a239.dreamhost.com (Postfix) with ESMTPSA id 4TrNP73lPmz86;
	Thu,  7 Mar 2024 13:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1709848459;
	bh=wrENXWO77wArFfuI9wFjhSyETZL1g7sY9YNTiQTX2aI=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=lTXaMKriRMpFXgYv08lJ+/1X0xfrPL9XlZk2MTH6JfM/L0Iemvdsmv7ZAjVOrjL0T
	 99CUQwfNJAw5lcvAVBRqGHBbEkQxiKQrshdZTLA4bO1Dc7zkcSEM5EEx76WS9lKdpL
	 2BTyiAP6x5Lp3gkzDGBw/yImyxccVMRHT68bar802HaYv8D/rq1o/9z6Rlp6yE8GbW
	 +Hh/M5CvqjojfJaI6DOdYcE+M2bNJ7HzdPKl0SIhb1CPqFO9yRf3SdLvrDGnmDoiAi
	 dv1IwIxjyk6MUFY9AFDwrAE9hy1fTB5suT+wfNGmzHJw4HCZo6ll7LM0v8fWHRRbja
	 KJeqahm8hdSsQ==
Message-ID: <99745e58-72ec-433a-8f0b-6f3153796847@gotplt.org>
Date: Thu, 7 Mar 2024 16:54:18 -0500
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
 <44b3846a-d1bd-46fa-bac2-3fc59832ca3e@gotplt.org>
 <e019481d-4977-475e-b575-2aa2f04bb483@redhat.com>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <e019481d-4977-475e-b575-2aa2f04bb483@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-03-07 16:06, Carlos O'Donell wrote:
> On 3/7/24 16:00, Siddhesh Poyarekar wrote:
>> On 2024-03-07 15:25, Carlos O'Donell wrote:
>>> On 3/7/24 14:30, Siddhesh Poyarekar wrote:
>>>> Add basic instructions to allow one to test and later submit changes for
>>>> review and inclusion.
>>>>
>>>> Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
>>>
>>> Content looks good though, you can keep my RB and push so long as you call it README.md.
>>>
>>> Reviewed-by: Carlos O'Donell <carlos@redhat.com>
>>
>> I'm calling it README.rst instead, since it's more rst than md.  Is that fine?
> 
> No. The README.md is intended to be rendered by forges that mirror the repo
> and should be in markdown regardless of what we use for the project itself
> (rST). For example Github only renders markdown and a README.rst would not
> be rendered there, we'd need to use pandoc to sync an update of the same
> file but converted.
> 
> Suggestion: Call it README.md; and keep it in markdown.
> 

Ack, I changed the name (and format, e.g. # for h1, `` for code blocks, 
etc.) to markdown and pushed this.

Sid
