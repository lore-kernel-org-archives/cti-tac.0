Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527A48825
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727280638; cv=none; b=qZz9MaaMJLOh7UPAiWC6L9b5TTLorTZQToIYbF6TutV+mzEo3Xv4VDkVKYUsejKPUmalLsNxieq866m/vgKnWUpLpnk7kwyXlESwFp5Jhyfq9U5jHZ5WINSDTC3DXb92O2QsAwzrUrlE/EPCYQgailBvY8VPkoITrD7Rowz6f8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727280638; c=relaxed/simple;
	bh=E8H8I58d9Xm1Z8yWXPmPLtrtJq1ZG6Csmm4H3mzaE1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbksywzat/BRbYvLRQ6VaSZvvWY9sshVNKXPL/KG2SxlqZ7ESdMCb+l6ZrHXvCOu+2fiVyOoqx4u7THWX2zTTAnd+toSUXAMBEBla6k+6EoUCPs7qE9ax77pA5rC4hYThuCbdchGIBhP45+ABG7io3pu+V4+VpKp4EdyeGXBRTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jEpeUFdm; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jEpeUFdm"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2C224099C
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 16:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsu8Q8C1qmgH for <cti-tac@lists.linuxfoundation.org>;
 Wed, 25 Sep 2024 16:10:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=konstantin@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F0D164049F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0D164049F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jEpeUFdm
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F0D164049F
	for <cti-tac@lists.linuxfoundation.org>; Wed, 25 Sep 2024 16:10:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D1835C3A66;
	Wed, 25 Sep 2024 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7473DC4CEC3;
	Wed, 25 Sep 2024 16:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727280633;
	bh=E8H8I58d9Xm1Z8yWXPmPLtrtJq1ZG6Csmm4H3mzaE1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jEpeUFdmZynKTtFWgUbVTMegBU8xfwaNVP+SOkrgSc4kqt8hEI5K7/u89WTrsJyTM
	 /cl57SNMUG664D2v1Umq5GXUAfyx5a0Rshi9moCVEpeqIBVyGiTX++aq/W+/ZMPkEb
	 K3+Gruj6Ab8xTDrEs3x8izn316NziVidoJWykRJ8=
Date: Wed, 25 Sep 2024 12:10:32 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: cti-tac@lists.linuxfoundation.org
Subject: Re: CTI TAC Meeting Notes 2024-09-25
Message-ID: <20240925-monumental-steadfast-urchin-8b1ae1@lemur>
References: <e3551841-0427-49da-8cb0-833a335daeca@redhat.com>
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e3551841-0427-49da-8cb0-833a335daeca@redhat.com>

On Wed, Sep 25, 2024 at 12:04:17PM GMT, Carlos O'Donell wrote:
>   * David: Have we heard back from LF IT?

Hi, all:

Apologies for not attending -- I've not seen any invites, so assumed our
presence is not required.

To my knowledge, there are no outstanding items for LF IT. We have done some
initial cost analysis for openshift and cloud deployments for the SOW, but no
further work has been done since then, since my understanding is that there
isn't sufficient "buy-in" from the glibc community to proceed with any service
deployments at this time. Please feel free to correct me if that understanding
is incorrect.

Best wishes,
-K
