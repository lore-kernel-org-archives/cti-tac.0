Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5490E14B94F
	for <cti-tac@lists.linuxfoundation.org>; Tue,  7 May 2024 21:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715118340; cv=none; b=jSP9yC3BsJgr2A0+0k4aiqihRjNcMQIXk8KsA1D1ORQ16KxHnS3sv//KYUwMolTYZDuVmSGnS6KUWbCl3LlGfP/Y8owHo3UhwsvwFcR/Itv/PE3aCicJi5TFAYbZ6C//mjqDVJnqIiTx/YDrTw84QRKWco8NBgFniC9DLtHHCb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715118340; c=relaxed/simple;
	bh=Qg2SlvnYcImAexhKfZs8BGI0wA7Jr47hieF8h6idT9g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mqG+YHT7IWcBSJ/+R3QcstdOeifsJcl48fJVAbQWEn6E7MgHcjxoK4Cpn/rFVAREPXnYvzi7iXMhkhULt0dLyrAEiL3VlzMNfmtVfxvHCvsJ9xq2a8fwRAxGsK6jJL3lK+vPGgmlT/W4CJhHdzvO5ijCrtsfAK5JEA84sWnJ6bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iICj5uzj; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iICj5uzj"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD1E8822AE
	for <cti-tac@lists.linuxfoundation.org>; Tue,  7 May 2024 21:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHxJANbrYovd for <cti-tac@lists.linuxfoundation.org>;
 Tue,  7 May 2024 21:45:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=josmyers@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 044DE822AC
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 044DE822AC
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iICj5uzj
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 044DE822AC
	for <cti-tac@lists.linuxfoundation.org>; Tue,  7 May 2024 21:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715118335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JHZraSAKzd3kdBXHDKlmwWT4Lp/Kk2NBcY87VfI9XjY=;
	b=iICj5uzjdZTcXc6bEAKB/czkWTLAcG8Yyt5QiGjpE3rAcZZa3Mbhx7GBFTEvxL7az6aqpI
	VoQJx49YZLpTN/6v8zZdsI5PqWk1GB2AtZ6j0NzoBvGWVMWcw9j/+rCPFIwrUnTdOGRxen
	sG15LNNSpn8ZWp/5G3OePluGdn3L264=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-MIIlXAQ4Nc-ijnsdqk57Wg-1; Tue, 07 May 2024 17:45:34 -0400
X-MC-Unique: MIIlXAQ4Nc-ijnsdqk57Wg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-34d7861a1f4so2457326f8f.1
        for <cti-tac@lists.linuxfoundation.org>; Tue, 07 May 2024 14:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715118333; x=1715723133;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JHZraSAKzd3kdBXHDKlmwWT4Lp/Kk2NBcY87VfI9XjY=;
        b=J/5ztXgMPKWMzfTq4jPY7G0EAxiRVMndmw5fqEXaHXgkG1H+64CEK/T+3cfGYG3jYI
         PVom2NJmDfXJ4VvhoJ1sIt7isgSTkxRBVrxrQUtIwWvaYH89Git2Va8yOC4DYdO1XUVJ
         +LFGZ8PN2JWpJc5Hh7Na6TScJqHsYF+sWfBaqJ2q//VdLfpQ0LGamRzkJzYWTkRrj+4Q
         KOqMNLuUVmHhRIwAXDhbc1qiX7+0r5TodoLmFUNfyTfzV3o6fGSkjazpYc5HnruETmig
         mY5i/g/hl/SK4TeDt4AkB+rSH58JPesavb913ax4WuCb4sS3cLFmvvq3LomlFGsMhiJk
         OxHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0MkWYhwf55hOnv8ClrOqxQ0eztA2B1XvM+trxIEnKIyaBxX/FVvbyZod9Whv+M+zq91KJd2qwdzhe8wFItWhv8wOX6VHdn1WE9zZnbOeXv+I=
X-Gm-Message-State: AOJu0YzN893af5/Py+qNTv6IXqpN/KtHwJzkTojUdNZSgxqeDXhXhW1l
	WXTtVeCSuWB6wP5uef01b7E/CKgE9WxGNhMGwelZINNMLoPbjRnD0jYNpjQKbA8zgGuEiLq4t2o
	gpDz8CWEdd2X9QS8iCC9hGKWaejnIstq2AVtaphvdH3O1D6MpWkmwo55XOkDKMdwpFFVw
X-Received: by 2002:adf:a49a:0:b0:34b:8bf:5fa5 with SMTP id ffacd0b85a97d-34fca149c3emr911472f8f.7.1715118333503;
        Tue, 07 May 2024 14:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC/evqa4e/Iiuvd6GyZaaYbT3PJ+uE0rDD3+8xHCvTDpbNnQjwH+uhjPcYKr+H+b2ggkOLIQ==
X-Received: by 2002:adf:a49a:0:b0:34b:8bf:5fa5 with SMTP id ffacd0b85a97d-34fca149c3emr911461f8f.7.1715118333023;
        Tue, 07 May 2024 14:45:33 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id dn15-20020a0560000c0f00b0034d9012e74bsm13888207wrb.72.2024.05.07.14.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 14:45:32 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.95)
	(envelope-from <josmyers@redhat.com>)
	id 1s4Sct-005ZBl-9L;
	Tue, 07 May 2024 21:45:31 +0000
Date: Tue, 7 May 2024 21:45:31 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
cc: Siddhesh Poyarekar <siddhesh@gotplt.org>, 
    cti-tac@lists.linuxfoundation.org
Subject: Re: Hashing out the scope of work
In-Reply-To: <20240507-graceful-wondrous-camel-f8d4d9@lemur>
Message-ID: <1c33265b-c31-7db1-13ff-5d5765b29024@redhat.com>
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat> <2293a3bb-5780-ec5a-ca72-e19671dccb51@redhat.com> <20240429-proficient-pastoral-whippet-bcc376@lemur> <6d25ccc7-ef3e-a885-b085-51185c23c91@redhat.com> <060ff9e5-785a-4963-8d92-2638db3228da@gotplt.org>
 <de67e18-d847-717e-a8d-dbfe7d2044d7@redhat.com> <20240429-rousing-mamba-of-improvement-cabefb@lemur> <30dc33a-69de-39e6-fe7d-bd21c99ccecf@redhat.com> <20240430-polar-jaguar-of-debate-04ddba@lemur> <9df22f6d-c854-ff6d-8c67-286366d070ae@redhat.com>
 <20240507-graceful-wondrous-camel-f8d4d9@lemur>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 May 2024, Konstantin Ryabitsev wrote:

> I recommend this course of action:
> 
> 1. We convert all current bugs in the glibc component of 
> sourceware.org/bugzilla to a public-inbox archive, searchable by the bug 
> id. This functionality exists in our bugspray project and only requires 
> non-privileged REST access to bugzilla.
> 2. On the migration date, all glibc components at sourceware are closed 
> for creating new bugs. This still allows completing existing bug 
> entries.

Previous bugs would continue being discussed and fixed for decades; this 
would require new contributors to create accounts in both databases 
depending on how old the bugs they are working with are, and would require 
new milestones to be created in the old database for every future release 
so old bugs can be marked as fixed in such a release, and would require 
the script listing fixed bugs for NEWS to look in both databases 
indefinitely.  I don't think requiring people to work with two databases 
indefinitely is a good idea.

> 3. The new bugzilla at CTI starts from a fresh state, with bug numbers 
> starting with 100000, to indicate a clear break.

So, while I think starting new bugs with number 100000 is a good idea, I 
also think all the old glibc bugs (both open and closed) should be copied 
to the new database so people don't need to keep working with both 
databases forever.

-- 
Joseph S. Myers
josmyers@redhat.com

