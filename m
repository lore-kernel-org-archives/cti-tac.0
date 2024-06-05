Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F3A15E90
	for <cti-tac@lists.linuxfoundation.org>; Wed,  5 Jun 2024 18:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717612447; cv=none; b=KZGnl554FjQ1ha8/IYokDS065cyux4DqVnbXN61evVuyNA2/x4f6xuTTR3V7H3qAk2dbNIcBKssp52Mh+aXGkArR9xox5p68jPgJ8+W+5u50z2cT83knHTz7fxxcrYj6JxqXkOfgHkW0GmWh8LFe5RcdXjI0BUIXTxS5bnYt0Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717612447; c=relaxed/simple;
	bh=dGb4ByzoXVnBymcsPLxuM497gRtbD7fG85DeWiL2RFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FtEX2M61l+yy9Jdaqu7ZKiMW6iImmJH7D7S6HYeBjiTBIMkj7qMbZTXG72PCW70T5Det8yROwOe0XYxeWJ5nwSRbhlw9T451rqCB1deRnczpO7uMgnXjSV6y9Y8vMlJv5Fo64AKoItCkmTQLo9J3MZEg0f3YvkMpgX1lNimwF9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jCpGI4O1; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jCpGI4O1"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B11D40B87
	for <cti-tac@lists.linuxfoundation.org>; Wed,  5 Jun 2024 18:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMF_j7xo_Ubv for <cti-tac@lists.linuxfoundation.org>;
 Wed,  5 Jun 2024 18:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fche@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79607400D8
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79607400D8
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jCpGI4O1
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 79607400D8
	for <cti-tac@lists.linuxfoundation.org>; Wed,  5 Jun 2024 18:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717612440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tam4FBBrjgiW47A8avJ9Uz7ZkFdTZY8A1ZchYpzAAJE=;
	b=jCpGI4O1ztZcu8lzrdmx0G2zsiQ6ZJW9j7zUtuvPJZ7MqZZe3aIWoGT88sDP9K5MQCrYRf
	bLk2TPRVQO6RPpVL9Mkx8zKIRyPxr0Vfmemia4g+ZjxgMapJRYAeMpf4Fi2NsbkILsP/zs
	2A6Xk7EidnK6KQCr37mNCN8jqZAsiJQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-336-6QlaJWtWNvG_q58Sh_kKNA-1; Wed,
 05 Jun 2024 14:33:58 -0400
X-MC-Unique: 6QlaJWtWNvG_q58Sh_kKNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C1DF1C0512B
	for <cti-tac@lists.linuxfoundation.org>; Wed,  5 Jun 2024 18:33:08 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.4])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D68561C0A92A;
	Wed,  5 Jun 2024 18:33:07 +0000 (UTC)
Received: from fche by redhat.com with local (Exim 4.94.2)
	(envelope-from <fche@redhat.com>)
	id 1sEvRa-0001zn-5p; Wed, 05 Jun 2024 14:33:06 -0400
Date: Wed, 5 Jun 2024 14:33:06 -0400
From: "Frank Ch. Eigler" <fche@redhat.com>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org,
	Siddhesh Poyarekar <siddhesh@redhat.com>
Subject: Re: [PATCH] source/faq/index: Update FAQ.
Message-ID: <20240605183306.GC6896@redhat.com>
References: <20240529135110.3917584-1-carlos@redhat.com>
 <c8da333c-1734-423a-976f-d2114ce597c0@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <c8da333c-1734-423a-976f-d2114ce597c0@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, Carlos -

> [...]
> > +In order to continue to support these communities we must start to adhere to
> > +the modern cybersecurity principles including moving towards zero-trust
> > +architectures with strong application sandboxing for all provided services
> > +e.g. NIST SP.800-207, separate and protect each environment involved
> > +in software development e.g. NIST SP.800-218A PO.5.1, and use multi-factor,
> > +risk-based authentication and conditional access for each environment.
> [...]

Thank you for offering those extra book references.  It would help
even more if there were an itemized list of those particular
suggestions or mandates from those books are of your interest, and how
each is absent on sourceware vs. to be satisfied at lf.  In other
words, offer a way for someone to verify problem, incompliance and
compliance.

- FChE

