Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE62A53BB
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 19:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1134F402C0
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 19:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1134F402C0
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=oIvEqKXp
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.103
X-Spam-Level:
X-Spam-Status: No, score=-2.103 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
	SPF_HELO_PASS=-0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9wACv5lCB5wj for <gti-tac@lists.linuxfoundation.org>;
	Mon,  6 Feb 2023 19:11:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72192402BD
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::62a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 72192402BD
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 19:11:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqrwMF+S6aajngU62WVUixbSCLjlb1R8GU0ECSHWKULbUC5JhrQo9kMyE+dv2gL4s2hKqbGABq31DDlotFf9Z4Puu1CeeS7aix+78HOMgq0phwCZIXLu+vnWiv+eqeKKt65yIqOTwH3Ht8ns+lT9cTh+itEqvpdodTBX+VSMD7rTgUkWGXc5fe4JUaHr7XYiZuQP/tEFIdIkbt9e+ol1crymW4xcxmmA2v5qJNhY2SipPi1npLqeGcPLEQ0tvyiCMbjtB137JxMejVeEmme49iBR6z2mwNIvXWwssy83qTakgztuW71rh7viS2X9FPRqm8EVZQSRZXDiJ1V02wTiCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34OlbzgCAkMOE5Y12xSmQJTqX8fqRUWg2swpnsfMd8k=;
 b=R4Bix+KiWvWOAINysYjVQ/tCgjEdvl8hwuCzo19xFDXz4vbAiA+jADmca/8vOxSAtu+3Z7f6IBOM0RUdckfiwBtfczaZ+uvcdi7qg3+MZDQNY4xnFMkAA3gAZD9j5miZNWvUFRB5k9UwjS9JcjDaY0h2mjNSuvOVMvMSSTCMvHxA050CHXsp6F7ZmktR61gWlgeX6dhzw3xOtybsjkSH/FZ5ygaY1V0H1Bh8tkOMu0wgOrlvWZcBUuvpQXa6iDqmoruHrYFkBbEmX/VwZ3pBNbOmuutWBDV38ki7TIyZy2EgzQbM5uje+a6X0FM75qTrevhxS5k5iue/AD+OgND/rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34OlbzgCAkMOE5Y12xSmQJTqX8fqRUWg2swpnsfMd8k=;
 b=oIvEqKXpp0e8GfczKni3YiI30zCuQ8oXJFH+RYdRdchLtbl8lzdYfKT66m4pgdjMddB8hmhbty5Kulbki/7IRUciFu8ifJyqTrxSd/PYboUHWw5Zo03HwjuOEgenKAvDjCcj7QeD7J6L4upw3ukJZUuIAYnd7lQTBOlLfxFLG5uckltVU6ZDd5QUcFR6ps//Lmaq4xjoV/+kP9schchCsepmk1Uh6Az2LMXkTzqcnqKJ5DrBHfawMVZAgKqA2Hf9/H1aZuEDnDRaL0Sea0jCoGc7L7rG00TfAKTqTU8oiFg9CidKdVJDInonKCBUA46CUuqW7wW+4xaYX1ivMsIhfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:a::23)
 by YT3PR01MB8243.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:9c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 19:11:32 +0000
Received: from YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::ca4c:b759:c2f5:c976]) by YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::ca4c:b759:c2f5:c976%5]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 19:11:32 +0000
Message-ID: <bc978ef9-3d6e-d032-252b-3aae460c895a@efficios.com>
Date: Mon, 6 Feb 2023 14:11:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: CY23 - Status of service enumeration.
Content-Language: en-US
To: Carlos O'Donell <carlos@redhat.com>, gti-tac@lists.linuxfoundation.org
References: <d8790f60-483b-dfc6-dd7f-cb408334eb40@redhat.com>
From: Simon Marchi <simon.marchi@efficios.com>
In-Reply-To: <d8790f60-483b-dfc6-dd7f-cb408334eb40@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0182.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::25) To YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:a::23)
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT1PR01MB2828:EE_|YT3PR01MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: 4473028e-f434-41a5-6d12-08db0875f4e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lq+8oO6m5fwI5nqrHvMVWwJObjkvxdYrEPhq4kxwYw1X6rkyNrL2dqomM7BFGOS5q+Erus6WFsXrMbBrox4aU93P0UxNBHrEtKRgSzrst01fLXN7bWfYJM2GWFsKvE5xmDnUqxXR/AqQjgltfEZa9nyft3otsDKD28LPQQVzZssq145+BYIUsz9OLAcBjRSZFFB9mOuv2g8KFXOigfBVYlC3v4wGAcEx3dh6Hi7VFKJSUAHwFU1oCMYjtVRMdyzO5Gj/yOsc9aLoz0/h/laDqaOOVOCdUuLHg3tlSlL3zVsSdoZVjeVTIVawS1ctGwGrcuDzReT36LyPOlhh1LS/v3VZNaNQ7F9VqNWoHOKhYqFdgr2Rv6IYe1CHMbNPkUQ9rSs6wJwr7GJzxJwHVeoaao7X5v58UrS2TNxAnH3dVBulzpjMcc+Vp0sl7hcq4v87YJ7Hr3ARLFBItjtmKRukyEmhZkL3UblDGMLG6C6nhVxbBYb61FtYSD2k3Nfnu+Vs2NhnFavyV2A1FsNcQqZWP/b1zXeWEwAxFs74mt6ysQkQlRDGNqUrvVxtdjLptzQHlWRs9dtG12i5ZHXs0oNvD2T8oiihV9I4Ofc2BRMmS2F6YzTs8rey/TpoQI1LM5gx5nbDD9KmcvZUzT8nQC4pxNJsK3DuoHyMcbgknryhHid3CeFG+LBaQi4UJGWuOIMnL95TpDuupfgbgig3yZ1VjTIX4sjlyIXt6wSDTte+gIY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(39830400003)(346002)(136003)(396003)(366004)(376002)(451199018)(66946007)(38100700002)(8936002)(66556008)(66476007)(41300700001)(8676002)(2906002)(6506007)(6666004)(186003)(26005)(6512007)(2616005)(44832011)(316002)(478600001)(6486002)(558084003)(36756003)(5660300002)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2w1U3MzUGtIc2xJbXc2dWFLZW9nK01SdFhBRXlWczdMdm1xaGdDV3JHUmNJ?=
 =?utf-8?B?LzFtbDlQTCt3YXE5OVBxd2VDdHBIMWs4dzY4dGNxOGVBVUtlQWliYU5kRU9L?=
 =?utf-8?B?ajZRWmN0c282TXVmWGZGWC9DeEdnLzYwVlQrUFBidG9IY1g2dmdmT2tubVJQ?=
 =?utf-8?B?UGxpQW90MlhyN04vWGJLaUsxdGxpUW9aMERhVklLU25TUFlMbkI1bE1SQU04?=
 =?utf-8?B?V2xTdTBwTFU5NWMrcURIWlVuME5SaDBwZHpobnpLYlgyaTlqaEhpRTczQzA2?=
 =?utf-8?B?V0xEbW1XdjE0MHhPYVV3QWpzbUFnU2FyWjlkbisyUUoyb2FSVXpMZTdOZndp?=
 =?utf-8?B?a0lld2Q0dHlVd1J2ZndaYTZGSFRpU205U2NZbDRJczZ2ZjQ0VjJDMll1YmtQ?=
 =?utf-8?B?bnd2b3c0aXdUa2VrV3BsS2NzTldrNTZHbjZxWkF3RGhnUUJIUUwxRlFHcE02?=
 =?utf-8?B?My9BekM4YU44QzBWVnJuczBCZlBRa2JrOHovUHk5WlNBM3FpZ1NSWkRvckhG?=
 =?utf-8?B?RDd6THRST2k4VS9ONGNmMm1Ud0hkMUdadlVRclc1a1NFSitsd1hqSjVyYjRK?=
 =?utf-8?B?YXVGRWVoak5SUGdrY01YZ1ZpRVRtNGFzSnRMaGZUOCtRNHk1aHoxQVBQOVJ6?=
 =?utf-8?B?L0lYbG8zTlgwNkRmQXlFajliSzhzK2s5dk82UkRndFdreE9CeGlKdkwyRDd6?=
 =?utf-8?B?Ui85R256azBtQ2JlQmk5eFZkT1lTZW1qR3ZoS0ZndDZSS3dEV1FqUWpLeGty?=
 =?utf-8?B?SEF6NUV6cHNhRHUzRktqaVpveUhSNmNNTXJ1VkdKb3BwV1lMWENCbUt0eUxL?=
 =?utf-8?B?YmhXK21lQXQ4NlAvWjJ6UCtVYWZTRkRSbXZldHJOeFZ2cThXKzU0djNGSFY1?=
 =?utf-8?B?OS9OSmN1YU5WMitkSDhpYjNBT3hiYzZnR1lLd2ZlUFFNV2hVLzZqWDlQeVEz?=
 =?utf-8?B?RDBKNHIraFdUUTNBUlgvV09YSFdtNGFPa0pac3FsQWFnVk9SU05IYTlGZzJ6?=
 =?utf-8?B?RkttTmFudXRKM2NvNXNFS2NDQVB1YzVsMWxpSVVKdmI1bWRwZXBSZ3V0alVX?=
 =?utf-8?B?TWhubmFIR09reU54RnZQOFI0bjFJWFBXT2VVbUtYQzU5dXIwckdFWVVNZ3M4?=
 =?utf-8?B?Uk4yU2VwelVGVlFWbGpwc3JRbXN3R2hhQ0kvWm5OY0dSdDZBSFdhQjVFcTYz?=
 =?utf-8?B?b1VIOHF6dXNkaXp4QVg0ekpWMHBWdnhwUWdRWnRYVFQ2aTZSZklBcU16T0s5?=
 =?utf-8?B?bHZNblNPelRUQXNkcmdNZnpodTdqQUNFeTdCaGwrWTdFTmZpVVphSm02WUNy?=
 =?utf-8?B?MFpObkVVMk9TUkpwcExDK3hqOGdjQytCOUp4ckdvU3JPWDhUZ3pzZW1OQTFv?=
 =?utf-8?B?TDBRT3FTa3NZSmJYTjd4QU0rQWtVTnl2TTJCTEdqM0Z5Q3FmWmlySDFoVW1I?=
 =?utf-8?B?RHladlI1Rm5GUDBSUmwzR21OdW9PVm9xRFIranlUMTdBODI4Y2J1WjJ5UVgx?=
 =?utf-8?B?UXdaZ0pyMlpoVi9ZYXM2TkF3UGEzYytKOEQ1TjRGSmNvbjA5SFhTRG5TWGRr?=
 =?utf-8?B?ZGNlREZUS0YwdmhDUG1OYys3bmJ1WkxYVGJUaUJBeDB1WnVDazRGOHIzNWNv?=
 =?utf-8?B?enh4OFJ4V1FsOTUyMWtJTEVqWjNGNlhSdjR3Z25PK203TWpXREpITmxzUVYv?=
 =?utf-8?B?WTZMUm5TWUdLWlY4SlhtY1ZtMEpTdXpVNFlSdm1uMllVUkdlaEp4SGtJQ0RJ?=
 =?utf-8?B?UnVBelZxRmJZWFlQN1lSd2pZK3NqeC9zVVNpQkloa2crWEFKZzZOKzJzVHQ4?=
 =?utf-8?B?ajlkNWt5RzhIZTZ5cEhpZW14RXlPbVdzZi9YZVlCdGxlVjdMalZ6dTVvTnh4?=
 =?utf-8?B?R0RrMmhFVzZkQ0xHM1BjSUtCRFhYaURXUXd0WGdwK3djZTYySnlYVUFDT0xC?=
 =?utf-8?B?V2o2MXNiN284cnJVRU55aEdtM0R6K2ZDSlc4WVdsYVRQdktrSTN3YkFnMkVO?=
 =?utf-8?B?WjY0YllwTzVnaENoNSthcGh5RUh0TDM3Q0t3MTZxNnBhZzdHSDg3MDdsSU9a?=
 =?utf-8?B?bzhUZnV4Z2NOc0pvNnVLYU51cmZHVHIxMXVYTnRBUXY2SkNUSllmdGdiNjA0?=
 =?utf-8?Q?vOTsjiEqwJ2G3hllqtLhTSox1?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4473028e-f434-41a5-6d12-08db0875f4e7
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 19:11:32.0435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uLcyR+oBd/93t5e6AgJumQwE76pWuURp2o1whdLkrLfEwFlHDkU9kSSnvIKTOD47mxcBAyuUp31MeTnudTZsrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB8243

> Joel, Simon,
> 
> Is binutils going to be any different from gdb?
I don't know about the binutils process.  Perhaps we can ask Nick
Clifton to review our list for GDB and complement it with any
information specific for binutils?

Simon

