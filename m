Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BCA1E1DA
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 18:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45DEC40136
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 18:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45DEC40136
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=TbtxZ7Hq
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jlgTSHB9kQWp for <cti-tac@lists.linuxfoundation.org>;
	Thu, 10 Aug 2023 18:25:52 +0000 (UTC)
X-Greylist: delayed 4118 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 10 Aug 2023 18:25:52 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F7BC400DC
Received: from buffalo.birch.relay.mailchannels.net (buffalo.birch.relay.mailchannels.net [23.83.209.24])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0F7BC400DC
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 18:25:51 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 568772C10B2;
	Thu, 10 Aug 2023 18:25:51 +0000 (UTC)
Received: from pdx1-sub0-mail-a250.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id EBB3D2C135B;
	Thu, 10 Aug 2023 18:25:50 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1691691950; a=rsa-sha256;
	cv=none;
	b=3Qc6q9jMX0xnD1k9uJY6yJrDMnvMC98K7vfT3NadkDDqZqW0XY/LlFegDbWPkhf4agiJiX
	2NSAL45KZmdy/a0yh5lFnBpip/kZlb7eQMLMOG+HxBs6KdtJnHzco424CX+iFaRAWGG2oI
	/AQ8q0rUQX7cqGVoR8+ZjsugmNARe99nW21mBU7j3b/tsNpe+MovOY/ANI+8WAuQhHQRb/
	ExDevk5s3T++3BiURQ3AovZqxsAj2tJbXhSE8shFYOJsftc/h2oLKJKDo+wp/DXtNTffk+
	NmolRXNLa1YHAekN0CsLegySbeoCYz4s2TQQZq6MfXmDf0C+fV90RXxmOI1feg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1691691950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=WIyPgR7EeFSeUGoolvafIuXdCM20ku4d19run5bfAx4=;
	b=OFPGs5XEpqsaT98g/uxCDwLga0Bam8Hlku1IAmp3S9WzNppJe0XWaTK/G6WsUcz0Lewgzv
	cTwTM5tBvTxsveauBdlx9mp8N8JPlPMJkbsf+6n7Vrcg1LHFBsUNATVR4n8qRCP7MkCOlU
	5yMH9wJfwnHqilHPOTQA1jnhoqmKlQH7zjFhFUjhagyHeb4oDwcIZFDFKgi+DzZD/15YZ0
	Sf3MyhJK9QDdF7S4QPtAe8I9ClYCINLTdSbXqv68F7822Wez10ofxzQFFNn9sZ2BAByn4T
	hdoK0T+6FLTZNE3VEik+VyAE/ziWp0ufFUvGR9wML0QsS9G/b4rkHaA78NhyEg==
ARC-Authentication-Results: i=1;
	rspamd-749bd77c9c-hmw2l;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Chemical-Daffy: 1c304a0a45750455_1691691951194_3943391971
X-MC-Loop-Signature: 1691691951194:4280506255
X-MC-Ingress-Time: 1691691951194
Received: from pdx1-sub0-mail-a250.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.117.178.17 (trex/6.9.1);
	Thu, 10 Aug 2023 18:25:51 +0000
Received: from [192.168.224.119] (unknown [24.114.69.242])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a250.dreamhost.com (Postfix) with ESMTPSA id 4RMFjV2FB4zGH;
	Thu, 10 Aug 2023 11:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1691691950;
	bh=WIyPgR7EeFSeUGoolvafIuXdCM20ku4d19run5bfAx4=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=TbtxZ7HqHo2IzSlZWsYwW3DjS1PuBm54zDm09WPQp6vdnN4Gp4uMo0/TcedpCS8EM
	 thsB5FbPK3zmTkpMGKL3cdt1ksXfgxuVrJ8lKjYaY8sRLV9RjNg2SFOS7aL4qj026d
	 6BT5Y0T0xB19wbAkOoHk971t3lYCPku1A/M3bj4zcUr9WZnuQwX9+ojRR1XSDiWski
	 RbardwPvPHit7IrZB3xT53DWfDr8g5lpDUM9xHdVH6Gg7ldkCtqkfUHg17FiHp9LQk
	 GapMaI2TTnJjyeRLKJGgsR9Ki32z9VIuaRMdUxW//QZV2wli/SRuLgBLy1bichQhS2
	 GAzSaVn93Bupg==
Message-ID: <3e9faab8-7272-dba1-d84d-60008ab95375@gotplt.org>
Date: Thu, 10 Aug 2023 14:25:36 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Resources for glibc CNA
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org
References: <3b30c81d-e328-0379-d7b8-92bfbe322b39@gotplt.org>
 <20230810-container-startup-099fa7@meerkat>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <20230810-container-startup-099fa7@meerkat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-08-10 14:15, Konstantin Ryabitsev wrote:
> On Thu, Aug 10, 2023 at 01:17:02PM -0400, Siddhesh Poyarekar wrote:
>> Hello,
>>
>> I recently proposed setting up a CNA for glibc and it looks like there's
>> general consensus on us doing this.  As part of this set up we would need an
>> email address (preferably one that can accept encrypted submissions from
>> issue reporters) to reach the glibc security team and web pages to publish
>> security advisories.
> 
> I am not familiar with "CNA" in this context, but I assume it's some kind of
> Numbering Authority similar to a CVE?

Sorry, yes, CNA is CVE Numbering Authority.  We're looking to form a 
volunteer group to become a CNA under Red Hat as the root CNA so that we 
can triage incoming reports first hand.

>> I wanted to know if this is something we could/should set up on LF
>> infrastructure or if I should try and get something up on sourceware.
>> Konstantin, does LF already have some infrastructure for this that we can
>> share?
> 
> Yes and no. We do have infrastructure for encrypted communication called
> "remail" where hardware vendors discuss vulnerabilities that are likely to
> affect millions of high-profile devices. For example, it was used for
> collaborating on the patches fixing the recent speculative execution
> vulnerabilities. The setup is described in this document:
> https://korg.docs.kernel.org/remail.html
> 
> However, this may be an overkill for what you need and also introduces
> multiple levels of complexity that you may not want. The alternative is to set
> up a private PGP keypair and share the decryption and signing subkeys among
> members who are duty bound to respond to vulnerability reports.

remail functionality is exactly what I had in mind actually.  What 
complexity would be involved in setting this up?

> For the publication, I usually strongly advise a simple static site that can
> withstand very high traffic. I believe there is general consensus that
> "toolchain.dev" is the domain to be used for CTI purposes, so something could
> be published on advisories.toolchain.dev or similar.

Ack, a static site would be perfect, perhaps with markdown pages and git 
access, similar to our plan for the wiki.

Thanks,
Sid
