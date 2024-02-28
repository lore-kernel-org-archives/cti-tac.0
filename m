Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC39612FC
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 15:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709133850; cv=none; b=QUtRGYgW4STbTzeL1lapfwBdU/lSPCfKO1A622ekOJNsLl55khHwXiTPVBs9JvIcsOs/fSwRhPWIC+TMd2SMT+0w3ArHh+QM8M+tY3NT5JWt3N8Mbh0QsDXAxH4pb/z9/o8JGzcS2lQem+6lzj1eSke82T12f3ZlU8iHD6QN480=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709133850; c=relaxed/simple;
	bh=KfEYJ5Nmv5NdEfBjnvJUFMqqOJIM2VNZlir3KGNXCdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SF342XQhBweifY5KvcQdiBLxCDJi64biXaUX8+x+S+aIoZB8tyStf6GAj5K4wYgDdTuwgkSfdK030Xzp5ZlN9/Q8grnwslVa4esjyxEOou/Hg3FrB6eOZFIAraJjjbJrD77G8ZrchlLWIwjh5dxTSfCHrrTctVGmoY8mmxioWuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S1Pwo3On; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S1Pwo3On"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FDE182204
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 15:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BJhIQ-wIR05I for <cti-tac@lists.linuxfoundation.org>;
	Wed, 28 Feb 2024 15:24:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AFD56821FF
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFD56821FF
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=S1Pwo3On
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AFD56821FF
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 15:24:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ACD45CE224C;
	Wed, 28 Feb 2024 15:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7054C43390;
	Wed, 28 Feb 2024 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709133841;
	bh=KfEYJ5Nmv5NdEfBjnvJUFMqqOJIM2VNZlir3KGNXCdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1Pwo3On0eXSxmCanLhMY+ZD88P5SGy97CDIcDVPBQVLOvx3Ofs+yftFTe2WKl4Ru
	 t+RYI/8sfLLOoVWR3A2xSZ0H9MPHha5B3RxkvkmcTMD7h4WMH67DpyGiWkAZO9kE6i
	 OaIoRh0OZQB310d5I0IGXdAVFsNviTUqtcwSxOCY=
Date: Wed, 28 Feb 2024 10:23:56 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Next steps to turn on https://coretoolchain.dev?
Message-ID: <20240228-functional-impressive-pegasus-ee839b@meerkat>
References: <26fa2971-f3c4-4b92-b89d-9157e21f59b7@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <26fa2971-f3c4-4b92-b89d-9157e21f59b7@redhat.com>

On Wed, Feb 28, 2024 at 08:26:42AM -0500, Carlos O'Donell wrote:
> Konstantin,
> 
> I pushed an early sphinx-quickstart to gitolite.coretoolchain.dev.
> 
> I've got a lot of the next pass of content ready.
> 
> How do we turn on https://coretoolchain.dev?

I will enable that in the next few days. However, I thought the site was
cti.coretoolchain.dev, not toplevel?

-K
