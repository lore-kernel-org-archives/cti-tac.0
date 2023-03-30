Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4367464
	for <gti-tac@lists.linuxfoundation.org>; Thu, 30 Mar 2023 15:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D974641D90
	for <gti-tac@lists.linuxfoundation.org>; Thu, 30 Mar 2023 15:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D974641D90
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fVeFlN+B
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.103
X-Spam-Level:
X-Spam-Status: No, score=-2.103 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJ3ma9pzO6P5 for <gti-tac@lists.linuxfoundation.org>;
	Thu, 30 Mar 2023 15:06:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CE374034B
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7CE374034B
	for <gti-tac@lists.linuxfoundation.org>; Thu, 30 Mar 2023 15:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680188779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f7/EMZEn6R5CCE8oc6ZVl+TCTY5uI7jd3OYadPSQN8g=;
	b=fVeFlN+BC3tN4FohZd8OxYIabn3z05pGjCEquZjxNK+uUKGi6VFeF81w0nj3c4VlYDhTUV
	t37zhPZ0L6WBRmfB1lyhXVyQ2fIoDK1ti8mUaQisPO/sGb1d8J1nwqEmA5rG/lBiXY40ll
	ClDgvdAKdRKnngLeIHoWpV9HH5BZCjk=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-YPtuTMkKOECnp5kZZMBLgA-1; Thu, 30 Mar 2023 11:06:17 -0400
X-MC-Unique: YPtuTMkKOECnp5kZZMBLgA-1
Received: by mail-yb1-f200.google.com with SMTP id g187-20020a2520c4000000b00b74680a7904so18954091ybg.15
        for <gti-tac@lists.linuxfoundation.org>; Thu, 30 Mar 2023 08:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680188777;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7/EMZEn6R5CCE8oc6ZVl+TCTY5uI7jd3OYadPSQN8g=;
        b=njSxYKR/7tO8PYvUaC1TDQBkQcxIpIS0hqDW5wUy4lBVQamaxdd7clp+TX9VUvT9YM
         +PEQcBteCbG8h4Sl8VMWMslz1Y7EuNoLOQ8o+4DynTRYtr2vEoG78kQNsa9IZFSGV0tA
         qPni0EXiauS8a3raD2sditynvlgLBzkbHpFXqrQbbaY2Nm/uXi47Y6wfZpHpRpUkUDPG
         Fu7f1zzPHSvgAt3SYHcQ+FJySlf4SAyoKUGnHQGbNuvvYH/jCv7/Q/4vG5Mj4Jbq2CKp
         Qw6XMkDHqvyAxnGe6BuWqXU7LQdSgyIcsl/XkrdI6szcZE1ebnw8F5TeVxnpJX9KAmIx
         sgvw==
X-Gm-Message-State: AAQBX9cIcMeuUS+usU+Y4j8VnLGe0FLAjFcYi3CKCcmVPRVxxE9KP9AV
	q7jFVa8xErQ5A4Yp4Z7JAvKYlM6F1KGBM1EeuckrJCGm8wISOjGUlLtbmZaTOmg6vCuGe8e1tC/
	C+llASCyCajOICbG3KfVF6x4c4+wf/HnT/0dJrAI=
X-Received: by 2002:a0d:eb45:0:b0:543:80d3:3b0c with SMTP id u66-20020a0deb45000000b0054380d33b0cmr5377712ywe.11.1680188776926;
        Thu, 30 Mar 2023 08:06:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350YPs6yNTVP/Mh4xZXPMfVORP+eSqqeKaGyhq3aTmoE+rIMm66zw6Uah9kctlWOCzAOoiabbMw==
X-Received: by 2002:a0d:eb45:0:b0:543:80d3:3b0c with SMTP id u66-20020a0deb45000000b0054380d33b0cmr5377694ywe.11.1680188776656;
        Thu, 30 Mar 2023 08:06:16 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 130-20020a810188000000b00545b9498c1asm2906004ywb.12.2023.03.30.08.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 08:06:16 -0700 (PDT)
Message-ID: <61c55c28-ba66-9e49-482f-4968ff700ca4@redhat.com>
Date: Thu, 30 Mar 2023 11:06:15 -0400
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Planning the next GTI TAC meeting for March 8th.
To: "Jose E. Marchesi" <jemarch@gnu.org>
Cc: Simon Marchi <simon.marchi@efficios.com>,
 gti-tac@lists.linuxfoundation.org
References: <db67f1f9-320c-18fc-f196-5923cc622c0a@redhat.com>
 <256fbbba-4b71-4fc0-3646-2c338253ba34@efficios.com> <87356l7tix.fsf@gnu.org>
 <e2750d02-eec0-ef13-9dcc-2de2ff56bb9e@redhat.com> <87bkkajo24.fsf@gnu.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <87bkkajo24.fsf@gnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/23 10:45, Jose E. Marchesi wrote:
> I was travelling and missed this last meeting.  Sorry about that.
> Are the minutes published somewhere?
Yes!

Posted here:
https://lore.kernel.org/gti-tac/a3b10266-2bf7-44da-249f-7d01e36ac253@suse.cz/T/#t


-- 
Cheers,
Carlos.

