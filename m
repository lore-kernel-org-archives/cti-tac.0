Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528B716DEB0
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Nov 2025 22:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764194840; cv=none; b=q7ZSf1JovrNFpBEEHzqvdRCZ+4YemMcWVskVfZsmfSCFHhs40sVxRFktWpZ2/EkuBdhenrwfGnBRdyLDGk7Rnc5HK8SZyCgW9dU7+N4bdufteyx6GwYR1AWL1M71xA8umCewWPaZPHTV0vasIh2ZEyKYG502Q1awgjd/rwKeOCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764194840; c=relaxed/simple;
	bh=2Yeb3uRweYfYfjJAzyAvHvJ4G6rpeznBKjm/jqoX4yo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=CMB687+PsweoJZNktuYhc0CRGGECxjzNZ2bT7JMVkQIcnWdDb4tcTtORp3qNe9PnHWoGlrlpZ3LSCN+1nNKSOCr+On0AoFM9S2FJUdVs7bHiafaN6ACGsQnNaTjWnrgzTGMRWXpvyJd4cEo1KKqGtPGKqjnBVwGcVXo1jbmPYMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cpWBrzaR; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cpWBrzaR"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0BA740219
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Nov 2025 22:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ww4P-j_gbhvR for <cti-tac@lists.linuxfoundation.org>;
 Wed, 26 Nov 2025 22:07:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A70614006D
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A70614006D
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cpWBrzaR
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A70614006D
	for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Nov 2025 22:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764194835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hoU59MVzYTizgb7IKWIpCulsyOklqdw8L8ue3st8c58=;
	b=cpWBrzaRbxJLIrmdZjTHWYeKgyf+ploYnZ9/sz5N3+LDvTtLyM5ybfM7Tbf2kb2ofkUnP+
	fu2FM5inbFmFoFv8/bfGrzpyvg5F1YD/ECoQ3GeCX9YNYZKj8oKQN/JrcEy+2i+nC/ko1A
	+PE2HnLrUw/lkXBID5TXo5HVfLWImsw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-Z6zdU0qkMZisgXEYGpw34A-1; Wed, 26 Nov 2025 17:07:14 -0500
X-MC-Unique: Z6zdU0qkMZisgXEYGpw34A-1
X-Mimecast-MFC-AGG-ID: Z6zdU0qkMZisgXEYGpw34A_1764194833
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88050bdc2abso5200316d6.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 26 Nov 2025 14:07:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764194833; x=1764799633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoU59MVzYTizgb7IKWIpCulsyOklqdw8L8ue3st8c58=;
        b=ctmxm9At8cP6b30lzWFJCLlHUJC6s1HmNTNUdrIT4iUHnWGjKpBCRXzLEl0uHnkw7v
         12MCLjeYKH/gipcEMYoGlnEXwtrXE6/zvIBdF7jED6Zf7t+PerPAFKif8R042LvPtx0R
         /jsmHXVGDJ/k8AW/u2v1ohN308pgA6GcxuhkB/0rPW4fw8zFEBee1Pf7MP4/wtBGRGb3
         yd+8B1BQpOOuYgmLQYD/wu3PvUKs5+yABaGYLb9dwPdl9DTHsmwIpYlwkr3y4Edug9JK
         cDrlDa1lRSbo7s2J9Tq56H0MkllshYI1oWQc0eNWsTlSNK0n0BtaVkYpXlCCXUQ+vR1h
         E27w==
X-Gm-Message-State: AOJu0Yy6Hc/HjFvQq0ZNDRbZBU2Cl4OlenAd75+BX9GWmvEC5apCS99l
	+OAkr0FsQg5YhJCl7qtuioamd1C1/NwbnTApsg0jbOni8Wx1gBdrCh9mbc5pbPxaO1COyY9uqWb
	/qNtqzEQu3v9NKED6Zf4SjdVk4Oq5uD0z2qgyVgW05GpIgmdf0jfOo9Rv5PstL55ifICSR0EgKm
	EScRsXiBhAJHSJGE3O5KXvLfYIiSwdm6wJGqusWJOSySwRmXFFpMIWSQ==
X-Gm-Gg: ASbGnctTWlEO0INP39XH2QMyndpnLvg/+GSZkKBbJoGigWf9NiwkUTvAjm0frbd3bAj
	iNR9ukN/hxHX8p0o1ovdJoUQGnLLe9K6ycDAn9UD4VfVVlTmbuqS1aj4n9ufJcFMqnBAgfFlK5u
	1zC6chNj0Du0F5IDdKbH6kHDoDQM1IeT9+SOPBpV1S8NXCIQihfsRvaTb40bWPnoBOn5HViymtW
	YNBHb1RsxcHbadqyrtsa4+YhDFvwX6I507zbDmYWxKRSHb9UiDhrh1cOJc2gXzk9Fw5uDQLF3LF
	ARvUK8kFVQrDhEhpqU4ueZqVrXL6iRdaizmb2dYJRYAFP4RK+dBgAKgEvjTyjYhf76BQ+jLPlqy
	6o0NqEXVMwbYF
X-Received: by 2002:a05:6214:1d2e:b0:880:4eac:8689 with SMTP id 6a1803df08f44-8863afb10acmr139783146d6.57.1764194832832;
        Wed, 26 Nov 2025 14:07:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFR1CPdIF+BwvN7iqgf7T3yhALxREAEfVY4SnspO05y0sakSmZltM4R0G1CNcbVVJHb5ClPA==
X-Received: by 2002:a05:6214:1d2e:b0:880:4eac:8689 with SMTP id 6a1803df08f44-8863afb10acmr139782576d6.57.1764194832353;
        Wed, 26 Nov 2025 14:07:12 -0800 (PST)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e445bd4sm152414256d6.10.2025.11.26.14.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 14:07:11 -0800 (PST)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [PATCH 1/4] tac/minutes: Add additional meeting links.
Date: Wed, 26 Nov 2025 17:06:46 -0500
Message-ID: <20251126220707.2596367-1-carlos@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zlZ0mk1UKLRMtr2kJHavPaXe4Ddt_omiGpsNlSDHIp8_1764194833
X-Mimecast-Originator: redhat.com
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/tac/minutes.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/source/tac/minutes.rst b/source/tac/minutes.rst
index 454d6ec..0c0a27d 100644
--- a/source/tac/minutes.rst
+++ b/source/tac/minutes.rst
@@ -9,6 +9,19 @@ The CTI TAC meetings minutes are sent to mailing list for archival: https://lore
 
 Recent meeting minutes are linked to here:
 
+  * `CTI TAC Meeting Notes 2025-11-26 <https://lore.kernel.org/cti-tac/3b1aaa90-9b46-4ce3-9209-4b9c358107d9@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2025-10-29 <https://lore.kernel.org/cti-tac/efca566d-6826-44d5-a599-240e0d1353d1@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2025-09-24 <https://lore.kernel.org/cti-tac/a0e12467-d54c-405d-a398-3463572729b9@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2025-08-27 <https://lore.kernel.org/cti-tac/4c7f3274-1c2d-4ae6-935a-5ceb656d71c4@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2025-07-30 <https://lore.kernel.org/cti-tac/1147e939-c6f0-4ae5-a0e0-a38fc05455e2@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2025-06-25 <https://lore.kernel.org/cti-tac/89406554-8527-4c63-b863-e8af530d4a1f@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2025-05-28 <https://lore.kernel.org/cti-tac/e7cf22c4-664e-4fd9-9933-b6b1eb6e4954@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2025-04-30 <https://lore.kernel.org/cti-tac/b949fd82-c704-4fd1-949d-28f5b0b42e50@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2025-03-26 <https://lore.kernel.org/cti-tac/5ebb8fa6-22ce-4224-be5b-6977b0bef8a2@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2025-02-26 <https://lore.kernel.org/cti-tac/3e2d354a-5366-42c9-8083-0596fafe23fa@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2025-01-29 <https://lore.kernel.org/cti-tac/50dd80af-7b74-41f8-b3b1-48bb1b9b483d@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2024-11-27 <https://lore.kernel.org/cti-tac/370f83d9-f771-4327-811b-049d74efe0fe@redhat.com/>`_
+  * `CTI TAC Meeting Notes 2024-10-30 <https://lore.kernel.org/cti-tac/1d7c45d0-0587-4ae9-98b4-2b8997236b79@redhat.com/>`_
   * `CTI TAC Meeting Notes 2024-09-25 <https://lore.kernel.org/cti-tac/e3551841-0427-49da-8cb0-833a335daeca@redhat.com/>`_
   * `CTI TAC Meeting Notes 2024-08-28 <https://lore.kernel.org/cti-tac/4d22bea8-9a01-43d7-9579-b6c877154e10@redhat.com/>`_
   * `CTI TAC Meeting Notes 2024-07-31 <https://lore.kernel.org/cti-tac/5e90ba39-d301-4ce3-bfab-d663864cb627@redhat.com/>`_
-- 
2.51.1

