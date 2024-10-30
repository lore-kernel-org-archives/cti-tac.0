Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3030326296
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 16:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730305817; cv=none; b=V581iCMttVOUOegskGR7NM8gXb5PK/SWjIVqIJoi1Wj0q2tDmr3tPeUt3TBm/PNeV5R72o1bBj688i814pAsATm3YCjjFz/0uj3l9Ng+FVxXeYkP4wAJJL8IEP9+5e6GR0E75ZiY3OTetk7iLA2TPLsoQDPz+ItY+hr/R7GHT18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730305817; c=relaxed/simple;
	bh=RDmljZfe5nBAfF6x/hhBtiiTrlhRIMUn5NPsPgbwmro=;
	h=MIME-Version:Content-Type:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID; b=nVZfLXMhFzh4xFgkqQeRZOqKTq8XES7AVfAhBmGrqvpf5+W+yCBHMe3J47ed4IRD/An+dHZ33R1SmKRZtOtjyaKeJz74Wk6ZrhIaNBr3MI+PGT9vMz1MEi9mbD4aF+3+bJnza/FlBtXbhE8pjx28AgxFU440UGoKj64H9s+w2Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sfconservancy.org header.i=@sfconservancy.org header.b=H9OGiqBW; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sfconservancy.org header.i=@sfconservancy.org header.b="H9OGiqBW"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBB7C401CD
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 16:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZWkAEwtK6K9 for <cti-tac@lists.linuxfoundation.org>;
 Wed, 30 Oct 2024 16:30:13 +0000 (UTC)
X-Greylist: delayed 431 seconds by postgrey-1.37 at util1.osuosl.org; Wed, 30 Oct 2024 16:30:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2827A4014C
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=sfconservancy.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2827A4014C
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=sfconservancy.org header.i=@sfconservancy.org header.a=rsa-sha256 header.s=pine header.b=H9OGiqBW
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=192.237.253.17; helo=pine.sfconservancy.org; envelope-from=karen@sfconservancy.org; receiver=<UNKNOWN> 
Received: from pine.sfconservancy.org (pine.sfconservancy.org [192.237.253.17])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2827A4014C
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 16:30:13 +0000 (UTC)
Received: from mail.sfconservancy.org (unknown [192.237.253.17])
	(Authenticated sender: karen)
	by pine.sfconservancy.org (Postfix) with ESMTPSA id 9FBF1E709;
	Wed, 30 Oct 2024 16:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sfconservancy.org;
	s=pine; t=1730305381;
	bh=RDmljZfe5nBAfF6x/hhBtiiTrlhRIMUn5NPsPgbwmro=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H9OGiqBWbtuTR/oLKUwSMpXZNgWrybHZVMwoJGPnLym9gQ0vapD/jpG9GUohCRUZt
	 lByyOG6T3+z9ypJH5nbhEj2db11COwQ3xf4EdpvnYFZKm4009kR6KKejQa+CTC0vHE
	 Bw24Eo0KHSZ2HZ12MzcJEUQB3E3eJZ8mbgOj1Bzo04cWsVAes9WU73ijGcnZ7mQXdT
	 zc7oYwSLCyIIapSnQ8RZ6H3Ka14P8GgBgsqOsnbYP7ZXqYV9kfF8BHdVq6YY1B2JVY
	 a6M2QUGUqgFgHkuLC+eZkqCBkpjWJISpVjluq23xnpy36tsK7QqSrrsDJ4P+BmDNPR
	 ErayCH5ZGqyZQ==
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 30 Oct 2024 12:23:00 -0400
From: "Karen M. Sandler" <karen@sfconservancy.org>
To: Mark Wielaard <mark@klomp.org>
Cc: Carlos O'Donell <carlos@redhat.com>, gcc developers <gcc@gcc.gnu.org>,
 glibc developers <libc-alpha@sourceware.org>, gdb developers
 <gdb@sourceware.org>, binutils developers <binutils@sourceware.org>,
 Overseers mailing list <overseers@sourceware.org>,
 cti-tac@lists.linuxfoundation.org, =?UTF-8?Q?Zo=C3=AB_Kooyman?=
 <zoe@fsf.org>
Subject: Re: Core Toolchain Infrastructure - October 2024 update
In-Reply-To: <ae8662fd114be6b26300e85173cfcd1068421abf.camel@klomp.org>
References: <9ee5b9e1-3f84-4d9e-8249-7a4bf8080bb0@redhat.com>
 <20241030103912.GD28606@gnu.wildebeest.org>
 <3a2c2d35-3b86-4286-a393-5ec166659f92@redhat.com>
 <ae8662fd114be6b26300e85173cfcd1068421abf.camel@klomp.org>
Message-ID: <89da0eac930620feb31b97083714e858@sfconservancy.org>
X-Sender: karen@sfconservancy.org
User-Agent: Roundcube Webmail/1.2.3

On 2024-10-30 11:45, Mark Wielaard wrote:
> Hi Carlos,
> 
> On Wed, 2024-10-30 at 08:32 -0400, Carlos O'Donell wrote:
>> I can get down to specific requirements and possible solutions for 
>> them, including
>> things like securing logins with 2FA etc. Which *could* be solved by 
>> Sourceware
>> today possibly using Nitrokeys (open hardware and FOSS), for example.
> 
> Yes, a nitrokey distribution scheme is part of the Secure Sourceware
> Project Goals: https://sourceware.org/sourceware-security-vision.html
> 
> We discussed this with OpenSSF and submitted a funding request to
> OpenSSF Alpha Omega for this particular part. OpenSSF initially was
> supportive to funding these kinds of security plans, but they have been
> silent for the last couple of months. If you have contacts to get this
> going forward again that would be great.
> 
>> Having all the details spelled out would allow Sourceware to make 
>> progress on the
>> same issues raised, and I can even file infrastructure bugs if that 
>> helps.
> 
> Yes, please file bugzilla reports against the Sourceware Infrastructure
> project:
> https://sourceware.org/bugzilla/buglist.cgi?product=sourceware&component=Infrastructure
> Or bring it up on the overseers list or during the Sourceware open
> office hours. https://sourceware.org/mission.html#organization
> 
>> My deepest concerns here is that Sourceware PLC cannot convince larger 
>> sponsors
>> to provide the funding to do what needs to be done to scale out and 
>> improve our
>> services.
> 
> Thanks for your concern. The whole idea of setting up Sourceware as an
> organization with Conservancy as a fiscal sponsor is precisely to make
> these kind of sponsorships easy. And to expand funding to be able to
> accept community donations and grants:
> https://sourceware.org/donate.html

Yes, SFC is already set up to receive donations from most of the large 
companies that are consistent funders in this space (we're registered in 
their vendor systems). Similarly, we regularly have fundraising meetings 
with them across our member projects. If you have a particular lead or 
suggestion for Sourceware, please let me/us know and we'll follow up!

karen



> 
> 
>> I'm excited that the GNU Toolchain community is looking at different 
>> workflows and
>> solutions, but if I'm honest the same question of funding and 
>> service/workload
>> isolation applies.
>> 
>> I'm *more* excited to pay Codeberg directly to support the GNU 
>> Toolchain to support
>> the development of Forgejo, particularly given that larger groups like 
>> Fedora are
>> considering Forgejo.
> 
> Yes, we did already discuss this. But it is too early for that. Richard
> setup a wiki page for the Forge Experiment that includes a list of
> various bugs/issues in Forgejo that we would like to see resolved
> before we can call the experiment an success.
> https://gcc.gnu.org/wiki/ForgeExperiment
> When we are a bit further into the experiment to know which ones are
> real blockers, we could fund the work to get those done.
> 
> Cheers,
> 
> Mark
