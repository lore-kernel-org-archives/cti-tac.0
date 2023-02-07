Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842643C3B
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 18:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 145786102F
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 18:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 145786102F
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -3.954
X-Spam-Level:
X-Spam-Status: No, score=-3.954 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
	SPF_HELO_PASS=-0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pG_vHS3XkM-Q for <gti-tac@lists.linuxfoundation.org>;
	Tue,  7 Feb 2023 18:42:36 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E72E260E76
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E72E260E76
	for <gti-tac@lists.linuxfoundation.org>; Tue,  7 Feb 2023 18:42:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="97284499"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 07 Feb 2023 10:35:27 -0800
IronPort-SDR: ANudRBrHtmLI2hmht1gqkSbct2FXdNeuzKulL8Ic02igVU+tI8BuDOVwsuwoYr+iQZOHDaXwtF
 cn7YsamWdu9VXziCmoKLUWXcu7qlwKMr6CB5SQ0m/n+4+19u4sOiPczKPvssDpaWGaz1QJflBt
 UEa9fZFgIRDsmZjEHo87JEMoZi7PMViUnRP7pzVvvSj6xdFUvsRcIT4r0n9hDATEOzOEKRLjzk
 JYnz1ywFXpCSq3XvEOqXxSNUysKRmM5j4RY4dkaTkRe4/vzrT2smNZQrkndfiFF6dThohmXOL5
 jH8=
Date: Tue, 7 Feb 2023 18:35:17 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: Carlos O'Donell <carlos@redhat.com>
CC: <gti-tac@lists.linuxfoundation.org>
Subject: Re: Planning the next GTI TAC meeting for February 2023?
In-Reply-To: <1344a6ae-15a4-f2c3-1abb-ced0caed9e59@redhat.com>
Message-ID: <a6a922d-f38-1648-bf6b-dbdd7cb3b520@codesourcery.com>
References: <e7563276-8d8a-7cb2-0da5-f838969d9c2d@redhat.com> <bd4ea1b-3a78-f04b-3c82-7eb5829962b@codesourcery.com> <1344a6ae-15a4-f2c3-1abb-ced0caed9e59@redhat.com>
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

On Tue, 7 Feb 2023, Carlos O'Donell wrote:

> On 2/6/23 17:35, Joseph Myers wrote:
> > On Mon, 6 Feb 2023, Carlos O'Donell wrote:
> > 
> >> With the binutils and glibc releases out of the way for January,
> >> I would like to schedule the next GTI TAC meeting and possibly
> >> setup a recurring monthly meeting to discuss progress.
> >>
> >> Suggestions for dates:
> >> Wednesday February 15th 11am EST / 4pm UTC
> >> Thursday February 16th 11am EST / 4pm UTC
> >> Friday February 17th 11am EST / 4pm UTC
> > 
> > Unless next week's WG14 meeting processes comments much faster than 
> > January's, I won't be able to do any of those.
>  
> Is the week after that week a better week?

Yes, that would be a better week (apart from the Tuesday).

-- 
Joseph S. Myers
joseph@codesourcery.com
