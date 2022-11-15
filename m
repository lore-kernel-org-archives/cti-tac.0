Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69F22F28
	for <gti-tac@lists.linuxfoundation.org>; Tue, 15 Nov 2022 20:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48A6E41583
	for <gti-tac@lists.linuxfoundation.org>; Tue, 15 Nov 2022 20:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48A6E41583
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=adacore.com header.i=@adacore.com header.a=rsa-sha256 header.s=google header.b=BcY61ktu
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YXxeiMsOmySc for <gti-tac@lists.linuxfoundation.org>;
	Tue, 15 Nov 2022 20:25:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC6B840400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CC6B840400
	for <gti-tac@lists.linuxfoundation.org>; Tue, 15 Nov 2022 20:25:13 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so17964230pjc.3
        for <gti-tac@lists.linuxfoundation.org>; Tue, 15 Nov 2022 12:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adacore.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lnBXu5Bfbqh/DAhVbZ6VZkgroCOnmg1xJXP6HGYAqik=;
        b=BcY61ktuIpUgPpo3zlshXuknS3pfLYfff2kGKlqlGlSBOZN/TspLF0BA3HuqxVjgZW
         QlwLwNZNKVbaQ2E+4GVf9XmZbmpszCD5/ZlpjscAM9m7DvpsNjt+ShD06lzTHn2oc1mI
         sEqkneWfeXyQq9FEaesinMSkyZuSw44vhPAhwelfDnjJfmExasjYA7GdYLtb8CI/7EY7
         wLN3i+37lmwMoVVjYh/9oZrBlGa3KCDgC0BGkXCv43KCBf8sFzB9CjO5S2KWlg4qDSV1
         aW5+GYN7kDNFVVmTCZEo2QdZ9qpYhy+XldqH8ZOyTIRbt88YhgRBThK221U7CXq0TxAX
         Yjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnBXu5Bfbqh/DAhVbZ6VZkgroCOnmg1xJXP6HGYAqik=;
        b=BRr8crXeXuBvg/imtEMUL0bCDc9beGPwOl/LSnfo9uGefnq2zYVeW/pXbZoUJhegfE
         C+39HcfNCDCEFsI/mifm5GTdDCZaAU4+cqLmElE0uUe36S2V7QIEc8EyLikqrqAmBSC5
         no4YnXxbEN4GT0o3nEMcP4efwtLduGWqgoWU5k/9936Fyil+RyT+gba9C1XBMhDXai6B
         x8hy6reCTozrXXeLgjVebMPAsCT8+oYyTDqWMnuUhfiMtxPkOzd+knPpru0lSoAGocHx
         u0fcx1HnaSvh3fKGvAnV6JqZDHdwVuAP8D3rF5Q2MOwmR+yY77AF5OejRJ1YTqfb39AF
         e+DA==
X-Gm-Message-State: ANoB5pmy03i+y5FuzzF/v5+v1vgubzBYhU+gr0g2J9QzNxcOTJfx8rmc
	RrOKKE2SsDSt4OiczfEdW/05
X-Google-Smtp-Source: AA0mqf4L9+4bgk+GvShwItsq1/vP68C7Rp6jsIyCgahJ/M+ys9pplUZ7ZbwocoiNfokDnH4WHfTWuw==
X-Received: by 2002:a17:902:b48e:b0:186:e114:bea6 with SMTP id y14-20020a170902b48e00b00186e114bea6mr5713259plr.88.1668543912786;
        Tue, 15 Nov 2022 12:25:12 -0800 (PST)
Received: from takamaka.gnat.com ([184.69.131.86])
        by smtp.gmail.com with ESMTPSA id w26-20020aa79a1a000000b0056c2e497b02sm9479681pfj.173.2022.11.15.12.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 12:25:12 -0800 (PST)
Received: by takamaka.gnat.com (Postfix, from userid 1000)
	id 93D9580B46; Tue, 15 Nov 2022 12:25:11 -0800 (PST)
Date: Tue, 15 Nov 2022 12:25:11 -0800
From: Joel Brobecker <brobecker@adacore.com>
To: Carlos O'Donell <carlos@redhat.com>
Cc: Joseph Myers <joseph@codesourcery.com>,
	gti-tac@lists.linuxfoundation.org,
	Joel Brobecker <brobecker@adacore.com>
Subject: Re: Action: Setup working group for the GNU Toolchain proposal to
 migrate to LF IT managed services
Message-ID: <Y3P1p4thdlOLES9l@adacore.com>
References: <3a81d482-c952-d501-f495-485f00400e85@redhat.com>
 <d8eabe-31ec-873d-7893-915e6d2fd6e@codesourcery.com>
 <ce1a98c9-a512-855d-3ad2-53ae69e0847e@redhat.com>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce1a98c9-a512-855d-3ad2-53ae69e0847e@redhat.com>

Hi everyone,

> >> - Seek volunteers. Please respond to this email if you want to volunteer
> >>   to be on the "LF IT managed services" working group and help enumerate
> >>   services.
> > 
> > I'll volunteer to be on it, but, as noted at the meeting, I don't expect 
> > to do much on the enumeration before January.
> > 
> 
> I will also volunteer to be on it, and I can start documenting right
> away for all the services I know glibc needs.

I can help with the GDB side of things. I don't know if I know all
of them, but I know some, at least.

-- 
Joel
