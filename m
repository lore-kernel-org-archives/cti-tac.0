Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8C67B
	for <gti-tac@lists.linuxfoundation.org>; Tue,  1 Nov 2022 21:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A47AA81B35
	for <gti-tac@lists.linuxfoundation.org>; Tue,  1 Nov 2022 21:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A47AA81B35
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Am82/enI
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 871WgZpJeRl2 for <gti-tac@lists.linuxfoundation.org>;
	Tue,  1 Nov 2022 21:41:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DB4081B17
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4DB4081B17
	for <gti-tac@lists.linuxfoundation.org>; Tue,  1 Nov 2022 21:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667338868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y6Cjcbtm+sSxNvWNFCtfrWmrdyVKNA8DIV+IFtWZiWk=;
	b=Am82/enIajTIZVBGPErrLc582LNxPjk9emofYzj/qOmPDbUMgPms8CU5outZVCKLfe8zLu
	2aj1a6TMJ3JlLlvnRDVTCE2wVHSj+pExs0QgZbRU/bWSW7cDtryahIgl9Pf6xOB1Skh+Vw
	mDrVs7mcaz29GgnpvHN4/9HW+rrb8NU=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-427-YCM1HZXUNAu9lGGKwf0Y_Q-1; Tue, 01 Nov 2022 17:41:07 -0400
X-MC-Unique: YCM1HZXUNAu9lGGKwf0Y_Q-1
Received: by mail-io1-f72.google.com with SMTP id f17-20020a5d8591000000b006bcbe59b6cdso12552606ioj.14
        for <gti-tac@lists.linuxfoundation.org>; Tue, 01 Nov 2022 14:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6Cjcbtm+sSxNvWNFCtfrWmrdyVKNA8DIV+IFtWZiWk=;
        b=vDUWdonzegRR23YggXJeXU8n9qMoDre1ZSG+HtdNbPqXqhLYcLYt2AMofE7idQh9RB
         FYtJgpLPSMDFHg91NNAeSMlTpw3iLRVNGzema66JqZfImbEH8KPO+kPB8YNa6XShIjnD
         wq7xujj1uBDZuDDfadUPB3nceU4Fs0dkyx0fyl5+U2fsJVVs5gj9Mn7Tyiu2iJ5KDr/D
         NVSUTD/SGEiWXekoEeqis1J5OjBw7twL9Jd5kuMDmPjuNhCHS15d/Kb7p2plewtG0I7r
         r2B75eRS3A0Ri7uEiToIp/n3mTe/+dXe1z66OHrX/Z7sRgr6ECLLZqu+scs9UHHejeOw
         ybgA==
X-Gm-Message-State: ACrzQf3IqyMFjqpt5MqDvmnoNn55qQtNTCuUGGUHw3bDNDv+VkrsqlY2
	MMQwGjh5typGvh006N/VXqZBuBmLV9JDsvBfh7LuYM6ivuv/SwxTbmtntjo1kH7PI2SfA6w5zVE
	ujTkTlExsrHq6CYwcjpgCx7D1Q/vV0PrIcEhKloIVCn8IPWs6BDF+QlLCxacQosSliNlJ8oO44c
	gBUpA0
X-Received: by 2002:a05:6e02:66f:b0:300:c8e1:5a98 with SMTP id l15-20020a056e02066f00b00300c8e15a98mr1538455ilt.173.1667338866313;
        Tue, 01 Nov 2022 14:41:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4QY8Jqkh6rhYrVQpIz/3MieQplX3K396E2GwvAtOp9h+c/8/WVLXU1zt10pIyTMPBkH7lIHg==
X-Received: by 2002:a05:6e02:66f:b0:300:c8e1:5a98 with SMTP id l15-20020a056e02066f00b00300c8e15a98mr1538433ilt.173.1667338865935;
        Tue, 01 Nov 2022 14:41:05 -0700 (PDT)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id m11-20020a02a14b000000b00374294947e0sm4249724jah.7.2022.11.01.14.41.05
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 14:41:05 -0700 (PDT)
Message-ID: <b246cbec-4c4e-940f-2b47-5e2f9f721adc@redhat.com>
Date: Tue, 1 Nov 2022 17:41:04 -0400
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
Subject: Planning the next GTI TAC meeting.
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

TAC,

We're trying to get a BBB instance setup so the next meeting of the
GTI TAC is using entirely FOSS. So this meeting may need to move out
as we discuss the use of conferencing technology and how to attend
and record the meeting.

Please look at your calendar and get back to me about the following dates:

 * Tuesday November 8th at 11am EST5EDT

 * Wednesday November 9th at 10am EST5EDT

 * Friday November 11th at 9am EST5EDT

The agenda for the GTI TAC meeting would be to discuss the next steps
for the current proposal: the GNU Toolchain moving to managed
infrastructure at the LF IT. We could additionally discuss some of
the mechanics of the TAC, like where we'll put our documents, notes
and recordings (I have some ideas on that).

Thank you!

-- 
Cheers,
Carlos.

