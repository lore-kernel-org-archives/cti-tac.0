Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C083627738
	for <gti-tac@lists.linuxfoundation.org>; Tue,  6 Dec 2022 19:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E8334171F
	for <gti-tac@lists.linuxfoundation.org>; Tue,  6 Dec 2022 19:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E8334171F
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -3.954
X-Spam-Level:
X-Spam-Status: No, score=-3.954 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_PASS=-0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bqsGpZL-LQTn for <gti-tac@lists.linuxfoundation.org>;
	Tue,  6 Dec 2022 19:20:22 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DFFF41715
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0DFFF41715
	for <gti-tac@lists.linuxfoundation.org>; Tue,  6 Dec 2022 19:20:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.96,223,1665475200"; 
   d="scan'208";a="89194630"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 06 Dec 2022 11:13:14 -0800
IronPort-SDR: lHNb7fb01oLB6WT29Yblg9Q6JQO6PxsQbEO3IX8qWyhkoe5EZ8aSB0YS76oDrgys3fW0Kkkg0e
 IqbRFpUEwxDFh69wmXa2Lmtoc2odC53q7yo2VLTTenSrTHpbtJ0K3ieaGXyqYl1ZMLsnNKHZ/A
 yM/xgLHjGC20p+tchQAvy42FP9FDq61mKKJQBWMlvN6Sv8OOf8WBs1F41eS284UnM8ML1bgqp9
 Q2o0g2RVvU/963qgrJ6gy+XRAA6hfstUPD0/FvVRFOw9NV4Njzbfm3kI7/L+POamvQdGcCFuIF
 +U0=
Date: Tue, 6 Dec 2022 19:13:10 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: Carlos O'Donell <carlos@redhat.com>
CC: <gti-tac@lists.linuxfoundation.org>
Subject: Re: First draft analysis of services used by glibc.
In-Reply-To: <804cee43-a120-3acf-a302-b1640f2285a9@redhat.com>
Message-ID: <15f1637b-38c0-5ba9-8a71-8a6349b5b0c@codesourcery.com>
References: <804cee43-a120-3acf-a302-b1640f2285a9@redhat.com>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-13.mgc.mentorg.com (139.181.222.13) To
 svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10)

On Fri, 2 Dec 2022, Carlos O'Donell wrote:

>   * Pipermail archives:
>     * https://sourceware.org/pipermail/*
>     * e.g. https://sourceware.org/pipermail/libc-alpha/
>   * public-inbox archives:
>     * https://inbox.sourceware.org/*
>     * e.g. https://inbox.sourceware.org/libc-alpha/
>     * Not all inboxes work correctly e.g. glibc-bugs-regex doesn't work.

Also the older MHonArc archives (/legacy-ml/) - no longer updated, but the 
/legacy-ml/ URLs and /ml/ redirects to them need to keep working.

E.g. https://sourceware.org/legacy-ml/libc-alpha/2020-01/

-- 
Joseph S. Myers
joseph@codesourcery.com
