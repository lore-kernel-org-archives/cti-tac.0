Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FAD847B
	for <gti-tac@lists.linuxfoundation.org>; Thu,  2 Mar 2023 16:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAAC2410B3
	for <gti-tac@lists.linuxfoundation.org>; Thu,  2 Mar 2023 16:42:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAAC2410B3
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=QTh/uLFN
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.103
X-Spam-Level:
X-Spam-Status: No, score=-2.103 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
	SPF_HELO_PASS=-0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eKAjXNfMjnOF for <gti-tac@lists.linuxfoundation.org>;
	Thu,  2 Mar 2023 16:42:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CFF8410AE
Received: from CAN01-YQB-obe.outbound.protection.outlook.com (mail-yqbcan01on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f403:7052::62b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9CFF8410AE
	for <gti-tac@lists.linuxfoundation.org>; Thu,  2 Mar 2023 16:42:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJWsPLx9DQNrKDoC9B/TT1dRdNtlBKyGH7RjN1OTX2eAybB6jZo8Rf+JEaGwpP7oRdDd7qTeVWhbWsZVIxe82vWHieqdushwwH4j5uUugcacSv5Uqse+XuPcMpN9CXOgcX5hQv49bpIuq4SqlXH7fb9zbTNc+O6ZHf2QqT+ywkbeHgMTtbHlG9+CxH8xduHGeX6iXRm/VzK0KXEBvqnAzVzL+kwo1nxqxlp/IrPV++ykY9z5KZAGTt3B0xMge2AttcF/1d0bDo7tAHbMFfL9mbv1e7PhwB3jSF1yj1ljelUU9R8DZkERAtOw/cNFghdPX4MVbnAe3E5woEIkepxCmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27EL919788sX+5kMLZq9C+EqoQt+RBfVHKV9JGBqX7Q=;
 b=HwfafMCKcHqzq7oZHrw6nKUB4MgBRkKdMASfFLhKGj1nJF6o6iJbOAG8PXqSstzYsGEX3OxCBFWbe4myDiODhFp50yS3j+iik8/awaMdxAfdxNqpbAWmc81CAKkAnSPzK/MGLf9bR4BHEjZQ6diytKuHPJsQd3jaCxfp1njjEad/QofUb02zRinyJWyl1uQYdrAD4ui9OkjZSq/Mfo8BFZXVevzgquSYXxkHdq61fJT2MWihAgyKGI+YKxjZaXwUMt9yOFI0vjsAd5XsyaUAZWhtMAqJ1fAy0iMTKe2jzUSEUn0ksKVqCQH7dHsd2qVVoIIetQnlFROjveEjMXkkwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27EL919788sX+5kMLZq9C+EqoQt+RBfVHKV9JGBqX7Q=;
 b=QTh/uLFNAyh5WGJUMxKDxBNl34DcEp+JapL7MYxLpkNJWrXR+zYo1SOqVajukdqyLprzQg0Z7W27LERmnxrekYB/Rlff2Ic8AvoIvsysMqDPIjWsgoJu7I1L73zIxLratVEX4aGrHxD3hg7BEgv88knjsoCCsek0sEnd6Uo1FyeWACeJNmJFLrvxsv2sghSS9sJQxEvRJ0uU1+m2bGfVM6z0AFtXqqbYK5Q2cK42TY0Dgq7arn0xegCscdYX9VXckcb4ttK7OZ6VW8mhsw0yBQI53p/pfFZwXRveihRf+l8k5nPBiSTfKMKlpDiigbWXVmEcaE1vdWmFohYE2JLffg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:a::23)
 by YT2PR01MB8534.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 16:42:26 +0000
Received: from YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::2e20:aebe:9849:7408]) by YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::2e20:aebe:9849:7408%5]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 16:42:26 +0000
Message-ID: <256fbbba-4b71-4fc0-3646-2c338253ba34@efficios.com>
Date: Thu, 2 Mar 2023 11:42:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Planning the next GTI TAC meeting for March 8th.
To: Carlos O'Donell <carlos@redhat.com>, gti-tac@lists.linuxfoundation.org
References: <db67f1f9-320c-18fc-f196-5923cc622c0a@redhat.com>
Content-Language: fr
From: Simon Marchi <simon.marchi@efficios.com>
In-Reply-To: <db67f1f9-320c-18fc-f196-5923cc622c0a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0101.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::37) To YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:a::23)
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT1PR01MB2828:EE_|YT2PR01MB8534:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e530fec-df5b-4e8e-2061-08db1b3d1b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	poole7oOnXBNI+nFIrnyIjEtlwdpYNmM63UOFesowLr674/eG0buGq/7PmhaQ40GFaE+zspZZJUvRaLfcZCo/8U1fgGd1K7kcjG1u0bh2ZMiJfiCyGy0UOYiSSTnbNlayP//T+YZ1XewOegFlEiV1lSJKIYGtezot5WMQ9/4iwlZel5cPJeCfG+lZBTpsToF6ChFS8DCCYQuXqH5UVMdn17dXvmvGbn8Ny+wENANw74XZVJ7th5Ojnw5hZjUgCCN0D9A89JoxXuNRvFAoHNeSwc4FQ+4RWmXxY2rnTp+7SqanZvQNxfDmNX4u/aBhuO+gjPNekBuWyiGJkUWU8ypA2eoTwHVhr6ByYf5Zn4aj0hFDzm7JSTMVWOK4k66jK1nj4N1RcRX4SZEhjFZKsJnI9Nie7FaUeeS3ErJXiej5fVG1BvmwBNQWvG/Ebhj1Xng1mIV/WPcHHL0Z/3FfX6hjXSMxnMBi9cSERnSWaMjBOpYnoNptfcj2oZCttFMAadoMuBUdqJ+mabGrRqG+53c1qUOk6eyaA8lbJ8jNqzZ/p9gfNShyFy5tHoUfA3jbrnsL4fWAOscF+W9gdoFUSrMX63KcYKwKguAgd22Uradznckz/NA7erzj+nuRnRdv+QQPD6alcf3ZEgkvsHFJLPIAKIFj72QtnH+iZgCWicyyhHdwEmKSvE9gN+eFzQI9h3ZSjKdnqC0wjs4vVWc54upi2mDancPngXkyY8/vzs39uk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(39830400003)(376002)(366004)(396003)(136003)(346002)(451199018)(36756003)(558084003)(53546011)(6486002)(6506007)(6512007)(26005)(186003)(2616005)(41300700001)(316002)(66556008)(66476007)(8676002)(44832011)(2906002)(478600001)(5660300002)(8936002)(38100700002)(31696002)(66946007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djdia3h2d0EwRno2YmFDT2kxeTJWNHdzOFFZd3NlbXFsRHBwQU5SNUV2V0NR?=
 =?utf-8?B?REk4MFlDQkRPbVdZOC9tbzRSWkNscEJCNFptcjZBSUNmeGpNTnltMDhoVXpp?=
 =?utf-8?B?bU85QkpSRE9EZlZCWlV5VWNzNU5mdWxtYnhlVkVJTGdqRmJ3cmNHbVlYT3hp?=
 =?utf-8?B?ekVMbndwUmVweDBZQnp4ZWdhUGJuTGdsaGZYUGJxTG0xOGtrZ3p2RDR0SDhU?=
 =?utf-8?B?K1h4cklabXB3K1UwRy9uTFllS0E4N29yYXZqUEJ6RGtJQ2N1anN2aklad2RO?=
 =?utf-8?B?WEdMSmFRakRTRmR6NDhiTVJmMUxOMVZLZFB6czRrcEE0VThvK2xDd1Vmd3p3?=
 =?utf-8?B?UFJ3TXoxeXEwR2JEMWZrV055VjZiZzFGZTgxMUVZdHZLVmYybkplL1RteDUx?=
 =?utf-8?B?QjhoWExwcE5rbW40MzFxMk9rb21rMFU4Y2FwbkpEV0s2N1R5ZTVmcmVMcElT?=
 =?utf-8?B?QldNbjQxdFNRdmliR1VnS1VpeWx1VHkzVnpzUnI2WTBVSCtvL3dXVUpQMFll?=
 =?utf-8?B?KzBVcmhpb2h6MUlYUTR0eHFXTzdhaDBVTHFrbHhxOTRIVUNrUU82TGhrR0J2?=
 =?utf-8?B?UnVDQWJhcHlGaXhua1V0cW41djJNU1FFa1RwaFNFMlpmRU1VVEtZdnRwQllp?=
 =?utf-8?B?QUI5bTUvSldFNitzQ0lWZzVIYXhYQ1EwQjJYd0N2eE5aTGdFT1RqWFowaERK?=
 =?utf-8?B?cWhiODRyYzdIemdiQitITmdWRk1yUlVOalBoUE9NT2c2d3VXMTFtMzJFQ3Vj?=
 =?utf-8?B?YVdnVW9NR1pWSHdzaWlmeERFeEw0MXRyRDJIYWhEa3Nta0hMRHZhTjRrSUlC?=
 =?utf-8?B?dnFVdVJFQklOaHJOd0FYbGJEWlVha09uNVVWcTBMSWxVOHBPS2hFVHBRUE5C?=
 =?utf-8?B?K3Z3SlAzRTFQRVpRNHJ1NktkWU05Um42b2dPRkpETFU3YXA1SURGTlhURHVG?=
 =?utf-8?B?b0V6d2swMHZvM05tYzV6T1k3cE1sTlB6YW5PUm0vT05LenZPb2t3ZHg3WHB1?=
 =?utf-8?B?Z3BrWmpHdXdXN0loS3N0MWdqNUJCZngyQSsrVGFEbXFWdndUeUxCR3Zha2xQ?=
 =?utf-8?B?bmdPdGVKa3g5MmNLd0Z1ZWNHRllBSHE4dGdjdEc4V0Rja2ZTbzZPWHB5WFJl?=
 =?utf-8?B?ZzhvclNTYzNaMkdINjVING5lbjlhak91Zjh6K2pkS2xSN1dhWlNETVRpcjI2?=
 =?utf-8?B?bERjVUZzMTJ5Q1kveVRpNVZlOURzUXhqZGFvZ1pUWmpiMnUzek5XUmtrSWRn?=
 =?utf-8?B?NnZmdnlsSkR1S1hGekNsQ3MvbytrcXlxMzEwNlRJYkhoQjFQT1dDRW13aER0?=
 =?utf-8?B?RkdqZS9mYzFqYTdTdTRIbkorb1FtRHdYU3hDbEMvNHZTVS9wNjdPUzFqYndD?=
 =?utf-8?B?SUp2Qllmb3JYOVpjWkQxV0xDcVFVUVdNSHN3TkpZYmpvTzkxM0QxYmlnNnVT?=
 =?utf-8?B?MXI0M0lVNUVvWmE1OFlyM1ZId2VtN3AyaXU2UUdXSEJ6eTdwblRrUzEyRjZM?=
 =?utf-8?B?R09wK2pWMGhwWFkxMS8zM0FwSFdXeHo5Sm5jWDFTTHYzN0VyUWM4T1I5Zisx?=
 =?utf-8?B?aDBCZnBOZ2RHd1FKbFJnKzV2SmUvN1FHeXNqbkV3Z24wdjh5TGFySVN0d3Zj?=
 =?utf-8?B?T25ZakRsWGdQcVFicTFWRjQ3VitxUjFaRVhqNFA4cE4ySG1PVHJVQXIvNlpZ?=
 =?utf-8?B?T243N21yUlB1Z1dYMmlkMnlwcDFpMWE0cElWNXQ2SWZEV0NBRXFDMjRsMStr?=
 =?utf-8?B?K3c1eXB0TWV1L1BPaXppWTg3bURHZnNtbENUTG05b3lrUkdvTUlpTFl1aVFQ?=
 =?utf-8?B?YW9IbEhZYmZyRkhvRFR0S01nZHh4dUpnclRyL2RpcWJVengvenhRelByMTVW?=
 =?utf-8?B?cVFZKy9xR3FiSGlVWFloT0RaU2x5Rkg4OHV4YTVoWkNNbEsvTnA1L2ppUnZ6?=
 =?utf-8?B?M293dTlGMDFMQXp5WENZMDk1VjJROC9FZ3BUbmJ1djd6akNvbUhyV0kwd3Vl?=
 =?utf-8?B?bGhZa1RzejhlaDNRVDFlUjE1c01kTFA2U0pEMTJQc3dtdWQ0VUM5Y0xleGhQ?=
 =?utf-8?B?TE1zQ3M2QnQ0b0ZVME9aQkdtUWlOZmp4QW9Yam1JalhoMDNEVFVZcm1xMElC?=
 =?utf-8?Q?juxzIzi4O/g+MG7JF8oRWhev4?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e530fec-df5b-4e8e-2061-08db1b3d1b07
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 16:42:26.5495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuVgKFe5lg9rwAoWs4Qp7B1bzBBLZ3TgG3wFPWbdXDF5LJznC2HlEzn8hx4Z1py43uE59Z4X6KYk2Odi4DvcUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB8534

On 3/1/23 10:16, Carlos O'Donell wrote:
> Team,
> 
> I would like to setup a GTI TAC meeting for March 8th at 11am EST / 4pm GMT.
> 
> Does that work?

Works for me.

Simon
