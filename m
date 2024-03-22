Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B759654919
	for <cti-tac@lists.linuxfoundation.org>; Fri, 22 Mar 2024 15:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711123068; cv=none; b=QNXioq8KoAx+wSFgQweWkFbvq/6HZ+C2uFFMzC/NLTFus4jEpre3cBXHVBZzTVmhORI/rCK/6SqF1TCCDRN/eavBwGWZGeAqxtyy9ERRtSBF08tv44UNVHqobgbgXg3c+vPZhtmKGpIsue1BTUGz7rxCO5PO9KZHRWUWs6fKVYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711123068; c=relaxed/simple;
	bh=HmBKaZdTzB8bIKmWznfHw6hJhhQtAr9MS/yoOzrYrWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEYutmuaSabbBQ0pRce6HDYtsZDctyK5xzbwzhTrfokcKgv9DkYeldPt+VN+/gv+HukwLSE+eFVqfF6yBtzWn6xXB/Ei/8poGeLIHCupcZ0WfDTJpjaC1GWXUDm6ChJXKfwg/LhgCtIDC8RFDHKFXn8aqJPVbmY46F0iaS9pfME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SaTnVgXZ; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SaTnVgXZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A62982E19
	for <cti-tac@lists.linuxfoundation.org>; Fri, 22 Mar 2024 15:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wnbZ4iOwGVpm for <cti-tac@lists.linuxfoundation.org>;
	Fri, 22 Mar 2024 15:57:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5854282D12
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5854282D12
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=SaTnVgXZ
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5854282D12
	for <cti-tac@lists.linuxfoundation.org>; Fri, 22 Mar 2024 15:57:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7DAA3CE1750;
	Fri, 22 Mar 2024 15:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93022C433C7;
	Fri, 22 Mar 2024 15:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711123061;
	bh=HmBKaZdTzB8bIKmWznfHw6hJhhQtAr9MS/yoOzrYrWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SaTnVgXZAKP7gFIFsfPJTPm9UsV2YaALkidIrutWyHNeyyT1DYgy5nuPOtxzsu+XA
	 k5POkNgmF2/OUhKk8FWfMtYMqU+jFVfkoI9+tOQ/1VtiBH/JR8oSl4sk336FCep+4R
	 c/sE+3TdgGJahdB53HMhnJLLNXQiwZAQCKux4Lys=
Date: Fri, 22 Mar 2024 11:57:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Ian Kelling <iank@fsf.org>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: My suggestions on auditing that services are running free
 software
Message-ID: <20240322-bipedal-nostalgic-adder-fec630@lemur>
References: <87zfuqcvlo.fsf@fsf.org>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87zfuqcvlo.fsf@fsf.org>

On Fri, Mar 22, 2024 at 04:35:13AM -0400, Ian Kelling wrote:
> I suggest that CTI come up with a proposal/plan for how to implement the
> audit. Eg, checking what software is being run and that users are able
> to download a copy and that it is free software. The FSF will be
> available to review the proposal.

Before we go down that route, please note that LF IT does not provide backend
access to third parties, so any audit plans will be limited to auditing
documentation.

We, of course, comply with licensing terms, so any AGPL-licensed software
(such as public-inbox) is available for download (we run the upstream version
without any modifications). Any free software without such requirement may
have basic version info, not necessarily down to the exact patch level. For
example, I doubt anyone benefits from knowing the exact version of Postfix
used to send this mailing list message.

Best regards,
Konstantin
