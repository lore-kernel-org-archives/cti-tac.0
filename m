Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D7A6130
	for <gti-tac@lists.linuxfoundation.org>; Mon, 24 Oct 2022 19:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DD63405C4
	for <gti-tac@lists.linuxfoundation.org>; Mon, 24 Oct 2022 19:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DD63405C4
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=QuVsd4QM
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
	with ESMTP id gIl-XvNHomHv for <gti-tac@lists.linuxfoundation.org>;
	Mon, 24 Oct 2022 19:30:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B3A94000B
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4B3A94000B
	for <gti-tac@lists.linuxfoundation.org>; Mon, 24 Oct 2022 19:30:01 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id s3so6204587qtn.12
        for <gti-tac@lists.linuxfoundation.org>; Mon, 24 Oct 2022 12:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4myVdctnJwCvllkqmwZPrFVFU/p+oymZPvjSEb7Bq4=;
        b=QuVsd4QMnPiEtoosaW46aIoNI9ufbRI4JQae3VnvgiD4dSJSQd/UCRexC+fEUn0Wpt
         1D3gdRw4pORojdS/x3ptP54N7HzSoIP+mQSrFeH9oDwCo8zBKxfer1xn+VJAQ1wKtdIe
         cPtO53fDavhhAfneBmvfuAHvG0W/VuJcn9GFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4myVdctnJwCvllkqmwZPrFVFU/p+oymZPvjSEb7Bq4=;
        b=zkEXsFSmE+fWtcoItFfkh7UKPT6s6/KVubHVLULeU3KI67VfYwxalth2qT2w7Khqj4
         zDeye1JQzNgnA1oLeigl/cuKTCpopASo0tE9dw8/AHFm6nbEpfI/hJI9iqSqf1ijxA5e
         lf2zU83gYcN3z0JhqiW9eXSbI2Uig74rT8tYqFQ90u0yuBBaTfW9Y3ad4s0pG/3+6N8r
         TSF19GYUytZ9SzN1H+Jslk3+1BEM1XgBLCtH0op0ry6G5Du92wPE1/KB58gZNmuTDNvV
         xKCBYlT+UHgR+9HjkM2kXgmfSoi7EXgkKZ9jaDg7TDBcx6WYnwmPKUewS3ng/e7rzEX0
         reBA==
X-Gm-Message-State: ACrzQf17UQ0jjGY329S0IkayrHifahZlxG9iZKfLGL6WYxIxsL952PI/
	JzjL7KxQuJJqqwP9n6dHOPvdBe3+vfLsOXd3
X-Google-Smtp-Source: AMsMyM4lJ/xHn3IRLISMQYIQDnvYUxnzKv8PuS1Us1PVscjtihT2W/SVQA1quVNVayztDH+NSRJjfw==
X-Received: by 2002:a05:622a:1b8e:b0:39c:ec9e:46c0 with SMTP id bp14-20020a05622a1b8e00b0039cec9e46c0mr28576832qtb.329.1666639799959;
        Mon, 24 Oct 2022 12:29:59 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id y19-20020a05620a25d300b006ec62032d3dsm542832qko.30.2022.10.24.12.29.59
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 12:29:59 -0700 (PDT)
Date: Mon, 24 Oct 2022 15:29:58 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: gti-tac@lists.linuxfoundation.org
Subject: Test delivery
Message-ID: <20221024192958.ab3f5smfx5xl3q2s@meerkat.local>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

This is a test to test delivery and to start the archives.

-K
