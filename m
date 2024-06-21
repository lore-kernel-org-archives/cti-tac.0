Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C984A15D1
	for <cti-tac@lists.linuxfoundation.org>; Fri, 21 Jun 2024 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718976656; cv=none; b=rmM7WFfSS8tCA95FfYOQnzszWovTJLhTqsJcnuPUpvFmWWQOHjcSwRo4RvfwyrtMT9NL+a2pnY2g1ZPM/VJlEEylL48iSS2USi9g3cQQsfx8edrMttxim5V9YEvCeif/llZWrUMbTxXuSsIMgb+OV6PkyZIvDI3PvjMi803o7V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718976656; c=relaxed/simple;
	bh=sIV7vEfse+bwMbNV6oe9+dtB0UmMpIqt5znI5PMn0mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SuLq5gupKY1ZTqprzg+wg2UD2n2cQKkM4m7GCC/hHlbRmLNvGEa2IgA+hPdXk+WBq4SXHpKY0GjZXEv2kEsLOxhyyV2U6FzYlRhMrLFO/+UOPm6+SC3312ZRgn2i2F61hPdG9gHc7N/2I1qMBM6f88U8dufJn0p5agm3rstah/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I2mXFqDI; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I2mXFqDI"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6627842CFF
	for <cti-tac@lists.linuxfoundation.org>; Fri, 21 Jun 2024 13:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72N7T5mCEI4e for <cti-tac@lists.linuxfoundation.org>;
 Fri, 21 Jun 2024 13:30:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fche@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8714742C66
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8714742C66
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I2mXFqDI
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8714742C66
	for <cti-tac@lists.linuxfoundation.org>; Fri, 21 Jun 2024 13:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718976653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sIV7vEfse+bwMbNV6oe9+dtB0UmMpIqt5znI5PMn0mo=;
	b=I2mXFqDItKAQAUDrIUuyWpBzc3VYHuZqPnuaeeWVCQxtp56IbunGhdaz0xrTKSNOZgWGnF
	DfoxpYWkPkW7u8TIAnfnpRg7T1afTJdhU0hdk7cKFaNmp9aIKQc6/NL6XmuQvZFx9wlsWn
	gZEATkd2CcWVoZbyeVXMQw1z79+oShw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-78-NaHlp-xMN4OKjujh6hTwIA-1; Fri,
 21 Jun 2024 09:30:51 -0400
X-MC-Unique: NaHlp-xMN4OKjujh6hTwIA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7658519560AF
	for <cti-tac@lists.linuxfoundation.org>; Fri, 21 Jun 2024 13:30:50 +0000 (UTC)
Received: from redhat.com (unknown [10.22.16.10])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3797F1956087;
	Fri, 21 Jun 2024 13:30:50 +0000 (UTC)
Received: from fche by redhat.com with local (Exim 4.94.2)
	(envelope-from <fche@redhat.com>)
	id 1sKeLo-0000rQ-CL; Fri, 21 Jun 2024 09:30:48 -0400
Date: Fri, 21 Jun 2024 09:30:48 -0400
From: "Frank Ch. Eigler" <fche@redhat.com>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Migration to CTI services should be an opportunity to reduce
 dependency on git hooks.
Message-ID: <20240621133048.GA24746@redhat.com>
References: <b3d04984-cec4-456f-a05d-7adccb1c3b3d@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <b3d04984-cec4-456f-a05d-7adccb1c3b3d@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi -

> The gcc community was locked out of committing because of
> issues with the AdaCore hooks: [...]
> My strong opinion, particularly for glibc is that we have as
> few hooks as possible, and timeout those remote hooks in a
> reasonable amount of time.

Note that these hooks exist only at the pleasure and control of each
individual project.

> As we transition the services we should be looking to architect
> a safe and robust system that can handle the hooks timing out [...]

You don't have to wait - such a thing can be prototyped today.
Is the issue mainly the lack of anyone's time to do that?


- FChE

