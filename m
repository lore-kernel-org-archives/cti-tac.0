Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D315910954
	for <cti-tac@lists.linuxfoundation.org>; Mon, 23 Oct 2023 08:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U/g5HqnH"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60D6981432
	for <cti-tac@lists.linuxfoundation.org>; Mon, 23 Oct 2023 08:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60D6981432
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U/g5HqnH
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8azt4pZ6tnqb for <cti-tac@lists.linuxfoundation.org>;
	Mon, 23 Oct 2023 08:01:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6ADE3813F3
	for <cti-tac@lists.linuxfoundation.org>; Mon, 23 Oct 2023 08:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ADE3813F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698048097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=SYx4H+qvp8i6PlO/tHiPAyUyRf2yztYJ7uZMQAKFb1A=;
	b=U/g5HqnH2oSAuJSOztquWzDGOl/kbJNgzOBOZ77RpgXSy+0I5rt7tS5BM1LvkTFrNpIe0K
	l9yolkPB4IUkFnTeRvk7yxWGFpySiodqeLZbrMHhEABAnJl30CMVelgbOai7SM45h51DNt
	KHSFNJ2mSfnU4/Oh36JUuy9kV4cicnM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-GitP6HRwPy2EYXmFuyy-EA-1; Mon, 23 Oct 2023 04:01:34 -0400
X-MC-Unique: GitP6HRwPy2EYXmFuyy-EA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-66d35dda745so36231586d6.0
        for <cti-tac@lists.linuxfoundation.org>; Mon, 23 Oct 2023 01:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698048093; x=1698652893;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SYx4H+qvp8i6PlO/tHiPAyUyRf2yztYJ7uZMQAKFb1A=;
        b=MRbrlzsy2bjU85SRFmq+GI21jEoY2FfyiFgB4NGIeXs2c0RdjhuiBxGc69DQ1vhPm3
         8zrEian9hDoAaU5L6prN1ASWykd//dHjz5ulPseS59QlAscXKP6SZQQeqMUjmIgm1N9o
         BFa+qEFFdu0dSxy/kAsKR/YPmMSAQUaHmwMuxFhcBfLcCBMGpFylHvVlkN3Pvl29SgZ4
         9n58vlupIleyjNWD23H7p4EVidpknJnUs83yGxQcw5YQJB+WKua0UEvTz/E+ksk2gT91
         +eSM1ilguUQ75O2o34deYh4mX+1MZJibEsSJpuahb+7xGmOCnRuAHyReoYX88Z2rcZwW
         c2IQ==
X-Gm-Message-State: AOJu0Yxyaq5p11+XSa3gCC9B++u+esgX6nq2cRONqPgcMsvANKP8nNSZ
	xdhXtRb6N/xSy1rQK8bQoBaGgQqI3PuOh6NBrHBhTQki+vklLFzbygJFCR4f0mneA7elBEGl/Hk
	AsYm9v6uoofP7ENERWrlAj3T4Ydf/UUVUPy8x4SfgNn1t3GQ2TPEUr49LCw==
X-Received: by 2002:a05:6214:5012:b0:651:66c4:cf4e with SMTP id jo18-20020a056214501200b0065166c4cf4emr10931681qvb.23.1698048093446;
        Mon, 23 Oct 2023 01:01:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH18W3nRpdX34HI0cQwOBdw4F68nZR+HwYSiIAhJXcNAfTqd8G4Xx+f0auRvO+B85OWcMiT+TsEvghlGueLhpg=
X-Received: by 2002:a05:6214:5012:b0:651:66c4:cf4e with SMTP id
 jo18-20020a056214501200b0065166c4cf4emr10931666qvb.23.1698048093095; Mon, 23
 Oct 2023 01:01:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Mon, 23 Oct 2023 04:00:00 -0400
Message-ID: <CAEMqeSqoOgwMex-d+y=Hp1J476em_yAJFG5-daxcwkQ+uA7UvQ@mail.gmail.com>
Subject: Reminder: CTI TAC Meeting on October 25th at 11am EDT
To: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Reminder: CTI TAC Meeting on October 25th at 11am EDT

BBB Conference link:
 https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1

Recurring last Wednesday monthly CTI TAC meeting.
Agenda:
- Standing monthly meeting for review.
- Discuss current TAC topics and progress.

Cheers,
Carlos.

