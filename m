Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376C0C8E3
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Jun 2023 16:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97FE141C3A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Jun 2023 16:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97FE141C3A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O6EVn92v
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oeATR51V4EQC for <cti-tac@lists.linuxfoundation.org>;
	Wed, 28 Jun 2023 16:03:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CC6141BA8
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8CC6141BA8
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Jun 2023 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687968182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BWzylILGc+CrqON+K0nuiweNZLmizltK+1MY8NmUlAE=;
	b=O6EVn92vC/K/YjD9svVKXinUjCQvPfxSeMZ5mPHE8F47LlD5QBy2Ru0/ee8YLVCbBjpWQe
	twmst7D+ttbNqogbO8/dMHHr9I7ioUPK2hW7++eMN+kcQGZMXYvMmXpbUu/GiDZscxR/x0
	d5PS0oU1oH3K0QK6qCf5Cama/RO09HM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-7mjSKpmkO8KiNZH-WzzRjg-1; Wed, 28 Jun 2023 12:02:55 -0400
X-MC-Unique: 7mjSKpmkO8KiNZH-WzzRjg-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-565ba5667d5so40507b3.0
        for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Jun 2023 09:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687968165; x=1690560165;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWzylILGc+CrqON+K0nuiweNZLmizltK+1MY8NmUlAE=;
        b=MTdiWcygBhQkASfzmaEyrA3dJKrYbrXuqYI6kGETO/1ctVKR4XhiuCAg8ikq9pHDSO
         Vh7WVFQqPPa6bM+DjuRplHdWY+8OfvuSA8slJ56lcW845LQxzbOPDOCMYF18ZfoXWRJj
         9i2FFuKOAOTSKSn3eUK0wDa5K8N8lyFC0PoHJpF9TePA2wYUt6OSMd3mdo/sOLRZOxbg
         QGKHuf725wCQEsNlDV1CUg5VXsIMu69mP588/vIJHH9pyTtIgu1WE2TGIIOTrA9JpMJE
         g6elDWy7ZWPsIEBPock8oHor3iVk0evPxxG/gZNnYndkynhN2lqLxCyxlMZMukhfbedL
         Ondg==
X-Gm-Message-State: AC+VfDzm2e82JTNFoYL+BqSUelMLsMf1Xmte5NI336Br0TVn2e9lhO76
	Tv0Z9YvwANQuNbR89KKPr3xM776J9Jk1+OLQloQ9cIVn6G8r5DYMbyTxg6XNEhjmaeto882gDUR
	JOAgXEWYgX3YaIU2fnm6Tu4+346rj8FlU+DOoWI/r5mRRHdqZdxwz4bINvGjKgpqmlXkvAc6Gfp
	jsfdK9jshToHIK
X-Received: by 2002:a25:d304:0:b0:bac:f398:3571 with SMTP id e4-20020a25d304000000b00bacf3983571mr29091235ybf.23.1687968165421;
        Wed, 28 Jun 2023 09:02:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5CLPua449sWi4CAmDv2E9X2skZoUjFIqUsQCO9HbBYClcRe/Kp4fxyXIDjGkpTLYrJPB/DNA==
X-Received: by 2002:a25:d304:0:b0:bac:f398:3571 with SMTP id e4-20020a25d304000000b00bacf3983571mr29091192ybf.23.1687968164900;
        Wed, 28 Jun 2023 09:02:44 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id t130-20020a254688000000b00bca531ddce4sm2117798yba.31.2023.06.28.09.02.44
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 09:02:44 -0700 (PDT)
Message-ID: <7d4d9764-dfc0-a0b8-c5f0-010305e70995@redhat.com>
Date: Wed, 28 Jun 2023 12:02:43 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2023-06-28
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


CTI TAC Meeting Notes 2023-06-28

Present TAC members:
- Joseph Myers
- David Edelsohn
- Siddhesh Poyarekar
- Carlos O'Donell

Present community members:
- Ian Kelling (unable to sign in to BBB)

Agenda:
- Status of update to the glibc community.
  - Carlos will talk about current status and writeup.
  - Not yet sent to libc-alpha, but plan to finish this week.
  - Discussed the key points for the outbound communication from TAC to glibc community.
   - Clarify next steps are that Stewards need to review and decide.
   - Clarify that it is LF IT that would be providing the services.
   - David: tl;dr put the justification at the top (moved from the bottom)
    - Provide a stronger executive summary at the top.
    - "This is the proposed plan to move forward"
    - "Use the knowledge and skills of the entire community to review service requirements"
    - Make a clear statement that we would like to move forward.
    - Add grounding paragraph at the top for the structure of the email.
- Action item: Carlos to mail out update to glibc community.
- Space for CTI TAC documents.
  - Should we have a web presence to put up documents?
  - Carlos: Yes, to upload videos and tac notes.
  - Siddhesh: Yes.
  - Joseph: Yes.
  - David: Yes.
  - May we use "toolchain.dev" ? - David: Yes.
  - Siddhesh: We should have git repo, with a web site e.g. LF IT rst/sphinx website.
  - Siddhesh: Does LF have a Gitlab instance for doing this?
- Action item: Carlos to email LF IT on CTI TAC list to answer question about gitlab instances.
- Noted that Ian Kelling could not sign in from remote location and will follow up with BBB admins to discuss possible routing issues.
- David: Preliminary budget estimates are difficult for LF IT to come up with. Continued discussing with LF IT and OpenSSF CTO to determine costs and continue to seek out additional direct sponsors.

-- 
Cheers,
Carlos.

