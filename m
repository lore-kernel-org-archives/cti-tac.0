Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5256B1E285C
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 10:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730285247; cv=none; b=NLW1fHP5b+oz6s8aGuDqR+cJUWDy2MNKobQdYaN9tSWRVRA6nOSP4Lpe85gJ5Tey2SiDhlZ63F5pHLQW4Fra+0+qIkvTJ2HCev8d9w+Hhfino+CXd03pC45FOKuU+KXLznEO0P8MyzM8vOgquuRXzXuLef78EMFaqrNvTIzWEdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730285247; c=relaxed/simple;
	bh=LJ8/Io889Y47uG3P7HPzFZWahv+ornG5+uondfSk5UI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqxj3VI3KWh3He6aSbPFrsPzsJG+0EuUKC7CigyAnu+euAclbH3fXM1WgcE7xVaiUXXmduZGANohjO7+QMVXp9sJDierpQKoNH3VcO3JrlENwaOCODikynTkz/5g6/ErR6U62e6Gbib5oQtb0RCsvrsSkZ3IsnFkHr0u6easL9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D647280B80
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 10:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.591
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IDD9RhHo5Rb4 for <cti-tac@lists.linuxfoundation.org>;
 Wed, 30 Oct 2024 10:47:24 +0000 (UTC)
X-Greylist: delayed 487 seconds by postgrey-1.37 at util1.osuosl.org; Wed, 30 Oct 2024 10:47:22 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B77F80B0C
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=klomp.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B77F80B0C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.83.234.184; helo=gnu.wildebeest.org; envelope-from=mark@klomp.org; receiver=<UNKNOWN> 
Received: from gnu.wildebeest.org (gnu.wildebeest.org [45.83.234.184])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3B77F80B0C
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 10:47:22 +0000 (UTC)
Received: by gnu.wildebeest.org (Postfix, from userid 1000)
	id 541E9303AA0D; Wed, 30 Oct 2024 11:39:12 +0100 (CET)
Date: Wed, 30 Oct 2024 11:39:12 +0100
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
Message-ID: <20241030103912.GD28606@gnu.wildebeest.org>
References: <9ee5b9e1-3f84-4d9e-8249-7a4bf8080bb0@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ee5b9e1-3f84-4d9e-8249-7a4bf8080bb0@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)

Hi Carlos,

On Tue, Oct 29, 2024 at 06:02:03PM -0400, Carlos O'Donell via Gcc wrote:
> Recent discussions on the glibc mailing list make it clear
> that we need to expand and discuss more about our "why" along with
> the "what" and "how" of these changes.

Zoe wrote a good summary of that discussion back in July:
https://inbox.sourceware.org/f20ce996-e9c6-4b6c-856d-eec6e14af26e@fsf.org/
Has anything changed since then to address the issues raised by her
and others?

I don't believe the community is helped by trying to set up yet
another, corporate controlled, organization or doing some highly
disruptive move of some parts of the services our projects are using.

A couple of years ago we spend the time and energy to setup Sourceware
as an organization that provides free infrastructure for our free
software projects. And made sure to work out our relationship with our
fiscal sponsor: https://sourceware.org/Conservancy-Sourceware-FSA.pdf
https://sfconservancy.org/projects/policies/conflict-of-interest-policy.html

We have a generic mission to provide core toolchain and developer
tools project with free software infrastructure:
https://sourceware.org/mission.html

The history and general roadmap for the next 25 years are descriped at
https://sourceware.org/sourceware-25-roadmap.html

And a specific roadmap and projects for state of the art sustainable
secure and robust services, the Secure Sourceware Project Goals, are
described in https://sourceware.org/sourceware-security-vision.html

I noticed you attended the Infrastructure BoF at the Cauldron and seem
to be experimenting with the new Forge we setup. I hope you will be
happy to work with the existing community and the existing
organizations that support the GNU toolchain and the Sourceware
infrastructure, instead of trying to setup yet another organization
that would split our efforts.

Cheers,

Mark
