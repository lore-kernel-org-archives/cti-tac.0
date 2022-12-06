Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B5627713
	for <gti-tac@lists.linuxfoundation.org>; Tue,  6 Dec 2022 17:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24C6E81B71
	for <gti-tac@lists.linuxfoundation.org>; Tue,  6 Dec 2022 17:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24C6E81B71
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=PPkKMFek
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.103
X-Spam-Level:
X-Spam-Status: No, score=-2.103 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
	SPF_HELO_PASS=-0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0iN-W0Mc_MZ for <gti-tac@lists.linuxfoundation.org>;
	Tue,  6 Dec 2022 17:42:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94AB381E61
Received: from CAN01-YQB-obe.outbound.protection.outlook.com (mail-yqbcan01on20605.outbound.protection.outlook.com [IPv6:2a01:111:f403:7052::605])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 94AB381E61
	for <gti-tac@lists.linuxfoundation.org>; Tue,  6 Dec 2022 17:42:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7vEmme4CT8eUGsQ65tmbVftTHo2d043uLIEhH/GDouRRPAshvvbViZby8+xyEWWoBCNjqK1ZhCsLunLZ22Yh4ESDQ51qJDjQCuWMrJFozZSLUV3mmhWSRETuM/Ush3bRqIpkYfZdiYL4Kl3PZOUm+4IJ53clwHWlI2xeMyObTcaiI5xiYRUKNnDwKH9vrufF4WiEtB4k9w+2uMBuATYz6/tAuWYx/IK+a3T6XKDbTFTlcPgQXlSWHzW9F+02c4/XFwUJu9wPkq2Vl128MU3nCwuRjHmpIIbV431is9dF6lQr36TbZUB97VKyidzva0Dz5LV6pJBWORRu7aTqJmhSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qniN1LMcO0VB1U8uebcX0rZYmCZ5H2GN2GJQ5wgHcY=;
 b=mMhxe2e+jH/+GfjUj5MsP9GzSM4cCMxvtdV3ZAz9Du/6SipbzKIJzHvt5eVJN8vT8gMEQ2/1yuki4mldsmRvBgX96ZTV5ztcsv7ZWeb0eoNlKQBYix3JXJvfoQKxt3zAf6gb5BSDGsi6Z/+FMJGtLB/yHxpnDpXY5fjZyc1cxEZ+aGiqGPmvidtAnY78uZF3neQKBshVqJ8FH3oBgcbkHpHXG5Cx+v0pym7nhxTSaMdPJaOO76ITT5O9SJscsh1ei6afsqfWbQ1KbaFHkSH0aB6PZrWqPq2I1BVjdelHxCoLxVZuYxLe0+F7jfmVKFLH6mC6lcI9JGIs+9tzAqkVSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qniN1LMcO0VB1U8uebcX0rZYmCZ5H2GN2GJQ5wgHcY=;
 b=PPkKMFekwTJGv2stiYLjSFyI9/xreSevUXRXaFQZl18kO6Wf46dK97W/5Vjdcxf8bJhXHIR3safUnlkWJDeYU6URIpIJx7Nh1vzHroOjyid8V5K+CDmqtB32qfSj8eQduSal2llbvE0z6wEtJaztbmVW9cydW5VNXufoV6DE7VeP6pAnAB1BrbjWRC9td/8COh2ld1cxHabNXZdCpRMl+4EvqD1MXDEBYHpYzjPFcQ+QEUcyImco0L0a0k4jS73i2tR93wwc1QMCgy4jCax4BIJhcko5ReQ9jv+8hesTYqp+lixJBNZaGzCP38geNb4vqSvuCkS9EHOwRLcYcAJ3BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:a::23)
 by YT2PR01MB8389.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 17:42:05 +0000
Received: from YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::948b:ac25:c50c:f52e]) by YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::948b:ac25:c50c:f52e%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 17:42:05 +0000
Message-ID: <b755774c-3912-2dac-957c-91f659c95119@efficios.com>
Date: Tue, 6 Dec 2022 12:42:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Action: Setup working group for the GNU Toolchain proposal to
 migrate to LF IT managed services
Content-Language: en-US
From: Simon Marchi <simon.marchi@efficios.com>
To: Joseph Myers <joseph@codesourcery.com>,
 Joel Brobecker <brobecker@adacore.com>
Cc: Carlos O'Donell <carlos@redhat.com>, gti-tac@lists.linuxfoundation.org
References: <3a81d482-c952-d501-f495-485f00400e85@redhat.com>
 <Y3rxAYa/oc5s/R/7@adacore.com>
 <da126be7-475f-e2ed-fb4f-4493271db5f3@codesourcery.com>
 <62439dc1-1bb6-76b2-d1be-e7d3a2b64522@efficios.com>
In-Reply-To: <62439dc1-1bb6-76b2-d1be-e7d3a2b64522@efficios.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::7) To YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:a::23)
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT1PR01MB2828:EE_|YT2PR01MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: b6988fd7-fbfd-4ba2-1c71-08dad7b1306d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pi7y7Q/TNruIsx17k09omwFXfO4oRpUV8Wr0nytUTc3zoOCT8RQn1JEKH6HG+yCq9JJ6zQvk5JIrnHbhU6Wfkf5opx5k95XioPD8gdIJu+1pMEZRWhi14CX6BgjSQhKAKcI6l/Qp9ZAHHU8Wz4WigoBvl9eK/NbIfvixwftrJ1/ALOUg9fmhWJrf39rIFtovctyXvjIwTQkT0o7zgE41eKXNqosSuZeW5YDxsoJxjVMaxxnD0iTgbG92+9/D++Puz8kJ9z1TPO5iWCdYsipis94U48NGgNpGEkby735ouC3Ci1DdRlS8Z4MbdCOtj+4Xo9GMg+3jKWc/yp4MwRqr0DQmYk0sJYRJw/CPDJyr37lek0bVczpKvU0gi2Rog70QKbZTBfB9hQHbYQKSLj7vQgqijktt/YY869H2XvUjWU6si+2F8gyogZfmoL8pM4vMLpnOeUCDX9qdRr3KYl2DLCxyulEqb2kvXxrMO4JARG34hOgb0BITI2VGMzgab/Hh1OnhP5QfA9WU3bYcNRWn059st5AmNTaW9nHbO/TqMTvpxwTwg0IRQZ/Ys1BBq15Tl9G8ns2/sLFjjdq+xr8D15jlJVKXWDYDUbQhhsa2NuIOjMXcpIUTTJNJtT5B5W0ZZ1KL1l5mOaR+PD1r65ZiVF0dB5zvFJgaMvdSMtCQunmdnOCjWaBUaLN97qZx6bLIZfXahtd8ujM6wLAWozGAmmBy+334UTBNIoZEcIx3Nmzxixty2LorPl9/U+a8Dzu6vMHAecPktwHIT9xpBBW9hA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(39830400003)(396003)(136003)(366004)(346002)(376002)(451199015)(31686004)(84970400001)(966005)(31696002)(6506007)(478600001)(6486002)(36756003)(83380400001)(6512007)(186003)(2616005)(38100700002)(5660300002)(41300700001)(26005)(44832011)(4326008)(66556008)(66476007)(316002)(66946007)(8936002)(2906002)(8676002)(110136005)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGM2TVdTaEFqSkowRk5YWDJJRU5kOW94NkZoNmdraVFvcGdNcGowcERRekFk?=
 =?utf-8?B?UjhKRFQ1YjE3bC9hSC9peUZoaXJ2MmtxdGliL0Y4RjNzTXJlMTViejJIdXo3?=
 =?utf-8?B?Q0Q1ZmQ1Nld2QTY4c2VyTFFMRUpnaDhueS9BekR0NGtIY29qdzVLcExkMXcz?=
 =?utf-8?B?dENjYnJXL0xuUlFiUUJQRzJvOGh2VXJpdEU2S3NSditEQ1ZLbGIxSzFTS2l1?=
 =?utf-8?B?QzkvUlJaaDF5cWt5Mkt4N1BVN1NqSGxDOWNtTUpCVnBDK1dCVjEyUi9JVjlu?=
 =?utf-8?B?K3liUHNydC9hR05NcHJFSzNaTzFXMWxxZ0FHSmtpcm8zek1uV2Y0bGNwcGRM?=
 =?utf-8?B?anZZQ1JveW1KOGsxMEswalcraEhaSnU2Uk9KWS9CVGZSQWFIL1JINmR6clBv?=
 =?utf-8?B?dUZWOE1jMWZ2YWVaRnlzVG1FSzBZNUExRjBoQktnT2FRaTRnTzBobFhtTFk4?=
 =?utf-8?B?QjRPaTRSRUFhNjM4UEpQZ0l6UHpkNzJDVkpwMWgrRXNtcnpuOVhsM3lZVDZm?=
 =?utf-8?B?NjNLaTlaVlVIdlEzMmFNa1ZqSXNsZTM5cHJMUkhZaEVsYk1ZQkxvWjgrSEtO?=
 =?utf-8?B?WmI3TU1RVTQvSld2MGgzZXVQZjJDTkl2UzlCUCt3QXpqME9YZ05WWHhJc0hu?=
 =?utf-8?B?NUJ3STJwWTB3OUJPM0lKNjJqZ2pvdWFNQTU1M2Znam9tVzl4RkNodjIrWVJm?=
 =?utf-8?B?MjhlcXRLTXU5bE5ndng1ejg2ZVpVWnFrbld4Z093Q3IwNHpwL2g0UXBsQkNH?=
 =?utf-8?B?YzhwcExRMUswSHRCRFc3MEpnaGF5NGh2Lyt6M1QxSzdpMGI5bXJZWENmTlpo?=
 =?utf-8?B?bkcxd3VuY0F4Tm9JQnRVRHBiTDRjeFl5Q2taTzBqanBHVklQaEpxQUdqTkdG?=
 =?utf-8?B?NHF4RC9oOEhwZ3V4RWRPQ3c2eU8xcmJ3MTFEUEI2Rm1TczR1TTg2UG12RWl2?=
 =?utf-8?B?dnBjMGdnUlFMQVRnNERsYjExWUczVjRNLzcwNjQ0dEZkdSttVzFOS3kvVmky?=
 =?utf-8?B?TUpJVnZDRHJIK2JCb09GR1JQQXlxV09UY0VIWVVSWXZsZ3U0bFRhNXBzYU8v?=
 =?utf-8?B?ZGFTMFNLZ3cydUZMSjl2NEtZaWViVWgxOWRFNWVYdVp0dW1GWGVDdXh1Q2Fp?=
 =?utf-8?B?Qm9xWEhDcXh3N0lNQ0NONHp3UXRiMitsNFVCdExJRXBlb0hlQzdqN3Y1Njcy?=
 =?utf-8?B?ZGhaR2dGNmlhSGJFQVZZUDZPM0F0SzNHakxBWU9wbGl1ektUT0ZlZlZXWURU?=
 =?utf-8?B?cEtXenRoZTFXMjdDMVVtemZseWFtcGIyM3BhaTZGb0h5dExpQmJCL1FoVXNv?=
 =?utf-8?B?SUcwa2FXOEhxRkFqcGFORGhqNFQ5OXowUWx4VFZQZGhKZnAvNzU0VkJUNGlO?=
 =?utf-8?B?VXVDcEs2WFpRL29pRWFxenpmeTBUcXFEVGhmcVdBTXBZYmhjajR5NThHUzVD?=
 =?utf-8?B?SzJkblpCK2dFK3J0aytwNFJuc0hUb1NXOVNCRHFKVmw2SXJza1JYM3pmRXRK?=
 =?utf-8?B?Y0RuSXZZZUhLSVZLbjZJY2ljYlNvbm50MDV4MFErUHRQQ0NaUFJob1NoMnBX?=
 =?utf-8?B?OHFFalNaaEE3aGx1Ymxldk14OS82QmFHbEJCbFlDaC9qbFZPSEtjSitkU0dl?=
 =?utf-8?B?enJDTm8xSXIrbXRWUmRKN2pGYlhacnhjQ1FnVHpvMFdUNmllck53cXc4OVNE?=
 =?utf-8?B?aGpnUmgvKzRKWjljMHNRU0Y3ZE5XZDhVSjMxWjNUTTI1dzgrRVpIcjl3V24w?=
 =?utf-8?B?UWpRcnhxcG5vSy9UWkM3M29uejhmaThRMk9pSmFpUDFoNFp6aWFlbjJYTjJP?=
 =?utf-8?B?Sk5BQUVIYTlQaWQrWThKeE1rdy9nRU1OODhFbWovRWJHcEgrS3dzeHJISWRy?=
 =?utf-8?B?MTFJZDZwc3ZCYWdYemowazRWVWlnOU51c2o3TWRGajhmeXZsV0xqNnBBbks2?=
 =?utf-8?B?YUhZZ3JxcFcvaktoTmhFNVNNandFRVJqL3NDaC9BUTRxRHN0eU5CdnZrRWc2?=
 =?utf-8?B?b3VxVlV6MFBaYXozWlZpT1FpUUlRUFRUOFZHbkRteitkd2w5VmVLSnZMaVAx?=
 =?utf-8?B?dk5US3VxOEVXTzltYVB4MGF5RDF5aEZTZHZUbFlqTjN5N3J1U0xYczRiNVR4?=
 =?utf-8?Q?lF3nSBcVD5MFEH+YIKM9F9ldQ?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6988fd7-fbfd-4ba2-1c71-08dad7b1306d
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 17:42:04.9861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYYlZ33OISal87V4aRqzzt2QfsAjXKbVhuCTnOjDiHyTIfaVgyqRDKR/Jwx/ky/+9VmCtJ4X7HH5kZavNs6LxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB8389

Here's a revised list for GDB, I added some user-facing / functional
requirements I would think of.  It's probably still lacking some of the
implementation details that you are looking for, but I probably don't
know them, and it's hard to know what you don't know.

* Git Repository
  * Need push access
  * Ability for project maintainers to request push access for new
    contributors (or to do it themselves)
  * Ability for users to create user-branches (e.g. users/simark/foo),
    which will be ignored by the notification-sending script.

* git hooks
  * Need to be able to manage git hooks (https://github.com/AdaCore/git-hooks) on
    the server (right now, ssh to sourceware.org)
  * binutils-gdb.git/hooks-bin/commit-extra-checker.py

    Verifies that we do not have this issue:

        # With commits created using "git am" of patches sent via the gdb@ or
        # gdb-patches@ mailing list, it's possible that the author information
        # gets changed into "xxx via xxx@sourceware.org". Catch and reject those,
        # so the person doing the push can fix this before the push is allowed.

  * /sourceware/infra/bin/email-to-bugzilla

        Sends a copy of commit messages to bugzilla if commit
        has a PR number in it.

  * binutils-gdb.git/hooks-bin/post-receive

        Calls the irker (IRC notification of new commits)

  * Something sends emails about commits to the gdb-cvs mailing list

* Web-based navigation of the Git repository
  * Need to be able to browse the git repository online
  * https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git
  * If it exists, a more featureful git web frontends would be nice, one
    that allows searching files by name for instance.

* email-to-bugzilla script
  * The goal is that when a commit is pushed to the git repository, we
    check for any mention of a Bugzilla bugs, and post a message to those
    bugs
  * It accesses the Bugzilla database directly to check if a given bug
    number exists (could easily be changed to use some HTTP request)
  * It posts to bugzilla by sending an email to a local email account

* mailing lists
  * Those I know for sure are used / useful:
    * gdb@
    * gdb-announce@
    * gdb-cvs@ (now misnaed, but can be used to follow commits to the repo)
    * gdb-patches@
    * gdb-prs@
    * gdb-testers@
  * Not sure about these:
    * gdbadmin@: seems useful for whoever is responsible for snapshot
      generation or other GDB-related automated task.  It seems a bit
      spammy to send an email every day when the task succeeds.

      The daily commits in binutils-gdb that bump the date are made using
      this email address as the From, not sure if it matters
  * Pretty sure we can ignore these:
    * gdb-testresults@
    * gdb-patches-prs@:
    * gdb-webpages-cvs@

  * We also have a "global maintainers" list hosted at AdaCore.  It could
    make sense to move it to the main infrastructure.  Maybe Joel knows if
    there's a reason it's separate.

* Mailing list web interface
  * The original one, which I find not so useful now that we have
    public-inbox: https://sourceware.org/pipermail/gdb-patches/
  * However, old links need to keep working
  * public-inbox or something equivalent is necessary:
    * have a way to browse easily message threads that span multiple
      months / years
    * have a way to download raw messages, to apply patches locally

* daily snapshot generation
  * We have a script that generates daily tarballs (I don't know where
    or how)

* daily bump
  * We have a script that does a daily commit in the binutils-gdb repo
    to update a date (I don't know where or how)

* Website
  * Handwritten pages (in a CVS (!) repository)
  * scripts generating website contents (doc, ARI, etc)
  * SSH access to the machine hosting the website is used, as the scripts
    above generating website contents are run by the release manager, after
    having ssh'ed onto sourceware.org.

* Wiki
  * Currently, anyone with write access can give someone else write access.
  * At the very least, we need a way for project maintainers to request
    write access for a new member, or do it themselves

* bug tracker (bugzilla)
  * Sends notifications of new bugs and comments to gdb-prs
  * Sends notifications of comments on a big to users who are watching
    that bug
  * Accepts replies by email, both from users and from the
    email-to-bugzilla script.

* Release hosting
  * Releases, the release manager must be able to upload there
    * ftp://sourceware.org/pub/gdb/releases/
    * http://sourceware.org/pub/gdb/releases/
  * Snapshots, the daily script needs to be able to upload there
    * https://sourceware.org/pub/gdb/snapshots/

* patchwork (https://patchwork.sourceware.org/project/gdb/list/)
  * It receives emails from the gdb-patches mailing list
  * This instance doesn't get much use at the moment, because it gets
    filled so quickly and is impossible to keep up to date.

Simon
