Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B3317F3
	for <gti-tac@lists.linuxfoundation.org>; Wed,  9 Nov 2022 04:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DE6C416AF
	for <gti-tac@lists.linuxfoundation.org>; Wed,  9 Nov 2022 04:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DE6C416AF
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KXKlzttT
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rt4EE-W2tBna for <gti-tac@lists.linuxfoundation.org>;
	Wed,  9 Nov 2022 04:56:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2294B4098D
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2294B4098D
	for <gti-tac@lists.linuxfoundation.org>; Wed,  9 Nov 2022 04:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667969759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LQyN7jpemZQTn9y98eMRQ/jn3RYxjzxMKkyvGlM6a24=;
	b=KXKlzttTRffDeHirMOiBW42R/Y3Y26tPy3KQwC+/4+AL09oUn73xDUgqJwzK305GLxibF7
	+PYrOzomce56lWkrL4gfEwujTyn/yppoOViYHVBVuMHvyJGMZXiqpPSFcbnpG+ZqnKokzC
	WYCecHQVGa3HsvknVNgzZMh8V7mcuQo=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-325-XmalX3nUNESZ8l84D7gOxg-1; Tue, 08 Nov 2022 23:55:58 -0500
X-MC-Unique: XmalX3nUNESZ8l84D7gOxg-1
Received: by mail-io1-f69.google.com with SMTP id j17-20020a5d93d1000000b006bcdc6b49cbso10718007ioo.22
        for <gti-tac@lists.linuxfoundation.org>; Tue, 08 Nov 2022 20:55:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQyN7jpemZQTn9y98eMRQ/jn3RYxjzxMKkyvGlM6a24=;
        b=V935EQBthb0qwCI4YSihIrKreAOLpdaUVeqkXK/dyxfLCuKAsHpmxgvweoSL4DBv5T
         chG4mVHM5FEXb9Po19yFv6jrY17hkkUJ0dYhMH3sdgJGlRKxhChq4eM4m2gRGRR5Qc2f
         LSa3EyLo6Gqr6PSn+qFA28cjqMAg5C8Krg6ufXEYpWiWc3dvSK1capJxY8fTbtC8AVW/
         k5HtAsL9baCz5sh7YJzpN/2BKen90WGLTG7oX0CZ8ztA/ghYkxQNchdnzj5JBbYVOo7r
         3nQwpZQ22Wng05C37yuUXdVCoqxinFtWZm87s+kLXU+8C15leE28KSDXDN2L8UuywpT/
         6gNg==
X-Gm-Message-State: ACrzQf0jmLZHQSNZ8mF/a9lZSvyAElZb0CbC+0Uukuir1tkKO6d9SW6k
	FLycj7LFAm7DcedtulvAu2tlbfvvddNxccmQDoJ80bQVwFXn5L3tZLIHBe5hUUo/qC9ljAu79Yb
	ZR2OwdZsCVQGgehjYnYzofjFaQEvOSfO45K2m1uNpLAP8PQyxrZ7equenVlP+rARiTl9wH3G1As
	gX+Vuu
X-Received: by 2002:a92:d12:0:b0:300:d51b:8289 with SMTP id 18-20020a920d12000000b00300d51b8289mr17561298iln.108.1667969757474;
        Tue, 08 Nov 2022 20:55:57 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4UPmF7otzu6J2Pe2W2eDeEgKWEvECe7qaqeSIOCGVK2uDVDQC07ZrwuorRjLPhrmeg8+dQSA==
X-Received: by 2002:a92:d12:0:b0:300:d51b:8289 with SMTP id 18-20020a920d12000000b00300d51b8289mr17561291iln.108.1667969757113;
        Tue, 08 Nov 2022 20:55:57 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id h15-20020a056602154f00b006bc48537658sm5172516iow.0.2022.11.08.20.55.56
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 20:55:56 -0800 (PST)
Message-ID: <e2e83a8c-247c-94df-ea85-b4963285da40@redhat.com>
Date: Tue, 8 Nov 2022 23:55:56 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: gti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: GTI TAC Meeting 2022-11-09
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This is a reminder of the GTI TAC meeting on 2022-11-09
at 10am EST / 3pm UTC.

Meeting URL: https://8x8.vc/gti-infrastructure/gti-tac
 
The agenda for the GTI TAC meeting would be to discuss the next steps
for the current proposal: the GNU Toolchain moving to managed
infrastructure at the LF IT. We could additionally discuss some of
the mechanics of the TAC, like where we'll put our documents, notes

This is the first time using the 8x8 Meet infrastructure (Jitsi based),
so I will be on the meeting early to test infrastructure.

Additionally I suggest OFTC #gti-tac via IRC for any coordination.

-- 
Cheers,
Carlos.

