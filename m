Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2425D3D38D
	for <cti-tac@lists.linuxfoundation.org>; Thu, 18 May 2023 20:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E27E8442E
	for <cti-tac@lists.linuxfoundation.org>; Thu, 18 May 2023 20:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E27E8442E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Qynl70Eq
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3SA8DVZpb040 for <cti-tac@lists.linuxfoundation.org>;
	Thu, 18 May 2023 20:09:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D965A81D3D
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D965A81D3D
	for <cti-tac@lists.linuxfoundation.org>; Thu, 18 May 2023 20:09:20 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-61b58b6e864so19568646d6.3
        for <cti-tac@lists.linuxfoundation.org>; Thu, 18 May 2023 13:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684440559; x=1687032559;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cMwPcbnbn5x9jtMU+QGrZXPWQIoFN4wV4yqu1xua9Ac=;
        b=Qynl70Eq1HFzN4lZoG+7jRFsgYS5kbxbeaOJ65B/8qWqHciIXRugwXaNHW/6IjqCYI
         LQWCOsoaqTzJiSqK+7rPvNLDPBbvKxIIBt1Z0pyGzmD3XcOdhtJtayGo7KnNagD6/xGq
         Bewc7nKP3nRFaRjimmX3zO3posmFNE1IRj+hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684440559; x=1687032559;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cMwPcbnbn5x9jtMU+QGrZXPWQIoFN4wV4yqu1xua9Ac=;
        b=eK/Zc5AU8hXs6RxE/SNFCCuKH7GSTIemrkZO7mZz2SYSmgNhQUBUQ6v1vjpQCyM7OT
         qmHIOYN4UxO8sZqGRQ2MmKjaOgPddv+KTRdsgpIC7REhpzFl8r8DQC5nSctqEoFjwShi
         nXzVN6xCA2m+07BifZBRV7jfRdWIu9OAo8P80KltW59tYKFFBLGt9F+JzJCchgZfKIom
         sVlTLx9Fr/VLYCn76Bdj5d/qO5PPfTu5/BfnRP7gRHu6O+uC4VQUqVBc0v3f9FbEIvJ0
         ZjXBLjYTJC3Ae4cxzyU2pXt9DfWPeZWzHoFUXux33EXVBLxIDT7+RXhyyfkIHAr2j5Dx
         uXEA==
X-Gm-Message-State: AC+VfDyEAiMGYB2IWAtRQ8PN9hFsKgnmNIrS8vSFCCaxvMIK+9whYevX
	/dv3wlWXMfZTPzmDcQRzlVGy9OlXhhhhq8MzRWmLAA==
X-Google-Smtp-Source: ACHHUZ56E6ArdVVCKUW3Bpm2rWwZvRYiAGsISlpbqEOvbH7/8xCIpMOP7+TDsX75TMCqPaBFJlxWsw==
X-Received: by 2002:a05:6214:19cd:b0:5df:47e2:8df5 with SMTP id j13-20020a05621419cd00b005df47e28df5mr519623qvc.31.1684440558982;
        Thu, 18 May 2023 13:09:18 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id p18-20020ad451d2000000b006215f334a18sm769405qvq.28.2023.05.18.13.09.17
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 13:09:18 -0700 (PDT)
Date: Thu, 18 May 2023 16:09:16 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: cti-tac@lists.linuxfoundation.org
Subject: List moved to cti-tac
Message-ID: <20230518-amaze-annoying-0ec185@meerkat>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

For a number of reasons, gti-tac is known as cti-tac, so the new list address
is cti-tac@lists.linuxfoundation.org.

Best regards,
Konstantin
