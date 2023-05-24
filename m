Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FB422627
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 21:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C9AB405FC
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 21:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C9AB405FC
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=fsf.org header.i=@fsf.org header.a=rsa-sha256 header.s=mail-fsf-org header.b=ZzkIiWC0
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
	with ESMTP id MBg5GFyAwQgX for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 21:59:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F33DA4049A
Received: from mail.fsf.org (mail.fsf.org [209.51.188.13])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F33DA4049A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 21:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fsf.org;
	s=mail-fsf-org; h=MIME-Version:In-reply-to:Date:Subject:To:From:References;
	 bh=l+LQgNrP0W/hcsPySOpCghthmgCGkeCcjeMnSDKhCqk=; b=ZzkIiWC0NEp+bHKDsb464qtD7
	bFIQOBEpKaxgmqwNUSQi4ot79b7B6LyZnRmn9UyThgFp3Iuw2Zp/b+OWa30qKyJQgmbYjU+wlzBV7
	3xUL7TndeaduFXnOT2DnLqDOLdpHnuvKxNd9Zo7EuCp0/LEt3Ur0uNmHfv5o4X44Adq9FvTxojsVG
	+KpaEAvPtp/zKwkqqYZw3XOKcqyOqKBKPZa81pPa7TPd5RySRaXgIwWV7q8F1AjhVC3veauAkEaBD
	cOeM9G4hykjP6f+eEE97qC5fpZ0h7Hg3tVxSSgKTKy6QVphMQkCC83lPRwya/yLuX2GjpbmVYHDO7
	lyHSAxUrA==;
References: <13b3266b-a410-77fd-5dfc-4e4994b630cd@redhat.com>
 <20230519-rebate-guru-b0528e@meerkat> <87wn108jqr.fsf@fsf.org>
 <3d664367-8be4-8910-380d-10076cc97762@redhat.com>
User-agent: mu4e 1.9.0; emacs 29.0.50
From: Ian Kelling <iank@fsf.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 cti-tac@lists.linuxfoundation.org, Khahil White
 <kwhite@linuxfoundation.org>
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost
 of glibc migration.
Date: Wed, 24 May 2023 17:53:35 -0400
In-reply-to: <3d664367-8be4-8910-380d-10076cc97762@redhat.com>
Message-ID: <877csx8k7g.fsf@fsf.org>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain


Carlos O'Donell <carlos@redhat.com> writes:

> On 5/22/23 10:37, Ian Kelling wrote:
>> 
>> GNU already has a system for release uploads to https://ftp.gnu.org that
>> works very well and I help maintain it.
>
> Agreed, and I use it for glibc to upload release tarballs.
>
> However, the tarball release process is quite heavy-weight for release branch maintenance.
>
> In addition the downstreams sync from git release branch -> distro git to get the 
> rolling release updates.
>
> So all the other discussions about trusting git become relevant here.

Yes, that all makes sense to me.

- Ian
