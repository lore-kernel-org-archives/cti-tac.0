Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0762E14038A
	for <cti-tac@lists.linuxfoundation.org>; Tue, 30 Apr 2024 12:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714480215; cv=none; b=Iox8RzN1VlwS8SGVwogP9v2psx6en7w619q6wgmCLdUUTxnAY9uFIFti+f/8cQTiAlbQvqvCDE6odihN5Yz+YIIV7M9Bz72fGYIHBv8eQ8Pj+QtsF/feeM/LyMpX0wh/WP4cREC3JGETHGBeMIboS6DyFhZiM6iFpJGG+wLJrhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714480215; c=relaxed/simple;
	bh=1iXen7vfJ5fihXYzuM+mlZlnSb0TljjYQO+RaYx4vak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljlCRpbxi3Y5B/Ny6Dfx+PKTJLuxECYUFQyDwofL8Lf21flOxAjnthWgHDXSX31/35VAO/84Jiqfa+KxurTyvQLrzo7t1Orc3ifgXgVInUrxKvxax3DzY8OW+FZAqRtIA5zYkQ5Ab/Zh1xcB2mjeQ/CAZKn5/CKfutTGL9vYmD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MlsD7mdp; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MlsD7mdp"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F3894027F
	for <cti-tac@lists.linuxfoundation.org>; Tue, 30 Apr 2024 12:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1awVs41kW0b8 for <cti-tac@lists.linuxfoundation.org>;
 Tue, 30 Apr 2024 12:30:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE86D400D0
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE86D400D0
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MlsD7mdp
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BE86D400D0
	for <cti-tac@lists.linuxfoundation.org>; Tue, 30 Apr 2024 12:30:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 95667614D2;
	Tue, 30 Apr 2024 12:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF57C4AF1B;
	Tue, 30 Apr 2024 12:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714480211;
	bh=1iXen7vfJ5fihXYzuM+mlZlnSb0TljjYQO+RaYx4vak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MlsD7mdp+Ls317w65Ermfi9laXeGk38FNkZ+5+Mf1A8cxgOQ6czI1PxgxzZLyBP31
	 /RkjpxlNGW3Kf2bOmnUzrDS8clNQbUoPuPj9W5s+UNZnKBzt0LX2KzKRuRyoFTw6UA
	 zARaBmk+QNirJ+sLiHcXdSyG/GT8gEqnUVcA7SHM=
Date: Tue, 30 Apr 2024 08:30:07 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: Siddhesh Poyarekar <siddhesh@gotplt.org>, 
	cti-tac@lists.linuxfoundation.org
Subject: Re: Hashing out the scope of work
Message-ID: <20240430-polar-jaguar-of-debate-04ddba@lemur>
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
 <2293a3bb-5780-ec5a-ca72-e19671dccb51@redhat.com>
 <20240429-proficient-pastoral-whippet-bcc376@lemur>
 <6d25ccc7-ef3e-a885-b085-51185c23c91@redhat.com>
 <060ff9e5-785a-4963-8d92-2638db3228da@gotplt.org>
 <de67e18-d847-717e-a8d-dbfe7d2044d7@redhat.com>
 <20240429-rousing-mamba-of-improvement-cabefb@lemur>
 <30dc33a-69de-39e6-fe7d-bd21c99ccecf@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <30dc33a-69de-39e6-fe7d-bd21c99ccecf@redhat.com>

On Mon, Apr 29, 2024 at 09:58:18PM GMT, Joseph Myers wrote:
> > For example, for bugzilla we'd need to prepare a query to filter 
> > bugs and comments by product and component -- to only include those 
> > belonging to glibc. However, how do we go about filtering users? 
> > User records are not tied to a specific product or component. We can 
> > try to have a large query limiting the users to just those accounts 
> > who have commented on glibc bugs, but this is going to be hairy -- 
> > someone could have commented on a bug that started out filed under a 
> > different product/component.
> 
> The simple answer there is not to filter users.  It's OK to have more 
> users than necessary in the new database.

Is it okay with the users, though, that they suddenly have accounts on a 
totally different system belonging to a totally different organization?  

> We do still need to make sure things don't break if migrating a bug 
> that was originally reported under a different product/component, 
> whose history might thus show changes of product/component/... from 
> values that shouldn't need to exist in the new Bugzilla.  But as long 
> as things don't break, it's OK for the history display not to show 
> those details of the history that aren't meaningful in a glibc-only 
> context - to show them as a change from <missing-product> to glibc, 
> for example.

I don't mind doing this work as long as everyone understands that it's 
probably a couple of weeks worth of effort and we have to budget it as 
such.

> > The same problem is with patchwork -- migrating just the subset of 
> > the database that belongs to glibc lists is going to be very 
> > difficult, especially with the kind of data model that patchwork 
> > has. Is it the CI data that you want to preserve?
> 
> I think it's the details of what patches / patch series still need 
> review that's the most valuable part to preserve and migrate.

I think we can accomplish this without having to touch the DB. We can 
identify the patches that are still open and replay them from the 
mailing list into the new system. This would be a lot simpler than doing 
database surgery.

-K
