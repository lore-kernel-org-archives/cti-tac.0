Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7E27B
	for <gti-tac@lists.linuxfoundation.org>; Tue,  1 Nov 2022 21:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5582080C21
	for <gti-tac@lists.linuxfoundation.org>; Tue,  1 Nov 2022 21:28:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5582080C21
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sd9THnEO
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
	with ESMTP id XK2rqkxoKt9V for <gti-tac@lists.linuxfoundation.org>;
	Tue,  1 Nov 2022 21:28:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 792AA80B1B
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 792AA80B1B
	for <gti-tac@lists.linuxfoundation.org>; Tue,  1 Nov 2022 21:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667338079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uFFadZgqV8eQvOOELhnnbxgR4PUVERgUE34gV8+2ciA=;
	b=Sd9THnEO1xCUfa5aecdSmo7r2C0i18oGnxp+IBbAWKtjb7OTkxXvAoXlYas0gvVxAWZrCw
	Eo7GaXuvcbCE4AD4pXSbDo0B+pBom1wNmm6KZymEhTGf5gBPVTXQuJjfEKQ1Eh2yxCgZMx
	+PNi1a9O4FH8DeYRjG/zjEFvawgJpf8=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-486-lvVz0xj1OySG5KM6Aqcb7g-1; Tue, 01 Nov 2022 17:27:58 -0400
X-MC-Unique: lvVz0xj1OySG5KM6Aqcb7g-1
Received: by mail-il1-f198.google.com with SMTP id n8-20020a056e02100800b00300906a2170so9628790ilj.2
        for <gti-tac@lists.linuxfoundation.org>; Tue, 01 Nov 2022 14:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uFFadZgqV8eQvOOELhnnbxgR4PUVERgUE34gV8+2ciA=;
        b=7aeZahlf7+To+NUWGZqj8AVzzur7cGRrBn8CXALlqNO5Wqdhm8UI7w1k1Tb4qNs+GW
         7RV9arTDMF/Tauz4lQbJjUasSJE/0EPYmtb6syOtqApz41cOjq3Kd60NUG3HqYh8c4zA
         JgMZ6h67NUlbb9dCMkvy1P+DABpVteACKTpFnFU1KZjWG823TVQ2gsUTrzFBbz73sJ78
         7bM9W7+6RlaQb6WyW9UWJlgEi8iZtVW6bJO6kqPtelc8qtoT1Rr6Ef1g6nsjue+k01jZ
         9Zft92Merwq//2moS8kdfdN9cUcKWJUTdVda40GMQZY4EDoHtu78KlyEJ+g5vzktveDK
         m2fA==
X-Gm-Message-State: ACrzQf1moF42S56QmIRB6N/5/pfJ79hQIkwt829Z2S2rgQCfkadpyw8a
	DF6gU4LSHyJkn4qxJLmvyW1d36RnS1d+yuysUs0A2ez0IEMX7x0XxZxQpwlrKcJ3RL9U3CX8SL/
	ylW0hDIFJMdoCn0zkbv3x1XRhsd/4KTU=
X-Received: by 2002:a05:6e02:66f:b0:300:c8e1:5a98 with SMTP id l15-20020a056e02066f00b00300c8e15a98mr1501341ilt.173.1667338077386;
        Tue, 01 Nov 2022 14:27:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5J1x2OCDLmBACrLegjVJlCDJIJZArWjIK2iX5/pk7b10IGcL8cZ08pSD2Zvme81CFgTsMdGw==
X-Received: by 2002:a05:6e02:66f:b0:300:c8e1:5a98 with SMTP id l15-20020a056e02066f00b00300c8e15a98mr1501327ilt.173.1667338077129;
        Tue, 01 Nov 2022 14:27:57 -0700 (PDT)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id t4-20020a92b104000000b002ff32b2ab1esm3915838ilh.1.2022.11.01.14.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 14:27:56 -0700 (PDT)
Message-ID: <25877c78-d2bb-9107-01ed-c0b7a852dbea@redhat.com>
Date: Tue, 1 Nov 2022 17:27:55 -0400
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 gti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: Technology for hosting the next GTI TAC meeting
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Konstantin,

What options does the LF have for FOSS meeting hosting?

Are there any BBB instances currently running that we could use?

There does seem to be a SaaS instance of BBB via Think Modular:
https://think-modular.com/en/bbb-simultaneous

Thank you for help!

-- 
Cheers,
Carlos.

