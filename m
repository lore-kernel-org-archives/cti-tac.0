Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87E4A463
	for <gti-tac@lists.linuxfoundation.org>; Wed,  9 Nov 2022 20:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57C1C60750
	for <gti-tac@lists.linuxfoundation.org>; Wed,  9 Nov 2022 20:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57C1C60750
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=QHZoC2Ii
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.755
X-Spam-Level:
X-Spam-Status: No, score=-0.755 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
	RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=no autolearn_force=no
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jE1ZWFdyM-fs for <gti-tac@lists.linuxfoundation.org>;
	Wed,  9 Nov 2022 20:55:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EB47608B7
Received: from donkey.elm.relay.mailchannels.net (donkey.elm.relay.mailchannels.net [23.83.212.49])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2EB47608B7
	for <gti-tac@lists.linuxfoundation.org>; Wed,  9 Nov 2022 20:55:08 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1683C640AF6;
	Wed,  9 Nov 2022 20:55:08 +0000 (UTC)
Received: from pdx1-sub0-mail-a307.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 74055641ED1;
	Wed,  9 Nov 2022 20:55:07 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1668027307; a=rsa-sha256;
	cv=none;
	b=QKVsa3aWUaRCcZFBTs8vAg1BylQRT+tZk0W3N4GYXwkxWhIyldOa1vJEBeDCEeUZdds8X/
	DHrJ8+cGqhFRX4wLpQt0Qo6m0p30dIWhIbfpDBYNN7uYo2zOWQynI9kmlwMDdxm42EkKDC
	wEkCr4+dQt3ux49dJxPozeGJFvJ0pSmwqcpCiontMZ9H97/rY33HViE0Telkqdut21DliI
	rNWL4JhQZc/abkg8g6ZlKTty/jdY9QI5wYYsOi4Bvl9DexGmogUGYx0ey0D0uFKnfvjSYy
	8bSpyq+3TGqfYEuxyoqzggxviyQCfVLJC4BhFmgBBksjWDsKX01Opi1kCS8k4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1668027307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=PdRw2j3yZY+hL7QAplERq4KpT6RzYPFmkWpA4kS0sUU=;
	b=FHK/yjhRR93VWWcwIEDAAWqL4mzKSWRFfrjX0gi/Jq9MbodLOICOtT6BECSEagNJWfYRGi
	8HrdqmmCAPHNuAu6zEOQm76jCwPmPjw6p34atJvhzMrIvdV4Q6eDsdw25pEv+j6kiM1WBL
	IsxdXQVl2uyUp4PjMAdzUJRzfuGsCMoSyFSWAq/ZV96wTff3vBcXL0SItlkXpsuUoa3mGt
	kXLF48jpJYm2K+DEI8TaJcudY4yQ6Pdi1waqEBKZe/zHowp4/z+Lxn+L7WqeOQLf4RjMQ+
	OZaTW5q0qMxz2DoEd29mtVKV4p+gWhdUv4oM8Q3YF4HFP7E1k1il8l26koU2BA==
ARC-Authentication-Results: i=1;
	rspamd-5cb65d95c4-ktmnm;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Sponge-Whimsical: 6349423309cba9b9_1668027307867_2003767047
X-MC-Loop-Signature: 1668027307867:3114231915
X-MC-Ingress-Time: 1668027307867
Received: from pdx1-sub0-mail-a307.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.24.77 (trex/6.7.1);
	Wed, 09 Nov 2022 20:55:07 +0000
Received: from [192.168.0.182] (bras-vprn-toroon4834w-lp130-15-184-147-71-211.dsl.bell.ca [184.147.71.211])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a307.dreamhost.com (Postfix) with ESMTPSA id 4N6y0B0g28z5k;
	Wed,  9 Nov 2022 12:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1668027306;
	bh=PdRw2j3yZY+hL7QAplERq4KpT6RzYPFmkWpA4kS0sUU=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=QHZoC2IiqYaTPSGGxEm4QZ+qdNpCeItoSCFprYE/eTehF5B2TM7/6GD7MKLtfXXyR
	 AkZpTOF4vJXSCeJXulfUu5MpSlel8u3c7F1D0BVjwyQMWPLMY6KpWvW37cCEmv1xDe
	 U1p85zEdLjSUF44TfW8XWOUkGnxxBJ0uxKsU3bBvUlGsyqnxXRrs49CzZmXbrm63Xl
	 19fClB3jRD2aBVQNKS1VM4cM65jMtlBr/U9J5A9N71x6dwHz+VxTMWc+qCQgd5uWAx
	 69X6sYPoUAvLfW8fIKkEnr8z/bJ2QC6BJMCsqj9feHeFZvh3ECU+vwC6R5XCO4+wIN
	 efJz2dEGX/mMQ==
Message-ID: <1d1817a0-f8fc-3ba1-ee7c-ce1a039285ca@gotplt.org>
Date: Wed, 9 Nov 2022 15:55:04 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: GTI TAC Meeting Notes 2022-11-09
Content-Language: en-US
To: "Jose E. Marchesi" <jemarch@gnu.org>
Cc: Carlos O'Donell <carlos@redhat.com>, gti-tac@lists.linuxfoundation.org
References: <90611be5-1c79-e5c9-e925-cad7ef854447@redhat.com>
 <4366b156-d1db-9414-66ec-6728eeaa3625@gotplt.org> <874jv7x384.fsf@gnu.org>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <874jv7x384.fsf@gnu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-11-09 15:49, Jose E. Marchesi wrote:
> I don't know what a "FSF steward" is, exactly.  I have only heard the
> term in the context of GCC and glibc, and always assumed it was a
> peculiar way to refer to the GNU maintainers.

In fact I think it's specifically in the context of glibc[1], I don't 
think other projects use the "FSF Stewards" or "Project Stewards" terms. 
  It was probably in the aftermath of the transition of the community 
around 2011 where the project moved to a consensus based development 
model and AFAICT the then maintainers wanted to broaden who they called 
"maintainers".  gcc is not the only project with a colorful history in 
that regard :)

So yes, FSF Steward does refer to GNU maintainers.

> GNU maintainership is certainly well defined, both in scope and
> extension.
> 
> The GNU maintainers are appointed by the GNU Project, and at the time of
> being appointed they agree to, among several other things, apply the GNU
> policies, be the responsibles for the package GNU-wide, and notify GNU
> if at some point they can't or dont want to maintain the package
> anymore.
> 
> The official GNU maintainers are listed in the records in fencepost (not
> in savannah) and for the four toolchain projects they are, as of today:

<snip>

Yes, these are precisely the people who will be making decisions on 
behalf of and in the interest of their respective projects.

Thanks,
Sid

[1] 
https://sourceware.org/glibc/wiki/MAINTAINERS#Project_stewards_.28GNU_package_maintainers.29
