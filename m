Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38050156F43
	for <cti-tac@lists.linuxfoundation.org>; Mon,  6 May 2024 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715014992; cv=none; b=XGZJBoOn/gusv2y1YCWKFd2ArngXWFFKoahFxJ7CMVYhFux0renqp0ye60LMVVB62MrIBvH34rFzUB5YP1b/fdEaDN/XNMDNv8htjY+/0158uTEm6q/7Ifz3OSM3Y8W2pm6mtiZfIItAkAeh5tmLp8G2VixVhPhFRL0pmzxy2kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715014992; c=relaxed/simple;
	bh=88t3J+w0Z+MmJgUEoAuVS1//wfgfAlNzZVQvyw6mVT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tYuEy1p3gOH0mR3mNdwIDWQBmVP9xSa6bQXeC/niuCobAX8o0WYRY5Q3Y4T4Q17LTV8vBZEECi+KCvwE9x+YuKVKi/yX2SiQ0eM/cfyhbkNaN0tDwIOXl8796f4TpbvzY6z9X+vmZ5rAdK6obrAsPDa/OPRM+7lmo8SGOHfNn/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=adacore.com header.i=@adacore.com header.b=BNY6SMss; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adacore.com header.i=@adacore.com header.b="BNY6SMss"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B85440454
	for <cti-tac@lists.linuxfoundation.org>; Mon,  6 May 2024 17:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaHDoUsdvFIL for <cti-tac@lists.linuxfoundation.org>;
 Mon,  6 May 2024 17:03:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=brobecker@adacore.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CED7040359
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=adacore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CED7040359
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=adacore.com header.i=@adacore.com header.a=rsa-sha256 header.s=google header.b=BNY6SMss
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CED7040359
	for <cti-tac@lists.linuxfoundation.org>; Mon,  6 May 2024 17:03:09 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1ec4b2400b6so16774645ad.3
        for <cti-tac@lists.linuxfoundation.org>; Mon, 06 May 2024 10:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adacore.com; s=google; t=1715014989; x=1715619789; darn=lists.linuxfoundation.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lk2CLzh1bWyfj+/sU8v2lflDM1qZ/plG2NLfQwOo9Ro=;
        b=BNY6SMss8AoSVlkS4Op7pd5PFAGWQt68hsifnZhOGjvvW7Y+AztTL+luFYAPIBjguB
         vDolzzFPZRWYxr9OksaMhlwXhUe7D0Mhxa1N/s+0a9ZqCbJq7HENx4dxju187C0lW1zb
         Js7QP4d4/hE3juC27299brRLAxu7TmF4K/ffOyEVcnd4joY2SR+C/lqbNM8M0mPTn6K+
         Xtiab33vAMTBhTbITw2VF9GJ07aBr/fPIxanWnEAQux1ivOOcTfCHKgaZtpef+dqKkqP
         N67KO6vsaQyoAJRjj7Lfa6R+b4ibN7XQQqOs39k7awTwjlBGSHAU2rwXUAfDFCWFVVW/
         xCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715014989; x=1715619789;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lk2CLzh1bWyfj+/sU8v2lflDM1qZ/plG2NLfQwOo9Ro=;
        b=CKhT1a5v6/KL8m+45Jgr56qFbaScwQYlM5k+yGFbWiWYoE4u7hyUxsd3tbZFJnkMnk
         1XNLkUmFse/x5AIZFz247OygkoDTr/ZL2yYx/xPhRzXNa0kpM98XDttdW5+uhHoO1x8A
         PplNoMU9wPAZKjFWVgwXoQZY5LTnpVzEy9hWN4LkpEm60Pu6N2ZrNCZO5fF7zWovNLEP
         Pf/vdtzMEnCPCJcwF3RdRrINeD0Tx6GgSXckB0+aKcCaza+81e+0FN3KZqqkLxbXfVqJ
         9PYiz2rd33xmDPe6+Xh+muE99HNpPXuTQWUcFukGVK6XTQevQ3UCEu9nzN29CF3SOAZj
         X9fQ==
X-Gm-Message-State: AOJu0YyIcIRA9VNo5pFg8ynDwXcoot9fmdDY/akagL82WAnziZFGkeFk
	A0C9MbtjXB3Ow2qF3mGl9P5VPGmhwLvfnvhe7R+zfIvED5pgGClp2hJ/6OC5
X-Google-Smtp-Source: AGHT+IHJwOHqiXHGpa8i1w5iNC0wBLqIQOK71FkMTKaMHaz1pQsQe1FaZHVmr+GrIfAUrFk3w2tAmg==
X-Received: by 2002:a17:902:d345:b0:1eb:75de:2a5b with SMTP id l5-20020a170902d34500b001eb75de2a5bmr10781209plk.62.1715014988539;
        Mon, 06 May 2024 10:03:08 -0700 (PDT)
Received: from takamaka.gnat.com ([184.69.131.86])
        by smtp.gmail.com with ESMTPSA id mq12-20020a170902fd4c00b001e25da6f2f2sm8501809plb.68.2024.05.06.10.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 10:03:07 -0700 (PDT)
Received: by takamaka.gnat.com (Postfix, from userid 1000)
	id 3941C81892; Mon,  6 May 2024 10:03:07 -0700 (PDT)
Date: Mon, 6 May 2024 10:03:07 -0700
From: Joel Brobecker <brobecker@adacore.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Joel Brobecker <brobecker@adacore.com>
Subject: resignation from CTI TAC
Message-ID: <ZjkNS7VkI3am/6Fr@adacore.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

A short email to let everyone know that I am resigning from
the CTI TAC.

To give a brief explanation, this is what I wrote to Carlos:

> I think it is time for me to accept the reality that I haven't been
> able to make any contribution to the group and I don't see things
> getting any better with time. So I think the right thing to do is
> to make it official and resign from my position with the group.
>
> I am very sorry that I never really was able to find the time to
> participate. I hope you'll be able to find someone else who can
> invest himself in this project.

Thanks again for the opportunity, and my apologies again for not
having met the standards I expect of myself when part of such groups.

Wishing everyone in the group all the best!
-- 
Joel
