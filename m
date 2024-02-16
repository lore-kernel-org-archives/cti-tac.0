Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70FD433B0
	for <cti-tac@lists.linuxfoundation.org>; Fri, 16 Feb 2024 19:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708111463; cv=none; b=Nt1q7EUmvPOtuWSdQLJZoURXbKxzFCW+70kECovjfh25BrmLLYGrqDaSZcd+Ccsum4cxZBFwoj1kk3YluUz6+XGMDXJio4Aedm2nSj4PD+uOXQyWkSKEHLqRavpos+tcuNUfNqmYCXFOjwiFKTeB7bpYCFfcnSWJeEjJ6wdVWnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708111463; c=relaxed/simple;
	bh=CoS8XYGxP8mPZUsm7lJtDq9uJfxDTCkedT5f9xf8Xp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OEjy2aBmQe6fsS0/3QSH635+HZ7L20wb+ViMnAPFzbYIoxwo++52yepTXtIpo96PRnHBtKFIHo7yQ7dOPMZCdDvyjB92DYtQsbJt7YBRWJl09hh3lYahe/OOxvrZ9zdQZ6eRo3khx1xPqI7Wrrlu5SIw32Gu3UuE3c93B1NADZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tjtbDKpF; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tjtbDKpF"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 493AA84125
	for <cti-tac@lists.linuxfoundation.org>; Fri, 16 Feb 2024 19:24:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xNoHOkYIRHV2 for <cti-tac@lists.linuxfoundation.org>;
	Fri, 16 Feb 2024 19:24:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E40584124
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E40584124
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tjtbDKpF
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6E40584124
	for <cti-tac@lists.linuxfoundation.org>; Fri, 16 Feb 2024 19:24:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C74262083;
	Fri, 16 Feb 2024 19:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61E9C433C7;
	Fri, 16 Feb 2024 19:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708111459;
	bh=CoS8XYGxP8mPZUsm7lJtDq9uJfxDTCkedT5f9xf8Xp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tjtbDKpF2yvZuo0ygXfuwsiLaUNNCvTVGtkHd374mjhv+UjkWqsTJXhWy9pokFkYB
	 Wh5ZtJdhJnq6trIcEZxsaq3ahckNRyNPPHEqKAwYrFVxEC/60jBtQnVazhEYkWcO/D
	 RPIqRj/4LMtLeil1sP02eUTQUA+9K4xbiDtiTnJg=
Date: Fri, 16 Feb 2024 14:24:15 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: Minutes from Key Reading meeting on 2024-02-16
Message-ID: <20240216-uptight-ultra-fossa-12052b@meerkat>
References: <7cbc3da4-e129-4922-8636-632e7c64227d@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7cbc3da4-e129-4922-8636-632e7c64227d@redhat.com>

On Fri, Feb 16, 2024 at 12:38:20PM -0500, Carlos O'Donell wrote:
> Meeting notes:
> ~~~
> * Carlos and Siddhesh were present to confirm that David Edelsohn on video was present and actually there in person.
> * Konstantin from LF IT was present as well to witness the key reading.
> * David Edelsohn reading the key.
> * David read the following key: SHA256:zkS1TzJkFI9X8gG6h0t9DWNle6IIhVC8Z7JTrXkuf2I
> * Konstantin confirmed the key matches what he copied.
> * Next step is for David to email it-coreprojects-helpdesk@linuxfoundation.org with the public key.
> ~~~
> 
> Once David emails the public key to LF IT then he will be added
> as a trusted introducer for the CTI git repo and can help add
> others to the repo.

This is completed -- David has access to the keyring repository as user dje.
To set up access and clone the repository, follow the steps sent earlier:
https://lore.kernel.org/cti-tac/20240131-angelic-positive-goshawk-ca6e87@lemur/

-K
