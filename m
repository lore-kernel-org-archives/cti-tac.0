Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698351369A4
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709841597; cv=none; b=Ww8ammcJdi6BfFf1t6uYBft5uAi5lTADYXN4C6THeYGsh8tpY+fChDuwH9fY3B7GhP9qYUx64Nj+fad0JDkAONtoCoTJOAPeGXj5+eXrPlGoywz6JQjvWnNzPuwpEjvUwYBVeDdhIr4cMySonK0Nbt1Th6mU4HsnxcdXjW5/wss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709841597; c=relaxed/simple;
	bh=R6eT2JMIvjyEoz6IWf7Bhn1OGscP3l9V3+rNEi1jeLs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=idoC4FKPAjXtoUBtqW64ZuQvK3qNhTyBa4nDf341XMCueipM36dnyJjjdht5SFFfMlsayGNptacy+/dSs5oCxRmjrdgfMCoB1bYoGbJAVdBMfQXy569AC8pXLAkeKbU70K0LJGtm9C/m+/C+fmsgdVK2fn3IBk/GtuEBDOmPB1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YQ4XALlf; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YQ4XALlf"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08B2440A55
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jAwdFaDBjwgf for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 19:59:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fche@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4FBCC40017
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FBCC40017
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YQ4XALlf
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4FBCC40017
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709841594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=rv3/ds/bMoEYVM7cRfA21xsH2loqOZrki93DTOzKCro=;
	b=YQ4XALlfqWy5+IUgK7uAexhq9rp1bPndG/0MyfxgU+R/IOI53cs+Bc0M4MIApeTET2/ixG
	8FnIcTtqredteqhi05g4EHJCoSKVTYL/ZxtzKtaBNvnR8iEcCqz5x9MTuVSgzDOJzzPDzm
	ZJUtgCy9F3nuemkJMU4xqQDp6a4KfVg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-rEACqDezPm6UKeFTrROiig-1; Thu,
 07 Mar 2024 14:59:52 -0500
X-MC-Unique: rEACqDezPm6UKeFTrROiig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E5D71C5402B
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:59:52 +0000 (UTC)
Received: from redhat.com (unknown [10.22.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EF6C40C6CB7
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 19:59:52 +0000 (UTC)
Received: from fche by redhat.com with local (Exim 4.94.2)
	(envelope-from <fche@redhat.com>)
	id 1riJuB-0006NA-EY
	for cti-tac@lists.linuxfoundation.org; Thu, 07 Mar 2024 14:59:51 -0500
Date: Thu, 7 Mar 2024 14:59:51 -0500
From: "Frank Ch. Eigler" <fche@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Subject: suggested website faq addendum
Message-ID: <20240307195951.GE5062@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi -

As the website git repo is not public, I'm not able to phrase the
following as an actual patch.  (Sorry!)


+Can we keep deploying services as we have?
+""""""""""""""""""""""""""""""""""""""""""
+No. The GNU Toolchain is a critical foundation of trust for the
+GNU/Linux ecosystem and the demands on its infrastructure, services, and
+security requirements have grown over time. [...]
+Different projects have different risk tolerances and the GNU Toolchain must
+meet more stringent expectations [...]

Since "For example?" is bound to follow that, please enumerate/cite
the origin and content of the driving demands and expectations.


Please add another FAQ:

+Are there plans to construct a feasibility-confirming prototype of
+the entire constellation of enumerated services for a CTI project
+before its migration is decided?
+""""""""""""""""""""""""""""""""


- FChE

