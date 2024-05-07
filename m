Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E207E8
	for <cti-tac@lists.linuxfoundation.org>; Tue,  7 May 2024 20:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715114204; cv=none; b=TVculsPvTySYdSrOskiWgjf2kMkkS9NBaYR8YO2kmgiEByVbbt7rqvwCWeeRpT6Nukaz071bXQvBiCNp70VWcD4d3g61oMsX6nV7iG3CL7hD7/FG10rnMfrm0DMQiLW826I2FlSdgn6Rkt2uklpbmx7aFE6AbOmMPZtKVDcj0v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715114204; c=relaxed/simple;
	bh=fKXQ+/D/vdZC8rFHyh1Ftx9uFLYGMFvHMMp5v7BZb6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnK40EHJiiWaPVW3+QuoGmGpWZcIWSrVopcu78zzap9ef3ka75qXbNeBBBI/D70Lzp5Tsfmb23eDlan8nkCTPLLBTEK0zlJpP17sQKQYDQqMSKqneYtzd1kp8lTzr+YgQWa2uOW39XwdYtSA5kfEaIrlpDaMn4EIP6rjNltQvXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=K5smQ7Sd; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K5smQ7Sd"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 956D560B1B
	for <cti-tac@lists.linuxfoundation.org>; Tue,  7 May 2024 20:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m68EDujsNKSy for <cti-tac@lists.linuxfoundation.org>;
 Tue,  7 May 2024 20:36:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B062E6088B
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B062E6088B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=K5smQ7Sd
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B062E6088B
	for <cti-tac@lists.linuxfoundation.org>; Tue,  7 May 2024 20:36:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 799DA619A0;
	Tue,  7 May 2024 20:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A63BC2BBFC;
	Tue,  7 May 2024 20:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715114200;
	bh=fKXQ+/D/vdZC8rFHyh1Ftx9uFLYGMFvHMMp5v7BZb6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K5smQ7SdyfNU5pYW65ZXpLYHMci48D77f2qJD3mikjkrlZ4m7iS4Dv6tMG52S6YD+
	 N+qg7Vc2+lCqc4xeon8X5GnVtF87Bv9W8skRdejyuk1QURY9qY136QpgClWMeH00K6
	 8CB+nbkBaPEmr/7vShJ1mOudlygN/n3n+xwgJI4o=
Date: Tue, 7 May 2024 16:36:39 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: Siddhesh Poyarekar <siddhesh@gotplt.org>, 
	cti-tac@lists.linuxfoundation.org
Subject: Re: Hashing out the scope of work
Message-ID: <20240507-graceful-wondrous-camel-f8d4d9@lemur>
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat>
 <2293a3bb-5780-ec5a-ca72-e19671dccb51@redhat.com>
 <20240429-proficient-pastoral-whippet-bcc376@lemur>
 <6d25ccc7-ef3e-a885-b085-51185c23c91@redhat.com>
 <060ff9e5-785a-4963-8d92-2638db3228da@gotplt.org>
 <de67e18-d847-717e-a8d-dbfe7d2044d7@redhat.com>
 <20240429-rousing-mamba-of-improvement-cabefb@lemur>
 <30dc33a-69de-39e6-fe7d-bd21c99ccecf@redhat.com>
 <20240430-polar-jaguar-of-debate-04ddba@lemur>
 <9df22f6d-c854-ff6d-8c67-286366d070ae@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9df22f6d-c854-ff6d-8c67-286366d070ae@redhat.com>

On Thu, May 02, 2024 at 07:27:32PM GMT, Joseph Myers wrote:
> > > The simple answer there is not to filter users.  It's OK to have 
> > > more users than necessary in the new database.
> > 
> > Is it okay with the users, though, that they suddenly have accounts on a 
> > totally different system belonging to a totally different organization?  
> 
> If that's a concern, I wouldn't expect it to be particularly hard to 
> identify a more precise set of users: there's a precise set of bugs to 
> copy (i.e. those, whether open or closed, that are against the glibc 
> product at the time of the move - not anything that was once opened 
> against the glibc product but is currently associated with a different 
> product) and each bug has a limited set of relevant people (reporter, 
> assignee, CC, anyone who did any action recorded in the bug's history).

So, I did some more poking at the backend database for bugzilla and 
while I think it's possible, this kind of surgery of moving a single 
project out of a larger instance to a fresh new instance would be a lot 
of effort, and something could still go wrong in ways that aren't 
immediately obvious.

I recommend this course of action:

1. We convert all current bugs in the glibc component of 
sourceware.org/bugzilla to a public-inbox archive, searchable by the bug 
id. This functionality exists in our bugspray project and only requires 
non-privileged REST access to bugzilla.
2. On the migration date, all glibc components at sourceware are closed 
for creating new bugs. This still allows completing existing bug 
entries.
3. The new bugzilla at CTI starts from a fresh state, with bug numbers 
starting with 100000, to indicate a clear break.

This allows us to preserve a searchable archive of all old glibc bugs, 
but does not require doing a database surgery that would be required in 
order to forklift all old bugs from the old bugzilla to the new.

Is that a workable solution?

> > > > The same problem is with patchwork -- migrating just the subset 
> > > > of the database that belongs to glibc lists is going to be very 
> > > > difficult, especially with the kind of data model that patchwork 
> > > > has. Is it the CI data that you want to preserve?
> > > 
> > > I think it's the details of what patches / patch series still need 
> > > review that's the most valuable part to preserve and migrate.
> > 
> > I think we can accomplish this without having to touch the DB. We can 
> > identify the patches that are still open and replay them from the 
> > mailing list into the new system. This would be a lot simpler than doing 
> > database surgery.
> 
> Where patchwork lists patch series as such, is this automatic based on the 
> mailing list messages?  (I think the grouping of patches awaiting 
> review into series is worth preserving.)

Yes, series grouping is automatic based on threading, so can be fully 
recreated from mailing list archives.

-K
