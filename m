Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B834F182A2
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 20:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 507DF42A3D
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 20:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 507DF42A3D
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XuN1fUqa
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
X-Spam-Status: No, score=-2.102 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ygYJUZsmTeWc for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 20:54:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4BFA42A35
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A4BFA42A35
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 20:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684961680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o2OHwQ6HvGV/jRbdhSSxzxffpoFPy43AhGP7w8sPjhY=;
	b=XuN1fUqaNSPS+8B8dCo3gj0o55SeVEp1P2oSbhy8KeOaJbnpci4yrQdrVzOpxCaBTkDRyx
	m7mqpJ2jWVbu1yle9TaoNvfDG75MeZOHEwdq8fegTf4tdOTup5TkjC/XBXLOlT8v5lppXD
	0LaKQlBItFd+qczFnokXqUOQKuZD8t0=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-RVj37VmaNxa_RWNZMb6RNA-1; Wed, 24 May 2023 16:54:39 -0400
X-MC-Unique: RVj37VmaNxa_RWNZMb6RNA-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-55d9a9d19c9so33511097b3.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 13:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684961678; x=1687553678;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2OHwQ6HvGV/jRbdhSSxzxffpoFPy43AhGP7w8sPjhY=;
        b=dsLdl6AqAqlWc1Gx3NIaWd4nLdXuo0E2J5Q/7iFlsnC56swO/meASOaD1mj9ibND4X
         RAbsc0iql2JavjS4yBTT3x3aSwrWOGTfDc7yDWatiKaQ9Io+xHAQgOFDKoxfzNAGuGQL
         Z2vYGUnMMwIKHr60qrR6Zs4dftJLQGK5cJEES6JPwYt8lnnLJtqYo12zXMoNTrnSyZ/Z
         ZBYpeXAzaeX8dt4TADqebFUmYKMvIj8cSL8SUmFwxxuWtMzCXfEDDtm7FNKS9nw5iad6
         tDZc6lIqhK/kjXR9jcDkWrPDevNZn30Vq/ZTOHEtKwUhm/1f7fZkuVt9iizmzAG3LODz
         BFUg==
X-Gm-Message-State: AC+VfDxy4+RSZSUMcFayyqvbaKHp2n0UzYhbjgSIgPd2/lQSTo4fooP3
	V6nSRLocDXyj54U6L9B4DH5R7KqxHk78iGz5CBu/XcuXhEpeNuZrq+nOiboovHjt0UN6Ao3sOa6
	Y+mf7NsP2b1TscR0Tc1U2qOMw5oBKE1VXrLvwvErpCCAfgModNW0qaa/JiOFil4ygiinWBDqz5j
	z4kTknmJayfoNW
X-Received: by 2002:a81:a554:0:b0:562:1060:f2c9 with SMTP id v20-20020a81a554000000b005621060f2c9mr20148619ywg.13.1684961678541;
        Wed, 24 May 2023 13:54:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ40dKYBpTJgwsaY2/wOJuqL9kNVLS/4pq1POXoaioKyUbJmAEsJ33dSPdoDDNQjAb/sgeYImQ==
X-Received: by 2002:a81:a554:0:b0:562:1060:f2c9 with SMTP id v20-20020a81a554000000b005621060f2c9mr20148605ywg.13.1684961678215;
        Wed, 24 May 2023 13:54:38 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id x67-20020a81a046000000b0054fcbf35b94sm3991526ywg.87.2023.05.24.13.54.37
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 13:54:37 -0700 (PDT)
Message-ID: <aa7bd278-fc56-0af0-c106-a2eb496111c6@redhat.com>
Date: Wed, 24 May 2023 16:54:37 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: Next TAC meeting on 2023-05-31
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I'm proposing the TAC meet again on 2023-05-31 at 11am EDT.

I've sent an invite out to the TAC.

If you didn't get an invite please reach out to me.

Agenda: 

- Discuss current status and updates.
- glibc: Next steps for glibc.
  - What to discuss with the community?
  - What to discuss with the GNU Maintainers / Stewards.
- Pick a time for regular monthly meetings.

-- 
Cheers,
Carlos.

