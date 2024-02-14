Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA40C54F8A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 14 Feb 2024 13:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707918903; cv=none; b=FZcIeTSFILEu0/RLievrZtW/1QDk6wrjGfSieyYOs406oqSbGLeMlD+XHJKZprZ34IqKTeSGzxnWGb8a++83PUe7Au8YuRErZMpQblZ2bd4ElkClXxMlTT535YGwOFpFxwMz26Cc2zZIPKI63UtFASgzVpCirtvGumgXKLb385A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707918903; c=relaxed/simple;
	bh=fT1tV1HW45qvIu6AMERlRxicgp9yCdPpid29VmQd0qo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=VtKj/DlP6nx4qU6eC0TwRKJ0NWjgIVjb8V5IGYpojg59CWv/pW3tCSx+v9nVzyBGnGRgyuQSWmXwYVf9oh/pygo6JndC8yxGea+ZfpO8u0ZoTs2YeLgJdSre3W8DjIkiFdTyj4RMPapCzPHJpZYeGxpTQQG5ezNfmN1O6e1HArQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RgSODrJR; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RgSODrJR"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45B0C406B9
	for <cti-tac@lists.linuxfoundation.org>; Wed, 14 Feb 2024 13:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5L83g-GWRGh0 for <cti-tac@lists.linuxfoundation.org>;
	Wed, 14 Feb 2024 13:55:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8FCEB406AF
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FCEB406AF
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RgSODrJR
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8FCEB406AF
	for <cti-tac@lists.linuxfoundation.org>; Wed, 14 Feb 2024 13:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707918899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fb+VEqaiE0i5/JHv4qdFkiVr9Ryrhu2IFi8S3zTzFFE=;
	b=RgSODrJRbfK1GMySbVMKgUIJawqpA+tYfwM/xG0bqZVyCeETFS/NTI0Hg/dfIHFZLy1MRT
	zqCiMpLiiUgEnOuhGEZzzY5pXWVrd5tEn9QVscsAZMPTsfLGNGEanold7+XG8YdjAV8nAP
	TEC05w0l6zlrHNKAQdNUhnRgVG/vV98=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-FKPEkbbEM7eCBxUPFSoVeQ-1; Wed, 14 Feb 2024 08:54:57 -0500
X-MC-Unique: FKPEkbbEM7eCBxUPFSoVeQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7816e45f957so803585485a.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 14 Feb 2024 05:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707918897; x=1708523697;
        h=content-transfer-encoding:cc:organization:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fb+VEqaiE0i5/JHv4qdFkiVr9Ryrhu2IFi8S3zTzFFE=;
        b=KwAm3t39JtQnDNz9tIZH1N+N5DB/PFPKT7JhBSKkrTpWNJhrFxy8BiakNu2JQiHFD7
         V1V8zKbyQY6PzL5AjQcNNON0FDrRiutfeBGtDlu8oGMFIYmuqjcCYBUnS5268nGntjaH
         x2NC0jIUKLd/gMzjSMTnRGX5nVxtuzVdpRsBKO+2v5FJPH0HriaHFKZNetC2gdS2uWWl
         fRL3XfYEFN5qrXwMYJ9CFyjMd8dbfY2fq1U0AlUk8RETl6QNleFpgro4k19Z/qbRyFWe
         hUSJ36pwcUWeOnla+NSduxbytyWvLh7dBK8iKzJiZ/wDfu0Efalw+wyHTFuVoStcIs1m
         k8TA==
X-Gm-Message-State: AOJu0YzrFNt2tWKHjenUky2JXA56aZEKo++zv6xuF9Pw88Cedp2lw0QS
	5JRvy1thFvTCXHuclQ7EyddQfPH7Vcurz1fmRtsX7nmN3plmtj1m2om6oO7N7E0iLHrk5yz9twN
	0grlTr/8ASkbactz55LN+jzyvVomyy4ikvsIeT1s+QJNgO/pAlcnvHl7WpY7vFQurnuWD
X-Received: by 2002:a05:620a:51d4:b0:785:aeb7:5ead with SMTP id cx20-20020a05620a51d400b00785aeb75eadmr2953271qkb.75.1707918897392;
        Wed, 14 Feb 2024 05:54:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHS5rP7eqVptd3mer+afKQ21Njdp+y2AnrMrIEaQyouGYYglzhlULBbstpiIUK9iwvEf5n7eA==
X-Received: by 2002:a05:620a:51d4:b0:785:aeb7:5ead with SMTP id cx20-20020a05620a51d400b00785aeb75eadmr2953255qkb.75.1707918897167;
        Wed, 14 Feb 2024 05:54:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVpU4S5dJEEIJYGEGLzNKpChZwuQWsT2yKkG1Li98NzfOpwQRzvWzs+Zl1NsZE8PmFn0eqfF6Vs10eTpOUaBztoi2JV+IbE+uDsd6rxOsQXdDt6EDHIuwjAdbuWdEbi21pBFPil8rYAr1gy32SRbLZTckWuZ6wmuV4=
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id bj26-20020a05620a191a00b00785d43061e0sm2707652qkb.59.2024.02.14.05.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 05:54:56 -0800 (PST)
Message-ID: <a263ae8e-6d86-48f3-a4f2-98e4560a8035@redhat.com>
Date: Wed, 14 Feb 2024 08:54:55 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: David Edelsohn <dje.gcc@gmail.com>,
 Siddhesh Poyarekar <siddhesh@redhat.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Joseph Myers <josmyers@redhat.com>
From: Carlos O'Donell <carlos@redhat.com>
Subject: Meeting to add David Edelsohn to the trusted introducers list for the
 CTI repos.
Organization: Red Hat
Cc: cti-tac@lists.linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

David,

My understanding of the process is that we would need CTI TAC
members to meet with you and LF IT where you read out the
contents of your ssh key fingerprint and then you mail the pub
key to LF IT and they add you to the trusted introducers.

I'm available Friday February 16th after 1200h (EDT) to do a
key reading meeting. Likewise Tuesday February 20th after 1200h
(EDT). Wednesday February 21st I'm free all day.

Alternatively the next scheduled CTI TAC meeting is February 28th
and we could take some time there to do a key read out.

What works best for you?

-- 
Cheers,
Carlos.

