Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C78208A1
	for <cti-tac@lists.linuxfoundation.org>; Mon, 23 Oct 2023 17:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YYedqX3M"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DBF4423DA
	for <cti-tac@lists.linuxfoundation.org>; Mon, 23 Oct 2023 17:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DBF4423DA
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YYedqX3M
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m_Pp1JWdJdar for <cti-tac@lists.linuxfoundation.org>;
	Mon, 23 Oct 2023 17:21:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EE26A42241
	for <cti-tac@lists.linuxfoundation.org>; Mon, 23 Oct 2023 17:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE26A42241
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0701B62614;
	Mon, 23 Oct 2023 17:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA4BC433C8;
	Mon, 23 Oct 2023 17:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698081676;
	bh=tmMEWKVQImiOaBCD4J1FppeB9ah1TzoZ3iF4p7EvmYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYedqX3MiAXPk5EPo1dyh/reTzE1aHgfYTHuiDTw6vFrkMcGn8Gv1CFPbHK8Id6xp
	 AXARxgJYMYjiJiT6vnv69tB8hVJ2yq+a/KOFekRsxxmazi/2RHZKGTfU5rVi6lCL7h
	 XYxvzqLG4Jw7GgiRz7m07TmDYsubnGbbG+FuB7Ns=
Date: Mon, 23 Oct 2023 13:21:15 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org, rday@linuxfoundation.org
Subject: Re: Reminder: CTI TAC Meeting on October 25th at 11am EDT
Message-ID: <20231023-moli-musi-weka-7d5150@meerkat>
References: <CAEMqeSqoOgwMex-d+y=Hp1J476em_yAJFG5-daxcwkQ+uA7UvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEMqeSqoOgwMex-d+y=Hp1J476em_yAJFG5-daxcwkQ+uA7UvQ@mail.gmail.com>

On Mon, Oct 23, 2023 at 04:00:00AM -0400, Carlos O'Donell wrote:
> Reminder: CTI TAC Meeting on October 25th at 11am EDT
> 
> BBB Conference link:
>  https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1
> 
> Recurring last Wednesday monthly CTI TAC meeting.
> Agenda:
> - Standing monthly meeting for review.
> - Discuss current TAC topics and progress.

Hello, I'd like LF IT to attend:

- Konstantin Ryabitsev
- Ryan Day

Please let me know if that's ok.

-K
