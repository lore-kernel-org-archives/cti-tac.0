Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348DBAD28
	for <gti-tac@lists.linuxfoundation.org>; Thu, 13 Apr 2023 16:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A92A8418B3
	for <gti-tac@lists.linuxfoundation.org>; Thu, 13 Apr 2023 16:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A92A8418B3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eHfgCxy+
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
	with ESMTP id C-QbwR8P5H1e for <gti-tac@lists.linuxfoundation.org>;
	Thu, 13 Apr 2023 16:09:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0E0241867
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C0E0241867
	for <gti-tac@lists.linuxfoundation.org>; Thu, 13 Apr 2023 16:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681402181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gJh4vcehOeYa4jzTQxHtaf6IoC6d49R++wPIFIdRzrE=;
	b=eHfgCxy+FAMRiBy8LMlTN2VDxXBxHfDt2W4q194qrUdrdsfDL6rRcemW2jlsBe2EI1LWlE
	q7hv+BopCPdE8UIgRb3E56gOhYF1QpIUdH/qo7zU9jlpa5B2Zmu30xpdtOy4C/TliGnPue
	eWKgyFqkJwNN6hVykw7YP6fRwSxyrRg=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-fryLv_eGPICd4c15mzLYTg-1; Thu, 13 Apr 2023 12:09:40 -0400
X-MC-Unique: fryLv_eGPICd4c15mzLYTg-1
Received: by mail-yb1-f197.google.com with SMTP id b5-20020a253405000000b00b8f66e29f5cso807733yba.21
        for <gti-tac@lists.linuxfoundation.org>; Thu, 13 Apr 2023 09:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681402179; x=1683994179;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJh4vcehOeYa4jzTQxHtaf6IoC6d49R++wPIFIdRzrE=;
        b=hXqt/PguQH8jy027t2Lsx3zo1FB0/xfNA197NiGmn84jStHjhcFOHCq4Rn0IqoFQRe
         f5X7CNdwVygA8S6G4TqumzJQ5i7Nuw+MytPz71KHSj93TvhboKQG7i7DLDxMLdgpXE/R
         Ahd7jHAn3FeIedEWKZkAVYDnQD6sFeI/dyFmoyFQZC6Yk28wuMa9aB1I3e5QJUBa7m8M
         +AIlP7UJAIxEsf1d7LgGGQzYFqlcJaPFVVfJ9B6ldiz1HjcPh28px3dDfBT2o/vO5jDH
         2286BwMJbQaK01w55UnF1Yn129MHvziAwfSWAhsjhK91SKlvwmuElbHgGhYTpMY/Swhb
         lh9w==
X-Gm-Message-State: AAQBX9cAd71eFbzZiPvA0WMbNTZYnS2Kd0jCmk+U8LeGkbDJDCsMwjnq
	8FaEx3i/gaGu++YSf9OYxSJPtS8g+yQMxdd1ww9aFbhapSWmSxtZcFrz1JEzog0iRFg7c6MwCsw
	7Oyq6Moc9S6XyMXxHlj+jhOGBYcKXTjDmmi9QTqFB5HMmqrJmZWVO71vh/UWgbw8zyIuCEDs03U
	MfKS29jP3DQLtP
X-Received: by 2002:a81:8282:0:b0:54f:ba89:225d with SMTP id s124-20020a818282000000b0054fba89225dmr2536308ywf.19.1681402179531;
        Thu, 13 Apr 2023 09:09:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZgrbNNFOEaHBOn5o2OguIeyyWvA7WmOM7J+WWRdHeLPcPpNl4ttkm0+Dod5eR8n8a47dqQaQ==
X-Received: by 2002:a81:8282:0:b0:54f:ba89:225d with SMTP id s124-20020a818282000000b0054fba89225dmr2536284ywf.19.1681402179204;
        Thu, 13 Apr 2023 09:09:39 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id r13-20020a81760d000000b0054f9e622741sm530812ywc.143.2023.04.13.09.09.38
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 09:09:38 -0700 (PDT)
Message-ID: <13d0e480-22f3-a7c7-4c47-b9e046aacab5@redhat.com>
Date: Thu, 13 Apr 2023 12:09:37 -0400
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: gti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: Welcome Ian Kelling!
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I just wanted to extend a warm welcome to Ian Kelling (FSF)

I added Ian to the list at his request.

-- 
Cheers,
Carlos.

