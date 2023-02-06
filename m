Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8811C3D72
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 22:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18475408C8
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 22:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18475408C8
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -3.953
X-Spam-Level:
X-Spam-Status: No, score=-3.953 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mIN3AwAZNddM for <gti-tac@lists.linuxfoundation.org>;
	Mon,  6 Feb 2023 22:43:09 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4660408E8
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C4660408E8
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 22:43:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="95860244"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 06 Feb 2023 14:36:02 -0800
IronPort-SDR: mukkUaDu40B2v/iL/W5jgJgGTsOgWIvH/BiP5s80e46kwcbzNXlU2qcqdIxAqfGV76erX/ttZG
 U223K2OWyk8YR9JrUNvZ++thagV3+K6X9SGYFLlI+c1IfqbD9KN1PD3yzKKJFZH2XnzBA4tLuH
 mUjmZoZeoYABapom2GsmnB564GqZD3yYtcoLTfo45BhsK0h9cqG1mKz9YI11WkUTQABCpuzQoS
 CR4KAG0j9vSKK9uW/FxJ2MmytQx+spQmBF6+ysksGv4QELqo50xbRWxhVdaP4E6j56h4KyiNsE
 g7w=
Date: Mon, 6 Feb 2023 22:35:55 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: Carlos O'Donell <carlos@redhat.com>
CC: <gti-tac@lists.linuxfoundation.org>
Subject: Re: Planning the next GTI TAC meeting for February 2023?
In-Reply-To: <e7563276-8d8a-7cb2-0da5-f838969d9c2d@redhat.com>
Message-ID: <bd4ea1b-3a78-f04b-3c82-7eb5829962b@codesourcery.com>
References: <e7563276-8d8a-7cb2-0da5-f838969d9c2d@redhat.com>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10) To
 svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10)

On Mon, 6 Feb 2023, Carlos O'Donell wrote:

> With the binutils and glibc releases out of the way for January,
> I would like to schedule the next GTI TAC meeting and possibly
> setup a recurring monthly meeting to discuss progress.
> 
> Suggestions for dates:
> Wednesday February 15th 11am EST / 4pm UTC
> Thursday February 16th 11am EST / 4pm UTC
> Friday February 17th 11am EST / 4pm UTC

Unless next week's WG14 meeting processes comments much faster than 
January's, I won't be able to do any of those.

-- 
Joseph S. Myers
joseph@codesourcery.com
