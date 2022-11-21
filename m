Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619712CAB
	for <gti-tac@lists.linuxfoundation.org>; Mon, 21 Nov 2022 20:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05DB2410A1
	for <gti-tac@lists.linuxfoundation.org>; Mon, 21 Nov 2022 20:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05DB2410A1
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
	with ESMTP id VJFt5ff2OGBh for <gti-tac@lists.linuxfoundation.org>;
	Mon, 21 Nov 2022 20:56:38 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D934A4109F
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D934A4109F
	for <gti-tac@lists.linuxfoundation.org>; Mon, 21 Nov 2022 20:56:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.96,182,1665475200"; 
   d="scan'208";a="87444278"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 21 Nov 2022 12:49:29 -0800
IronPort-SDR: 7Uddw2lFVGO7I844pkEsL6U1yjaLzWlXISOa3pj8UWU9pBhPyuErIS+ci2IVmg4uKNYv4HNeRK
 3+CjGakMass7460mpU2yVxRVkJNFI/1wTGu+p9nmXmAA9BdFIrOCMBefCcmtShY4sEGRu5iNdq
 GqQzcwPBLWz1Im+kth1g5Uwil1OmGNkcKSX9NzRrFxocefGe2Tf3Vm4dCRYx2GhAXE7rTfUiCm
 AmdEj4gWOwfQ6sisSkSvb2dK4vJjSLOLpuaNGWUaouIN9PY03/42fHKe3YCH0UiY0qTu/Dncmt
 Weg=
Date: Mon, 21 Nov 2022 20:49:24 +0000
From: Joseph Myers <joseph@codesourcery.com>
To: Joel Brobecker <brobecker@adacore.com>
CC: Carlos O'Donell <carlos@redhat.com>, <gti-tac@lists.linuxfoundation.org>
Subject: Re: Action: Setup working group for the GNU Toolchain proposal to
 migrate to LF IT managed services
In-Reply-To: <Y3rxAYa/oc5s/R/7@adacore.com>
Message-ID: <da126be7-475f-e2ed-fb4f-4493271db5f3@codesourcery.com>
References: <3a81d482-c952-d501-f495-485f00400e85@redhat.com> <Y3rxAYa/oc5s/R/7@adacore.com>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-09.mgc.mentorg.com (139.181.222.9) To
 svr-ies-mbx-10.mgc.mentorg.com (139.181.222.10)

On Mon, 21 Nov 2022, Joel Brobecker wrote:

> * bug tracker (bugzilla)

I think this needs to go into more details.  Details of incoming email 
handling (some Bugzilla installations don't use incoming email, we need to 
be explicit about how it's a key feature used in our installations), 
details of outgoing email handling, details of local changes to the 
Bugzilla installation and how account creation is handled, for example.

>   - /sourceware/infra/bin/email-to-bugzilla
> 
>         Sends a copy of commit messages to bugzilla if commit
>         has a PR number in it.

The fact that this currently seems to use SQL access to the database is a 
really important thing to include in the list of services.  Remember that 
we're trying for more isolation of components with minimal interfaces 
between them, to improve security.  So if this script could be changed or 
rewritten to use the (public) REST interface instead of SQL access to 
check for whether bugs exist, that would be helpful.  (The fact that it 
sends email to add to Bugzilla is also relevant, because it means that any 
system running this script needs to be able to send email - and for any 
system sending email, it will be necessary to avoid losing outgoing email 
if it's a transient system and there's a transient email problem.)

In general, details of exactly what interfaces are used by components to 
interact with others - especially if they make any assumptions about 
direct database or filesystem access, or about different services being 
hosted on the same system - are really important.  (This would then give a 
list of cases where we should *change* the interfaces used to remove such 
dependencies - for example, using the public read-only REST API to extract 
information from Bugzilla instead of SQL access.)

-- 
Joseph S. Myers
joseph@codesourcery.com
