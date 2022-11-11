Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC58320C
	for <gti-tac@lists.linuxfoundation.org>; Fri, 11 Nov 2022 23:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F76F40106
	for <gti-tac@lists.linuxfoundation.org>; Fri, 11 Nov 2022 23:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F76F40106
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -3.953
X-Spam-Level:
X-Spam-Status: No, score=-3.953 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eebujIQKSJuz for <gti-tac@lists.linuxfoundation.org>;
	Fri, 11 Nov 2022 23:43:50 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79E3C400D2
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 79E3C400D2
	for <gti-tac@lists.linuxfoundation.org>; Fri, 11 Nov 2022 23:43:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.96,157,1665475200"; 
   d="scan'208";a="89657145"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 11 Nov 2022 15:36:42 -0800
IronPort-SDR: zTiPXFbzjk6YQ4+l32DEh02vdcWJcFKseNx+13Sb3j0uyq1C4k+yzRU5t08wM8vafLwofTSZHJ
 OsT9P2MBUyEVdvlc+0BcgJ+wegduvrMO9Z6or3A3n0DeVzXUrKAejqeLGEyW1ffo1pyLEXu+Le
 VelA85MzzkqhotLoLr+VXDdK5kK1b+2lsfJYbv4Y2Z12C+rs6EtsK3cCyQ7yy/Djnu5EhfPtbc
 26df6kmIObXAkVxwDFZkFen8BCeCyF3loJ1y/1nPvX3R0xS7p5wWHfyed3MI+f+xFkMeqeKJ8h
 jgc=
Date: Fri, 11 Nov 2022 23:36:38 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: Carlos O'Donell <carlos@redhat.com>
CC: <gti-tac@lists.linuxfoundation.org>
Subject: Re: Action: Setup working group for the GNU Toolchain proposal to
 migrate to LF IT managed services
In-Reply-To: <3a81d482-c952-d501-f495-485f00400e85@redhat.com>
Message-ID: <d8eabe-31ec-873d-7893-915e6d2fd6e@codesourcery.com>
References: <3a81d482-c952-d501-f495-485f00400e85@redhat.com>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10)

On Fri, 11 Nov 2022, Carlos O'Donell wrote:

> Next step:
> 
> - Seek volunteers. Please respond to this email if you want to volunteer
>   to be on the "LF IT managed services" working group and help enumerate
>   services.

I'll volunteer to be on it, but, as noted at the meeting, I don't expect 
to do much on the enumeration before January.

-- 
Joseph S. Myers
joseph@codesourcery.com
