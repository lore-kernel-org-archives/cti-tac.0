Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B023056444
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 22:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719612057; cv=none; b=RAjwVifu0CoAeTlfSUsmHz5Ai8xr4JwHb/ZXETgcRH45ejlE5Bnd1U1qfwTb6idJPDuieSD491zuD7U6eV0QmYCwiFLqa5oW/5K7q6j8msP+TL+aONst0q3Ts7BaiUc2oSx3xqZlDsyghKpnS4f4fhnTDPYVFWj7VOtMnXwze4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719612057; c=relaxed/simple;
	bh=LdoiKCNHrO20w6X9rAE/sASD8pDmaSmQdrQQgC/eMc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=n5x1Hak8TB1TBIHrOFdVSUW3qhxaoYKMbGe+8KbFaTQox1vi+hCh+rltX4SoyPpDCZMk9W+YhprNPBFG8ppNty24CimVtWcC/ZZG4rgTC1f+n1an205Wiv5HUnBD6LzPkecbuBrvTHqy2LW7rKPw/YzSYgkMBI4ltFAIAcYJ7IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I3pPjeOa; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I3pPjeOa"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 425D841E6C
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 22:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u54GnG2Q7_Ro for <cti-tac@lists.linuxfoundation.org>;
 Fri, 28 Jun 2024 22:00:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fche@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 322F64167F
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 322F64167F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I3pPjeOa
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 322F64167F
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 22:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719612052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BJjPJ+x4TUnfVeXd6L8yziV2z2jaEEKof/NtgmTaH04=;
	b=I3pPjeOabcmFh40p37Ex7fo3GBf5qYgumsLlbQLukxyIujJgNhdlmoK6S4Q49It7DY8Rrc
	dNxeQvIn4OYFthc/mNFUmUoEDhTrZGn9NyXSfOnrsFBpMl4jjvLjFcmCNvq5ICucZDW8Yx
	uXddpfR4Vjt2JTEgbgR9atjS8+lsBZU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-hcosE5jWNYWUFxCfTeFqtw-1; Fri,
 28 Jun 2024 18:00:50 -0400
X-MC-Unique: hcosE5jWNYWUFxCfTeFqtw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09F9B19560B0
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 22:00:50 +0000 (UTC)
Received: from redhat.com (unknown [10.22.16.10])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BEEF8196BE81;
	Fri, 28 Jun 2024 22:00:49 +0000 (UTC)
Received: from fche by redhat.com with local (Exim 4.94.2)
	(envelope-from <fche@redhat.com>)
	id 1sNJeB-0004Et-Gy; Fri, 28 Jun 2024 18:00:47 -0400
Date: Fri, 28 Jun 2024 18:00:47 -0400
From: "Frank Ch. Eigler" <fche@redhat.com>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: CTI TAC Meeting Notes 2024-06-26
Message-ID: <20240628220047.GB15310@redhat.com>
References: <a1e31779-b3c3-4016-ae69-27aced5971e9@redhat.com>
 <20240627142532.GA2948@redhat.com>
 <587b16a0-1cc9-4987-a36e-f4f3306aa14b@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <587b16a0-1cc9-4987-a36e-f4f3306aa14b@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi -

> > Given that the routing issues mentioned were upstream of the
> > colocation facility itself, effective improvements in failover would
> > have to work in a cross-colo way.  Is the intent to have
> > failover-capable servers in multiple colo facilities?
> 
> Yes, correct, as noted in the just published SOW:
> https://lore.kernel.org/cti-tac/2186f48a-12cd-4630-8944-26b9042e924a@redhat.com/T/#u

Can you point out where that is spelled out?  I see "it will be
deployed within a single public cloud environment", and am missing 
a part which talks about replication of git etc. across multiple
colocation facilities.  (e.g., as far as I'm aware, grokmirror git
replicas are read-only.)

- FChE

