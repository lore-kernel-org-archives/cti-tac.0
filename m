Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897E61779AB
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 21:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714424495; cv=none; b=Yb28G4YlX9vZyaWs34Gv8LMrLUW85LxWUSdSijVQsSJglGlQl3KTh1Z6vxAQivPVlB0eFJyOkON6qcI4FrpPaM971Fjc00yiQ/LNkVTzoJ1HUO6z92SZNGUZBEWdHweAcbw3+AkhkcOjUWJnZkd/RVvunbyFKCaqIIjbnzgxv+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714424495; c=relaxed/simple;
	bh=drbNHdDoMPnBaiQrYAbeB9HIu2+2RZrfytH1QeOqbRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3l+YOtWuU0oE6a6iDbr44kTtlRnO50Bhr37Q0Akhas9UDYVQ/zkfAti4fhHtGFp5USZTacnw76rKWc8iDIVxRcJ3eAvExFzWtP2+/PTHX8ph3sARdhZYY0waMHHdqlX3avigbujCAyn8bjU030tGvjKcyysggOvA05QiqQgAoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HH+CcA9x; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HH+CcA9x"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2335E404D5
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 21:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIk9b2GbgFdh for <cti-tac@lists.linuxfoundation.org>;
 Mon, 29 Apr 2024 21:01:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07C7240471
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07C7240471
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HH+CcA9x
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 07C7240471
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 21:01:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 08AE0CE0D8D;
	Mon, 29 Apr 2024 21:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08307C113CD;
	Mon, 29 Apr 2024 21:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714424487;
	bh=drbNHdDoMPnBaiQrYAbeB9HIu2+2RZrfytH1QeOqbRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HH+CcA9xGcSxsjuHypIxA8RYty078aZrUqX0lW93pPD+jdXgWvtEdBXY+dfAXOhT9
	 UWnZ6JaXZSj2up+dNIbNxDrn+56aQqGLAJYaW/uAv1A4gX5J5LiVOAXlDgjgzAMKyp
	 iWhXy2eWXuAO8X4Db60Iv59xgqNuo7R1CByQBYbY=
Date: Mon, 29 Apr 2024 17:01:25 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: Siddhesh Poyarekar <siddhesh@gotplt.org>, 
	cti-tac@lists.linuxfoundation.org
Subject: Re: Hashing out the scope of work
Message-ID: <20240429-rousing-mamba-of-improvement-cabefb@lemur>
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
 <2293a3bb-5780-ec5a-ca72-e19671dccb51@redhat.com>
 <20240429-proficient-pastoral-whippet-bcc376@lemur>
 <6d25ccc7-ef3e-a885-b085-51185c23c91@redhat.com>
 <060ff9e5-785a-4963-8d92-2638db3228da@gotplt.org>
 <de67e18-d847-717e-a8d-dbfe7d2044d7@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <de67e18-d847-717e-a8d-dbfe7d2044d7@redhat.com>

On Mon, Apr 29, 2024 at 08:47:27PM GMT, Joseph Myers wrote:
> On Mon, 29 Apr 2024, Siddhesh Poyarekar wrote:
> 
> > I believe we had explicitly agreed in a previous CTI TAC meeting to start over
> > with a clean slate for patchwork and not bother with migrating the previous
> > database.
> 
> Bug database migration is definitely a lot more important than patchwork 
> migration, but I think the starting point is that patchwork state should 
> be migrated in the absence of a clear reason that's problematic.  And if 
> it's problematic, we should try to understand if there's a better way to 
> configure the future patchwork installation to make it more 
> susceptible to any future migrations.

The difficulty isn't really in the migration by itself, but in the fact 
that we're taking a single project from a larger installation of 
bugzilla or patchwork and attempting to migrate just that project and 
omit everything else. 

For example, for bugzilla we'd need to prepare a query to filter bugs 
and comments by product and component -- to only include those belonging 
to glibc. However, how do we go about filtering users? User records are 
not tied to a specific product or component. We can try to have a large 
query limiting the users to just those accounts who have commented on 
glibc bugs, but this is going to be hairy -- someone could have 
commented on a bug that started out filed under a different 
product/component.

Yanking out just those db entries that belong to glibc is going to be 
super hard -- I'm not even sure surgery like this has even been done 
before. This is really why I'm worried that we will spend a lot of 
effort trying to get it to work only to realize something didn't get 
moved over properly at some later date.

The same problem is with patchwork -- migrating just the subset of the 
database that belongs to glibc lists is going to be very difficult, 
especially with the kind of data model that patchwork has. Is it the CI 
data that you want to preserve?

-K
