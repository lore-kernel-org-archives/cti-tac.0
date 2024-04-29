Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DE683CBA
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 20:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714423655; cv=none; b=HffhM5XJWvwcNOxQr2pXdg0zsl4M1JEWZRGFmUBEFFuXXAUBX2lmOGNqI28iQKENdeOyHfyb/DJGZ+HIBXU4ASm+dq3rA8f8iPxRH/ybRSc/ik5nZ8E+nrur56KMZfE2vxUwJ4wB28cPxbKx3mKcIzV10XgaWpTc8SFt0D6wMi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714423655; c=relaxed/simple;
	bh=dsteCVVm+hNT+e58WhGR8tZgV8fw6mrIaF/j5oFx0pI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DkfrNurnp+JUHCtg9zYocsa+gdXbo7SS+DrLsxxqJhjikxFGF5wlT2yvJUvIDNoDxHEBIDktwOo0KIx7xAW0LebXVk7ob4kHDF37QkSiQWP52B9AOa0FDKZzxTtR+HjZf9aOQc/2Eqp4ViuFkMCbV5Irf2a3KseqO6k7PvQxpD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ch9McXko; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ch9McXko"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ED0681BC5
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 20:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12Rsz5xjuHhd for <cti-tac@lists.linuxfoundation.org>;
 Mon, 29 Apr 2024 20:47:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=josmyers@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DC5E81BC2
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DC5E81BC2
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ch9McXko
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5DC5E81BC2
	for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 20:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714423652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ay34jzpz12X5681xSMdED/2MM4WGgV25veR3grTUZWE=;
	b=ch9McXko79nV+xyaaAO7vgS4zYHhbJx41pj+HbdVytT1gw0f+e8fwEtC7olLnr2xbBC4w+
	IH9PRohUB3MGt8Qz6rYA4PQ2EXOTtY8MWTWBP6DuDOF3oK1y+QcVoG/T7xYZ8YwnLtzUeK
	mhsayCJvql4TZem1roQbDtgIeMmMEMU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-OUth0-cvP1yWOoqmkEGD3A-1; Mon, 29 Apr 2024 16:47:30 -0400
X-MC-Unique: OUth0-cvP1yWOoqmkEGD3A-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-349cafdc8f0so2906172f8f.1
        for <cti-tac@lists.linuxfoundation.org>; Mon, 29 Apr 2024 13:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714423649; x=1715028449;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ay34jzpz12X5681xSMdED/2MM4WGgV25veR3grTUZWE=;
        b=CLRvTF3uFIADDguGVLXEZPSnsCUA9VWbggbxVdhiQNgZGjAgqJwYCqs62AFdDGwu9+
         r2PGIr6jPJ9hlbMI06zu9qwRLCT4bNwHo9akF63nFTBhWTlkF3VRMpLJtmpqSLylW/uo
         ccJohleutvDKaTWMy/P8d42SLTpY++S+qtaaiGbgHdp9bDWbgb3mvVRfcY1PmhT69+pn
         fczGzjBR8L/psRjO6EKrOt5Z+ZkmJr+YeMC7S8fg3CztZ2TMNumwi8HTma3s8kuh51/b
         0FsJEt1P+jXvCay51SOKEMqE+trwDxtqehqznlwDY7ZmdFw/ewkFVFcLb1SeuDnR1bgf
         kZcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiekBQT006whsjo5usC2X0yjg50hHSsjsspsC2T3SzyO3vFJEbGgXYre9Gk7zjfqSPHYgOcdnJqQ5ObEx3jjVx0e6MUmVmJDrtM9BxTYAoQrg=
X-Gm-Message-State: AOJu0Yyi181/KR3OginFdSRDBPvhfcyyjckKo1MIhZ7ptTIXukbyQQrD
	rplcG2kV6/rxkdMYaDJFIeG5Ot/NoR3kKrVmxdhHjV6jMAFCSppHilNqBGEidONdfT5FFPxmWRo
	lv2UIPMVONYnPaIID5kBkXZkLD9MLH8+MQcqfizBbDHCMcmC/d6yMBdOfbHUcYcb5R37q
X-Received: by 2002:a05:6000:e4b:b0:346:1443:27ea with SMTP id dy11-20020a0560000e4b00b00346144327eamr10147202wrb.68.1714423648986;
        Mon, 29 Apr 2024 13:47:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmwmw+BDz8m5U/UQJnhsRHkByU+X/CGPiQ47Xfv7oKGwjXbr3EEWAUUUQdy8T1MmsrVt08aA==
X-Received: by 2002:a05:6000:e4b:b0:346:1443:27ea with SMTP id dy11-20020a0560000e4b00b00346144327eamr10147191wrb.68.1714423648633;
        Mon, 29 Apr 2024 13:47:28 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id e7-20020a5d65c7000000b00349eb6eae3esm30680115wrw.4.2024.04.29.13.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 13:47:28 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.95)
	(envelope-from <josmyers@redhat.com>)
	id 1s1XuJ-003NIq-5Y;
	Mon, 29 Apr 2024 20:47:27 +0000
Date: Mon, 29 Apr 2024 20:47:27 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: Siddhesh Poyarekar <siddhesh@gotplt.org>
cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
    cti-tac@lists.linuxfoundation.org
Subject: Re: Hashing out the scope of work
In-Reply-To: <060ff9e5-785a-4963-8d92-2638db3228da@gotplt.org>
Message-ID: <de67e18-d847-717e-a8d-dbfe7d2044d7@redhat.com>
References: <20240424-viridian-peccary-of-honor-4eaeed@meerkat> <2293a3bb-5780-ec5a-ca72-e19671dccb51@redhat.com> <20240429-proficient-pastoral-whippet-bcc376@lemur> <6d25ccc7-ef3e-a885-b085-51185c23c91@redhat.com>
 <060ff9e5-785a-4963-8d92-2638db3228da@gotplt.org>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Apr 2024, Siddhesh Poyarekar wrote:

> I believe we had explicitly agreed in a previous CTI TAC meeting to start over
> with a clean slate for patchwork and not bother with migrating the previous
> database.

Bug database migration is definitely a lot more important than patchwork 
migration, but I think the starting point is that patchwork state should 
be migrated in the absence of a clear reason that's problematic.  And if 
it's problematic, we should try to understand if there's a better way to 
configure the future patchwork installation to make it more susceptible to 
any future migrations.

-- 
Joseph S. Myers
josmyers@redhat.com

