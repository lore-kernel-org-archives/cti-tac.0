Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DF160862
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 20:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5A8F83FB4
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 20:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5A8F83FB4
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PoOFD3HE
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
	with ESMTP id b8L4HY2uUdTe for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 20:19:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C5D583F9A
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5C5D583F9A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 20:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684959574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nfB9RA2KBKjzNUz6RHaRs62XYikeIfrRBYFS7XIV2Ks=;
	b=PoOFD3HEwQ54nrHo46a0E8uL1UltTMCOAqW4cICoDXqQLUH5MsS1pmFxkzvDQU0JPRoljh
	JOw1P8HYYFLMnZDre2Lt3uol5RZsXhYnL56GU0EfmTed/3zJlpozU6kYIyOlrb7zYiwCXP
	+uHxiYno7bqsXH9TSDLvLqvVFDh6D98=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-6ZOzob6YPbSpg2lGdJk0tg-1; Wed, 24 May 2023 16:19:32 -0400
X-MC-Unique: 6ZOzob6YPbSpg2lGdJk0tg-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-561e68fe434so5701947b3.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 13:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684959572; x=1687551572;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfB9RA2KBKjzNUz6RHaRs62XYikeIfrRBYFS7XIV2Ks=;
        b=NpcZly90Bvg1NjS7I5lvE7HL76bawGb5qvlr1+RF4gkea8FC/5qHmlOEOleVtVWyP3
         nMVTQACwKMlI8N1YKt9h+3erf752tGkl5+Mm/eCMEvoopQvgglSlIIpO5Th0viD0zTD1
         yPTp5HwYhSFwMAjYtu32/M1RyEwRXIm8uyK6B7azZk37owGU7ZYaVZrBtdrbueqnZIDm
         n+bGh6xqPWyz5rpSjK/GO9VjT6oQ/5fJpQY5xbtnEjlU5BlbWglO/CwigQXxnQ2j3w6V
         fYmC4Tp8I4E1Ho6yaI16hPtzX/jjhRS4sxGdYtLWO35qrazV1GAanR46Hcuab5mVcoDq
         dwWQ==
X-Gm-Message-State: AC+VfDzYTki4HKF54wHcBwAraJZa7Ics0UfIZ7UW00pw6bEmxVZfvLC8
	IuY7qyEfAdTu9GLpODqzrPuhvcuGprHw+TeTf25MvWt0Is+DL0saDq9jkoEE51lv5ulU4FKDC7T
	6lK7AAuBhU4rGcOjrQzs8ISfoADbnOnw=
X-Received: by 2002:a0d:df44:0:b0:559:d19a:37ee with SMTP id i65-20020a0ddf44000000b00559d19a37eemr644053ywe.15.1684959571906;
        Wed, 24 May 2023 13:19:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7GzMyRr+Uxz6EPJXnxO4+RMthGmIERC6JfB5oHh/lzMjLTnj8yLO820n2S+YlWbrdyVJ93YA==
X-Received: by 2002:a0d:df44:0:b0:559:d19a:37ee with SMTP id i65-20020a0ddf44000000b00559d19a37eemr644038ywe.15.1684959571670;
        Wed, 24 May 2023 13:19:31 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id g65-20020a0dc444000000b005612fc707bfsm3953530ywd.120.2023.05.24.13.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 13:19:31 -0700 (PDT)
Message-ID: <926be414-95da-8d4c-c407-816701ac48b6@redhat.com>
Date: Wed, 24 May 2023 16:19:30 -0400
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
To: Joseph Myers <joseph@codesourcery.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 cti-tac@lists.linuxfoundation.org
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
 <20230523-ankle-infer-spurs-55ac6f@meerkat>
 <1a2097f1-2826-8381-6633-479dde6cbe28@codesourcery.com>
 <50134537-f7ad-e618-cf86-937d185f3e4d@redhat.com>
 <a9ba2c32-c46b-24fa-d0ea-9471717ed242@codesourcery.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <a9ba2c32-c46b-24fa-d0ea-9471717ed242@codesourcery.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/24/23 14:46, Joseph Myers wrote:
> On Wed, 24 May 2023, Carlos O'Donell wrote:
> 
>> If we removed all the hooks, what is the consequence of a commit that is 
>> wrong? Can we just fix the sources with a subsequent commit? Add a 
>> light-weight linting check in 'make check' that additionally reports 
>> this?
> 
> The consequence, at least for GCC, is that other scripting that depends on 
> certain invariants of commits falls over.  Mapping from SVN revisions to 
> git commits relies on only a single commit matching a given From-SVN 
> commit message pattern rather than such a commit message getting quoted in 
> another commit message in a way that confuses the mapping.  ChangeLog 
> generation falls over if there are various problems with commit contents 
> or messages.
Thanks, both of those seem like they are surmountable challenges:

(a) The community may choose not to support SVN/CVS legacy repositories.

(b) You already need a ChangeLog post-process to fix issues, so the hook is
    a belt-and-suspenders way to reduce the work done by global maintainers to
    keep the ChangeLog clean.

Just a reminder that we are talking about the cost of the glibc migration, but have
also started discussing the gcc migration which is more complex.

(1) CVS/SVN read-only repositories.

If the GCC community decides not to keep the read-only CVS and SVN repositories in
favour of the git repository with all the currently converted history, then does
this remove some of the more complex git hooks?

(2) Changelog invariant checking.

ChangeLog generation as I understand it is a concatenation of the commit message
ChangeLog snippet (Nightly update_version_git), and already would need manual editing
if someone makes a mistake e.g. 32582c190b91287a0d1239162333f5ad0ac81e72 in gcc where
Jakub adjusts the entries? Does dropping this hook create more work for you and Jakub
and Richie to udpate malformed ChangeLog entries for the day? Who gets email if the
update fails?

-- 
Cheers,
Carlos.

