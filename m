Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EAD474261
	for <cti-tac@lists.linuxfoundation.org>; Mon, 28 Sep 2026 22:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=140.211.166.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633121; cv=fail; b=uN033Yl60cVbO22N8R7p7HvlOuppFrM5GH22iRfXtMXMDyj+P/APjfTqJ2sqseDUNIz/Tyvp1Uzhbkv4eTJi/19gRjCJuPYGoVIN4dt9YiyViA2aNF0jSi4m7z3lBFMzJBcAeqQHaT49AW9ypVkP3w+ebOduzZ0h2PGXfjZmpRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633121; c=relaxed/simple;
	bh=J4DOSSHF2DnDZ2CqEh9ymdVVWCCWEjZAoQbqwUtzVw0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Du+8FRLc78lGsY7d5ThZcyDstiMTPaxFAtBnXVKf1KTy26D1cMdyeweGllp1PdDLkNwqej4C8ZQcX/dJrk4ud2K3KkBy/VEzXWy61RkbRsjdntRTPiCYyBfrqxCVpJozCnTKwrtiOXvQWHWE1t6oSwUPYOuW9JaMY0jbAc/Pfr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=Lzd5s2+B; arc=fail smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="Lzd5s2+B"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D959C80AC5
	for <cti-tac@lists.linuxfoundation.org>; Mon, 28 Sep 2026 22:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.37
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMZvYSUJ5mDP for <cti-tac@lists.linuxfoundation.org>;
 Mon, 28 Sep 2026 22:05:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EDA56809CE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=23.83.218.249
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790633118;
	b=qQtmb+7r48GOxUpG2ZaYgo+bLoOYTFB9dt3JsukNheqSGYfzd+QMXf1q7XrOXf4bYo7d
	 pKUAe/nqEUQzrjS67kO+9AlJltXhaNsp7Nxp8c2DLneqtefE3shyVBqXlC4SGH20Qopbr
	 /9AoPfYIQq55Hcm2bgbM4NZJBlK3iS6nBbFLZSa1/MCTniqvGcqQIQAb538yIdFiWfcck
	 jNq0P2QMk4g/14hnLgbrjmnJhoktkujLFu4vTSdtZsyhmkhGz9rlwktNC1aoHKSnLM5t2
	 njLHumu/3w/v1/xJNO/GXGrK5PXW2cdOUoGroRvtpde//Ujcjq8mVi/g1RCmI1hTZ5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790633118;
	h=Received-SPF:X-Sender-Id:Received:Received:X-Sender-Id:X-MC-Relay:
	 X-MailChannels-SenderId:X-MailChannels-Auth-Id:X-Dime-Invention:
	 X-MC-Loop-Signature:X-MC-Ingress-Time:Received:Received:
	 DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:From:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z+O6NNRa7ZNibCEx3+TFn0t4/2qze770pN6XdJh74kg=;
	b=FdWjdSJ+OVtgZ2WrrrM8gg/PP3bsT36HLQsWIaEP8/AAquYIIP1TwRJDgZj4sc3An5dG
	 rluMaplZ8B4zgpkjqAKRdjGKIJZWKhcYEyCwgn+OS01vcR7MkJJbdcABL1SqfdUQE/bbE
	 5YKrCPGoQMgVQv78mRFw/wVS5Qxl7+65wDdwR8T1rEn97n2F+PN2NhSrWbqrLyjVg2RS8
	 F9NTAQ9Fa7B9Ck5O67GpDC3JLb5SVL4roD6IAXdAeaDiwKSr141iYVa3rINYInuB+wM1+
	 55QjfO20xGJfHLx5f2Mfz1IXAaqMfmyURoVUmHVx31XZYUYNWN2Pfuic1xrlmGKUsKg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; dmarc=none header.from=gotplt.org;
	dkim=pass header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=Lzd5s2+B;
	arc=none smtp.remote-ip=23.83.218.249
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.218.249; helo=poodle.tulip.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=Lzd5s2+B
Received: from poodle.tulip.relay.mailchannels.net (poodle.tulip.relay.mailchannels.net [23.83.218.249])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EDA56809CE
	for <cti-tac@lists.linuxfoundation.org>; Mon, 28 Sep 2026 22:05:16 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D03BE4E2A98;
	Mon, 28 Sep 2026 22:05:12 +0000 (UTC)
Received: from pdx1-sub0-mail-a220.dreamhost.com (trex-green-5.trex.outbound.svc.cluster.local [100.96.3.213])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8744B4E2763;
	Mon, 28 Sep 2026 22:05:07 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Dime-Invention: 6a0a652f7077b2ee_1790633112581_2107252912
X-MC-Loop-Signature: 1790633112581:161721943
X-MC-Ingress-Time: 1790633112580
Received: from pdx1-sub0-mail-a220.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.3.213 (trex/8.0.2);
	Mon, 28 Sep 2026 22:05:12 +0000
Received: from [192.168.8.195] (unknown [38.74.41.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a220.dreamhost.com (Postfix) with ESMTPSA id 4htwN30lPxzQv;
	Mon, 28 Sep 2026 15:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1790633107;
	bh=Z+O6NNRa7ZNibCEx3+TFn0t4/2qze770pN6XdJh74kg=;
	h=Date:To:From:Subject:Content-Type:Content-Transfer-Encoding;
	b=Lzd5s2+BV2X2avrdBx+9Hzkgrot5Zk+zesjctjp24DBIKNjpa54gIJw5tSHf5EuNJ
	 mMzThxYo5P1RNcaJ+kQnpvSG/kAOwUZML+rPvZlzIx1yOhTYqR0lbMhZCmMWiobr3b
	 uR1MB4xq2Xmgc+xhMUQvrAFNvM49ACy5hG4UxWePI67TPrZ12XQ7emWD8ljEvIT5ue
	 fq/aKnNiw6I7tCFctSomA0LYR6C4Qk2EfVcNuqef9yEap99vZt/k97UjoogZ8H+l0a
	 nWH4XIOpfKOmmAZCWL4WW2uiRRJCMpW2iVkj/mMzuqvUFOoxeF2m0g4aqwfm96FGhU
	 eeTw1ap9Vqa/g==
Message-ID: <1e40ef07-8a23-4c86-a7a2-8cfb58fef525@gotplt.org>
Date: Mon, 28 Sep 2026 18:04:56 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 cti-tac@lists.linuxfoundation.org
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
Subject: cti.coretoolchain.dev misconfiguration?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Konstantin,

Looks like a couple of folks in the glibc community ran into a 
certificate configuration issue with cti.coretoolchain.dev.  Could 
someone from your team look into this?

https://inbox.sourceware.org/libc-alpha/31c95a6c-891e-4246-a27e-5070dd6af0bb@app.fastmail.com/T/#mc25a06064b3605e77f1fd80e9ef2cb1f3db8c45c

Thanks,
Sid
