Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914FA15FA74
	for <cti-tac@lists.linuxfoundation.org>; Thu,  2 May 2024 19:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714678075; cv=none; b=g7NLqZP3FJW8AqP2MsrKmOTc2urDEHUNR1MZQ6O1MYeSLrvJKK1m5aqz3IF6Pdl6x+o/GQL8JEr81TPZY3Rw7qe9YaofvRtOdEWSfPpX/hjz237caez6CxhezEqKUuZ/YVUBPlBlMwd2oEiJ62pQYvtCjQ90DKPQ6SC9ZrFd13c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714678075; c=relaxed/simple;
	bh=crGmjOCxthSH9uUjayoOoZRvULBY54m7ZpOIpntnKDk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gE8y2WKGSbOIUX5vtbLadqPRxxLF8ZD1v02VAUlAZpW5Ml+WCQlThYdr+pFgR0jRlrlefU0AoKid/g5lzHZynG44b8XkSsnmCsqF2hoQIHPvDOc8bJ/yIY1Ea/CGW10ohIO7AqxpdtM9E+jlDz0NpChyVtbfpXj+5rWy8MmyTjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ForreDGx; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ForreDGx"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 477694183C
	for <cti-tac@lists.linuxfoundation.org>; Thu,  2 May 2024 19:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnqLRNy876VS for <cti-tac@lists.linuxfoundation.org>;
 Thu,  2 May 2024 19:27:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=josmyers@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E599C40723
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E599C40723
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ForreDGx
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E599C40723
	for <cti-tac@lists.linuxfoundation.org>; Thu,  2 May 2024 19:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714678070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lZZYb2jGwQzE0q1FlfHl1ZjiOT4vjBFNcqkGYkPyweA=;
	b=ForreDGxNT5R8T9XY1gR64rsEX4SxB7RF9vX4jXjxa8ZY/wRLbbyRxlexTau8HAc2a4p8J
	kqvZa/LVh/6tdQhescb5HZD2Bmc2wQ04BjJt9AWapM3gQyAUckOW+bLFuFJh2QPpmBzez4
	lqx6Kp13sVLpQlHkBwM0x+P2/hoksNw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-oRI5CaXhMR-zStHZF-AXYQ-1; Thu, 02 May 2024 15:27:49 -0400
X-MC-Unique: oRI5CaXhMR-zStHZF-AXYQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-419ec098d81so35781285e9.2
        for <cti-tac@lists.linuxfoundation.org>; Thu, 02 May 2024 12:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714678067; x=1715282867;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lZZYb2jGwQzE0q1FlfHl1ZjiOT4vjBFNcqkGYkPyweA=;
        b=K+v5w85ox07OEhwB5+gEy/SHDj0pKfxe5WtPhYrCcU06XAaQ/lN0Y4bj9EHqBAUzLl
         gW83CL1YEWTjeMrEqqGkQ0OzQHqSChJDubaEefYzX3u7A/VuuOBctog9c+Sq6YmIqNGX
         imo3yArnb+rA6B752UnrIQmYauiMgJd9alegl61MJySOpxXgOHhV4B4oFN+Skh9enblJ
         rvP6jlad9nLeaU5LlPS27QDT3WSPk7GREN6K9d/2EdslvXlMnOC0LjA5W/haE/jZycwq
         Ejs63gEN9O90ojUJ5BYw+3bjxY8bb5YKq8fuIF47c0uyNODtJf8X5IKFjLGGyfHWU4dX
         YI6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFvJFgY2Tc2WK8PTu3ysEbNMVCFcXZo1Lul19uc+UEb+BolG11I8xzbHwZGhcmLyloCqeMOh9pYFZxe/XCAsV6yoasxGnN2InXnooBQu5bdCU=
X-Gm-Message-State: AOJu0Yxx9GBX5xl2zif0USUyW5dVTl40Wg81hqImuXm0ux8pKkOsnXWo
	/q3s1aIysuDi0Eeji4pdzpG1jwd3xKz20KXuE61a9lMrAKLEOxTsCzxrTzoqdD33dyjJUXNtz5v
	J8EN5eULqv15HNFQ2uOf250eUktRD38CMLDvt+G6LUUNCFR+Y2v8kZ3Iwyzn+Wa16BAvnQwPGDV
	fE
X-Received: by 2002:a05:600c:4e8a:b0:419:f088:249c with SMTP id f10-20020a05600c4e8a00b00419f088249cmr560110wmq.12.1714678067522;
        Thu, 02 May 2024 12:27:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMXMCLC9AWZi6TilfJ4Dt0uj49l58uQDA4FCOB4yLa+nGNQ9VfyHiYUZXhme9tt5k/1cHPxg==
X-Received: by 2002:a05:600c:4e8a:b0:419:f088:249c with SMTP id f10-20020a05600c4e8a00b00419f088249cmr560096wmq.12.1714678067094;
        Thu, 02 May 2024 12:27:47 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id bh10-20020a05600c3d0a00b0041c130520fbsm2908174wmb.46.2024.05.02.12.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 12:27:46 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.95)
	(envelope-from <josmyers@redhat.com>)
	id 1s2c5c-0045NI-Ka;
	Thu, 02 May 2024 19:27:32 +0000
Date: Thu, 2 May 2024 19:27:32 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
cc: Siddhesh Poyarekar <siddhesh@gotplt.org>, 
    cti-tac@lists.linuxfoundation.org
Subject: Re: Hashing out the scope of work
In-Reply-To: <20240430-polar-jaguar-of-debate-04ddba@lemur>
Message-ID: <9df22f6d-c854-ff6d-8c67-286366d070ae@redhat.com>
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat> <2293a3bb-5780-ec5a-ca72-e19671dccb51@redhat.com> <20240429-proficient-pastoral-whippet-bcc376@lemur> <6d25ccc7-ef3e-a885-b085-51185c23c91@redhat.com> <060ff9e5-785a-4963-8d92-2638db3228da@gotplt.org>
 <de67e18-d847-717e-a8d-dbfe7d2044d7@redhat.com> <20240429-rousing-mamba-of-improvement-cabefb@lemur> <30dc33a-69de-39e6-fe7d-bd21c99ccecf@redhat.com> <20240430-polar-jaguar-of-debate-04ddba@lemur>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Konstantin Ryabitsev wrote:

> On Mon, Apr 29, 2024 at 09:58:18PM GMT, Joseph Myers wrote:
> > > For example, for bugzilla we'd need to prepare a query to filter 
> > > bugs and comments by product and component -- to only include those 
> > > belonging to glibc. However, how do we go about filtering users? 
> > > User records are not tied to a specific product or component. We can 
> > > try to have a large query limiting the users to just those accounts 
> > > who have commented on glibc bugs, but this is going to be hairy -- 
> > > someone could have commented on a bug that started out filed under a 
> > > different product/component.
> > 
> > The simple answer there is not to filter users.  It's OK to have more 
> > users than necessary in the new database.
> 
> Is it okay with the users, though, that they suddenly have accounts on a 
> totally different system belonging to a totally different organization?  

If that's a concern, I wouldn't expect it to be particularly hard to 
identify a more precise set of users: there's a precise set of bugs to 
copy (i.e. those, whether open or closed, that are against the glibc 
product at the time of the move - not anything that was once opened 
against the glibc product but is currently associated with a different 
product) and each bug has a limited set of relevant people (reporter, 
assignee, CC, anyone who did any action recorded in the bug's history).

If an account was blocked for spamming and gets copied, it should still be 
blocked after the move.

> > > The same problem is with patchwork -- migrating just the subset of 
> > > the database that belongs to glibc lists is going to be very 
> > > difficult, especially with the kind of data model that patchwork 
> > > has. Is it the CI data that you want to preserve?
> > 
> > I think it's the details of what patches / patch series still need 
> > review that's the most valuable part to preserve and migrate.
> 
> I think we can accomplish this without having to touch the DB. We can 
> identify the patches that are still open and replay them from the 
> mailing list into the new system. This would be a lot simpler than doing 
> database surgery.

Where patchwork lists patch series as such, is this automatic based on the 
mailing list messages?  (I think the grouping of patches awaiting review 
into series is worth preserving.)

-- 
Joseph S. Myers
josmyers@redhat.com

