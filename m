Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEE76EEFA
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 16:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709138530; cv=none; b=RMtMj40FK7QD2dFer4DI/Gr489yLMmTFBZB5ToqPsUP56T9ETxw6qirXzC00uOBcdigXW3pitph+gZM1YBM5h21rx/XfdlqQ11iGiUjH04Fpi0o2y8NRTYeDlh+ez9d7MHbZrCcTZrozESV1Nb4E3QVWq4eQWafzkkl9b8mMpXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709138530; c=relaxed/simple;
	bh=iXuT37NtVG+v709Ir81Db2ChhqsX9cOsZwX5+M2K8j8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=nQLJOZSuqQPGzoidbInpSLY554KrnteuJr/vjSkJ9Y4IZ5V7iP5f342dOQhn5ZgNUK5EINcZWqnS73BuQbVds1J8fyQNrAWVXIxVBJQzvWP60l/e9uDRLp8rXkmMElH3Oj4ktR+xuHSJBksMSFRkkbwpFGt5pZ4R3MV+n5oZOTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ddXC8QCL; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ddXC8QCL"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0BA1415BF
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 16:42:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v5A7E_k1JuLX for <cti-tac@lists.linuxfoundation.org>;
	Wed, 28 Feb 2024 16:42:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 40E99415B0
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40E99415B0
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ddXC8QCL
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 40E99415B0
	for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 16:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709138525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ePoP3jm7mwtPQp1BlJVUCI4GJHdSGfCGQ2ffc0Fspoo=;
	b=ddXC8QCL2101GzMpbaDJXhpDvA0g3RFpOSDRDJKbhjKZj8nATSGeMBbLjIl67Xg+FhVJd6
	NE5+XfhVYwv11trmQ3Fc90uP08G0b+xyYtXAKB88Du8CuO12xEKCMlCltDX2y/CE7orACF
	EmbCX2u3zZiQ7aoTUMjqXEB0DxPkFeQ=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-bpuuw3EuM2y8LI9qdNgkng-1; Wed, 28 Feb 2024 11:42:04 -0500
X-MC-Unique: bpuuw3EuM2y8LI9qdNgkng-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3c1a511830eso3213005b6e.3
        for <cti-tac@lists.linuxfoundation.org>; Wed, 28 Feb 2024 08:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709138523; x=1709743323;
        h=content-transfer-encoding:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePoP3jm7mwtPQp1BlJVUCI4GJHdSGfCGQ2ffc0Fspoo=;
        b=O4yxl3cuOvEDZexR3c13pry1L3XixYgIIsd94vb4UwWRMBt01iy2sMbUOL5Telu9bv
         +Nyc/MXUryp5BNDdKvrBx+vFJzZQOXjMA9EOc9exTZDXYXnt0QXd4TszGpbwjGCEzDFU
         tYPHO1QGPflCAIvnBXFBHf5tZ2oTUIeCwhJVPl9MnuF7+fxqCaoYIafBzucVlC61sDzH
         so1FIP8i57OPO9gAt8RN2FBSPEh3MZErZnCwL8i0tHF/08hTTpedl4E34zX8vjQQ02Nn
         G74CyKGAIYz/5ENqROQsIchXFrTyHe8b08p/aigiHuwgrCX6qSKAmdVJtQr4gyfZyNUh
         b//A==
X-Gm-Message-State: AOJu0YybFOSh27GaZlt6a6eQD/QBaWFw2xTLhbtMrGS4u8KN2HVkq/TK
	WTlwA0LtvTEp/5dYLddPLts/MhGLIlNPB1q8ElcMuJBDudbFWXgUAwn+W+GGqj9vo0UU5zO+24V
	vA6GM4Vx4TAapbXwOyxQNF0yJO33nVkrjru+YE3E8lU5SebOTp006mmEy29VBqEVA/LUMIxo5ie
	cQegQzJz8dHvuQPhWhd2Ain8tZ7wEL6xe8HaYNl88QCTkoDNbyHA==
X-Received: by 2002:a05:6359:4c10:b0:17b:c954:8b34 with SMTP id kj16-20020a0563594c1000b0017bc9548b34mr3859833rwc.26.1709138523353;
        Wed, 28 Feb 2024 08:42:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELTWs0HR47O/oFWNEy93yCZlnKBixuyGEfe/2h+r2fLlcIfX52dKo7eZPiTCkhfbC0aSZ6Dw==
X-Received: by 2002:a05:6359:4c10:b0:17b:c954:8b34 with SMTP id kj16-20020a0563594c1000b0017bc9548b34mr3859808rwc.26.1709138522778;
        Wed, 28 Feb 2024 08:42:02 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id b8-20020a0cf048000000b0068f11ceb309sm5347424qvl.128.2024.02.28.08.42.02
        for <cti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 08:42:02 -0800 (PST)
Message-ID: <ea82c272-9bdf-4685-bc72-9fa6da83e6be@redhat.com>
Date: Wed, 28 Feb 2024 11:42:01 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cti-tac@lists.linuxfoundation.org
From: Carlos O'Donell <carlos@redhat.com>
Subject: CTI TAC Meeting Notes 2024-02-28
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

CTI TAC Meeting Notes 2024-02-28

Present:
 * Carlos O'Donell
 * Adrianne Marcum (OpenSSF)
 * Bennett Pursell (OpenSSF)
 * David Edelsohn
 * Ian Kelling (FSF)
 * Joseph Myers
 * Nick Clifton
 * Siddhesh Poyarekar    
    
Regrets:
    
Agenda:
 * Schedule going forward.
  * Feb 12-16 writing.
  * End of February setup the website.
  * 2024-02-28 - Emailed Konstantin about process to turn on the webiste.
  * By 2024-03-08 can we have the website up for Paul Egger to review?
    * Add item for yearly audit including FOSS audit.
    * Add item for security and service separation.
  * March - Review with LF IT and prepare a migration plan.
   * Schedule TAC and LF IT meeting.
  * March - Review migration plan with community.
  * March 19th - Next CTI presentation to OpensSSF TAC.
  * March 27th - Next CTI TAC meeting.
  * April - Schedule for migration.
  * May - OpenSSF GB meeting.
  * August 1st - glibc 2.40 release (possible migration blocker or the point at which we switch infrastructure)
 * CTI Website Review
  * make html to get Sphinx html output.
  * FAQ items to still add.
  * Service enumeration still to add.
  * Process to follow for commits to the website?
  * Carlos will merge patches to the list.
 * Carlos: Is thte TAC able to review content by March 8th?
 * Joseph: What we have on the website is good, but we need more FAQ items.
  * Carlos: I will add the more complex FAQ items around service separation.
 * Nick: No worries (can review content).
 * Requests from glibc steward Paul Eggert (UCLA Prof)
  * Paul is asking for a checking mechanism to ensure we are using FOSS for the services.
  * One solution is for service provider to show their code that they are using.
  * Carlos: Ian how do you comply with such a request?
  * Ian: I'll have to think about it. We mostly handle our own services.
  * Publishing the code and documentation is something to be thinking about.
  * Carlos: Sid any thoughts on how you handle a FOSS audit?
  * Siddhesh: Yeah, an annual enumeration of the services and the FOSS software providing them.
  * Nick: Do we have a policy for what we do if the services is provided by non-FOSS?
  * Sid: As the TAC we've committed to not providing any services with non-FOSS?
  * Nick: The FOSS audit should be public.
  * Carlos: As Sid noted we should have a page updated yearly for the audit.
  * David: What requirements do we have? Is that sufficient for Paul or not?
  * Sid: Alex's wish is to meet A regarding SaaS, but I don't think we need to meet.
 * Making the CTI website live.
  * Next steps need to hear back from LF IT.
 * Ian: RO repository available for the website.
  * Sid: Yes, because people might want to participate in the editorial process and send patches.
  * Carlos: I'll ask LF IT for that, but before I send the email I'll verify you can't do an anonysmous clone.

-- 
Cheers,
Carlos.

