Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F1A611E
	for <gti-tac@lists.linuxfoundation.org>; Thu, 17 Nov 2022 14:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B902382075
	for <gti-tac@lists.linuxfoundation.org>; Thu, 17 Nov 2022 14:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B902382075
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=kyBNbL7i
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
	with ESMTP id r3P-IgaPLGL0 for <gti-tac@lists.linuxfoundation.org>;
	Thu, 17 Nov 2022 14:11:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 694BC82074
Received: from CAN01-YQB-obe.outbound.protection.outlook.com (mail-yqbcan01on20605.outbound.protection.outlook.com [IPv6:2a01:111:f403:7052::605])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 694BC82074
	for <gti-tac@lists.linuxfoundation.org>; Thu, 17 Nov 2022 14:11:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVmxjT3HMzhDLvLjLvslhJHRPwW0pzLoKlYna226dsjRusz439+mRI9dVij0gPJA3uu9J2ZdB2QGb7keTgW2Q3EQ7IhHHM8DDCgUmnbf/346jS1CamUDhVk+/EFaxyguXQqfNUTkdGEQfe2bZkoos3yT8wGFtq3VKTr3279ykErBwy4GRjvJCkn8JFTOq0nOvlZtZMBRJYCeRFwzbatHlc24aHFmwnajQBH1Qm78AVsWyNsETFzymtnz5/sucFAQJzwGUG+9/7M9k4cS2m0SB4mfJVwl/k0GB91vYpXLhl8kURE/4xlOz9rHR3YP7yKpAJqzgmmzykzpM6zC+PzCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYkL+TwZCD9tXJEflrTohYHIDwV7geqqPXrweQPPmkQ=;
 b=VXtESfvtlaKsfEN0wIqppbaZhhM6mwGIK79o9GYk8n54Drc6vZpZz7awmHoYz6kBTFLU+dw1DQK+jWqAeQ+KwEZ9v3P6iik0dS1oYPywgWLsQF5YMqfUpx6gE0azMvjIGFB75YOwQgtkz3E506lftNRVLNjXawysUv8bQRGnlBtbJP+VEeBX1LXPGjn4Tu6AyF87qbvPNuS/JUUi3NYWg1LSBqsMhPn15aOnxp3Wl8AbywE6TsDrcsGWFS3vDvU2FHH0Q7X6nhqWG1XmF7XEB45TsA/YvNcEU09jwVDT7/xNzWn9GBCxqupj0tDB5Omm6OULuJodjdtc8uDnVBHugQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYkL+TwZCD9tXJEflrTohYHIDwV7geqqPXrweQPPmkQ=;
 b=kyBNbL7i7CzoEYmtpbH/zuXcFcWT9uclDJGVRutS1BcfuZjlDzw+FGd/5fFx8vmMCiyPoT/kudkkMZiOJTzs/Fd7n2cGRKbTgSiFdQvgeGoPO8x5agy5jzpS7VyhtpumKeagndwLZtI3b3BoBr6pc7qSNQxFALdJej23RllPGv4IluiSLBFYXjOr9zppLgb8MuQ/dbI3hJ3XgzEUUkDqdNAohdCoAjkLUBZobEm6qOBOv2xhuPFAktJFi+0EsbxtaHxbNYaBvGO1EmUC1wVvGUMHVIeTZBsDzV4rYIZ2I0xD650iyC7QRdmj+OjI5nLGfzrun0TBKmxMH0X21IjE3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:a::23)
 by YT3PR01MB8322.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:9b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Thu, 17 Nov
 2022 14:10:57 +0000
Received: from YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::2465:ab25:2168:32df]) by YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::2465:ab25:2168:32df%4]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 14:10:57 +0000
Message-ID: <ead28c4c-a181-57c0-2918-e43aa8680100@efficios.com>
Date: Thu, 17 Nov 2022 09:10:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Action: Setup working group for the GNU Toolchain proposal to
 migrate to LF IT managed services
Content-Language: fr
To: Joel Brobecker <brobecker@adacore.com>,
 Carlos O'Donell <carlos@redhat.com>
Cc: Joseph Myers <joseph@codesourcery.com>, gti-tac@lists.linuxfoundation.org
References: <3a81d482-c952-d501-f495-485f00400e85@redhat.com>
 <d8eabe-31ec-873d-7893-915e6d2fd6e@codesourcery.com>
 <ce1a98c9-a512-855d-3ad2-53ae69e0847e@redhat.com>
 <Y3P1p4thdlOLES9l@adacore.com>
From: Simon Marchi <simon.marchi@efficios.com>
In-Reply-To: <Y3P1p4thdlOLES9l@adacore.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0198.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::35) To YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:a::23)
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT1PR01MB2828:EE_|YT3PR01MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: 91079a6f-5266-42e6-a573-08dac8a58bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pAPSN/NRlEhH9uZH9WPTd5cbUIhYYzkui4lQKMiWv5hUWXQYlaV++YK24AipTTU4rqruCblSlJWx1ub59xpL5sZVHHrGhJly0lO6K7rZ35l0h1KrQM6Eu6V/l9frxZf//or3pijQpTy6TkbxOrXOx18bvr7iNX5d2mGYcgvxJor9V9O9mz6/Wr1Z049tGrOwIf3L0kbEE/MUEnWl8T+6iZIh7BTstAL2Md/fdj3GqGpuUisGwEiweVep9TPspUiAyT6VQRrF03NbhY86V2SbkwPZF43Uz51M9HIfiGhZGY56uTpDVmyInEvqPg8neLWOXyXPfMlhXhCQbpBNSSL0Mc2R7lN7J9AeDhlQYhNeZzoJo3yo6b7jT8nQXesYd/N6yWJEGq9rwr0hQES7rKwl98v8q9DwY2uZ+elwSLvompzFlbOIdZX5Hyt8En7sDiFySU2SzrJZrrolRWXDYBEQfix0ikZH9LC8KTLF9BindpX3/UA+1ekEnlHsYJIYAq5pJqEjSdgFKt8bkJlmwNoMjFa4HQICujWD5I9gzHEzTAWtKaIVda9m/f/rN8cNL3SmN6RdXMME/V8nHJcKbUPm30+NBXRK2D54SgTcEq0H7lUYrRUjVRcnBypJ5i9eNUuljrKcOkLaUGOgIo7n//xc8iciUP8Y8I74Le9SGE6q4gVQ4BQlVLqWHYYqPfLls40HPOH0XU+qh8XqXklmNCvnJ4wq6T5rgVZCV/wbFasVojM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(376002)(39830400003)(396003)(366004)(451199015)(186003)(44832011)(5660300002)(4744005)(110136005)(316002)(6506007)(53546011)(41300700001)(2616005)(6512007)(26005)(66556008)(66476007)(36756003)(8936002)(8676002)(66946007)(4326008)(38100700002)(2906002)(83380400001)(31696002)(478600001)(6666004)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enhrV09tV1pnaWVnZDZmOS9lcTB3UHhNY01qTzdyYVVTQWVwN3Izb013QTQ2?=
 =?utf-8?B?eWFEb1czVS9OcE5VSDNFdVRSRUpEK1lydUhheTlKS1I0RWhRZkJGQ2JrMDBL?=
 =?utf-8?B?NUcrRUh3dXZCN0d6OWlUV3hSdGFmV0p5bUNGRW53OVAxa3dyV1FUa3QyODk4?=
 =?utf-8?B?U0pUMWpJQVJWS2QwaWZJb2s0RnRydUdsN1h2RkFWcjFQemx2ZmdKZnRZS25S?=
 =?utf-8?B?dkVIaWJ1NTdwZlZmUkIzQlhCOElMdE5Oa05vTUZLOVhtc0dtMmQ4TXp4Szdh?=
 =?utf-8?B?UCtpVFVvWURhSVdsQlRxNFV2YzRHazMvNGEyN3BCSHZJQ3Jld2ZTaTN2R1Ry?=
 =?utf-8?B?RjcrcExRdWoxQVpDQTlwNGUrRFdpckhLaldRTm5oVzNlVmxwZjl4cW5hUEpj?=
 =?utf-8?B?WXo5VE1jSDV5ZG4yMUdoV0xhZWZVVC9vUWUvMFZKalo1Z3ZHd2liMC9lYjhp?=
 =?utf-8?B?Y0pBeDMyQkNRQkd1dC9WYmtpZU0yOFVOMytPY3Vnd2F2RGpPTG5hTjF3MklY?=
 =?utf-8?B?Vmo0THBwYVBkNTRodExHT1ZlalRpdUlzTjk5aVVxMFZRODVVTHlkUjZaNktO?=
 =?utf-8?B?cEZ2SkIvSHhiSmVOaHhmbW11YmpCRmw5TC9PcHpQdmJ0bmNrUnRTWXl3TXJr?=
 =?utf-8?B?UkxPV1JUU1hHRmU5TXQzaDJBeG9XTWNiQ2daSTZTMUc2TUxsallOaXdqRjRI?=
 =?utf-8?B?SFJNMmt0Y0Y1OXpvdDhNdkIwbC9HWUMzT0lYd2cyVG54L1N4b0lMSVJKZ2Q4?=
 =?utf-8?B?N08zUjBLemV1cmo3VUllUmh2aHh1NGVtTXE0T25EaFJHSzEyS2VNZXczT0ZC?=
 =?utf-8?B?WDUwc3N2M2lnQnRDMlJpcVNkdTlOdTFtd29kbklxb24rS0kxbHVCZmttQVdO?=
 =?utf-8?B?Rzh6OXQvYjY2RC9NaWdHWG1zMXdOZlRQZnB1b3VBblQ2Sk5hNlozbGpReG0y?=
 =?utf-8?B?TlI2dVdURTBDOWJpRmlJTG8vb29yVWxrN0xWZEx6RWE1K0VEUGRPZnFRQmFO?=
 =?utf-8?B?U1lUT1AzbmU0OUpEKzQ2QUFyOTZXd1c0S2UzVGlrNzF2UlMzSE41UUlkRkt3?=
 =?utf-8?B?YXA3d3V6SmxuWnFnUHRyMkh1NVVGYzcxbGZqMXpaTG9WT1hXdUhucERPaDVq?=
 =?utf-8?B?WGMySm5UaEhTTjIwRWtKVkJuVnVMZWNhQzR4bEdGL1ptT2xRaTJWMnVWVUdy?=
 =?utf-8?B?NHFDZGJKOE42T0RSa3h2WmVobE1Gb29wSENtTDdPL1BWUGJia0NWSEhKdStu?=
 =?utf-8?B?bGZ2RHpYV3hPaXRkR1BZUmowcEdPM29CczFhVjJWbTg4YVhZWm9qZktuVUtU?=
 =?utf-8?B?NmsxWEo3Vnc2RVcvcWwxTkVmOVV5TFpmTjBqaXN4QlR0REZleVFIVXdNSWd4?=
 =?utf-8?B?d2ZoaDFaaFFCVkZaR2JUWjhDZkRVQm5jTUdNZkFHYWg0RjREd1QreTd0enI0?=
 =?utf-8?B?K2lpL2xyZTVMQVkyajV2VmhHdmJJNkJyRzBxWWdXcHZwQWtPUTdsNlRHcnpN?=
 =?utf-8?B?OEpJRXVlS3hJNmJGZkNkSStTMW05QmF4NDd2SkNaTVBDNDV3VlVicVQzbWJl?=
 =?utf-8?B?d1Bpb05Rb1hDbTRCdlU0MHpkT2czWGdPbTdTSGJGRzJjSThRTy83aURmSmpI?=
 =?utf-8?B?aTNweFF3WFVuWStCMFVHbDg0MnFjZ1pGT2FSNEVkbXJkWlFIS3JicXJMNjVt?=
 =?utf-8?B?SWFmRnoydDB5ZWlCZzM2ZWlpMzFIMk0vSlg0akpRLys2dTkzL2MvanVTR3hs?=
 =?utf-8?B?UVRVem13VHdwNVgwQkFBMXV4Z1JCNUw4Z3EvaW9KaHB1bldqQ0pYTkRNOEMx?=
 =?utf-8?B?cncrOVVRa0hUZ1BLTEo5TnJJTUlqYzcxSGoyY2lJUGlKR0RPR256SXRBOW85?=
 =?utf-8?B?T1FBOWMzVG1iRWU5alc0TVZsR3VCK2hRR0dpWVF4UGpqamxJdTlTeUwvYm1T?=
 =?utf-8?B?V2JlT3N4WmdxSnNENm5ZVk50dGdwYjRQV3JEUFcrZkxPcUh6Z2JRMFRWNXJ2?=
 =?utf-8?B?ek1iS2Y3TnRlbXdxYjg3ckJyT1c3cUYrNzFybWxldTI5ZGwwNkszdGFBQ2U4?=
 =?utf-8?B?alBSUi84cThEMXdQelM3RUE4Q3BlOWRnWXIxUVNLTHNKbzRQTXZSMVZVaTZn?=
 =?utf-8?Q?SUwfB11M8Dds1qqbTy+8QKTJ3?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91079a6f-5266-42e6-a573-08dac8a58bdc
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB2828.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 14:10:56.9561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPj16uZ1LxHWLEhSncaRjICs18PbngtC3rCHWOW2EIvj3tmHgcwU0uZQLgM1yyzqCuUioF+c+3HEOMhUwL5deg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB8322

On 11/15/22 15:25, Joel Brobecker wrote:
> Hi everyone,
> 
>>>> - Seek volunteers. Please respond to this email if you want to volunteer
>>>>   to be on the "LF IT managed services" working group and help enumerate
>>>>   services.
>>>
>>> I'll volunteer to be on it, but, as noted at the meeting, I don't expect 
>>> to do much on the enumeration before January.
>>>
>>
>> I will also volunteer to be on it, and I can start documenting right
>> away for all the services I know glibc needs.
> 
> I can help with the GDB side of things. I don't know if I know all
> of them, but I know some, at least.

Hi Joel,

Let me know when you have started list, I'll review and try to complete
it to the best of my knowledge.

Simon
