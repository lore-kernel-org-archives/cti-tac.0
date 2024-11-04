Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35CD1AD3F5
	for <cti-tac@lists.linuxfoundation.org>; Mon,  4 Nov 2024 10:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730717443; cv=none; b=psgdsTKeAIXygQQY/+y58pe5vcW4kVu6aVLCyDlSxHxEbirTJCM/R+AVDVeK4m5EGsqKAGalAmVeYqFtwQxJ+6Xs7BIfD4/idSJ3UCq1c99FJ9AuT7fJamzIYS9DHaf18463JOsEsbX579W3Syoct9VDk/kGfUCjwhiL47PPxjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730717443; c=relaxed/simple;
	bh=/JEcYAKiFx6wU4BrpVZvQ3DItskofGiK7L8KaENBeDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQAdaC2KwGTsJSwQPVpmVzSoqCG0GT3SSLrS1L85wK7kzxTAWeeDKORbbxwfSaoc7OJG5GC07tEa+6bTmVL5x1wtbfJ8NhUTqsvdgcRHRUko/mbUiUxIUCDmktrdYTkj/VXdKYNyIEV44QOKqNrAZJcNrXKv2Nz6NaGpqV6CTjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 482E840258
	for <cti-tac@lists.linuxfoundation.org>; Mon,  4 Nov 2024 10:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.591
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HptCk2Jl0cq3 for <cti-tac@lists.linuxfoundation.org>;
 Mon,  4 Nov 2024 10:50:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.83.234.184; helo=gnu.wildebeest.org; envelope-from=mark@klomp.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B4714023C
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=klomp.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B4714023C
Received: from gnu.wildebeest.org (gnu.wildebeest.org [45.83.234.184])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4B4714023C
	for <cti-tac@lists.linuxfoundation.org>; Mon,  4 Nov 2024 10:50:36 +0000 (UTC)
Received: by gnu.wildebeest.org (Postfix, from userid 1000)
	id CFC62303C2A0; Mon,  4 Nov 2024 11:50:33 +0100 (CET)
Date: Mon, 4 Nov 2024 11:50:33 +0100
From: Mark Wielaard <mark@klomp.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: gcc developers <gcc@gcc.gnu.org>,
	glibc developers <libc-alpha@sourceware.org>,
	gdb developers <gdb@sourceware.org>,
	binutils developers <binutils@sourceware.org>,
	Overseers mailing list <overseers@sourceware.org>,
	cti-tac@lists.linuxfoundation.org,
	=?iso-8859-1?B?Wm/r?= Kooyman <zoe@fsf.org>,
	"Karen M. Sandler" <karen@sfconservancy.org>
Subject: Re: Core Toolchain Infrastructure - October 2024 update
Message-ID: <20241104105033.GB25396@gnu.wildebeest.org>
References: <9ee5b9e1-3f84-4d9e-8249-7a4bf8080bb0@redhat.com>
 <20241030103912.GD28606@gnu.wildebeest.org>
 <3a2c2d35-3b86-4286-a393-5ec166659f92@redhat.com>
 <ae8662fd114be6b26300e85173cfcd1068421abf.camel@klomp.org>
 <5691d7c8-f92e-46f3-8edf-c83e085dbfa2@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5691d7c8-f92e-46f3-8edf-c83e085dbfa2@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)

Hi Carlos,

On Wed, Oct 30, 2024 at 12:52:13PM -0400, Carlos O'Donell wrote:
> > We discussed this with OpenSSF and submitted a funding request to
> > OpenSSF Alpha Omega for this particular part. OpenSSF initially was
> > supportive to funding these kinds of security plans, but they have been
> > silent for the last couple of months. If you have contacts to get this
> > going forward again that would be great.
> 
> I do have contacts at the OpenSSF and I'd be glad to help. We just
> met with one of their team members today as part of the CTI TAC
> meeting.

Thanks, I see the OpenSSF General Manager and the Technical Program
Managers have gotten different positions or moved on from OpenSSF. I
added the new contacts to reach out to.

> > Yes, please file bugzilla reports against the Sourceware
> > Infrastructure project:
> > https://sourceware.org/bugzilla/buglist.cgi?product=sourceware&component=Infrastructure
> > Or bring it up on the overseers list or during the Sourceware open
> > office hours. https://sourceware.org/mission.html#organization
> 
> For tracking purposes I'll file them as Sourceware Infrastructure
> bugs and we can go from there.

Thanks, that would be useful input.

> >> My deepest concerns here is that Sourceware PLC cannot convince
> >> larger sponsors to provide the funding to do what needs to be
> >> done to scale out and improve our services.
> > 
> > Thanks for your concern. The whole idea of setting up Sourceware as an
> > organization with Conservancy as a fiscal sponsor is precisely to make
> > these kind of sponsorships easy. And to expand funding to be able to
> > accept community donations and grants:
> > https://sourceware.org/donate.html
> 
> What you have done is make it *possible* for an organization to
> place money at the fiscal sponsor for the mission you've set out,
> and while this is a measure of ease, the hardest step is still to
> come. You need to convince sponsors to donate.

The hardest step and what cost most of the energy was setting up the
organization, the PLC, working out our relationship with our fiscal
sponsor, making sure to get the governance right. And setting rules
for making sure to preserve software freedom and diversify income
sources.

Large monetary donations from corporations are certainly nice, but you
have to make sure the community keeps in control. Having large
corporations dominate the funding is risky, so we are also explicitly
looking at individual donations and grants.

Our largest sponsors provide hardware and services directly instead of
exchanging money. https://sourceware.org/mission.html#sponsors
They are valued partners with who we can discuss community and
services goals. For example about cyber security regulations.

> How have your fund raising activities been going for the Sourceware
> fund at the SFC?

Very well, thanks. See our last yearly report:
https://inbox.sourceware.org/20240529190215.GA26515@gnu.wildebeest.org/
We have been getting more hardware and assistence from our sponsors to
expand our services and are pulling in ~$250,- dollars a month from
individual donations and small grants. We are currently just spending
~5% of that to make sure we are building up enough reserve to be able
to replace any hardeware and services in case one of our regular
sponsors might have to drop out.

Cheers,

Mark
