Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55939657A7
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709843924; cv=pass; b=XZFInZt1z0B9RjsBegi7z8h7N4xsS83EYfsKlJgsdU6gHUA4tU2ByJY65fUpuO60Q+UUDCWyykEYRysz6ume6teS1Vk9p0dxEk3KqCNmyqreLgk30DoLviMMse+NnR4D5RDP71TVYaaukPChgcRsSKl7plg2jF3NFl0FrBcv01c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709843924; c=relaxed/simple;
	bh=cixqkAOi/7GWBwbvThoXppKnKhYzy/+W2RyIdqUuixo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=db+2thg3n8AZ9WrIV5Iaizbez0HdhTFGOb6OZ9yaq1LOGR5peUF6fMk81OKUznwy3aijGeGmxxfEYFFn9V5tq8f2DNionETYDgwvNpdH/sK8F3hT8lYGfZuvrJ70H/7qC3mKK8G74n5osvL4uKPfyhmNRqMnESXbSTF/QSSKJb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=bSd0uvIl; arc=pass smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="bSd0uvIl"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E240760781
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8iqufwapbkr for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 20:38:42 +0000 (UTC)
X-Greylist: delayed 4080 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 07 Mar 2024 20:38:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 034F8607C4
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 034F8607C4
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=bSd0uvIl
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.212.50; helo=dormouse.elm.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
Received: from dormouse.elm.relay.mailchannels.net (dormouse.elm.relay.mailchannels.net [23.83.212.50])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 034F8607C4
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:38:41 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B79C4943CC0;
	Thu,  7 Mar 2024 20:38:40 +0000 (UTC)
Received: from pdx1-sub0-mail-a239.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 358FA9434B4;
	Thu,  7 Mar 2024 20:38:40 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1709843920; a=rsa-sha256;
	cv=none;
	b=bWxRcag8VVeh+ROZsH1VXpXAgPZdQZ7ukn6PpMZ73OKTbH1zJ4H+kVkfcFf3ez0d/eAWXX
	kJ15pZzVSkDCZiG+PzOrXl2Spm/E7R3gHpntHysjSb3tU9Iv9gAYYDSF6+phl/HEiPGtgs
	YYAkzeAF7I7S9zt5F2F03Yoey+FJ/UlApCI0N7tPmiSLKTuCTfO+9akDCYC37iAVH2BGzX
	rSZPrV6atTxTFZ3kAgOHMiXSbfT3z/ZsO7Udhjemp5jx2Ep7huPJ3GsUGitUFCPK8IA2vt
	LceAbXGlI38mN/Kybp4nfwGBfKcHiCvaoVnRT0E+92ByYKm+U4ONMmaVd0FdMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1709843920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=s1/yid3DFZ6AgBzuA7MEw/SvgVHjFhazwFN+o+Ww9Mo=;
	b=ecglJL4Jy2pGxgNsemQA2MrEgTuYj2avbETq/hrOYH5a4LS4MLnWq9u59sRNZSrel2Fj0/
	NArbWFywyxgCxenk0NhvfZAHYEd7rvCjLnXsdfZr++WNcXfpeCGpWGaowZfJjdH8eZWq5N
	KYJ2XpInC+Di7BPBqehDHg0Z6ikjDNy7zJA8owNndYlWzPuS+AzXkABx3+hcev0vq+d9Ga
	BgvD0LIPmVSpPWCUfr6zJT0UrGVbTg20ALDy3oKPa+/zhonIIHq3iDAZR1kIbNPXpn0g1a
	+K0lyXIWX/6HmkLuBLHEFwaAFzaWrYV9KL7cJJG6Zt8loMFKWfYoZEQuH740Pw==
ARC-Authentication-Results: i=1;
	rspamd-7f9dd9fb96-gcqr4;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Company-Juvenile: 67b4dd9f4103d073_1709843920461_2688753649
X-MC-Loop-Signature: 1709843920461:3013621840
X-MC-Ingress-Time: 1709843920460
Received: from pdx1-sub0-mail-a239.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.102.58.45 (trex/6.9.2);
	Thu, 07 Mar 2024 20:38:40 +0000
Received: from [192.168.0.182] (bras-base-toroon4834w-grc-23-76-68-24-30.dsl.bell.ca [76.68.24.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a239.dreamhost.com (Postfix) with ESMTPSA id 4TrLjq6PnSz3Z;
	Thu,  7 Mar 2024 12:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1709843920;
	bh=s1/yid3DFZ6AgBzuA7MEw/SvgVHjFhazwFN+o+Ww9Mo=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=bSd0uvIlS3yPwuq1agL5FJos6lPcLWL4SQbMbF5dAs4QKdg0ZfiUOKNlGOGbD7Dgu
	 DCRoqXdew0a1hMYYy7PJwYC09NWe/etrTw6khMYawM5lzHYZU9Gb/PauNa4EYzgsW8
	 hgljoq9TTCY5Wdewpx+CC+fo6VnS43jFUq6Uye3pFCkoSkkc6EJpUVywe3mIZ22hVy
	 1LF8D4EsI0RZLMbzV+/tcBxFZj95q4L+jn2e+SSgCIFrk9S2vbdh8QyXxfauAzu0jz
	 YG9lcaR6HVPBpA/EI4uffWDQow9L7ezVXLlwtCSzre4sSeaEKgyysLWl74q5zsnllG
	 0N2FiZ4F5vfLw==
Message-ID: <664e0f5c-db4c-42b4-a9d5-36f6c015268f@gotplt.org>
Date: Thu, 7 Mar 2024 15:38:34 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] projects/glibc: slightly adjust the structure
Content-Language: en-US
To: Carlos O'Donell <carlos@redhat.com>, cti-tac@lists.linuxfoundation.org
References: <20240307193019.4028812-1-siddhesh@gotplt.org>
 <20240307193019.4028812-2-siddhesh@gotplt.org>
 <191eb22c-ec30-4f01-a7b9-b7b9fa5ae0fb@redhat.com>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <191eb22c-ec30-4f01-a7b9-b7b9fa5ae0fb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-07 15:22, Carlos O'Donell wrote:
>>   * Mailing lists
>> @@ -81,7 +88,7 @@ The following is the suggested list of services to be migrated (with notes):
>>     * Isolate BBB from other services.
>>   
>>   The current list of glibc services were put together as part of the
>> -CTI TAC `glibc service enumeration <./enum>`_.
>> +CTI TAC `glibc service enumeration <./enum.html>`_.
> 
> I don't think this is correct.
> 
> I agree the website link is broken, but it has to be a cross-document reference
> that works when generated as html (rather than assume html).
> 

Oops, looks like it just needed a :doc: prefix and not the .html suffix. 
  OK if I fix this up and add your R-b?

Thanks,
Sid
