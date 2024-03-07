Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6012D050
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 22:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709851090; cv=none; b=d4VNK4CgeRooDOLqOYBlqbhE6pgFMzSfUM5iypcVoxKOjcNQJXegYHV+gF8dtG/7d3ny8SLRRt+BedW+Ed+89jl2gN2IcjyUbSk3LNh7sSTVg9cuhmtgFiJ8GUhwvEbwP5op0JV9VoPqxLR+8vHpjyI4fbkwk3hLrKa8lFnZhaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709851090; c=relaxed/simple;
	bh=CSnCHFWP6IuuRRAJIIW7lyQAU2EJVPxj3Gp2PLi42ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=eA3+3g2sL+CE1J6r/8/SDNa4PrCmGvCIsrGppdojBKfGC/jdt6GYe6KVqLRWPTfZDPA4zvhzpVk2nQTAPNTTr/Fxo59n7NCFIDcF2e4tJPqR9MSbNPqrCm4LEmAIS1zlRxZTKbA9+b34Qtxx5ovSOPKGDx/6/8oP5K3lAtGhrdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q5p1q6uz; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q5p1q6uz"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 503E341BDD
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 22:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHkVy61cfcgE for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 22:38:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fche@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B28D41BCD
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B28D41BCD
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q5p1q6uz
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3B28D41BCD
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 22:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709851086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PkhVbDSCqhJoqEC4iXuR5r2hRbONsfYwsBCdoO7Hrl8=;
	b=Q5p1q6uz0iif/hda5q1pgEh1bRJViWT1mKTKbl4W0/NByN8BtRdJehfxSrAlcneHfaymXL
	lFY2MJ1vSM6cX9EUAOEEvgSsZvzuKZoAXEd92iYKLK4vmx9DCUzHpZdPmCGquXRQJX4xMR
	3qYWSRatZQNsK236Rf1e3utqhwFo9vU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326--EsYWt9WMdWHVMWYgHTYUA-1; Thu, 07 Mar 2024 17:38:04 -0500
X-MC-Unique: -EsYWt9WMdWHVMWYgHTYUA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5341185A58C
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 22:38:04 +0000 (UTC)
Received: from redhat.com (unknown [10.22.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ADF3492BFC;
	Thu,  7 Mar 2024 22:38:03 +0000 (UTC)
Received: from fche by redhat.com with local (Exim 4.94.2)
	(envelope-from <fche@redhat.com>)
	id 1riMNH-0006ag-5W; Thu, 07 Mar 2024 17:38:03 -0500
Date: Thu, 7 Mar 2024 17:38:03 -0500
From: "Frank Ch. Eigler" <fche@redhat.com>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: suggested website faq addendum
Message-ID: <20240307223803.GA25065@redhat.com>
References: <20240307195951.GE5062@redhat.com>
 <d0a99699-911d-49d9-b638-7a475cee0282@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <d0a99699-911d-49d9-b638-7a475cee0282@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi -

> Please feel free to provide a diff to the sources so we can look at
> your suggested changes.

Here it is.  I'm afraid I'm unable to provide answers to the questions.


--- index.rst.txt.orig	2024-03-07 16:17:06.726132460 -0500
+++ index.rst.txt	2024-03-07 16:20:31.854901376 -0500
@@ -16,6 +16,13 @@
     must meet more stringent expectations to maintain the trust of the 
     ecosystem. It is with this context in mind that CTI has been formed.
 
+    For example, the following demands and expectations are based on the
+    following origins:
+    
+    ?                   ?
+    ?                   ?
+
+
 * Q: What concrete steps will CTI help with?
 
     * A: Some of the major goals include:
@@ -48,6 +55,13 @@
       infrastructure. Projects of similar scope and importance have been
       deploying significant resources for the use of the development community.
 
+* Q: Are there plans to construct a feasibility-confirming prototype of
+  the entire constellation of enumerated services for a CTI project
+  before its migration is decided?
+
+  * A: ?
+
+
 * Q: Sourceware volunteers have fielded requests and organized volunteer 
   efforts that have worked well. Does LF allow volunteers to administer 
   the servers together with them? Have they in the past?

