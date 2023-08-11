Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DDA63B6
	for <cti-tac@lists.linuxfoundation.org>; Fri, 11 Aug 2023 15:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F26AF60AAF
	for <cti-tac@lists.linuxfoundation.org>; Fri, 11 Aug 2023 15:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F26AF60AAF
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=bcYujcfV
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iC_THtUuMV1l for <cti-tac@lists.linuxfoundation.org>;
	Fri, 11 Aug 2023 15:28:33 +0000 (UTC)
Received: from quail.birch.relay.mailchannels.net (quail.birch.relay.mailchannels.net [23.83.209.151])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DFF9A605AD
	for <cti-tac@lists.linuxfoundation.org>; Fri, 11 Aug 2023 15:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFF9A605AD
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 462EE801646;
	Fri, 11 Aug 2023 15:28:32 +0000 (UTC)
Received: from pdx1-sub0-mail-a268.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id D880A8016A0;
	Fri, 11 Aug 2023 15:28:31 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1691767711; a=rsa-sha256;
	cv=none;
	b=RZSt8ZSRmVx9u/am4m3AtU8yWOMLQqPIzz8O4Y5Q0gnIXVtBkNq93uP1JnJ0OexPxHXNR9
	viONfZiJiV4FUf9qkl6f/ZwGzBkH2/JHzzaee/a2ZJRpPVgsLgkTtjL5O5p4n9sJNEKmpd
	q+7EvuZbTHUA9uP+0c3gOMgMwdAmuBpBSoDdB4n6SM63MfkQf6hN3fxx4/uspDO8DnynSN
	79wx/OD4z6Nf/j1joP/A6KW8pKjIpsC+saSb7sf336sAXtK8cO/2cFz94Vl7g1wRM8iS6+
	9xafutkFAPUTM7iOGL+92KTUrUUXv9qcVl4Kca/DUqJvpn+eOgbSnbQ2Z6+L8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1691767711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=qC9tX7snS8yoFRBzi2Eddz1NZp74NV+hgZedwiCRflk=;
	b=geIM5JPXi0KzvJszsfgaDOyfOjbPHB2oKLcmwui3TRGDiVSL6w4SPBxJH1X8Fm48zqNBva
	jF6T+GeqOKxLrcq84mB6NRHqAmdtwcYio9vi/ruFmzFLOcXECC+PyFNOuyRwO61rRqZ9fN
	fTfsNV27TE7rCscf4pbRKhMP1Sf9PbJyoiv94O8da0Avt4S6+qs7ZYn5VbRrifyfpuA6Tw
	adcuISi0CHg/rXQZ2hURpThxSXnEy34sgZlSsejyHmKCDUKAgN+tIvm09r8Yp8vpo4XQbp
	0so5pJj53WabTYmMGpLd/4M+YPlLHTwswd/lByJAaEsoDawubcG/x3/PbD2Vew==
ARC-Authentication-Results: i=1;
	rspamd-749bd77c9c-66c7p;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Scare-Abortive: 525c162c408a9a76_1691767712128_233173170
X-MC-Loop-Signature: 1691767712128:2226373469
X-MC-Ingress-Time: 1691767712128
Received: from pdx1-sub0-mail-a268.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.125.117.202 (trex/6.9.1);
	Fri, 11 Aug 2023 15:28:32 +0000
Received: from [192.168.224.119] (unknown [24.114.54.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a268.dreamhost.com (Postfix) with ESMTPSA id 4RMnkR1Zyzz5x;
	Fri, 11 Aug 2023 08:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1691767711;
	bh=++PErze11yY0uDs12ufsFKq4U0LO58k6ZZ9O+bK9sQU=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=bcYujcfVjIwx13u/5A77qz5Yl5MhgpgId5oOY+Ye/xGbBkddzuuIbqr1VPt0wuEYW
	 rqNn6j9R86kiSkM/dwCs05HO/JNh2aBcdjgAS2tmnI+ucUTurONIVMFNKxcKDnVfUO
	 m/pka64sb+n/vQdrNx2DvLsxEWWUU9IBoO7lF3v2tEJAne5QCXCe+vV59ERqLGbtng
	 k4cYLmgBMr4MdxHfc4yHQk9oSmL/knki9B8HwsjM0mZ6xOiPL2fDd6Xo0yRVOI8n8d
	 8TAG2O2A5tH8rpCJ6ISfUF5/IZPimh2BJ8uLOfOeTimQ3Yo+ho3hhoLOrPj123dQzP
	 qiAW/EzqqzvvQ==
Message-ID: <69b52888-bc8e-d98e-a588-16f12939a9b5@gotplt.org>
Date: Fri, 11 Aug 2023 11:28:29 -0400
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
To: Carlos O'Donell <carlos@redhat.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 David Edelsohn <dje.gcc@gmail.com>
Cc: cti-tac@lists.linuxfoundation.org
References: <3b30c81d-e328-0379-d7b8-92bfbe322b39@gotplt.org>
 <20230810-container-startup-099fa7@meerkat>
 <3e9faab8-7272-dba1-d84d-60008ab95375@gotplt.org>
 <20230810-slingshot-kilt-01ce9b@meerkat>
 <5ff7a8f2-225e-eec0-44c6-afaf08f5944a@redhat.com>
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <5ff7a8f2-225e-eec0-44c6-afaf08f5944a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-08-10 17:33, Carlos O'Donell wrote:
> I don't have a strong opinion here, but I would rather start *simple* and _then_ scale up to
> remail only if we need it. If we can just use gpg/pgp then I would prefer that.

Maybe we could start with a regular, private mailing list and publish 
keys of some security team members to give reporters the option to use 
them if they need to encrypt their communication.  Team members that get 
contacted may need to act as pigeons between the mailing list and the 
reporter though.  We could start like this and see how quickly this gets 
painful.  I don't like the idea of sharing a subkey among multiple people :/

> I agree we need to settle on the domain name, and I would also pick "toolchain.dev" since
> we want to use that for other CTI projects, and a landing page like "advisories.toolchain.dev"
> would be fine.

[bikeshed] security.toolchain.dev because we'll need a security policy 
page too, even if it just means pointing to or replicating the contents 
of our SECURITY.md.

>>>> For the publication, I usually strongly advise a simple static site that can
>>>> withstand very high traffic. I believe there is general consensus that
>>>> "toolchain.dev" is the domain to be used for CTI purposes, so something could
>>>> be published on advisories.toolchain.dev or similar.
>>>
>>> Ack, a static site would be perfect, perhaps with markdown pages and git
>>> access, similar to our plan for the wiki.
>>
>> Another option is a restricted public advisories mailing list with a
>> public-inbox frontend (similar to lore.kernel.org). This would provide you
>> with both pull-based and push-based subscription options.
> 
> I like the static site backed by git better because it allows us to do all kinds of git-based
> auditing and review. I get the appeal of a mailing list, but I'd still end up committing something
> somewhere, and then sending an email via an API. Might as well just commit and regenerate the
> pages.
> 

... and git allows us to edit advisories too.  In fact, all of 
security.toolchain.dev could just be a repo with:

- index.md
- policy/
   - glibc-SECURITY.md (Gives us space to add more projects in future)
- advisories/
   - CVE-9999-99999.md
   - CVE-9999-99998.md
   - CVE-9999-99997.md
   ...

Sid
