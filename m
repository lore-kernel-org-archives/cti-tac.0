Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042A61922D8
	for <cti-tac@lists.linuxfoundation.org>; Tue,  9 Jul 2024 14:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=140.211.166.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720534504; cv=fail; b=T6v50OSb3UagY5oDdsN52CkHC0h/qXghgNkcUlcMN0nGKSaSfDdMswUVFEXIkqEPlMy2gGplgTj47qFaYmkN+D58n5YHVs7i6kO4OZubjJDwkZxuZ+XC+UCl/a8RKLCvu3HWnVmOMnQG8r/S6OJStOpPbG+Z51xor8prjd1tTXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720534504; c=relaxed/simple;
	bh=+RZyWF58nbxzc5mPL3obSl2asffidVixSrMunuzOF1A=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HZUdJt4+u4/Syde30hqd0iUjzH+smgPa4z290HplO2NTtfsgVD5ZceKUgSt+EizF8FgVjgT0W4bZAszQhZdvf6oA3C+D9EyhH8AW/PVxdh21Xg/olj+O4eHwbMlO56gy6YGZ0i9G3lprlOacOpCr8a/gyzQ4Luq1Xd6R4j1qBVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=L61neXuX; arc=fail smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="L61neXuX"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F58A81E0E
	for <cti-tac@lists.linuxfoundation.org>; Tue,  9 Jul 2024 14:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHJc_FRTNbHb for <cti-tac@lists.linuxfoundation.org>;
 Tue,  9 Jul 2024 14:15:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:c103::; helo=yt3pr01cu008.outbound.protection.outlook.com; envelope-from=smarchi@efficios.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6FAC881E07
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=efficios.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FAC881E07
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=L61neXuX
Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c103::])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6FAC881E07
	for <cti-tac@lists.linuxfoundation.org>; Tue,  9 Jul 2024 14:14:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQCKQNpQCEuAH6ZKnUfSjxiOVqnHlII5+fmEx2QCQlXPA5vDUiciqNsXwTPqzUJQKxh+z4tmUkiJ5AcdEips1XJxnLBIVYhZAtYypmIhvqQdWMTodOFb2UqnH9ZtYuXdBcc+VjUZru+MlGlEVWIRkcgtqkVMAorCN9eUHkWBN4hYYP/yws/qaPdJy4uWad1/jnOlC8xU1z01z+yeBTui4DtaOeae3JuGYWOcRjWi5A0AtFj9Rym5qwrFbuy4F+2emRQkXB5BqGmJvPaf1rI7vD3HxR2Em7RHJRez6wN84TY1QQIIFBp028uaI+p8vLsgyOLrVTJ9NV0RnVDH/lmi0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNjMsU73kjX+/yp4UQIq5nwJic/CW2QD5TkxOwCwKm0=;
 b=S0o/iTYG7YuA88kD0letUeEIdfExziweKzAwhYUgS5a0WUbHseZs8SGGhsszlpQQKpHnhugwx3G5FlKQH72S0YRi+e2vsnHSe4juJ6Rli4GTbYx6+h5zKmjLuJCcgTzE6ZU+xCmujjSSLXZxw5tcrN72kbIEzyVkclRrOB1uOPyaEyZp12aNg4LiEswdZHaDj76dLF11fKRV6TQLeMy0vl+EHiKaZkxehmoUVMrevrcj/g0+LZwDnOXrfS/xUC3lUXHZw5ded/Utao0xcfc6Is5EFPD2zQvZgEtPnU5CmNPr0eOoEw3fQAPCvFHREYvB3MN/gBlXTnNnVWobC/7bHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNjMsU73kjX+/yp4UQIq5nwJic/CW2QD5TkxOwCwKm0=;
 b=L61neXuXA1xIfla52szVN7zr5CS9gVOKbSFezbvt1ifmUaBlcbTxIwx8DGp3InK/jwekwrjBgM17NLttZNijP2NXG+0qzOBLYAh1yT3/w48FPBuDjr8Ihnz1AJ/g33B4eQisXf4nl6MUYQBwu58dFL9Iq6bk3K0OE0uT8YMkqa3NKKIIHA9za32Cof7rDUE1kWtjtyDgXlrnNh8kRZ4YFUDz7dumxDam9jjcXxoCaOQ5TD365yoeiR1bnrskJ6ZB8dAVjuKxEGvEB0nBJiNrSFer5lUZPl2o9jS1IPxV0Vj2WHHVsXXoTJ5V/lL0um2uYo4S5SS2hBuHjgKJ+CvVLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YQXPR01MB5520.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:2e::17)
 by YQXPR01MB6011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:28::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.38; Tue, 9 Jul
 2024 14:14:55 +0000
Received: from YQXPR01MB5520.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d278:be5:4197:6627]) by YQXPR01MB5520.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d278:be5:4197:6627%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 14:14:55 +0000
Message-ID: <725f7f38-7325-4511-a30f-4c54757bec11@efficios.com>
Date: Tue, 9 Jul 2024 10:14:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Stepping down from the TAC
To: "Jose E. Marchesi" <jose.marchesi@oracle.com>,
 cti-tac@lists.linuxfoundation.org
References: <871q46zed4.fsf@oracle.com>
Content-Language: fr
From: Simon Marchi <simon.marchi@efficios.com>
In-Reply-To: <871q46zed4.fsf@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::15) To YQXPR01MB5520.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2e::17)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YQXPR01MB5520:EE_|YQXPR01MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7626d4-d3c3-4812-85bf-08dca02181cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVVQWkk2am00cmJMeDNIb1ZjRnpiNUpuL3UwZ3oyRTA5MXVFejdoRjM0WEx0?=
 =?utf-8?B?ZHVSRnpsWGc3ZW0yZktYdllHdkhUazBpdHc3bU90cFYyU00rMVo1OHhabHMr?=
 =?utf-8?B?MGp0RVAzMS9Ka0NvbzV0ay9uQ0dSUlZBUU9ROFR6R0NaTVJma25yakhuWGtG?=
 =?utf-8?B?cSsxdXg0aURWamJQWXpHVzNQc3Q3UnpwRkZMK1hJUzFrOVFKZnJmdjJKYmsx?=
 =?utf-8?B?NHFiNnRLOVNHeERENnJvNlFVMFU0enBhYmhvN1R6ZFpFdDNOZlZ1azFyazNk?=
 =?utf-8?B?VzRRVitjQysxKzhMY2FocUs3LzUrY3dQMGovc1JrdTF1eGtVNFUybzg3dUVv?=
 =?utf-8?B?dHpBN0R0SGRJcjVEdmFNc1N2RXZJb1RrTVhBY0Y0Y1kxTTZOVVdNdndSankx?=
 =?utf-8?B?bWRoTm1MbG5IcldEdW1tT1J3QWIrZU90N2g5ZnI4eUJmTTZBWUdYUUthUHFh?=
 =?utf-8?B?S3k4SVYyNkxYZkZSMVJIandjNDc0OHk5VTJaUS9wSHVyeUk5dGl2ZnRFOEdB?=
 =?utf-8?B?WUVDbHF1Ujk3NE5VS0NCYythcXpHY3VZNU5ZZW8yYnNLUjZ0RXRFaXdzK1lz?=
 =?utf-8?B?TjROM3B4K05rVlNaWHU5bVcvM0xMM2ppMCtLWElZZjZDbE90M2xpdDh5UHBY?=
 =?utf-8?B?aE5ZUXhZYjd5eFBNY3Y2eExJeDQ0bHlubmIvbEZUQXQxV2NpUTRrYkNVZUVL?=
 =?utf-8?B?SDlzeUR3Vm1KTDJsT3FWQVFZa2dTdzJ5YmtWaDN4YVNVQ3ZuYnI4ZDRIYnhS?=
 =?utf-8?B?aVNreXlQcjlsUUpWaFhPdWNHWXpLNWIvdG40endQM2I4VjV6Y2p5VGpxdnRE?=
 =?utf-8?B?YXc1MHlsbkkwNnVaMVo4NVUvL0dEbkJ3T1lqaUhCR216eTgxQkZlWWVGNi9B?=
 =?utf-8?B?RmE3NWJqVDgyTWVIUXUvd21oSFRmN1FnNUwvaEs0dC9HUURkSjJnTVZLb0pI?=
 =?utf-8?B?VWVzVmxlSDEyZjdibklRQ1BoRi9Eb20vMDRYM04zSytvb084M2lkcGFaNk5L?=
 =?utf-8?B?VE5GUkdZMFdsTjdJcVNPZTA2WG5XQi83bEpuakZxUEVxYkliVTVGakZiV3RT?=
 =?utf-8?B?cnVyb2ljWUVuaVpUb3N5SUM3eGdRcFBZUGRIMGQ0ZXpGTVFGVG9NOVB2WHRk?=
 =?utf-8?B?VTlCMlpGank4ZnF1WHBwM2tyelRnZHB1WVRjcUZyL0JOWWFFcjFuVWJMbWNs?=
 =?utf-8?B?SitXemZ6cmFlNVI3QTRrZ1R6S0xCanlLNVpDbXBTZVpJSzR1empUMklud0gv?=
 =?utf-8?B?UXhlQ0lEWnA0a0t3KzZ6R01FTC91U25tU0gwZVdVZjhoT3VWZ3hYaUJSVVgw?=
 =?utf-8?B?Qkx1QVhNS3YxZlhzaXJtb05YMFZWWDExaG5UbW5YaFpiVE9SRm1WeTZvY202?=
 =?utf-8?B?NFNRdHpxaWNoTUJ4a3ozb3MvaWFTSVkxa2NRT2UzODU2RzlRSjVKdmdIRytM?=
 =?utf-8?B?cWlpcG9UWmlydGFPOG1WTzNLQ3d5NUFBT3JtY09tZnJpRmoyQXhtZm04aGhS?=
 =?utf-8?B?VlJ5Wlc0QmViSFlGYXNxWnlDdy9malU5VDhrREFMVEpBaHRnZmpueElDNEhW?=
 =?utf-8?B?RHBlKzZ4NnhaU2xwZmpxemdIQzRXLzJEdEovT0Q4UmdJUUxpODMydmlRTkVt?=
 =?utf-8?B?WWRTSkhlQzFIQWY0SEZtbXBVVVJTY2dkS3NaTHB4RzAwM1owcFJGRG9CQjhv?=
 =?utf-8?B?NTU2WmdidkY4ZG9CRzJkenVQYTR4QVRqcTQ4VjJwSXV3d3R0WnRoVHd5M0lS?=
 =?utf-8?B?WksycDhYeldYTjJidVJzRXRYSlYramNKTjZieTVWTFhrVWw5bkVVMUw4K082?=
 =?utf-8?B?ajR3ZGZ5V2UrUnRIeGhYQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQXPR01MB5520.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djFaNFgveUlyeVRyaUZ6NXhEUUJHOFAxbDVSTGZLSzFiRDkvYXZNeFlVYWxp?=
 =?utf-8?B?UmlHUmViUmNsYmxpWFRRZVFFOXFBQnRGWTZXaS8wd1RsTlBEUXlhVFFneXh4?=
 =?utf-8?B?NzlqVDFMN3dWYzBqN0ZRZW9pY21URmNPajZWS01GNCt4dVpKb3NpbGVUSzRw?=
 =?utf-8?B?Zno3QTRCaTk5d0FBaWlWNjkrSXVxR0ZhWE1CZ2xpVi9lSXdhdVpDUGtKVkdP?=
 =?utf-8?B?NiswWFFROXltQkVJdmRsOUlqYmduWXJSOFJjZHVqV2N1d3NVTHFhQ1pGNjh5?=
 =?utf-8?B?U0lRRnRmeUF4TXQvZVVtZitEbE5PVVBiZ1BHUjlaY2pmc0ZpTlVvdWNQOWxk?=
 =?utf-8?B?TXdmM2xndUN4QndYVDVTSERDS1FPU1E0QXJYcG9xRFJkaTdzMmJ6UlFhUWhn?=
 =?utf-8?B?TDVLUDJnVGwwNmt6SlNkTE1HMjhDS3VvWG5QN2xKMU52a0pWODNNVmN2UkN2?=
 =?utf-8?B?cVFrYm0xNmFPam5KNmZqdU4yRC9mbCtrSFJMdnl2clU3cmdubTlFTHJwaldz?=
 =?utf-8?B?c2l2OUdrTWs3YWNubzEzVFJ4a2E5bEhrRkMxbGd6a3Mva28rUGNMc1c1NlQz?=
 =?utf-8?B?Z2lqdVlsSytZTmJiY3ZDTHMrWDkvWTQzbTBrdUIvYW01WUN4RlViakVWN0Fm?=
 =?utf-8?B?M2k3TmpwRUNTZzdmSGQ5YWhRWmpXQ0IzWk5DUVppb0hMQTVDOVJNRVRad0NR?=
 =?utf-8?B?Ky9ScGMrL1VLeVo1ZUJvY0JvbVYrdzFLa1ZWdWVYV09lcEgrMVcwZ3J3OGRz?=
 =?utf-8?B?b3Y4K0NaNklFazdPQ1BuWlZmOFZBVU1mSXNTTTh2cmU0NW1WeldNNkdTQVYy?=
 =?utf-8?B?STQ4dGlNRDhQRVg0VWd4UlJCZUljd3lPMmVtT2o5a051L0d5ZEJLenQvTWdC?=
 =?utf-8?B?eFNBZFo3ZnFpVGtrcHQyUmR3dWltRjlmejlRdis0MnIwNTZERnBoY1ZTYkRC?=
 =?utf-8?B?eURBQXhSWkNJWktvcDF2aFFXa3BlMnlxbWIxQjJEOFA5dlpGdHhJZlRPNWNS?=
 =?utf-8?B?V2JCMFVzTndmU3RLWnpZK1QxeXpISzJ1Z1J2ektkaXFGNTFwbzhVeTVicTJC?=
 =?utf-8?B?azhZMUhJYWVUZVowMmNHaERGTFlEdjl0dUtmbTFQdUs3WnRXMWJ6TU1PMkZM?=
 =?utf-8?B?NWpaVzFnazhzUDczVVNqV0oydi9jdVErZ2h0V3EweEdPTFlDc3AycGpEL0di?=
 =?utf-8?B?TC9sS1N0bW5jY2N6TFMvNUxab1U4Y3lHR2hJc25oOUhjUGkzeGhyQXg2cXp6?=
 =?utf-8?B?VXU1c0FHQmh6dkRmU2UxeWYwQmtBUUNiSWdWWDN0b2JxOXVSWUxNNDI4NXhD?=
 =?utf-8?B?K1BMTVR5SzZCM3MweWRwMzQvWjd4bjRCaHMybStYK2JlRGlCSS92dGlsS3dP?=
 =?utf-8?B?SE91R0p6T3hWekorZyt6QkkvSys0ZS82Szd1SThCc0RTNGtpU3FtYnBIUzJ2?=
 =?utf-8?B?bUtmOGV2dGdod3laVEpPOGVGWXVlSklqdXZ5TlVNVXFQZjNJWkluS294UXBu?=
 =?utf-8?B?bUMrcVArVVdCVnNaMXFxeFRGeXJXcVhJUmFSUTg4TU96WTV2Q0FsN1drblNk?=
 =?utf-8?B?a2hGSnZqSHBnUWwwejF4bjhzSTcvOFpNaU4wQ1I2TXdZRmZGczRJS2lmY2N0?=
 =?utf-8?B?Slk2R1Q4dUdRR1VENEZUc3hWMElhYVdTcCtnV0FOM0EyY3ZXWFNJYzhhRHJa?=
 =?utf-8?B?SEp3Ti9nSG5MNUdMendVeGp0OGxFWnNCcnhTYUVnTFNWV1F2V1B4YmUweStl?=
 =?utf-8?B?aCtQeVdBYXJpa2xXOUFnenRpSWl4aXVaTkpPR2JKeGlNQTdvT3ZkelBJVnhE?=
 =?utf-8?B?dHEwaHlydkFIR1RabTZveTZCemxKZFk5VDVpdXU2N0V1M2w4dHlSdHZMTVNi?=
 =?utf-8?B?YXRPNzdHZVhKdUJnd1RVZW42WDZGQ2VLa243ZU9ySnUzbTRkbWFqQkF1Y1N5?=
 =?utf-8?B?bzIxUEx6M1NqMmRQRzF6M3pFV09WYnh6Um1kby9CTW9SZkNvUi9lOEF5QW5a?=
 =?utf-8?B?UTZCTmw5RmQrcU82cVAwMHpHc2oxR2R0cDZEdFA0WStwaHNDcUFFbUg3dlFF?=
 =?utf-8?B?Q3FCU3hnV0hETkNxR1B1THZ1QkNnTDdYdFNuMTcwbnJCTUVCVkttUDd0L05Z?=
 =?utf-8?Q?YEjPjzmSXYnwuf70beGtvIqs3?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7626d4-d3c3-4812-85bf-08dca02181cd
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB5520.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 14:14:55.4014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJucoGj/JWJ8pjDWUXO9gFJpHl3TXC+tK+vkqHcvWS6EjX3yjLiLfGQjUOzWj3/wmAX05UgY3sQjkdIRxp9N0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB6011

On 7/6/24 12:15 PM, Jose E. Marchesi wrote:
> 
> Hello people!
> 
> I realize I have not been active in this group for a very long time and
> all things considered it is unlikely this will change in the future.  So
> I think it makes most sense to just step down at this point rather than
> continuing being idle.
> 
> Thanks, and salud!
> 

Piggybacking on this... likewise for me.  If things start to concern GDB
at some point, I'd be happy to be back to help.

Simon
