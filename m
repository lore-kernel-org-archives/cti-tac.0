Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7643932C3
	for <cti-tac@lists.linuxfoundation.org>; Sat,  5 Sep 2026 16:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=140.211.166.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788626324; cv=fail; b=kNqAM7vRCrs9I7/WfdgHNzl+0Dy5tuDAbUH4r2EV/OfwTUaFUOABR8VU+WXMj5Qj6a88Zlx19XoXmB//SXZJrz6e7dPTxfZ1FmuPoAMq0cJiEBQa9ASbs08aZRCCrDBpUanCUojFOod4SzbVipAlHvvUh7lIZIPonjTwPQuT8Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788626324; c=relaxed/simple;
	bh=uuj5YQdcSZ5OQ8x45z9lpfs3bMa+/xIlzy7iJodOxxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nc9sD0G/6z3hKFKwydFAcdl0GbnXlaA+ISWYd4rZy/m0UYsyxlwsp8qYz4lGtloy4Jao3iImIkF8WckyOxSdtGbj7BXT02Hdhiy4Jsv6BRBUBcfNmxkgGe7iDlhp7z/epipvw+lirXYk8F/bPdQcYrhvxP/fcdN514UNlx68ARs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=bLZ25l9F; arc=fail smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="bLZ25l9F"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF7F381016
	for <cti-tac@lists.linuxfoundation.org>; Sat,  5 Sep 2026 16:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.04
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oGnZVXnzblZv for <cti-tac@lists.linuxfoundation.org>;
 Sat,  5 Sep 2026 16:38:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8698581010
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=23.83.218.249
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788626321;
	b=YnI4XHCg/Jj7QpzOCjfMb9vqYJpMzWHLeMrtGb7aVkk3Xr60A+gDz/Iz8MG1ewPwRYxq
	 kXp8IVheKCkkPXW9YC2Gmh3qWWnioitQiB/Na1bE5X/C8q/jFqZsuQuaJh1I3niB0iwvm
	 yGqtSzYdttrXmLHSYrV9Y/ulzWEkMFZvqkROxUA8b1uEbsAtFWKL6xj6BBR7yp/R18GtL
	 bV51MwSfKmp0Ne0T2ed4ehhXf5aIMYksjbmEWvXrmCtikNxNF1PLwIULt9jm1SQXG1wfh
	 Qwj75g0tIJ3kVnJmZsJd31Os8yJeXjK7A9gcXV8kqHBj24IXngzAWJHheu9dfcm/rsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788626321;
	h=X-Greylist:Received-SPF:X-Sender-Id:Received:Received:X-Sender-Id:
	 X-MC-Relay:X-MailChannels-SenderId:X-MailChannels-Auth-Id:
	 X-Shrill-Celery:X-MC-Loop-Signature:X-MC-Ingress-Time:Received:
	 Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=3X+17DFwout58al46AZBwkDST7pIKv2sP7mlGL1e1zU=;
	b=mOkQjDgoNHQMzhLrfNuD+LKMqCD/1kOw448n8byUchT6WbjVPH7ogGzKpTAkWfq9mEZX
	 44Y78ZND5d2O2ncNXbjRlyIqazOWwmSnS+OrSU+o1Pjwq65AOu8E1eaWXPzE6d/loq6cf
	 k5ALPVyfyFnFsGwZ5ramGUzOaKiuZFdJpOcOOXwKt+V3RnmRLEU89aZMNaJK+GxoDcFsK
	 u8E3pNrZQa4dIGaYv7Jtd2RRKEQFKmi/EyXCp/X04JyT2GLES3avsajgeRlgbAn2IPktH
	 nZ/HPVfgcryqsZArt6kVH64rxn6mhYMq1PI573wPe0boFdmbxZe5ZshKjKLWt0co0Yw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; dmarc=none header.from=gotplt.org;
	dkim=pass header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=bLZ25l9F;
	arc=none smtp.remote-ip=23.83.218.249
X-Greylist: delayed 534 seconds by postgrey-1.37 at util1.osuosl.org; Sat, 05 Sep 2026 16:38:41 UTC
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=bLZ25l9F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.218.249; helo=poodle.tulip.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
Received: from poodle.tulip.relay.mailchannels.net (poodle.tulip.relay.mailchannels.net [23.83.218.249])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8698581010
	for <cti-tac@lists.linuxfoundation.org>; Sat,  5 Sep 2026 16:38:40 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id CE326615AB;
	Sat, 05 Sep 2026 16:29:44 +0000 (UTC)
Received: from pdx1-sub0-mail-a257.dreamhost.com (100-98-23-243.trex-nlb.outbound.svc.cluster.local [100.98.23.243])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8E2B8615B1;
	Sat, 05 Sep 2026 16:29:39 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Shrill-Celery: 340390104d910ba4_1788625784626_116825044
X-MC-Loop-Signature: 1788625784626:2785160185
X-MC-Ingress-Time: 1788625784626
Received: from pdx1-sub0-mail-a257.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.23.243 (trex/8.0.2);
	Sat, 05 Sep 2026 16:29:44 +0000
Received: from [192.168.8.195] (unknown [38.74.41.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a257.dreamhost.com (Postfix) with ESMTPSA id 4hcf1Z6wVFz103V;
	Sat,  5 Sep 2026 09:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1788625779;
	bh=3X+17DFwout58al46AZBwkDST7pIKv2sP7mlGL1e1zU=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=bLZ25l9FDxCw93iQS87MfUahA4aER73WVeB1mZ9OF7EYg/llJucw6jmMEYCYDvgF4
	 F1I195p+DjxrkFyRabkkSJSJMwJdmTU/DAzZ1O+uxQKiMum65TAGfLUmIfTDSST6pJ
	 hwVynx+/9c9RmPJd1NXodzxFEUvLZeZJX/cAsQYxshmZ9aQMSqQt+ZknMHk8C0Bsvc
	 ExvrlbBFvNjIfUVqj5Ec/mEsE/YkoB7AUvr0p7MkbTONyKwEVJ46fPKVOK7UGnasGt
	 jetUPXU9Rtek1f3JZjzH6DuDtJrlNw3mkKU1XIstmu9P1eRW2oS0EBT5/9e1m01PoK
	 bIemTWtL7XU+Q==
Message-ID: <3bb34e0e-a91d-4233-9383-c2b750485709@gotplt.org>
Date: Sat, 5 Sep 2026 12:29:26 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] glibc: Update meeting minutes and next office hours.
To: Carlos O'Donell <carlos@systemhalted.org>,
 cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
References: <20260904213350.1827805-1-carlos@systemhalted.org>
Content-Language: en-US
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <20260904213350.1827805-1-carlos@systemhalted.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-09-04 17:33, Carlos O'Donell wrote:
> Signed-off-by: Carlos O'Donell <carlos@redhat.com>
> ---

Reviewed-by: Siddhesh Poyarekar <siddhesh@gotplt.org>

>   source/projects/glibc.rst | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/source/projects/glibc.rst b/source/projects/glibc.rst
> index 71e80a7..f841fd8 100644
> --- a/source/projects/glibc.rst
> +++ b/source/projects/glibc.rst
> @@ -27,6 +27,12 @@ Future steps in the migration plan include:
>   
>   Meeting minutes for Office Hours for CTI:
>   
> + * `2026-08-28 <https://inbox.sourceware.org/libc-alpha/ea0733bd-7d03-48be-b2d5-77587540789e@redhat.com/>`_
> + * `2026-08-21 <https://inbox.sourceware.org/libc-alpha/ef616950-d7f9-4d56-bfbd-941813b5d1de@redhat.com/>`_
> + * `2026-07-31 <https://inbox.sourceware.org/libc-alpha/a9306858-0d9d-4ab6-9e89-1a36beefa435@gotplt.org/>`_
> + * `2026-07-10 <https://inbox.sourceware.org/libc-alpha/1ed184a0-9aa1-40cc-be01-46c16142f26d@redhat.com/>`_
> + * `2026-06-05 <https://inbox.sourceware.org/libc-alpha/03c54212-5f7f-4dc8-a9de-e1f3df65090e@redhat.com/>`_
> + * `2026-05-29 <https://inbox.sourceware.org/libc-alpha/2bad4ca0-ac19-4c49-98a6-eca20968ccab@redhat.com/>`_
>    * `2026-03-13 <https://inbox.sourceware.org/libc-alpha/b158b348-a8e0-4b80-8795-ca926d10f14d@redhat.com/>`_
>    * `2026-02-27 <https://inbox.sourceware.org/libc-alpha/eabfe0be-7e59-4484-b4bd-248f4fd3682a@redhat.com/>`_
>    * `2026-02-13 <https://inbox.sourceware.org/libc-alpha/41a4d52e-e890-4a12-9046-92f1a6f51eaf@redhat.com/>`_

