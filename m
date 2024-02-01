Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE853D563
	for <cti-tac@lists.linuxfoundation.org>; Thu,  1 Feb 2024 20:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706820679; cv=none; b=cDlkRE2rlcN8bZOP+FU9psrdfrSXD//8mNJoUGO2tlmoYlUnI6KafUfO2Ubp/rk4x/SpttAkTxbu/I+Nhf6rR9Pd8Z4X0ZvNRD8ldl4dg0wTJgnB9qAGeYryMt4e+H6DXkTw1ziwULn4/QxY47sNKlpzNq3NlWA7CKCtm8inGFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706820679; c=relaxed/simple;
	bh=YPUHuXMmY0/bh9ta9AaFvLu9dSV8Esp8KPHcPB6bQ9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6s4bkFQdpci+2dNWgd5w85TTAgek2CrgZKQOMJDdyNNAQiIvfHuG7H4fV15quuu4D8M/tB5H7hNMrq4DER1smSLdmiJktb3255X/9Z30zTJTtaQSnZ0JO7J7n01GileSsoF4GaEWE9eanrz8fck2Nes5VjmDMz5s/S9ZoffMfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=c9w9zkwA; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="c9w9zkwA"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 059F484552
	for <cti-tac@lists.linuxfoundation.org>; Thu,  1 Feb 2024 20:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 059F484552
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=c9w9zkwA
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZV93ppMjEIR for <cti-tac@lists.linuxfoundation.org>;
	Thu,  1 Feb 2024 20:51:17 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4857283E88
	for <cti-tac@lists.linuxfoundation.org>; Thu,  1 Feb 2024 20:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4857283E88
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4F5C4CE28A2;
	Thu,  1 Feb 2024 20:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F536C433C7;
	Thu,  1 Feb 2024 20:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706820672;
	bh=YPUHuXMmY0/bh9ta9AaFvLu9dSV8Esp8KPHcPB6bQ9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c9w9zkwA26DOVNp7WXf4PHF/Opzd8W9LNmA+Tw9UOsklDR8+ujTifZk++d4NJJHCi
	 UHPOeKBGglVe/PSlH9IRol/cZ8i1mvQ+QyMn9H24Xq500QM9W7QiMbPdhhBEyC/H5y
	 wdmkA8uKQLgA7mnzK0i+4rvvRk5kSf1xd8O9Wz3k=
Date: Thu, 1 Feb 2024 15:51:11 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Siddhesh Poyarekar <siddhesh@gotplt.org>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Gitolite access
Message-ID: <20240201-large-passionate-hog-cd3b3c@lemur>
References: <20240131-angelic-positive-goshawk-ca6e87@lemur>
 <bd9a1d59-b4a8-4ebd-8ca5-80ae6c0fd84f@gotplt.org>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bd9a1d59-b4a8-4ebd-8ca5-80ae6c0fd84f@gotplt.org>

On Wed, Jan 31, 2024 at 05:34:59PM -0500, Siddhesh Poyarekar wrote:
> On 2024-01-31 16:26, Konstantin Ryabitsev wrote:
> > Hi, all:
> > 
> > I have completed the initial gitolite setup. I have the keys for the following
> > users:
> > 
> > - carlos
> > - josmyers
> > - siddesh
> 
> Would you be able to fix the spelling for my username? :)

Yes, sorry about that -- fixed the username to be "siddhesh".

-K
