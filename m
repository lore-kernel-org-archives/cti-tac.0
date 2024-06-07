Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519C9D27A
	for <cti-tac@lists.linuxfoundation.org>; Fri,  7 Jun 2024 19:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717790076; cv=none; b=fcDXoLUwE5D+lighUIHOm3Fs+NsEKLx0xyQx8U+d7FZeyFvXz4Yml5Rd9knVZnkaRjML5chetzZQvWN8BhPGae0QzbhR8Y+W6bAMKJJes7dRu33mlPKSh8kWaoK2BUbZ6qWVxQjpZBi/0ur7/MYwj9HprYdceaPuTxoOsB1uwtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717790076; c=relaxed/simple;
	bh=iGJVTEhVi2++jKgzBaPYZDGJDzxyZWKrr7t80dyTZug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gi4V9ATuVD/YxY0HDe5hJRjVOXneBL5SiJwGwNEyUWdyYLhYREkkL3/YJVn8pjghC/2UGhLgx8AYHqxag51rXdBQjnsrDcaBD5BlmDtdmobEEyfhWQZpmyr/pJXSf/xuPWJ/9iPKZlEf/8skwA1nMpG+g1Y4opTIBh5g499HOzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MKEkajX+; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MKEkajX+"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC72C82056
	for <cti-tac@lists.linuxfoundation.org>; Fri,  7 Jun 2024 19:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wg4qrUgeq7Av for <cti-tac@lists.linuxfoundation.org>;
 Fri,  7 Jun 2024 19:54:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 247CE81FE3
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 247CE81FE3
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MKEkajX+
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 247CE81FE3
	for <cti-tac@lists.linuxfoundation.org>; Fri,  7 Jun 2024 19:54:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E07D3CE1E42;
	Fri,  7 Jun 2024 19:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33D3C2BBFC;
	Fri,  7 Jun 2024 19:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717790067;
	bh=iGJVTEhVi2++jKgzBaPYZDGJDzxyZWKrr7t80dyTZug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MKEkajX+vFnkn0tOx0Kw8GBb8wi1jrzZeSbtOEFJZX+la+9aC71jGjcfISeo6MRxB
	 BDxcagK4CWSZ2X02IJJjbj7GHcqSUriXQ0GpUVtt1AJm7fNaqZcAy2i/QLdGPzca+C
	 OS2hGTRWgHVlqoS0RXXeqkMjCjtGTUEl2B4SwFVA=
Date: Fri, 7 Jun 2024 15:54:25 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: CTI TAC Meeting Notes 2024-05-29
Message-ID: <20240607-lyrical-warm-wren-a4b8cd@lemur>
References: <69862ea2-d7e2-4fdc-91a6-a80525ecf423@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <69862ea2-d7e2-4fdc-91a6-a80525ecf423@redhat.com>

On Wed, May 29, 2024 at 12:01:37PM GMT, Carlos O'Donell wrote:
>  * Next steps revised:
>   * In Progress: Review LF IT SOW with CTI TAC and finalize SOW.

Hi, all:

Sorry, I've not been able to work on this yet. My goal is to prioritize this
early next week.

-K
