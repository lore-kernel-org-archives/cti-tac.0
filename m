Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1B7195803
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Jun 2024 14:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719498340; cv=none; b=DDEIykPH/Z9IlTYeLgUPXeefkiEJCZF1ZDsdercxnHivJdYgXvHDobDnn8KzqjP8zOAX2tiVaJc9j1LFCUn7ln4b/fsHMr858YZOEKOHJ4tjN54HXaXWG2pG0C4bbyxh6wmJzbdG9lk+qswJ8Pu66cRurBDiImhWAAeQblMqFz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719498340; c=relaxed/simple;
	bh=95kqwEHIwAqpFZSmTQz9hVsWSUvGWhR6/DA1R8Y6gYg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ZgmpPv3/+O3YTBcb/heu7da+c/TUatZDPj1XBEb2O4xoyTnQk5cqHbQqCmjDFfCJJAYdVMkzySzMcPD6NnJp0Uomnpe5w+ViOzmpSmkItdeCUWNEBu8+HqaJU4Nh15XkqrSAT/r5+KiJg8Eu7gvZ4yTntkXGzH/56WcWwvqYE2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yn8ffcYI; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yn8ffcYI"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DC9241610
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Jun 2024 14:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrXo4lyc389k for <cti-tac@lists.linuxfoundation.org>;
 Thu, 27 Jun 2024 14:25:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fche@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 17FC841608
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17FC841608
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yn8ffcYI
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 17FC841608
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Jun 2024 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719498336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AUEp6FdxKixpm2DXp0KrHZldf7HcfrkIl11rFrpUBT8=;
	b=Yn8ffcYIQvJnhu2vK3ldGSapD7b9YBo89qZTAy5GIyI2mqVleeHqayBu3hyCq2b+Ib0kjZ
	DGtDJlpnSX9VQJph/CwaF5IwIX1zyo0ahHd3zZgeHQWIQnUrVBMzbkWybsyVx1ehJNz/cg
	8oCrCqBnL8YpgMOqCGi4EScHGSee9nY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-118-Wjv1negdPfmSzOr2SaFhwA-1; Thu,
 27 Jun 2024 10:25:35 -0400
X-MC-Unique: Wjv1negdPfmSzOr2SaFhwA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9BEDA19560B2
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Jun 2024 14:25:34 +0000 (UTC)
Received: from redhat.com (unknown [10.22.16.10])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 60D341955D89
	for <cti-tac@lists.linuxfoundation.org>; Thu, 27 Jun 2024 14:25:34 +0000 (UTC)
Received: from fche by redhat.com with local (Exim 4.94.2)
	(envelope-from <fche@redhat.com>)
	id 1sMq44-0001tO-G6
	for cti-tac@lists.linuxfoundation.org; Thu, 27 Jun 2024 10:25:32 -0400
Date: Thu, 27 Jun 2024 10:25:32 -0400
From: "Frank Ch. Eigler" <fche@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Subject: Re: CTI TAC Meeting Notes 2024-06-26
Message-ID: <20240627142532.GA2948@redhat.com>
References: <a1e31779-b3c3-4016-ae69-27aced5971e9@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <a1e31779-b3c3-4016-ae69-27aced5971e9@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi -

> [...] Routing issues to the colo.
>  * David: The SLA is within the LF, with the OpenSSF funding, and the OpenSSF saying this is important from a security perspective.
>  * Bennett: We have redundancy and is that something we want to publish?
>  * Konstantin: We do mention that already. We can also put in the design of the platform. Automatic failover.
>  * Carlos: Yes please.
>  * Konstantin: OK, I'll put it into the part.
> [...]

Given that the routing issues mentioned were upstream of the
colocation facility itself, effective improvements in failover would
have to work in a cross-colo way.  Is the intent to have
failover-capable servers in multiple colo facilities?

- FChE

