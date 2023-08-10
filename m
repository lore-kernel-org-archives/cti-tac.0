Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1421E1C0
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 17:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 423B740298
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 17:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 423B740298
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=RJvLcd2S
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.701
X-Spam-Level:
X-Spam-Status: No, score=-0.701 tagged_above=-999 required=5
	tests=[BAYES_05=-0.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nh4UexnLHhSm for <cti-tac@lists.linuxfoundation.org>;
	Thu, 10 Aug 2023 17:32:28 +0000 (UTC)
X-Greylist: delayed 916 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 10 Aug 2023 17:32:28 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06820400DC
Received: from antelope.elm.relay.mailchannels.net (antelope.elm.relay.mailchannels.net [23.83.212.4])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 06820400DC
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 17:32:27 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 73A9750202F
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 17:17:10 +0000 (UTC)
Received: from pdx1-sub0-mail-a250.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id E2E75502323
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 17:17:08 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1691687828; a=rsa-sha256;
	cv=none;
	b=yaiETE7U67E3J2vmhCJyiELNjWSOHYg+JXyN8elF7PTy/z3FAPCXRuL/Yj155EpikXz+hJ
	sUW/q7bjJcUe39jDP5H3JUsntzIboqunbaybXVE2ao6JIQ3tpirzQNMFJlQBd9Xj1JvV9d
	eROm/q1kENOSWWc+fSVR1FcK5af+5E7JK84ykveXTkCNumZ6Mn8PQXjSJeCQnXzAJrNpxB
	Pl4wXsZEC+fVsR46kApH/iBOXcV/TFF5Qqm1EBPn3E20OAvNppTum9t144S8P9fguhZDvE
	1D3fvidDwwQErNETExPO8grChYT52bp+jIQZqXIMC3iQBuNq3sMled1SziXB3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1691687828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=HwSOZnZFnKtTi2KpxghZnv9OlYhsjETMaT3EKJUh11I=;
	b=DVwAvzNif8IUdjdkUOZgdtYV0KBaKcx2oHZJnrJTJDtU1qQQJhlW0BX84l+EQUtLpQxeeO
	GSsJ5bdNQin0mlZgaqKY5Mb0XQAG1PwfSoSyJ3kX4o/SMDyseHvPUJtUXDSzjHsOMS0TxP
	9FFhyTJQ95Yrz9tHJAs4jOBDUijZt2vFYiRZTbfgsTePGovmf0bsTQGufBQ6YSYh3BvRYX
	s6Q6d4gmck6g12TjCUm9zQBmiXnCZJzRBwjK0wO/fVCmVe5ybjqSxRQRnQxuOCTZmhuEcQ
	uH6k+t0rl3qqA0YD9egmxSWOob3osW4rCqVDiiL/k2Qij/7LWHP7mfkUNNlITA==
ARC-Authentication-Results: i=1;
	rspamd-849d547c58-rkzg2;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Abiding-Spill: 3d2af5d858144afe_1691687830296_2830624544
X-MC-Loop-Signature: 1691687830296:808304036
X-MC-Ingress-Time: 1691687830296
Received: from pdx1-sub0-mail-a250.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.184.201 (trex/6.9.1);
	Thu, 10 Aug 2023 17:17:10 +0000
Received: from [192.168.224.119] (unknown [24.114.69.242])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a250.dreamhost.com (Postfix) with ESMTPSA id 4RMDBD2455z65
	for <cti-tac@lists.linuxfoundation.org>; Thu, 10 Aug 2023 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1691687828;
	bh=HwSOZnZFnKtTi2KpxghZnv9OlYhsjETMaT3EKJUh11I=;
	h=Date:To:From:Subject:Content-Type:Content-Transfer-Encoding;
	b=RJvLcd2Spl9VSftEAELDgz4DELdF2y4aMb+AqsXj8o3m5V1qWOnRwabQAxm6pXBja
	 x1C6jARP2yVaejGNKE8i93aXfvrs0x5LfsR6CXBcW0dWeY2XFV/ZmpI+YrAUgY3pVJ
	 Guiw9xsEmDKu222ZNrIWrxjfIWBKzGl0jbihPdJLDbYmqkGdfDWcVWM06Wp8n7XUL8
	 SgSh/bTZDaJhsbZQi3d8+ON7hcqQFP3wGB8SAm00spRtq5AKPL0cj2sBbUps0YnH3d
	 AtkGrWnq/Kmnhk4SYMKYgGBlVmwcYw0bf6HWNTQPyczxQ5FFlBnIw4SVmiErJD4H2F
	 BiSC1/HSL3XcA==
Message-ID: <3b30c81d-e328-0379-d7b8-92bfbe322b39@gotplt.org>
Date: Thu, 10 Aug 2023 13:17:02 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: cti-tac@lists.linuxfoundation.org
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
Subject: Resources for glibc CNA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I recently proposed setting up a CNA for glibc and it looks like there's 
general consensus on us doing this.  As part of this set up we would 
need an email address (preferably one that can accept encrypted 
submissions from issue reporters) to reach the glibc security team and 
web pages to publish security advisories.

I wanted to know if this is something we could/should set up on LF 
infrastructure or if I should try and get something up on sourceware. 
Konstantin, does LF already have some infrastructure for this that we 
can share?

Thanks,
Sid
