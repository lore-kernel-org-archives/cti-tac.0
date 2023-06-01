Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A5823404
	for <cti-tac@lists.linuxfoundation.org>; Thu,  1 Jun 2023 11:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6978402BC
	for <cti-tac@lists.linuxfoundation.org>; Thu,  1 Jun 2023 11:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6978402BC
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aSsrkMCl
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tiKwr64SpQh9 for <cti-tac@lists.linuxfoundation.org>;
	Thu,  1 Jun 2023 11:08:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5099540122
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5099540122
	for <cti-tac@lists.linuxfoundation.org>; Thu,  1 Jun 2023 11:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685617708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u25CaPRESDYs4Ie+CNJK2NxZYgNUfZhujNOHydJqm24=;
	b=aSsrkMClc5cUJt4ZrTe6F8msLEjTu8cLWNRxX1JTFyacAbuiO3Aqh9x9xzafSXT2tHfb05
	CWllKxd/UfTmTi7LqN43UROGZSHArl4QSPd+lBOU7KJkbeVZTOoiqNTPaa1UQIx2vkKd33
	Roy1r/uBledhvmDYRxE45WqxktbWRcQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-YGJ7yT7gP_6_QaRBk03zSg-1; Thu, 01 Jun 2023 07:08:26 -0400
X-MC-Unique: YGJ7yT7gP_6_QaRBk03zSg-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-5659a7d4c38so9434407b3.2
        for <cti-tac@lists.linuxfoundation.org>; Thu, 01 Jun 2023 04:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685617705; x=1688209705;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u25CaPRESDYs4Ie+CNJK2NxZYgNUfZhujNOHydJqm24=;
        b=R/sCV/ipVFBMQQjhVUdUMV0Yy6orlXc3jLo1HQA4E4H3ID92PSMOEyDQa+RM1NTNT+
         hFahoJQVOi0GxgZLRKeqxl0J/cWCQw/0+Ef20KpwYVbOj6Bl7LbKPcM7y/Hmexc2+KJ7
         nfFQs/CAiR7t2AQtW8P0D9Hvv/n/oZi2hRDIhAzP/c4y9F/GWgMzLwniq6pGeJgRcAiS
         Y5YkyPuixR6dT6RbXUFvbeKIxVBourAHRexJlIt6IRb/8Kf0Q6YsKY63kkz4EhL9dupv
         9qUEAhubd1dWfesZA5G1mR91kLyNJ2ki0jrNWngfx+nW9Kjc1YU90xdG3OnwyjWgP9gF
         07kQ==
X-Gm-Message-State: AC+VfDxZmSl1z5p+rUeAgyAFUX9/gIRbdJg9gqCe/YOTuLjgDfihoEx1
	MLruLDFT2NpabTYbSM4paj8jxcJQeciWxlDAQRQVSOnazi4ULo8a+bd+OUsI4mKwI+T//exwzkN
	Bcz4bRY9iJ/Ur45ZbUPimjyzNJRrg4cteQi7adZWinZKqBnGZovK71fIWGEzn2l4k44IbeWJzVC
	hF0QjsmvKxv4Ar
X-Received: by 2002:a81:66d6:0:b0:565:a6b2:cbd2 with SMTP id a205-20020a8166d6000000b00565a6b2cbd2mr8252528ywc.4.1685617705762;
        Thu, 01 Jun 2023 04:08:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ65j2me2dIw4wd2eZDBlGITQdqcVF7Nt+Q2rHa4xlWF1coZM9c3sWg4HGgIoWSXOPFXsq4pPA==
X-Received: by 2002:a81:66d6:0:b0:565:a6b2:cbd2 with SMTP id a205-20020a8166d6000000b00565a6b2cbd2mr8252517ywc.4.1685617705408;
        Thu, 01 Jun 2023 04:08:25 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id v185-20020a8185c2000000b0056507de3d82sm6095279ywf.104.2023.06.01.04.08.24
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 04:08:25 -0700 (PDT)
Message-ID: <07ed5d8d-9d44-15a2-5a88-e0300291c7e0@redhat.com>
Date: Thu, 1 Jun 2023 07:08:24 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: Suggest monthly CTI TAC meeting on last Wednesday of the month.
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

TAC,

Joseph, David, Siddhesh and I discussed setting up a regular occurring
CTI TAC meeting to discuss open issues and current progress.

I've scheduled that TAC meeting for the last Wednesday of the month
in the 11am EDT timeslot. I've sent out a calendar invite to the TAC
for that slot.

Please review that slot and see if it works or doesn't work, please
suggest alternatives if you have consistent blockers in that slot.

-- 
Cheers,
Carlos.

