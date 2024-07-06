Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DC3DF5B
	for <cti-tac@lists.linuxfoundation.org>; Sat,  6 Jul 2024 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=140.211.166.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720282515; cv=fail; b=IDHXHYUU8DlweoH6qGB3nvAGU5r1pwPwjZ28oeKlgq3LubgTJYAmkKVBmGhukybyysOWxvTFqEk4GYcoQQmLzHQlmsFIl3NRIYbinAR+tTiHaYfN5snSnl1PwSt+Li8gbe9Se+pbW+Xr2KFXp9Xrig7T2sFv45fjkWh4IQ8/A6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720282515; c=relaxed/simple;
	bh=eei7y1J35kflAkCD961F1uBrKlxSt/XZNuQ4pj7is94=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lBErwNYlzeEiCkEsVXYrDOYMog9BRwyoi36jVc7zUEf/QnygcPukrNzyxhANK/1f82QDWp4quz2kDoNEpFGoGM4HUdhDnrGdbEBVHNSJDEliGttaz+k94Geuddivc+VasHx4u/AN0FG620GWCTpZ6iZhAn8mN0DNZvzOvjDXM4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TV3Asr02; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oiK5+HN4; arc=fail smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TV3Asr02";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oiK5+HN4"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07CBD81E43
	for <cti-tac@lists.linuxfoundation.org>; Sat,  6 Jul 2024 16:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94NFmO1Idh9h for <cti-tac@lists.linuxfoundation.org>;
 Sat,  6 Jul 2024 16:15:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=jose.marchesi@oracle.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C899D810D9
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C899D810D9
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=TV3Asr02;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=oiK5+HN4
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C899D810D9
	for <cti-tac@lists.linuxfoundation.org>; Sat,  6 Jul 2024 16:15:11 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 466FNssn010652
	for <cti-tac@lists.linuxfoundation.org>; Sat, 6 Jul 2024 16:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=eCL9W441uJ08wyItkK0FXsxIX6TGieVxuHWH6wTkN/A=; b=
	TV3Asr020LqjCwuIGZXUVWVyuJiel/rth+IKuEyLdTP9v4AaTgCQk7YusSipg3i3
	4dkje6rfLLDHmHdd1BGfA7+Tp/6nosdPCWNHtGgpvZ7PJez2IVYih/nOMAgJF6Wk
	1G4vubxXvhCkipThDaF3oDMc46EazJZ64V1gPiVsahetwUjTfjSAEwhlQCGtKJe4
	wsD7FqtGIZVRM6NFsIiz+Z7Fwc4sIc/I/46x99fkuHYHLG85jiCcfcW+PGRJMp/Y
	SK94uzBkoL73TG9djqNWO6vatLaWWJeN09j/BeIAEn+788N6kKVCilOj5eNLUk2N
	yRU7i8BWs58S4D429Qj4LA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 406wgpre91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <cti-tac@lists.linuxfoundation.org>; Sat, 06 Jul 2024 16:15:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 466CP8Fh010282
	for <cti-tac@lists.linuxfoundation.org>; Sat, 6 Jul 2024 16:15:10 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 406vc4uux7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <cti-tac@lists.linuxfoundation.org>; Sat, 06 Jul 2024 16:15:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f19swbSfGde61VNs8xftL+wtXarqw7WlXg1BVwIeP3+jMErjuYicYrPbjKzZIdaD9ODUdbnhIQQ9zCKDr+7xaZIc96MZ0gq3bn/yjec4qAPBniaPMD5+3Y96u/dWykt7d4fmPrsVW980XGU/dzn9Oj20480z3PiNwtSd1sUjSOzxTq3RTsBjBAYmc7gvLm/aOjp23IqYMJg6DjC6rE7A3zD0PrL9IFhq3N58Eh9Kdyn6BjYoOFIgKO8zSCzE59n/xCkpJlToTHZwRJcZKB+TfkXIWzwpOwawFy5hr5Xfj8ob4hCBQvB2Nb5pR1YzDsmU1tUyJlD4FL3B6nAMlVkIVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCL9W441uJ08wyItkK0FXsxIX6TGieVxuHWH6wTkN/A=;
 b=g9dEzfgEnFp4tnN6hUxEYNwnF8VVhxCYRXT39w5h9UoQmYi5WpdR7yyvIRSPtAB4HCUaI07ZcB2m+Tz+dh3xzpadF/ysFHqItF/+Lsxz00gElJLck7CXMcZkzs5EU/KTDlRUK65UtKZ7zvlUhzsShB0pBDtmTBr16OCPMRgTZrBklNrmYuwPUJcHA7CcQkGbwXaHGCo8iaCMLLsauxgcswA/UeoBDF3ZThwAbXa4+o0sX2WPMs9mMILuTQFja94DlWh9zCpWBpjXsgnKL12ukq+QaHX9ZlrU3OLveTKqOPxiYck/1FdE2OB5bXt2Upr/3uwWZwExwgVynNnotg4owg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCL9W441uJ08wyItkK0FXsxIX6TGieVxuHWH6wTkN/A=;
 b=oiK5+HN4BcrUwywGUE6Jy0GSllg+e9FRXRD9eMwa8GZO2HvV364vRJypV++xwm8FTds34gFyYPvjlCmVQExl6Ce8BsswqOUE2Y/p1DVGysNcQ6evECxfloLUJ1lwuHcge4OI8UAgH45SV+316BnFBsalNYiWRXDdJJmE4qNHO9w=
Received: from LV8PR10MB7822.namprd10.prod.outlook.com (2603:10b6:408:1e8::6)
 by PH0PR10MB4741.namprd10.prod.outlook.com (2603:10b6:510:3d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Sat, 6 Jul
 2024 16:15:07 +0000
Received: from LV8PR10MB7822.namprd10.prod.outlook.com
 ([fe80::4808:df01:d7ce:3c1e]) by LV8PR10MB7822.namprd10.prod.outlook.com
 ([fe80::4808:df01:d7ce:3c1e%3]) with mapi id 15.20.7741.033; Sat, 6 Jul 2024
 16:15:07 +0000
From: "Jose E. Marchesi" <jose.marchesi@oracle.com>
To: cti-tac@lists.linuxfoundation.org
Subject: Stepping down from the TAC
Date: Sat, 06 Jul 2024 18:15:03 +0200
Message-ID: <871q46zed4.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::14) To LV8PR10MB7822.namprd10.prod.outlook.com
 (2603:10b6:408:1e8::6)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR10MB7822:EE_|PH0PR10MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e4bf28-8d2e-4fd7-901c-08dc9dd6cd25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LW7rUsenoveMwiw4eGFD5NhY4128bfoadOI/VKpWWHfkkggphrwlo8VMjpVC?=
 =?us-ascii?Q?M0J0UKK2sVYUBlh1rW71tiX0tNa51ibL5SIu3cO4gBx+3tMGQhGqnio1vK26?=
 =?us-ascii?Q?JKT0QH+p3t0D7ROpXZ4UojzI6xTUbVFdvhJ7Qi0ZJqcC6co/CAIgz2tgrIrR?=
 =?us-ascii?Q?ipj9ezJ0FKus+rRN6kzA5+/b3928N7Sj3vzOIKqK92pPbHD0MCauU8QJ+rLz?=
 =?us-ascii?Q?b8QkO6yoYbHv06A6nsZG1eap+cLaofVWroPVk54hmIBQF6qKGMjHQHqfaZ0a?=
 =?us-ascii?Q?6QOHHuF2/s7hKwGcplaKdUWiKqIkfjp6FsvxACQpyfFKREQoRx3d6wcR8ttE?=
 =?us-ascii?Q?Q1An16Q/5CD4U0/t5yigz7em66UGwXtfGu0YISaY3s/oEjIU2S3YGiN0P3/A?=
 =?us-ascii?Q?QTuiTv3FyF0vzACvHEJFuXOO17Jhk9a4iREN4V32eps8E/2E2TIyFXthjiqY?=
 =?us-ascii?Q?vp87QKXsXdE3n4K69KRT9sDGdjhuF+KVGN/0rSVNItOOfFzYIW1V8hvrQZJW?=
 =?us-ascii?Q?fwYbt0GUO0/GYEQkQNymUmHZPwK8X1Zu1b10X5TQuzpvU2Q5FNAs96tEYwpi?=
 =?us-ascii?Q?zp3ZJgDVYZlM8ca3tFBue56y9Sj7VNm9ICaVa+1QVpPSZfF6Kh2ONqm3IWaq?=
 =?us-ascii?Q?LNF1j0mJk8mhXkLqLAGM7CuXmIilHsD1OjtiGIdAOCEgJc1kr5yb5zSALuPE?=
 =?us-ascii?Q?5UiShkxa57BguemCrEMdd5XrxtZDMZvkIKCfwvYYFAA6o32C79Lbcc1ZXZ8Z?=
 =?us-ascii?Q?5btez3M7qa0T3LYMiXgSII2cXk6erhN5LLnuse3Ok45imZARYQCD8q6Mhdqb?=
 =?us-ascii?Q?BIeVbOJ6YMAF3SgijyYM/mg1aoTqpOSXZ06aHAPxEcF1eIBrPT4CLEPtcqEj?=
 =?us-ascii?Q?iko/2k096hIX9dY09wKKzrNq4kkbeGsRWEM1Ayb3pB5Tgfg2NbwMQQ5cv2OX?=
 =?us-ascii?Q?MWrKpa8svHSKO8LZT1uQAnGyMt/hgHHfxyUsjHa2sd1/fb6GlxQEEMKv3P1V?=
 =?us-ascii?Q?7KrwYG/Usy4wLcY5J0UYROkqiu6DEZ2uvD5Xj+OFTKnNHmfpahohZuTlTLhs?=
 =?us-ascii?Q?wCOd+audKK8TWfhAPFULCNeN4ptLie+TQJsD2wqcJunfFjLaYnGxWDN9YQWl?=
 =?us-ascii?Q?Gvm0fg6Yj8uuRKT9ZnKM/e8E/tf8cClVFK64fs9VrQQkXa0S5JdFNlceqV1S?=
 =?us-ascii?Q?J4vxraIDz/PfpfMlnx+4OWwVVXPPg+4z8jB+6lsSWe8KZZwDLMMT79C7p5IZ?=
 =?us-ascii?Q?F/ZzN5njHrbwP9mHX1VLmu7uXWhuyIKd/kibzHhIq34hx3XCIkckcWxW3yo9?=
 =?us-ascii?Q?ljAHVqp+Sk2f/itgxhz/RLJ1DTxb50QgjLdg4lZ3231/6w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR10MB7822.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CoKhyl+I4ma8rsplVc8Vk9Yxo+n+c/+Xdoy9O04czQ1OJaNZeqgZp6UntZwE?=
 =?us-ascii?Q?C20kfQqa+INaNSRfLWO8bnvGXXjqFkivpHbOgGJqNQWFMAtrILmXfjbONpMj?=
 =?us-ascii?Q?nQWdvM9WF43uymLt7sBjPq5vbhrWX9h1fhA7w861ND/YfIDNJGmkF5rO2GrX?=
 =?us-ascii?Q?nL/eDJhMGi/GVR+EqO+LmRku53ljRDSHwqeYxC8LS9E+9vUKeq3RNJkrn9vx?=
 =?us-ascii?Q?Bz7cyPXXJ6XjGNTHum+QqoRryp4gfXJyVQ4AzKXW0QCGugQmlcr53qYxi8Ww?=
 =?us-ascii?Q?Z9IZtbJcc/Q2TupxPsjXvskQWGIr/AoMXlNT+Ik7q4Az/ufpPvNQ0kBRbzQy?=
 =?us-ascii?Q?wlsjSEUQEnZAEu9UjdUAfBVHyEt1jDxUyxxA7T36+T2327SE/mqcTs/QBT4q?=
 =?us-ascii?Q?h15eUD3lu2LyzWUib7qo6Ma2tT2QwOS6Z63VxE7MelpFrIyHcW9ef45SjCle?=
 =?us-ascii?Q?TUOnOUAlTTeju8V+RsQdARznwVIoGAfKExck3NVg+WYGbRUeRJC2MXsKRwh3?=
 =?us-ascii?Q?d0KuHj0wVN6ZFx1NNVJOlndyv7uCtU0gUxdsZiAtu7s9BfdLYw7qf4DU4nDV?=
 =?us-ascii?Q?RnoirWY/g3VfuX9Z4Uco40jPqiuTGziUhFFOhBCX9unszWKiW6WJoIe9ckNk?=
 =?us-ascii?Q?+3Tc4pAyCH6v/evnG/AyHMpHfrO0+kmdFxhNM1J9RJyUzElvN/NFS8oQTlw3?=
 =?us-ascii?Q?QtmKuZT6pdSWX6qtz45xI5XP5OScwPNkWo++4I7C9rm/pKwT/Vcl3FHcQTuT?=
 =?us-ascii?Q?LFhwLv8xeC+8ABzSr3tL/WsMFa2RWpcxQ24+Au83aSa+E7mLQnHtLXF4VRzv?=
 =?us-ascii?Q?i1fkWT4l7jCWUlhJht6UBwRbem9YhG9HU4xY33XwhyCONSyerRpK+277X7wD?=
 =?us-ascii?Q?3fZW1i8Yt+cTYVXWWeF1ZIkNINZ1UOtsUMxIX3vuG+QcYpLr0VlSOC65scRV?=
 =?us-ascii?Q?5WZ7sAsTQws2G2OBaIdJqFmSYWi2Sty7GwS8hUBvn/CFR7D2dmjhs3/XzEUp?=
 =?us-ascii?Q?kRP+hNY1e2bIHO7VhjzG8bD3Xs8V96BLmYkAxCqIj46P9KPWVXnjAdi+z96y?=
 =?us-ascii?Q?an7jVF1kj8uW4lFGxV8+27lJvDurVngJGwY1GMhAjRuzZCDIEwt13lMRKTTA?=
 =?us-ascii?Q?Y0DG/8TYAlM8pxcSiR7UGMxQHqdJU3MKp4KzJx8UGxWAS6kITQMtWWMDq0K1?=
 =?us-ascii?Q?5UmADKnVqaGObgb/jRcQmrE46m/jF/XUCJh+Ou8Ta8aX9miax1Xp2gKSemqw?=
 =?us-ascii?Q?IP2ds49+L8ULEGKXS1IT3KD8mmBOlHIiibJMxF2dgRB/h1br4BSUxaJrajnj?=
 =?us-ascii?Q?o3+W9a0JG/7wi9+Kyqpn2bMYazybktnIU3N15rs63vGS9HpFNfKA+4ZO1MYT?=
 =?us-ascii?Q?ZQoD6EHwA5Yqm61DJgbRm6/Xn9OMoEDLnBfRo8/QTsXVFW9oNyyzixQR/Dlp?=
 =?us-ascii?Q?B5h/eVTF6RK5VMjR6Re0vKNhASb3uHbzwdywUk5hgTMZDQCK3MF1EmAOToAe?=
 =?us-ascii?Q?lmc135okSqs1fru1/3ds0JYmlXWnNORoh69EG+Vor/VWXuXMyOfUleSjwClE?=
 =?us-ascii?Q?Rkr7xWNnn9d/X9FFYEH2Oe9rVsDrvzxxtH/LxxLhZxeH5YJwE4e7I1nMmWv4?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	BO6l9+DZJgYWW19eh3+PJbjd5XGwmmN9I0ocAeX7MvCBLYZHPxboGVLkRah5UKCivaFD8Ac4bRJ4mR4PpWmk5HyeZScJ2pnOgPdwmhNH8ecQ9crGHN2KYiV7GJyjkb0EgqH6/fKKo312pm9sFw1DiVUfxhNIrQ5QdaAkeF8v60VAMaaBGRo8Q8oVKCz1IcjVykTKzcbDk4jZ+h4jJBpa5QQaMoCUxoMgflJiHU9i2yTuNpKDuc4/YzCBZxG6BJjMnFTaO07N3UCsVI4aaU04WCao9ikGSwNdK9oHZ9LUefaI1mjn8yS8QAWh6psDy7hrnJhdmsYVsGUuEAJwQeh+2KfcfB4n0DJV+wmkrydNiOXgaY8jgbpI7Vok2JMgazHjVypNqykiPGR7cSyo9HiP1acuJkFjlh1FsMcB6hfwyq2zdcdwGimd00Ppry99Yvgm8fmY9+tGhgMAcrFDB8LSS2eNVBiDQsoD8kehts9ipukzpTQhBj/sWZ0DddRjoOp+cWq8fEDsHpVL4hsl748L6UcloHrIEt0peCf51kNBdGTpVGn2jlJlb+rjt4b8eXH6HsN80KfgNts/K0IN7SkQR1BMJwykxb8H6POMK/w40gs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e4bf28-8d2e-4fd7-901c-08dc9dd6cd25
X-MS-Exchange-CrossTenant-AuthSource: LV8PR10MB7822.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2024 16:15:07.1003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEP41X8Q+lnOoMFzQsHQbMz7+T1+Xx3Q+gror9kMrjBeA/IxVCf1hrsNg8XAA1jYB1lmyp25Bz4je87ROjpaOhKl0ZHr9VHIl3Bj/NqCTNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4741
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-06_11,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 mlxscore=0 mlxlogscore=481 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407060125
X-Proofpoint-ORIG-GUID: 6QnTiRB_IuXpHwI_u8yPET5RsgLqBawL
X-Proofpoint-GUID: 6QnTiRB_IuXpHwI_u8yPET5RsgLqBawL


Hello people!

I realize I have not been active in this group for a very long time and
all things considered it is unlikely this will change in the future.  So
I think it makes most sense to just step down at this point rather than
continuing being idle.

Thanks, and salud!
