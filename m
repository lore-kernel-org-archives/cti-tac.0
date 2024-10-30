Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC13C8EB
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 16:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307142; cv=none; b=adtMtRy6uhhyccar4ZVtAfQQelJass3VmFLM4HCe/dZFFcnUaWSCOK8j8dT7oNoilhbN3AoaHbj8gy3z6MLIX5ASjAHQR/ltv9qiyWdwkSYyYo4V56kJ4s73y9yy7o5MT96pQEijpD/DSp5IFyY1Yh5OyXLFUxdWoH30FQHtBDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307142; c=relaxed/simple;
	bh=VHOvznZkpAQ1XYiyVzfYC4zJ1p5LrhcS4s6qdRsUmMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9tXYro5sLJ22+1OTqGakKboqlHuXkfQdqwgo/d92KAGyWhDiw8RXE6OolPZ5JLN519FmpBT6YuGrjSZUwV3GnJekj/sXi6WlgDtuMX9N0umeJ9MBv/w0Aygrhu6QX7DT6wG8knVbOpqXKz+U0xoV3U+nCn044NhZfzLH838LPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RTwPTok1; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RTwPTok1"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F77401EF
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 16:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJPZLr2TM2wj for <cti-tac@lists.linuxfoundation.org>;
 Wed, 30 Oct 2024 16:52:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 34B004011B
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34B004011B
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RTwPTok1
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 34B004011B
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 16:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730307137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NfV/9uELHfT5+ze67OXmo20DJJDpDvvKqCuKw6FlBTs=;
	b=RTwPTok1pJQxwxgHuLHgqZqBUF5/Ar0DTmjUrCoB7pczTujhonoze1MQeXbT74UzlQm3lp
	BpcWf4hKR6GLyfzgA+fjkuGa7HPJdeXGCl9xY69YFQrrhkv3edHNyQfDDwCOrpX3SHd0bb
	2AWgzeWb54e+k6v3+lJekOzTM5iXXro=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-cvhdilfpOdW0xkv7o7mguw-1; Wed, 30 Oct 2024 12:52:16 -0400
X-MC-Unique: cvhdilfpOdW0xkv7o7mguw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6cbe933e877so939836d6.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Oct 2024 09:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307136; x=1730911936;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfV/9uELHfT5+ze67OXmo20DJJDpDvvKqCuKw6FlBTs=;
        b=aqUNfErij/qULwoD2MzAv3V+CkC4C4T+kCQLdAJvjiO0yQCEC2JY2cKbIi23etHyDN
         jVHZmjtiCdOniyOzIF5hFdfW1GCgdLmugYS7MDq746CgscGfVwe9lQsKSbMKGY/2V9NV
         glh2lig8An7Kt4WPNFzj5xdSWxSRpqiceB+pDPENNvlPHBIHAzOhy7mqlYzYU3hJqaSi
         pXccB7iJ10GaeHXHW+7gfOLdwj0pDYjh5rDzmaoGujHEIlzLlz9IlaNiJAWLzAgiP5q4
         XNR52OHwApLkLV1FsMjcBX+2b6fNqRlIHFhqzDuc8uBcUWVG6IfeZ4zPVvbIBqT3wL6d
         uDIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlY1BTDVLzOovaz1+QrV4rPoWryFW1i8nbhQi+gEopu8GRRhjCa/mdIoC06IjOt5kQZweIEPCC@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzAsURrRQuDsRzjFFHlQ6UWf13ahfg/F+l0x6MpkMpoRxuj592t
	qHzXmLm+K5czkQ1OEZG4T76VGPLNeSmzX7DIRRImM8CjDCEU3rPFCVh1/kI4fLxe5mFqiyiVyrP
	/r/izsCawZoHcG4QCKSMzgBSL4temLyv3s0fTXgLQGULHDTr9ZoaTE8x7Hiq1lJ3jPbCV
X-Received: by 2002:a05:6214:43ca:b0:6ce:2651:f3b1 with SMTP id 6a1803df08f44-6d1858412b6mr243865566d6.41.1730307135978;
        Wed, 30 Oct 2024 09:52:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdrg4r3m4ke93xr955K5oRmrYre+tGnBsnogIB7YPq1FgIdwooUPTx2J4YOwDYmn1Ts53eBA==
X-Received: by 2002:a05:6214:43ca:b0:6ce:2651:f3b1 with SMTP id 6a1803df08f44-6d1858412b6mr243865336d6.41.1730307135609;
        Wed, 30 Oct 2024 09:52:15 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d179a2fd62sm53370936d6.131.2024.10.30.09.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 09:52:15 -0700 (PDT)
Message-ID: <5691d7c8-f92e-46f3-8edf-c83e085dbfa2@redhat.com>
Date: Wed, 30 Oct 2024 12:52:13 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Core Toolchain Infrastructure - October 2024 update
To: Mark Wielaard <mark@klomp.org>
Cc: gcc developers <gcc@gcc.gnu.org>,
 glibc developers <libc-alpha@sourceware.org>,
 gdb developers <gdb@sourceware.org>,
 binutils developers <binutils@sourceware.org>,
 Overseers mailing list <overseers@sourceware.org>,
 cti-tac@lists.linuxfoundation.org, =?UTF-8?Q?Zo=C3=AB_Kooyman?=
 <zoe@fsf.org>, "Karen M. Sandler" <karen@sfconservancy.org>
References: <9ee5b9e1-3f84-4d9e-8249-7a4bf8080bb0@redhat.com>
 <20241030103912.GD28606@gnu.wildebeest.org>
 <3a2c2d35-3b86-4286-a393-5ec166659f92@redhat.com>
 <ae8662fd114be6b26300e85173cfcd1068421abf.camel@klomp.org>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 xsFNBFef5BoBEACvJ15QMMZh4stKHbz0rs78XsOdxuug37dumTx6ngrDCwZ61k7nHQ+uxLuo
 QvLSc6YJGBEfiNFbs1hvhRFNR7xJbzRYmin7kJZZ/06fH2cgTkQhN0mRBP8KsKKT+7SvvBL7
 85ZfAhArWf5m5Tl0CktZ8yoG8g9dM4SgdvdSdzZUaWBVHc6TjdAb9YEQ1/jpyfHsQp+PWLuQ
 ZI8nZUm+I3IBDLkbbuJVQklKzpT1b8yxVSsHCyIPFRqDDUjPL5G4WnUVy529OzfrciBvHdxG
 sYYDV8FX7fv6V/S3eL6qmZbObivIbLD2NbeDqw6vNpr+aehEwgwNbMVuVfH1PVHJV8Qkgxg4
 PqPgQC7GbIhxxYroGbLJCQ41j25M+oqCO/XW/FUu/9x0vY5w0RsZFhlmSP5lBDcaiy3SUgp3
 MSTePGuxpPlLVMePxKvabSS7EErLKlrAEmDgnUYYdPqGCefA+5N9Rn2JPfP7SoQEp2pHhEyM
 6Xg9x7TJ+JNuDowQCgwussmeDt2ZUeMl3s1f6/XePfTd3l8c8Yn5Fc8reRa28dFANU6oXiZf
 7/h3iQXPg81BsLMJK3aA/nyajRrNxL8dHIx7BjKX0/gxpOozlUHZHl73KhAvrBRaqLrr2tIP
 LkKrf3d7wdz4llg4NAGIU4ERdTTne1QAwS6x2tNa9GO9tXGPawARAQABzSpDYXJsb3MgTydE
 b25lbGwgKFdvcmspIDxjYXJsb3NAcmVkaGF0LmNvbT7CwZUEEwEIAD8CGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEEcnNUKzmWLfeymZMUFnkrTqJTQPgFAmagDwgFCRDhXm4ACgkQ
 FnkrTqJTQPgLlw/+JD7l4tj8l8hAMUlszrlIT6IhKSODzjrGO+6d9Y6T9vyE2kk4Xbn+kdJf
 uBl+wj2+U15MsQe9Z4RwowIB3YHHXgj53M2OjqOAY/sRWXZVDfmVj03hqW8D7zFxjc0SZ9cI
 TI0MwrDWc+Fr3naXeo7HhgjUmULfPndxb8NHVV4Ds2DTkZoUMwB8l3dboD+nKi5GbfVBf3Q5
 cBw0CPkxPl0hxD9sr5IMgWIKVLtvztMIXv2xWAavqk8pQjk0zCYd46GcA8d9pZuac24e9NbM
 ZzTxu6cP0sKhub1JFIadyBHtJnEV/8Auc8nXJ63QY3h0QVCJYV35gQeejEdMD94in2XTkxk0
 A/xCp32bmSZv5flsmdAIv5LK4jTKLvzd6BSy/v7qlpgQ7sNaxQ/JRd+8YuBIiUVIp/kgGezD
 qtGZSpvPCFuG3LxsdvAu7JAzBY3sfBd2lSGOeHX/JK0nQ6s97j4HlSuXIabSOdsCI5UGSOq5
 thbIqfK3ewUSUB0yGvWf7EyuZugtCZOaFGpvcT3ix9/sP1fTRlJl+bNjMcO8GwedDoy85oeg
 yLCEV9gejCr+NijLfPYtb1s8o0hYu13uBojFyBv+bkUI5hTQaVLacq7VglA/QLOy/3mtM2v5
 4OEotiNXbKypHFKnoks/MFpP4xdwxGX5jU4MgFg80aPFGr0oZVXOwU0EV5/kGgEQAKvTJke+
 QSjATmz11ALKle/SSEpUwL5QOpt3xomEATcYAamww0HADfGTKdUR+aWgOK3vqu6Sicr1zbuZ
 jHCs2GaIgRoqh1HKVgCmaJYjizvidHluqrox6qqc9PG0bWb0f5xGQw+X2z+bEinzv4qaep1G
 1OuYgvG49OpHTgZMiJq9ncHCxkD2VEJKgMywGJ4Agdl+NWVn0T7w6J+/5QmBIE8hh4NzpYfr
 xzWCJ9iZ3skG4zBGB4YEacc3+oeEoybc10h6tqhQNrtIiSRJH+SUJvOiNH8oMXPLAjfFVy3d
 4BOgyxJhE0UhmQIQHMJxCBw81fQD10d0dcru0rAIEldEpt2UXqOr0rOALDievMF/2BKQiOA7
 PbMC3/dwuNHDlClQzdjil8O7UsIgf3IMFaIbQoUEvjlgf5cm9a94gWABcfI1xadAq9vcIB5v
 +9fM71xDgdELnZThTd8LByrG99ExVMcG2PZYXJllVDQDZqYA1PjD9e0yHq5whJi3BrZgwDaL
 5vYZEb1EMyH+BQLO3Zw/Caj8W6mooGHgNveRQ1g9FYn3NUp7UvS22Zt/KW4pCpbgkQZefxup
 KO6QVNwwggV44cTQ37z5onGbNPD8+2k2mmC0OEtGBkj+VH39tRk+uLOcuXlGNSVk3xOyxni0
 Nk9M0GvTvPKoah9gkvL/+AofN/31ABEBAAHCwXwEGAEIACYCGwwWIQRyc1QrOZYt97KZkxQW
 eStOolNA+AUCZqAPEAUJEOFedgAKCRAWeStOolNA+D38D/9WnZY9fUmPhZVwpDnhIXvlXgqX
 cspZJEBWNS5ArFn8CLcje7z9hzX3+86lqkEeohTmlgtTg4ctZzM+XKyWSiqHCRCR+FX5SKaa
 1VveBtwvjTSVmtV1m0rNHEvUZ5x47A8NadWqYi6uOQ22FhEqUOiwJ7EHzk4w9W3gT1913XT1
 vmkCn6FtQcrQvJT7pP+oA0YIVs8ADayJcqWHM+Ez7L2fpfAzBDhIS7dq2MYU8LQOQAsx1y7H
 6njp5dN/OI/aN/RL6XeX1Kxl4Xe+hc+tq457fLAUnmaevUldvKThuj+5/Cd4DW25MxaqinfY
 m/U6pBQ4ZwQPGWA0f+GKiJcLosSRXxIuEdZAl82ht+KgT3zhV/BvQRmrD6wX3ywPkJap8h4K
 ibwz3r6NbHKdCX22ok58oE8NAWtmTRTKXDhh8oWOKdIYjX6jJzdb/F8rPNoEY3UiYbaNTxt5
 TE9VD+yWilYO796HMXjXenCOlghy3HFmZbsQ4N+FlG6LQD7cnwm56kcrJk1IlnQXOSOd2BA2
 qNbM1Ohry3B+1F4Oaee+ZKH2C5y7Kx0y3m1b5X7Wpx76H5BeUAp6dQi6nNYeqM9PglZIMvSe
 O4uRThl5mMDx8MXQz6M9qQ5anYwre+/TudTfCzcTpgXod1wEqi2ErJ5jNgh18DRlSQ3tbDvG
 O0FatDMfJw==
Organization: Red Hat
In-Reply-To: <ae8662fd114be6b26300e85173cfcd1068421abf.camel@klomp.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/24 11:45 AM, Mark Wielaard wrote:
> Hi Carlos,
> 
> On Wed, 2024-10-30 at 08:32 -0400, Carlos O'Donell wrote:
>> I can get down to specific requirements and possible solutions for them, including
>> things like securing logins with 2FA etc. Which *could* be solved by Sourceware
>> today possibly using Nitrokeys (open hardware and FOSS), for example.
> 
> Yes, a nitrokey distribution scheme is part of the Secure Sourceware
> Project Goals: https://sourceware.org/sourceware-security-vision.html

Have you broken down those project goals into actionable steps that could be taken?

For example filing Sourceware Infrastructure bugs for each service that needs to be
migrated into a VM and isolated (with a top level tracker for "Increased isolation")?

If you're going to ask for funding, having a list of concrete goals the funding
will solve, broken down to the level at which you can write an SOW, is very very
beneficial.
 
> We discussed this with OpenSSF and submitted a funding request to
> OpenSSF Alpha Omega for this particular part. OpenSSF initially was
> supportive to funding these kinds of security plans, but they have been
> silent for the last couple of months. If you have contacts to get this
> going forward again that would be great.

I do have contacts at the OpenSSF and I'd be glad to help. We just met with one of
their team members today as part of the CTI TAC meeting.

Do you have your funding request anywhere that I can read it?

>> Having all the details spelled out would allow Sourceware to make progress on the
>> same issues raised, and I can even file infrastructure bugs if that helps.
> 
> Yes, please file bugzilla reports against the Sourceware Infrastructure
> project:
> https://sourceware.org/bugzilla/buglist.cgi?product=sourceware&component=Infrastructure
> Or bring it up on the overseers list or during the Sourceware open
> office hours. https://sourceware.org/mission.html#organization

For tracking purposes I'll file them as Sourceware Infrastructure bugs and
we can go from there.

>> My deepest concerns here is that Sourceware PLC cannot convince larger sponsors
>> to provide the funding to do what needs to be done to scale out and improve our
>> services.
> 
> Thanks for your concern. The whole idea of setting up Sourceware as an
> organization with Conservancy as a fiscal sponsor is precisely to make
> these kind of sponsorships easy. And to expand funding to be able to
> accept community donations and grants:
> https://sourceware.org/donate.html

What you have done is make it *possible* for an organization to place money at the
fiscal sponsor for the mission you've set out, and while this is a measure of ease,
the hardest step is still to come. You need to convince sponsors to donate.

David, Joel and I have been the trustees of the GNU Toolchain Fund since we worked
with the FSF to set it up in 2017. Since then the hardest step is getting larger
sponsors to support.

How have your fund raising activities been going for the Sourceware fund at the SFC?

Have you allocated and spent any of that funding to move the project goals forward?
 
>> I'm excited that the GNU Toolchain community is looking at different workflows and
>> solutions, but if I'm honest the same question of funding and service/workload
>> isolation applies.
>>
>> I'm *more* excited to pay Codeberg directly to support the GNU Toolchain to support
>> the development of Forgejo, particularly given that larger groups like Fedora are
>> considering Forgejo.
> 
> Yes, we did already discuss this. But it is too early for that. Richard
> setup a wiki page for the Forge Experiment that includes a list of
> various bugs/issues in Forgejo that we would like to see resolved
> before we can call the experiment an success.
> https://gcc.gnu.org/wiki/ForgeExperiment
> When we are a bit further into the experiment to know which ones are
> real blockers, we could fund the work to get those done.

Yes, I agree we're too early.

Fedora has commented publicly that Codeberg's informal position was that they
probably did not have the capacity to host a project of Fedora's size.

https://discussion.fedoraproject.org/t/a-vote-in-favor-of-forgejo/112059/5

-- 
Cheers,
Carlos.

