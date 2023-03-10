Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA04D1C39
	for <gti-tac@lists.linuxfoundation.org>; Fri, 10 Mar 2023 08:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 637A741678
	for <gti-tac@lists.linuxfoundation.org>; Fri, 10 Mar 2023 08:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 637A741678
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=x1ocLvkY;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HCXk0E3r
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -3.735
X-Spam-Level:
X-Spam-Status: No, score=-3.735 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665]
	autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AtOPb7ILjXOJ for <gti-tac@lists.linuxfoundation.org>;
	Fri, 10 Mar 2023 08:07:48 +0000 (UTC)
X-Greylist: delayed 00:06:11 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2A9B41655
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E2A9B41655
	for <gti-tac@lists.linuxfoundation.org>; Fri, 10 Mar 2023 08:07:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 28E9822A64;
	Fri, 10 Mar 2023 08:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1678435291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WHeZShf9fY1f1rg4zCIbI0Ml0T/0/lpxhkxM08Rv8n4=;
	b=x1ocLvkYIwp10ZGxcdvJNvcqghYhQaWse32B7S5HTG0eei6SVjIs9k9RMBJvasvwF8VPMx
	7tRh+xCuHk6oZH8mHKm01df2vCbZv8vmCl0W+xStGA1WNDTqnmjbAUAgdYUagRUyZ/cBGL
	ooBxP1JCwpv+nCR/z5Pzm9v2xnA+kew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1678435291;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WHeZShf9fY1f1rg4zCIbI0Ml0T/0/lpxhkxM08Rv8n4=;
	b=HCXk0E3rTRFKmEVGMxel4e8nWTwmFwpmxc1lmVjQ2kQBwoTeoaGSuWS2GMshJnMuJyMQY5
	om703YOW/vMJ73Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D3B413A77;
	Fri, 10 Mar 2023 08:01:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 77kvAtvjCmTSDwAAMHmgww
	(envelope-from <mliska@suse.cz>); Fri, 10 Mar 2023 08:01:31 +0000
Message-ID: <a3b10266-2bf7-44da-249f-7d01e36ac253@suse.cz>
Date: Fri, 10 Mar 2023 09:01:30 +0100
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: GTI TAC Meeting Notes 2023-06-08
To: Carlos O'Donell <carlos@redhat.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jeff Law <jeffreyalaw@gmail.com>
Cc: gti-tac@lists.linuxfoundation.org
References: <b72a0c4f-fed3-7418-e9d6-7a277bf37b3e@redhat.com>
 <20230308192923.tuxd3ocrbg3dwqf3@nitro.local>
 <83b7663a-114d-6fcd-6a62-ed3e79ba65bb@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Martin_Li=c5=a1ka?= <mliska@suse.cz>
In-Reply-To: <83b7663a-114d-6fcd-6a62-ed3e79ba65bb@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/10/23 05:50, Carlos O'Donell wrote:
> The gcc project itself has ~6k lines of python in the git commit
> hooks and part of that handles "message" customization.

Hi.

Do you mean the copy of contrib/gcc-changelog where we verify the ChangeLog format?
Note it's just of copy of what we have in the main repo:
https://gcc.gnu.org/git/?p=gcc.git;a=tree;f=contrib/gcc-changelog;h=1978dc6e4f6572e88b27898a9abe849d7ccdb883;hb=HEAD

Cheers,
Martin
