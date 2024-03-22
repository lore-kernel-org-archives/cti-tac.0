Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA79140BE5
	for <cti-tac@lists.linuxfoundation.org>; Fri, 22 Mar 2024 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711110702; cv=none; b=rKoZnGHFarSZ9lNsQzz1bv9Sbj2JzFzafKDIAh5Xs1Oy87ZXmayyKUeJdWeET+HwzXVdZdBYLZ9nQZv1WhRZKgX7wRs+h79MULEWk0aNNQqfDSs1F9zkhfIq1djuqKigGd5mv9R8bJBU9icdrPTjoMEeCOMBq0IZpADlO+LE3QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711110702; c=relaxed/simple;
	bh=Us5KyuLKsNpGyX8oSa8gFu61zJckUromyhMZ/5c4JAM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cFdqhJ2Wr0avnnoT3Yq7Sx9d78ZBug9vf1Kkfwf6K1mMTaoul6zkYr0uZ7Wm8trAC9ghZLZ9538kIhSgKrg+3nQ4Tv5xpL4txD2e4qNp9LPwaj68H0IpqgX5d/G4M1ccX/ZFoybjxw2R5MrH9loUfOgZAQF8WM2kHxt79QVpx8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=fsf.org header.i=@fsf.org header.b=liDFzS0y; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fsf.org header.i=@fsf.org header.b="liDFzS0y"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2373E417A2
	for <cti-tac@lists.linuxfoundation.org>; Fri, 22 Mar 2024 12:31:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.51
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ONkiUGIuRX2X for <cti-tac@lists.linuxfoundation.org>;
	Fri, 22 Mar 2024 12:31:38 +0000 (UTC)
X-Greylist: delayed 1057 seconds by postgrey-1.37 at util1.osuosl.org; Fri, 22 Mar 2024 12:31:37 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0051F4177B
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=fsf.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0051F4177B
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=fsf.org header.i=@fsf.org header.a=rsa-sha256 header.s=mail-fsf-org header.b=liDFzS0y
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:470:142::13; helo=mail.fsf.org; envelope-from=iank@fsf.org; receiver=<UNKNOWN> 
Received: from mail.fsf.org (mail.fsf.org [IPv6:2001:470:142::13])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0051F4177B
	for <cti-tac@lists.linuxfoundation.org>; Fri, 22 Mar 2024 12:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fsf.org;
	s=mail-fsf-org; h=MIME-Version:Date:Subject:To:From:in-reply-to:references;
	 bh=MNJdL5GkL4i5rEpPMvIilC59gLurIkq9ImfCOJMalYY=; b=liDFzS0yTOTtU8Hqci4TFWh0G
	0pSpWUd5IL0nHJCUtOhBgipM2IilO22iFANJVqlGLKYokN6zM6mkfx9WY8ozz0nppqrWx/Oz94kD8
	ydbSL1UViwzCYqRFmAAbfawlwpawvJj46LFaLnsZGD1Hm6j2s5hLPZDNG/QMmO5gKju/r7CJP4tGW
	oJS1fumr8rhcyDOCaMRwzYNvj2V6jyyB7BxAQTMt7Cyb/MQTVYKuOlX7j+R6VvN5v6tpOdhHA17xn
	w2lqhH/9ooL80dYE64V6tg5/0EQxz34bnl02uA0v7bCP0hOB/ZJXoRuytf6aIPkOj3Ukmb5MQqghr
	eqG5ZvDhA==;
User-agent: mu4e 1.10.3; emacs 30.0.50
From: Ian Kelling <iank@fsf.org>
To: cti-tac@lists.linuxfoundation.org
Subject: My suggestions on auditing that services are running free software
Date: Fri, 22 Mar 2024 04:35:13 -0400
Message-ID: <87zfuqcvlo.fsf@fsf.org>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain

This is fulfilling a request from the last CTI TAC meeting.

I suggest: For any program that users interact with via a user
interface, the user should be able to download & run a copy as free
software (they need to be able to know & get the specific version being
run). If the internet archive is not taking at least weekly snapshots,
there should be a web page with a history of past versions too. Past
version information is needed for example if a service changes and a
user doesn't like the change, then they can download and run the
previous version.

If needed, I can help work out more specific more details of what
programs should count, but the list of programs on the CTI website [0]
seems to have the right idea.

[0]: https://cti.coretoolchain.dev/services/index.html

I suggest: if an entire machine is provided to a user, for example root
ssh access to run any program the user wants, then the scope of programs
to be free software on that machine should be greater than in the case
of a service. Defining that scope can happen if and when there plans for
providing an entire machine, I see no plans right now.

I suggest that CTI come up with a proposal/plan for how to implement the
audit. Eg, checking what software is being run and that users are able
to download a copy and that it is free software. The FSF will be
available to review the proposal.

-- 
Ian Kelling | Senior Systems Administrator, Free Software Foundation
GPG Key: B125 F60B 7B28 7FF6 A2B7  DF8F 170A F0E2 9542 95DF
https://fsf.org | https://gnu.org
