Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CC33D72
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 22:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E78F4094B
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 22:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E78F4094B
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
	with ESMTP id GMuRSZ-nqzSA for <gti-tac@lists.linuxfoundation.org>;
	Mon,  6 Feb 2023 22:43:46 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A7EB408BC
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3A7EB408BC
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 22:43:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="99806441"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 06 Feb 2023 14:36:37 -0800
IronPort-SDR: uiBnUhdWJFoZY160LA8zekaZ+0OCWO8p2nPm+SCV9VJqKnRmRRP0UIY06Cnp/qRfPVI3RsC5Ri
 qNvxgBiM83vvw0RQ21oDJ6NMM6yvJ0aNnQyTX0fVZa7lrN5HnRIHpIue3zaHpmyBZWlw1OgtzC
 C5Hpnkdzke96rtY4+Y6WUQ1ykKu9F89ODaCGFVk6hO/T3dhJy4BdGblFpTNGh2kp7OamEvh325
 iRhjtvGFHOZGwQF/MZ1fttqam23tY0DSkNkvqE5UjcjIvC0gpIMurWGZmk1HH3mnWpIf1+Ex0K
 SJU=
Date: Mon, 6 Feb 2023 22:36:31 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: Carlos O'Donell <carlos@redhat.com>
CC: <gti-tac@lists.linuxfoundation.org>
Subject: Re: CY23 - Status of service enumeration.
In-Reply-To: <d8790f60-483b-dfc6-dd7f-cb408334eb40@redhat.com>
Message-ID: <74cca66-ecfa-8772-631e-5ca110b510ce@codesourcery.com>
References: <d8790f60-483b-dfc6-dd7f-cb408334eb40@redhat.com>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-14.mgc.mentorg.com (139.181.222.14) To
 svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10)

On Mon, 6 Feb 2023, Carlos O'Donell wrote:

> Joseph,
> 
> Have you had a chance to enumerate the gcc services?

No.

-- 
Joseph S. Myers
joseph@codesourcery.com
