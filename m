Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BC11119D
	for <cti-tac@lists.linuxfoundation.org>; Thu,  8 Jun 2023 12:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B69EA402E4
	for <cti-tac@lists.linuxfoundation.org>; Thu,  8 Jun 2023 12:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B69EA402E4
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RNDd0fd4
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
	with ESMTP id 62h7micTfi0a for <cti-tac@lists.linuxfoundation.org>;
	Thu,  8 Jun 2023 12:10:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF8084025D
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DF8084025D
	for <cti-tac@lists.linuxfoundation.org>; Thu,  8 Jun 2023 12:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686226235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VmVL3IBnbgf1k/PIbfmOAa6lIgtLs/b2M0gtMx9WUS0=;
	b=RNDd0fd42kaI3DC16wEpKM7FOhjHGMQotmT9iaPY5G/0ZkPS1luml4PgkxZeci2KYNVBIG
	6ntob4U4MPYEA6KxhiRrDOT5UPJ+Y6pt0PMA7A9i/7DeMKY41oN395c9EPi0UBEA99WkRR
	cgr4DZ+g0nrgnEDSFq/NQELiGTI2s4k=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607--_yu9daQOIuZOo0d1-gbmA-1; Thu, 08 Jun 2023 08:10:34 -0400
X-MC-Unique: -_yu9daQOIuZOo0d1-gbmA-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-5651d8acfe2so7991767b3.2
        for <cti-tac@lists.linuxfoundation.org>; Thu, 08 Jun 2023 05:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686226233; x=1688818233;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VmVL3IBnbgf1k/PIbfmOAa6lIgtLs/b2M0gtMx9WUS0=;
        b=VSlKbPx5KeNUPMYiLn/R6EHlkMqKWE8ETNVu8Lu7jhqtlGKkLzoaWFcUga0FPvc9SW
         KMkr8/qukeGPFmDAXyszbNDIziTvbkS8b6DRM5Ziy2oQmYJbDfM/s6NiUuz0m/rCw/6o
         pOetoB1ZVekSVbIFFrN+m5QipPl5M+oJPX/3snW/JlSJQWHXR4EHz6BJEyp79fJ5TYbq
         yROaVhvhTkFkf1271/335WRScFQbNPSR6KHfbQVVs06/HRK8XKVZ7gOWRq0eBPcgm0au
         4zv9fS11G1BrOCH/aXI8o9mbpuFYb9PTaMRGQqI1el+peje06Csp1kgCUJH1fImtvlJK
         DhxA==
X-Gm-Message-State: AC+VfDxu8GRdqgOA67GkrH0x/w+OrAjCMnaYdajcpAfaOlCwQBS1hqEO
	1g3Y8iQZabDJVZSvLRt92cIEf6q0e64s9mDNMySLrvvOE4Jq2koeNn/odfbdbRRDMeqF2KWQPcZ
	m866X+c5Bo2FmLFurZd/GhaeHrG9Lwu6JKEwRlY+a20YaM28h2NyseKGNkssFNSh+NAn/YJNpRl
	njKLEdLdbarcio
X-Received: by 2002:a81:67c5:0:b0:561:d25b:672a with SMTP id b188-20020a8167c5000000b00561d25b672amr8704888ywc.21.1686226233535;
        Thu, 08 Jun 2023 05:10:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4csxT7FpW1lmZjiBxBUS+sESuhdfPwSmjnze7cHvjh5465dxfdxLOShICW52qkLOx7x+dytw==
X-Received: by 2002:a81:67c5:0:b0:561:d25b:672a with SMTP id b188-20020a8167c5000000b00561d25b672amr8704868ywc.21.1686226233188;
        Thu, 08 Jun 2023 05:10:33 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id w6-20020a814906000000b0054f8b201c70sm322801ywa.108.2023.06.08.05.10.32
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 05:10:32 -0700 (PDT)
Message-ID: <c008bed1-17d9-9735-fa0e-ab7041be7550@redhat.com>
Date: Thu, 8 Jun 2023 08:10:31 -0400
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
Subject: =?UTF-8?Q?Martin_Li=c5=a1ka_stepping_down_from_the_CTI_TAC=2e?=
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


In February Martin Liška stepped down from his work on the GNU Toolchain:
https://gcc.gnu.org/pipermail/gcc/2023-February/240694.html

I just spoke with Martin and he confirmed that this means he will
also be stepping down from his involvement in the CTI TAC.

With Martin stepping down the current CTI TAC membership is as follows:

* Joseph Myers
* Joel Brobecker
* Carlos O'Donell
* Jose Marchesi
* David Edelsohn
* Simon Marchi
* Frank Ch. Eigler
* Siddhesh Poyarekar
* Nick Clifton
* Jeff Law

I want to thank Martin for all of his effort to date in improving the
GNU Toolchain. Thanks Martin!

-- 
Cheers,
Carlos.

