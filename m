Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95FD27706
	for <gti-tac@lists.linuxfoundation.org>; Tue,  6 Dec 2022 15:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5580060758
	for <gti-tac@lists.linuxfoundation.org>; Tue,  6 Dec 2022 15:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5580060758
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=qynOwyUh
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.103
X-Spam-Level:
X-Spam-Status: No, score=-2.103 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GIjq77ewM-Fs for <gti-tac@lists.linuxfoundation.org>;
	Tue,  6 Dec 2022 15:52:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94D7F60F86
Received: from CAN01-YT3-obe.outbound.protection.outlook.com (mail-yt3can01on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f403:7053::61e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 94D7F60F86
	for <gti-tac@lists.linuxfoundation.org>; Tue,  6 Dec 2022 15:52:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6fftu1ADHwcaWOI+ZTxeA3x/MmS30NFZHSykIgD58eFnHhfV6alzs9oTZYKLfrQKR1YvA8NuzbyeHd9ruivSaTii+ymwTUleHCBT8+JdZbov+g/c6E9x4PhtQv4avl/nu3cNb7zbk5nLD6DwwhsHGhiPovb8/5V0i0etMZ5h45E1tJBEYepYQeN5U/ydueoCuMSMknVefxx0QYeTpRySqjqYkRb5OjuIzOupLq8HKaCqoSXtTCx+IBq3ofOxavmjelDbK/VzOjfnAGmIdfK+BTT4HhWBjDuUwgZ6Q3jaNndgWNHoJgxJVG7RCidFzDjXXX3j4k7rRDi+ckk2HeoEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZpb3RVHgOzQ3qmrVLZvlxlaueuwG6taZQJdE2+UT0M=;
 b=nuAuperg9dBgQNpAq7uggl7helP4zJrhB8Is3GznsisRgnhCPsBF5dCp+Y+idrpsVzy0sadNe8A5RHG+82NyCp5TPtz275jvS4101sjjC+k8gCxZo38juPrtXwX54sIleqfhcBZjFxZ+U9FA67FOELVGsfGNmFUXrHrLeYkYsOqR3YqrN6Y4RDlpA1XGDj/bY0c/d45XCqCX1cMjKJMvICPKxSKHms3hf/3LLszePIxEitDtlTfIHW9zIqpizPusVf2cMQACRWJPg1EAekPnj4nxFa1P3ZZ6A/nX8b4Q6SV4livyuRV6eH+nN5HQRRzFu8IcoeYSOr3OOaiuu0cG8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZpb3RVHgOzQ3qmrVLZvlxlaueuwG6taZQJdE2+UT0M=;
 b=qynOwyUhlDI/rRNQKe0gzEZw8+kaM+BWHlZzsJC0CdqdpAZ3+AXm70FIbd0D/8h3YDY9OuXj+0r4Ixk3+HbMTzO71ShXKGjsOFb65Yugfwfa5Bs9e4eYB45nx81pxtKR4iI1E5krFrKpfD789R6ZbV64fA8MNAKEGS1vYN7W/RgHxvET+gwYajfEA/klfSqe0ssYHkiuGvxgsFWyFmKPPFGayni7EAJKOHIw2hGA18x6EtjnYOguH5ykVFlEXQUOAFfMErrS+7EgUKiJbbYlCcDQ69WBFuHBD2sxsKujaY0hFH/x37UkB13wv1WbGn5f0pT6hBZJLqFsJ0nLe67JQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:a::23)
 by YT2PR01MB8821.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Tue, 6 Dec
 2022 15:52:22 +0000
Received: from YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::948b:ac25:c50c:f52e]) by YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::948b:ac25:c50c:f52e%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 15:52:21 +0000
Message-ID: <62439dc1-1bb6-76b2-d1be-e7d3a2b64522@efficios.com>
Date: Tue, 6 Dec 2022 10:52:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Action: Setup working group for the GNU Toolchain proposal to
 migrate to LF IT managed services
Content-Language: en-US
To: Joseph Myers <joseph@codesourcery.com>,
 Joel Brobecker <brobecker@adacore.com>
Cc: Carlos O'Donell <carlos@redhat.com>, gti-tac@lists.linuxfoundation.org
References: <3a81d482-c952-d501-f495-485f00400e85@redhat.com>
 <Y3rxAYa/oc5s/R/7@adacore.com>
 <da126be7-475f-e2ed-fb4f-4493271db5f3@codesourcery.com>
From: Simon Marchi <simon.marchi@efficios.com>
In-Reply-To: <da126be7-475f-e2ed-fb4f-4493271db5f3@codesourcery.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0290.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::26) To YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:a::23)
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT1PR01MB2828:EE_|YT2PR01MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f1e4f81-6338-4edc-b575-08dad7a1dc9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sO7HJAkiAZobeOHWtPw7hK3DIw7RyDaRo0E2jrkQVgIwnlLStXYx3t2Y7zhZzyKtlvKQ88LhWmPIC4qzjXi8y3nRhf7vIfp1oz3MUfgTy73wv2Bry7u2fL6CLxd0bGqmQTh1N02qGbc3T0q8gmBQ6h/5+CP/9U6pXbTyN8pYYv/Oiy+WF93KMcIPOEw0jtmYP1LKrfN19Q6OSmcRYh+BfL9kMGNzgqvcWEX6CTOpPWAD9sl3mcPLvLkA1aFRDa/PRirEcoHzTurT0EAKIEgJ0LSzOhBml/Ge7kv3eIlY3nHPY/mxnqW3PLkuHFsnLBfXHpQzSoJW1DwFxbcKmLW+zp00lweA9v1s9Amte/8khngyWcEgCgcAG7A4QX02U4xA9gbUbYN9fOUifhb0Hzys1k+gug5cmI4xs6y+BaoGHhyOIgfm8iMgbgnMrK/MAUX7tOvSvm4/9eeXDauX4Nl3mAmdEF4sOpO9dduU3nAHngikdAdgndcqHwW0B+nMQ4P8p1O4eepxQIZOySISHnQPCFSSrxZqYBQUOiCSozmqDJOm6cX3obOD8en0elMRtyx0Z2eUOFr+daiwpo/7LVbLtNNtw21MMJsQJKb1qAnsQHFUUq7xTroL4sHouqH7WXbo48u2FpqhMnRz+BTBh6PBFxrn7tcMeSYZIhKskYxZ2q3CjqtuCX80rS7TM5ayi56AeqDUjnkhSM0gPXSXk6YLeoryDqqo0RrOiEIwMX8CY3k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(366004)(136003)(39830400003)(396003)(451199015)(38100700002)(8936002)(5660300002)(4326008)(8676002)(41300700001)(31686004)(44832011)(26005)(31696002)(6506007)(53546011)(316002)(110136005)(36756003)(2906002)(66476007)(83380400001)(66946007)(66556008)(6512007)(6486002)(478600001)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vll6blA4Vm9RekRnczA0MGpCWTRVYmIwV0gxeU9NdWlqdHkreFE0czgzUkVw?=
 =?utf-8?B?cXZBcXZiTGZKUU1ES1J5RU1PWDZaYzIxdW5GWUhFOXpEaHgxNnEvdktBeHF3?=
 =?utf-8?B?K0l3Z1Z6UW42d0pocE5yYkhHUmdONkYxOWR0em1rUFRqa3Izb2p6UC9uUnNk?=
 =?utf-8?B?NGRRTVQ5dkJ6WGlrVjIyZDRUUXBPd05GU1VCeFUxelhxOVJjbTRBRFV0Z0Ra?=
 =?utf-8?B?NHBMRXBVTms4VDRCZW1rNTFYMWJ2Y0F6cUprdzJOUDIwZlFJQmxzaE01eEJP?=
 =?utf-8?B?UzJtWkRsdFdKMGFlZENUa1JvMHV4cmd0eW5JMEpYcHhvRE9CdlJacE05WEVZ?=
 =?utf-8?B?NFhyQUlmUk1OdXJ5ZDI4TkppQys0b0RQc1d4VkUrZjI2NmRyTlhucUIvb3Np?=
 =?utf-8?B?eWlZVDVOd05TdGFqRXZjTjZDeWZLVTJiTndhZ3FPN29GUkRnbi9VREgyeGFx?=
 =?utf-8?B?b0NsL0p2WE10d2l6M1dabzNBVXVQVUxXWmdnRys3Z3JyR2dVUWRDN0g2WVgx?=
 =?utf-8?B?THlFRWxZMW9ob0dicjRldjBjVjJ6VjY4bVczNG5zUnVQU3lDdkozbFVaNHRu?=
 =?utf-8?B?SXZ1MEViTkZJTmpUR3lrTitLbDV2ejdDY1JKb2FYRk9FeU96aFo5a0NGWGhl?=
 =?utf-8?B?U2pjd0ZPQkk2eUlmVFdySmhBMFRhaTNQaEoxQVFtUnl6L094NXNCeGhkMnJv?=
 =?utf-8?B?U1R6MGQzQ2p1ZE5EV3Q4dmRMRUtjeHZJcmZla3FTd2ZacUl2Qkk4bG9mTzNT?=
 =?utf-8?B?VHlBTTVidU5lcXZER0h1QjlMcUMvV3pXRmVlU1ArNjJCVlpGYUgrNUpFcjdY?=
 =?utf-8?B?S0VkcHoxSDBna2FtR1A3T3BFNDlPS0NRNGhpOUtXR05Gc1JpZElaK0Ftdmwr?=
 =?utf-8?B?Q3ZaTlZKOGUvZmxnbjVHSVdDNXFtMFBaMmpPdW5zVWJvVDJGa1Zwd3I0MUtz?=
 =?utf-8?B?cmMxelk1U1B6VzZGSVFRSjlwYTA5SWt5Ym1YMWhmTDFwUndXRWc5OGJ2L1di?=
 =?utf-8?B?QjRPV0VVWU53N0Y2MWtzN0ZDeS9SRlZvTnNEenV6NXlqZkI2R0tQWkI1dHV5?=
 =?utf-8?B?SldlaFhPNDVLQWRncWk2aWdiUjQ1aGt0KzdDVjVwZHY2MzRHNWJVSENmVEkr?=
 =?utf-8?B?WWw0SjBFS2ZRMVJjS3Z6U0tkbCthZW5MdVV4WlRZemRFR244aHlIQjdZYWtC?=
 =?utf-8?B?SnlTVUNsbGhoNGtLMCtkcnd1RHpFYW03Vm1WSGJHd21ONTB0M2JmM0hldGhw?=
 =?utf-8?B?YWhYclBhQStmZ0NWUVVQNUtGYTRBUHdJdXVPaE90SzNZcDkwSW9UZUg2Qnlq?=
 =?utf-8?B?WVpMZDFGUGlVeG1WWWVKN1ZMQUlNOGNuY1lQclV0RlFETmIrbXByV2p1bUF1?=
 =?utf-8?B?SlphUFpneVZYTEJ5SStKbmdjd1EvOGpGNEdBR1FpMVlZay85NnBULzMyTEZm?=
 =?utf-8?B?bXNkVzVRSXhPSVkxcDQrV2plM0Y3ZVpGUVBjVU1Nb3U1VGlWY1VBNHE5aFB6?=
 =?utf-8?B?RnV0eGJkRk9iRWNheHMwR1ZROFlOZzhKdTlCcmZ0bGxCclY5TFlFaWl6WTc2?=
 =?utf-8?B?N1FvTi9IWkNXWUR6MFo1MEpRdTVSKzN2VnFRR0twMUZacXR4aTJLdnRINlB0?=
 =?utf-8?B?bExQSnhsdTl0SEN1THEvdzV0dEs3TWtqaW8xUWtJRC9RTkFRZzhFU1pKOFdB?=
 =?utf-8?B?dndVdVMwYVNJU1gxS3pONFkyb3d2TFd0YTh1bWFoTlJidDByY09LM2RDeHpk?=
 =?utf-8?B?TU5WMjFJc3BWVnM2ODdmVmFrU3FXS3hFSzRneTVWalV0U244YXo4QjZrdVJB?=
 =?utf-8?B?WklMSStsVVJySGVKaWU1Z1l2Ym9CdzFmOS8rNCtzc1Nwem9HTGlHUWhqU2k4?=
 =?utf-8?B?SjdHQ0xucS9HV2MwODNiRUI4d3Uza2FtYXltVVM2czV5eWVjVkp4QzdaR0cv?=
 =?utf-8?B?a01maUZOV0x0eUpLMDdwOURiWVI3RlowZGZ0Qis5MEhVR1UxNHcwNWdlUlNM?=
 =?utf-8?B?d2twWlR3bmpmNkcyWEdCMGJvWGFHMFMyQmVtVXc2RFR4VjlnODFEdVJWaWdj?=
 =?utf-8?B?Z2RkMjVnS1hkbnIwQ3hEeHR0M25WV0ZLTG1Gdmh3ajRJNzFZWlRYdDI1bzBR?=
 =?utf-8?Q?Ly1oBwNr6IebS6J04UL4yqKNh?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1e4f81-6338-4edc-b575-08dad7a1dc9d
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 15:52:21.8313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rA0Q3ASq6BBSg5fT478Zh6teql1FlngqTk3IFO5RMBBPPHITvpOFBpWTWvL4En7ajQKLeO45F46qOVWvr2GILA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB8821

On 11/21/22 15:49, Joseph Myers wrote:
> On Mon, 21 Nov 2022, Joel Brobecker wrote:
> 
>> * bug tracker (bugzilla)
> 
> I think this needs to go into more details.  Details of incoming email 
> handling (some Bugzilla installations don't use incoming email, we need to 
> be explicit about how it's a key feature used in our installations), 
> details of outgoing email handling, details of local changes to the 
> Bugzilla installation and how account creation is handled, for example.

I wasn't aware that Bugzilla could accept posts by email (I personally
don't use it).  I am also unaware of any local Bugzilla changes.  Like I
said in the meeting, I never touched at the infrastructure, I just know
it as a "black box" user.

>>   - /sourceware/infra/bin/email-to-bugzilla
>>
>>         Sends a copy of commit messages to bugzilla if commit
>>         has a PR number in it.
> 
> The fact that this currently seems to use SQL access to the database is a 
> really important thing to include in the list of services.  Remember that 
> we're trying for more isolation of components with minimal interfaces 
> between them, to improve security.  So if this script could be changed or 
> rewritten to use the (public) REST interface instead of SQL access to 
> check for whether bugs exist, that would be helpful.  (The fact that it 
> sends email to add to Bugzilla is also relevant, because it means that any 
> system running this script needs to be able to send email - and for any 
> system sending email, it will be necessary to avoid losing outgoing email 
> if it's a transient system and there's a transient email problem.)
> 
> In general, details of exactly what interfaces are used by components to 
> interact with others - especially if they make any assumptions about 
> direct database or filesystem access, or about different services being 
> hosted on the same system - are really important.  (This would then give a 
> list of cases where we should *change* the interfaces used to remove such 
> dependencies - for example, using the public read-only REST API to extract 
> information from Bugzilla instead of SQL access.)

Ok, maybe I misunderstood the point of the list then.  I thought it was
a list of functional requirements, what needs to work from a user point
of view, regardless of how it's implemented.

[Implementation detail: I know about the email-to-bugzilla script,
because Joel sent it to me lately.  I am in the process of rewriting it
in Python (if it's in Perl, I just can't contribute, sorry) to make it
recognize bugzilla URLs in commit messages.  The script accesses the DB
directly just to see if a given bug number exists.  If Bugzilla has a
proper REST interface, it should be easy to change.]

I'll go over the list again, see if I can add some details, but it
certainly won't be in as much details as what Carlos did.

Simon
