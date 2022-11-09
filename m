Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F1AEC08
	for <gti-tac@lists.linuxfoundation.org>; Wed,  9 Nov 2022 18:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B2D7415DF
	for <gti-tac@lists.linuxfoundation.org>; Wed,  9 Nov 2022 18:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B2D7415DF
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=CnnY2pvh
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jX8u8pmWvgbY for <gti-tac@lists.linuxfoundation.org>;
	Wed,  9 Nov 2022 18:29:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9D98409B1
Received: from cross.elm.relay.mailchannels.net (cross.elm.relay.mailchannels.net [23.83.212.46])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D9D98409B1
	for <gti-tac@lists.linuxfoundation.org>; Wed,  9 Nov 2022 18:29:12 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id DF5A43E1AF1;
	Wed,  9 Nov 2022 18:29:07 +0000 (UTC)
Received: from pdx1-sub0-mail-a307.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6F2103E0CCB;
	Wed,  9 Nov 2022 18:29:07 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1668018547; a=rsa-sha256;
	cv=none;
	b=UXbahxUT+TVn9vbT0FNVNV3bEeMgXVF9KhypjMBxgLHAME6zq3vGZo61MqodjJsj5eK5lZ
	4w9xYqiRFv9/qtUTiZQtjIt8SvPZloriLu7FLKBJ7MLoF5qMT38XTBgZ9UHiZ90Y+UfFH3
	NhB6Uo+ADnS6a+V3RzHID9LeUx48FzOXjWTwgkaeTx8epFgiu3b6bNsnzdKbUHyyNMga1O
	+alyOmHy33eYNkAYD4SxivHjWmoBHLkgV9kSv6lQ29KIc9cBJZLtdUoNBybjnOVQ+NNxzx
	rAiS8pXlfBY2uyAsi6xxpkQLK50Q43uaDAdv35dmoqrefdxZL4o+rtTNNsZTGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1668018547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=BV67NpedAXidmvxNVJS/PrTIc5gRws4U9yHx2UFppTw=;
	b=OXsPy6m9aSQRFwa9jfAXPIYQX17zr3HtN3WFyic7aDg1Djfa861oArGZZi2meIYAkOZnGU
	bKDH/h/zWbiEN5V4LSvpUNMFOyIdDuxP00lxvok3DlqPJQvGugUHdbzwL+Yl8pOg+hoxqy
	iPaLyTzlBT3g3r85wTOgfVVReL5/vNrVmebevbUZIKfn0EvgY3cJRXpvvex2Evyjc6zxbJ
	AsF1EriKixrP7i/p/0gNUHu1G1q0XpaKuipXq/cMDrJPqQfJOfrq9c6pkye/n0jJ4GEhqw
	YGEUqJPiHxY+GhDCsQ/XwKlNdVbnVJR5Fwu8Hk+hBvpLBGtjpwqHBeS/gVqGJw==
ARC-Authentication-Results: i=1;
	rspamd-7f9bbcf788-2bslf;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Shoe-Fumbling: 15389c4c653e800a_1668018547697_480806396
X-MC-Loop-Signature: 1668018547697:141271970
X-MC-Ingress-Time: 1668018547697
Received: from pdx1-sub0-mail-a307.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.125.113.135 (trex/6.7.1);
	Wed, 09 Nov 2022 18:29:07 +0000
Received: from [192.168.0.182] (unknown [184.147.71.211])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a307.dreamhost.com (Postfix) with ESMTPSA id 4N6tlk3Gqkz1W;
	Wed,  9 Nov 2022 10:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1668018546;
	bh=BV67NpedAXidmvxNVJS/PrTIc5gRws4U9yHx2UFppTw=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=CnnY2pvhcGF4sXDMvZbUpmFUSsGhssLYRB4sQ1BF2iRa4v/MbJk1Czxpy+wKiSLbr
	 S36jkBc/nZwDxQQd/ilM8V3Q2OkNoe65WYisYgDPSzfqzVflBaJmQtpcMBgiFdLCto
	 mJm02B5R8/tz5A27vi4HtAhKQGRNFCzyZXaeScLN27gZgAaKodmmgdjvdSIVmffgxB
	 a0e1b+HBpJ3POVxR14dyW9GPQV7aX4qJv0fLv8+bumCi9KSR8LwORbD8NYyn1OMLx4
	 fvDMsdflkwpnDLIIBXpytRzAwjMI4yOd7/F1+Vi4BagnHH8L8l48DK4SUhBMa6Bhj5
	 ljPNGtzhvdpTQ==
Message-ID: <4366b156-d1db-9414-66ec-6728eeaa3625@gotplt.org>
Date: Wed, 9 Nov 2022 13:28:54 -0500
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
To: Carlos O'Donell <carlos@redhat.com>, gti-tac@lists.linuxfoundation.org
References: <90611be5-1c79-e5c9-e925-cad7ef854447@redhat.com>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <90611be5-1c79-e5c9-e925-cad7ef854447@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-11-09 12:47, Carlos O'Donell wrote:
>   - Siddhesh: Could we just use some of the LF and OpenSSF stuff?
>   - David: Some of that could be non-FOSS
>   - Siddhesh: Do we have concerns about non-FOSS for the TAC?

Specifically, I wanted to know if reusing their github project 
namespaces was acceptable.

>   - David: Yes.
>   - Siddhesh: Yes, a simple solution would work.
>   - David: Also have.
>     - toolchains.dev
>     - tollchain-infrastructure.org
> - Regarding the GNU Toolchain infrastrucutre at the LF IT proposal
>   - Next steps?
>   - Create a working group.
>   - Detailed assessment of the current technoloyg and services.
>     - Enumerate the features.
>   - Wether the GTI TAC or subgroup, working with the LF IT
>   - Use the more detailed list to do the analysis and sizing
>     of effort and expense for:
>     - Steady state provisioning of the services.
>     - Transitioning the services.
>   - With that plan and budget, the GTI TAC votes on that.
>   - Plan goes out for review.
>   - Jose: Do I have your permission to be a little bit naive here.
>     - The GNU Toolchain projects are GNU projects.
>     - The projects have had a historical process.
>     - How do we make that decision?
>   - Carlos: That would be for the GNU Toolchain projects to decide that.
>   - David: Yes, this needs to go out to those projects to make their decisions.
>   - Jose: That's clear.
>   - Siddhesh: Yes, there is a bit of word soup here. The "Leadership" is the
>     general term here because multiple projects use different nomenclature.

To add some more detail (since this question has come up multiple times 
in previous years), we have:

- gcc: GCC Steering committee as the GNU/FSF representatives
- glibc: FSF Stewards.  GNU maintainers (i.e. on Savannah) don't have 
special powers in this context
- gdb: FSF appointed GDB Maintainers
- binutils: Nick and Alan (what do y'all call yourselves?  The GNU 
maintainer list on savannah looks different :) )

Sid
