Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50371427D
	for <cti-tac@lists.linuxfoundation.org>; Mon, 22 May 2023 15:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 381724017B
	for <cti-tac@lists.linuxfoundation.org>; Mon, 22 May 2023 15:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 381724017B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=fsf.org header.i=@fsf.org header.a=rsa-sha256 header.s=mail-fsf-org header.b=lDVvQ4Ho
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.402
X-Spam-Level:
X-Spam-Status: No, score=-4.402 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nq-56upjtCCC for <cti-tac@lists.linuxfoundation.org>;
	Mon, 22 May 2023 15:32:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D02D34017A
Received: from mail.fsf.org (mail.fsf.org [209.51.188.13])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D02D34017A
	for <cti-tac@lists.linuxfoundation.org>; Mon, 22 May 2023 15:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fsf.org;
	s=mail-fsf-org; h=MIME-Version:In-reply-to:Date:Subject:To:From:References;
	 bh=DKODEniInAc0B5OWjjG3tWPYYfn/L3E2imn5kncw+YE=; b=lDVvQ4HoajyJ409OnTs/IRjct
	bK5twOm+rucaww4bWHGmfoY1HOuEcrckVcLejvhxCNWRyoiei8qrpJN9r78YL9COS8lroS/Bd+ZWs
	/CSQAg7YDN6iXEm9ECVCVJq01hFjhGzrirOZndagfGk/lc/OcKTpJdeMzxZN8FwEzdQTSkcEDZJnu
	ayeARUaPpyHkCyOkJNf+vhmgIO1t58ZBNG1fODBhy5cBZIkknKJ18yBcZhrpRZh2Wul/XbJol0f53
	tG2LdCuu8ijlLEQvi4dcMSthrYTt4kIf8kPa5UEpdLrL0DbJ7dL7nJ4uBxkPeRcwRRwiyz910UW3D
	r0te6kmHA==;
References: <13b3266b-a410-77fd-5dfc-4e4994b630cd@redhat.com>
 <20230519-rebate-guru-b0528e@meerkat>
User-agent: mu4e 1.9.0; emacs 29.0.50
From: Ian Kelling <iank@fsf.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Carlos O'Donell <carlos@redhat.com>, cti-tac@lists.linuxfoundation.org,
 Khahil White <kwhite@linuxfoundation.org>
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost
 of glibc migration.
Date: Mon, 22 May 2023 10:37:58 -0400
In-reply-to: <20230519-rebate-guru-b0528e@meerkat>
Message-ID: <87wn108jqr.fsf@fsf.org>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain


Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> In the case when we can't use the git tag note process, we can also do tarball
> uploads using our own "kup" tool that is done over ssh and uses the gitolite
> permission framework. I'm quite shocked that someone in the world still uses
> FTP for any uploads. :)

GNU already has a system for release uploads to https://ftp.gnu.org that
works very well and I help maintain it.

Debian uses ftp for package uploads according to
https://www.debian.org/security/faq and of course they support package
downloads over ftp too. There is nothing wrong with it for our use
case. Ssh would have the disadvantage of managing extra keys, but I'm
not opposed to adding it if it would make sense. If there are any
features lacking for the GNU ftp, we would be happy to add them. For GNU
maintainers to discuss potential improvements to the ftp the best place
is https://lists.gnu.org/mailman/listinfo/gnu-prog-discuss. There are
also multiple inherent advantages of GNU packages to use the GNU release
site. For example, for any changes to the set of keys gpg authorized to
upload, there is a manual review by FSF tech team and GNU volunteers.

-- 
Ian Kelling | Senior Systems Administrator, Free Software Foundation
GPG Key: B125 F60B 7B28 7FF6 A2B7  DF8F 170A F0E2 9542 95DF
https://fsf.org | https://gnu.org
