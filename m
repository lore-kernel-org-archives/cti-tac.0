Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AC660843
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 12:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B63A82272
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 12:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B63A82272
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q62LGJoR
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
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m5OGNYnjr2hJ for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 12:44:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3305C81FF0
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3305C81FF0
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 12:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684932281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TKZTwLd+urAeMMolQuD/MmLpJ765US5QBi3z3ljA0AY=;
	b=Q62LGJoRLJaNI72mFP6mr2C9O5kAb3rRhTMW9VNWiaX4zp4l7XTURKhIDV0r4vu1BnMalr
	myJCoz7oIXYagta0o0aQjfyrOFGTlnWDAoWKZFGRho6tfYaooeHSYabxe73TiHL5YLhnl+
	L/MQ0lERpNyFGWHjzDvHW2pG0He6CAk=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-pyfOi3A2P3qr28jnhWhlNQ-1; Wed, 24 May 2023 08:44:40 -0400
X-MC-Unique: pyfOi3A2P3qr28jnhWhlNQ-1
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-ba8c9e9e164so1739898276.2
        for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 05:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684932279; x=1687524279;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKZTwLd+urAeMMolQuD/MmLpJ765US5QBi3z3ljA0AY=;
        b=Yrs6AmOBR9WNYW2c6E3nYOdO8Y2nW73YrekG3Nql2aL94bgRwFG6w4POGIsmOwUc5I
         69zybQjqrnYU6opssEhWPhYNlURK7EhLUxHTYkOD3NyYR7D80jBqBiq/WT85BgXYsYBs
         yt2LSyrwLDdK4XWRaGS4PqVlGhAMcMvhFqtqpSkFuKI1yIgMKqYiG5lTlbU5X4NAUjru
         4e9dr8NnjLh9eTEpJTdISfrj9LEm6KnunyOmvUZ30BBLvB0vzqTXRT7w1uR1ExVyJaC2
         qb7JxBM9Fkc5XdqVDkjvibr/hUCFBs0pS6XL7Hkn3dWTobSwNlPL9per2B4SOSgt3BFK
         3mZg==
X-Gm-Message-State: AC+VfDyXGXCENDC5CbI/O/Of3FDBsC0zAS6AOwyB5v/+6EhqTLDrhsK3
	KV1sarNHNf9t2Ixrv5pwmjv/3UPnB5EFjuCC6bafmLu5+CMMjZvR1EuO8HBDJWSySLp87V84FA8
	KZb6Av094BMt9VKeH1R5z9RQjfyDyO5UkhDVEv5E=
X-Received: by 2002:a25:53c4:0:b0:ba8:918a:c333 with SMTP id h187-20020a2553c4000000b00ba8918ac333mr18195030ybb.30.1684932279215;
        Wed, 24 May 2023 05:44:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ77CI8oHb3GisC85nknEXXNtoGfq8DFVMgu1FGws/O+J+c87eMpXlMnXf5itPSIuDaJZ6ce4Q==
X-Received: by 2002:a25:53c4:0:b0:ba8:918a:c333 with SMTP id h187-20020a2553c4000000b00ba8918ac333mr18195023ybb.30.1684932278917;
        Wed, 24 May 2023 05:44:38 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id a40-20020a25ae28000000b00ba83a9755f1sm899752ybj.43.2023.05.24.05.44.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 05:44:38 -0700 (PDT)
Message-ID: <e40b659a-6479-56a3-6ad3-d7a0e34433b9@redhat.com>
Date: Wed, 24 May 2023 08:44:37 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Next steps from GTI TAC meeting on 2023-03-08 - Evaluate cost of
 glibc migration.
To: Joel Brobecker <brobecker@adacore.com>,
 Joseph Myers <joseph@codesourcery.com>
Cc: cti-tac@lists.linuxfoundation.org
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
 <ZGs/yahtWK4pholh@adacore.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <ZGs/yahtWK4pholh@adacore.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/22/23 06:11, Joel Brobecker wrote:
>>> * Sending per-commit email to mailing lists -- this seems like a vestigial
>>>   feature from the pre-git past. Does it really serve any purpose? I am
>>>   fighting to kill a similar feature used on the kernel.org side, because I do
>>>   not see any remaining legitimate use for it -- it just creates a lot of mail
>>>   traffic that nobody really reviews.
>>
>> I think it's extremely useful to have those messages for watching out for 
>> commits that shouldn't have gone in or went in in an unintended form (this 
>> is for human-determined "shouldn't" or "unintended" - not anything 
>> expected to be covered by automated checks).  And also to have a message 
>> ready-made to reply to when something was committed without being posted 
>> to the mailing list.
> 
> I strongly agree as well.
> 

Likewise, I do post-commit review using the per-commit emails.

Even if we had an advanced process to review and merge code that process still needs
a belt-and-suspenders review from senior maintainers, and I do that by reviewing and
often responding to the per-commit emails to loop in the people that committed the
code.

The question for me is "What is lower cost?"

(a) Walking the git commit history, making a note of where I stopped and started,
    and then writing net new emails when I see something that needs correctly.
(b) Reviewing an mbox, deleting as required, and reply-all when I see something
    that needs review.

I like the per-commit emails because it lets me have some post-commit discussions
easily e.g. (b).

-- 
Cheers,
Carlos.

