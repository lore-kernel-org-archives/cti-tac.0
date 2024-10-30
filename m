Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE27A1DFD1
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 15:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730303122; cv=none; b=fzO0YIc+fiUX1rnugP8qTJYm9kCiKEu8bxfEjm4fvOBfF/axy1MszILcV7/tkoKeRqIP1UJGWsqKyyAUMZoz9HmkhXBJvfWARgmhIOLzE8Gb0URoXSqYIU19oUql3yxAY8EMet07OejYBxZu2XO9qk0DKxwu6FjfQGOMqSZ+V0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730303122; c=relaxed/simple;
	bh=k8wzKaTcggOcc0FQ02sI41wdw2tQVskdWbS1TZEw1TQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XuEZnPdDW5SmDRveT5vqAP8Tfz39GM4m1AUy/JSLNUy4rbg+l8j7zlNjNdIj2r0oGhzlvxY3bmu/QCknced7sXHC9NadOS9Fnh7ZipMQAKqTyarFv44kdbOszxS6EghbJHZzewE4Scvu6a9EiY/O3yIyexuDblVDJ83OO0vITlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C0A180E0D
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 15:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.591
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJyC6shMKS8u for <cti-tac@lists.linuxfoundation.org>;
 Wed, 30 Oct 2024 15:45:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.83.234.184; helo=gnu.wildebeest.org; envelope-from=mark@klomp.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9EB4580AB0
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=klomp.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EB4580AB0
Received: from gnu.wildebeest.org (gnu.wildebeest.org [45.83.234.184])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9EB4580AB0
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 15:45:15 +0000 (UTC)
Received: from r6.localdomain (82-217-174-174.cable.dynamic.v4.ziggo.nl [82.217.174.174])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gnu.wildebeest.org (Postfix) with ESMTPSA id 35D973032F85;
	Wed, 30 Oct 2024 16:45:12 +0100 (CET)
Received: by r6.localdomain (Postfix, from userid 1000)
	id DB32D3403A8; Wed, 30 Oct 2024 16:45:11 +0100 (CET)
Message-ID: <ae8662fd114be6b26300e85173cfcd1068421abf.camel@klomp.org>
Subject: Re: Core Toolchain Infrastructure - October 2024 update
From: Mark Wielaard <mark@klomp.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: gcc developers <gcc@gcc.gnu.org>, glibc developers
 <libc-alpha@sourceware.org>, gdb developers <gdb@sourceware.org>, binutils
 developers <binutils@sourceware.org>, Overseers mailing list
 <overseers@sourceware.org>,  cti-tac@lists.linuxfoundation.org,
 =?ISO-8859-1?Q?Zo=EB?= Kooyman <zoe@fsf.org>,  "Karen M. Sandler"
 <karen@sfconservancy.org>
Date: Wed, 30 Oct 2024 16:45:11 +0100
In-Reply-To: <3a2c2d35-3b86-4286-a393-5ec166659f92@redhat.com>
References: <9ee5b9e1-3f84-4d9e-8249-7a4bf8080bb0@redhat.com>
	 <20241030103912.GD28606@gnu.wildebeest.org>
	 <3a2c2d35-3b86-4286-a393-5ec166659f92@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0

Hi Carlos,

On Wed, 2024-10-30 at 08:32 -0400, Carlos O'Donell wrote:
> I can get down to specific requirements and possible solutions for them, =
including
> things like securing logins with 2FA etc. Which *could* be solved by Sour=
ceware
> today possibly using Nitrokeys (open hardware and FOSS), for example.

Yes, a nitrokey distribution scheme is part of the Secure Sourceware
Project Goals: https://sourceware.org/sourceware-security-vision.html

We discussed this with OpenSSF and submitted a funding request to
OpenSSF Alpha Omega for this particular part. OpenSSF initially was
supportive to funding these kinds of security plans, but they have been
silent for the last couple of months. If you have contacts to get this
going forward again that would be great.

> Having all the details spelled out would allow Sourceware to make progres=
s on the
> same issues raised, and I can even file infrastructure bugs if that helps=
.

Yes, please file bugzilla reports against the Sourceware Infrastructure
project:
https://sourceware.org/bugzilla/buglist.cgi?product=3Dsourceware&component=
=3DInfrastructure
Or bring it up on the overseers list or during the Sourceware open
office hours. https://sourceware.org/mission.html#organization

> My deepest concerns here is that Sourceware PLC cannot convince larger sp=
onsors
> to provide the funding to do what needs to be done to scale out and impro=
ve our
> services.

Thanks for your concern. The whole idea of setting up Sourceware as an
organization with Conservancy as a fiscal sponsor is precisely to make
these kind of sponsorships easy. And to expand funding to be able to
accept community donations and grants:
https://sourceware.org/donate.html


> I'm excited that the GNU Toolchain community is looking at different work=
flows and
> solutions, but if I'm honest the same question of funding and service/wor=
kload
> isolation applies.
>=20
> I'm *more* excited to pay Codeberg directly to support the GNU Toolchain =
to support
> the development of Forgejo, particularly given that larger groups like Fe=
dora are
> considering Forgejo.

Yes, we did already discuss this. But it is too early for that. Richard
setup a wiki page for the Forge Experiment that includes a list of
various bugs/issues in Forgejo that we would like to see resolved
before we can call the experiment an success.
https://gcc.gnu.org/wiki/ForgeExperiment
When we are a bit further into the experiment to know which ones are
real blockers, we could fund the work to get those done.

Cheers,

Mark
