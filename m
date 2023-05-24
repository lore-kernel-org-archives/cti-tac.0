Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C890660847
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 14:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F770611E9
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 14:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F770611E9
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wh6Q3yba
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
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YTfyjfkFy4Rf for <cti-tac@lists.linuxfoundation.org>;
	Wed, 24 May 2023 14:12:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9854A611E4
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9854A611E4
	for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684937576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OYEBpApqfkbl4H2KiX0bJIq4yHBLshM+XaMrFyjHguA=;
	b=Wh6Q3ybaqOH5clUjkazpJ1avmvsdKw8GUYF9eNHlHFH3J+fpDQaSnJoVPSuIgyFSAC/caD
	bE3t+QFngL1wuDu51j07d4S5Vu8VSxWnd8Y/r5cmN6PA26mhFa+Ip0NwRxBUVNqp5PG5As
	TfwYt7SmwEjrAcRCYRy6sA6eIvXD/OQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-qgMOxUt5M7allYigPFhhEw-1; Wed, 24 May 2023 10:12:55 -0400
X-MC-Unique: qgMOxUt5M7allYigPFhhEw-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-556011695d1so18239247b3.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 24 May 2023 07:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684937574; x=1687529574;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYEBpApqfkbl4H2KiX0bJIq4yHBLshM+XaMrFyjHguA=;
        b=KukH0Ol4MD7+VOV8inpcnxeUrq2QmqRmlreY1j1b1EuspAMAC7A800unUoO5WZqiTY
         gO2jm4QESk85ZmHv40l2vU8HmKXsLRuaWNaA9AVN1z7nFyZGRnTza0mYKdOwQraM+8qe
         B43v9MqAZtuYtiAUahlnSGwCJuIpufqn4g3moaLsAnK8fKGalMZKdKlmm12MpNmuvpmH
         FOvhrv9wJb1sWIFEpAbed+jPTzQLGGmRlP1j8U0LjggXjd+SVj1yS2ZaBTlEkDM88VYN
         zycPFQtkKwx80uB65fMSfliWzJ+PXwAiPNIV5dzcxKKx7TFl/DMafGn26tXZqEJ358/F
         dshQ==
X-Gm-Message-State: AC+VfDzQh7u31zqPfL5S7zBLxZcTTKOdkG/Tsp96gV9otqbJ6z642HjP
	TfX8GHLU5HQaL2+EEdDijqX7h/MqH4DCFr4AP/PD2D2z98JsPsK5+Ll1yypSKituX7IpXuzITTK
	KfiOWduKxhg3o95qc39WQxgFMEQuo3GaYiCkDTAg=
X-Received: by 2002:a81:4f57:0:b0:55a:98ff:f075 with SMTP id d84-20020a814f57000000b0055a98fff075mr19222114ywb.3.1684937574377;
        Wed, 24 May 2023 07:12:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4G118ZI+aOPHMDDBnU+5KzuBYLON4cUQcoza+1LmzNuxFjkqaOT0vS9T9xU5pk/RsZj7FD0Q==
X-Received: by 2002:a81:4f57:0:b0:55a:98ff:f075 with SMTP id d84-20020a814f57000000b0055a98fff075mr19222099ywb.3.1684937574067;
        Wed, 24 May 2023 07:12:54 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id u132-20020a81608a000000b005611de826bdsm3742044ywb.86.2023.05.24.07.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 07:12:53 -0700 (PDT)
Message-ID: <3a802bd1-71f7-f845-5d29-34597368e394@redhat.com>
Date: Wed, 24 May 2023 10:12:52 -0400
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
To: Siddhesh Poyarekar <siddhesh@gotplt.org>,
 Joel Brobecker <brobecker@adacore.com>,
 Joseph Myers <joseph@codesourcery.com>
Cc: cti-tac@lists.linuxfoundation.org
References: <2938fae6-fc5-67e4-d85-3f193b68da89@codesourcery.com>
 <ZGs/yahtWK4pholh@adacore.com>
 <e40b659a-6479-56a3-6ad3-d7a0e34433b9@redhat.com>
 <d7c12b61-70d1-150d-e4ae-d6b2bdc62419@gotplt.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <d7c12b61-70d1-150d-e4ae-d6b2bdc62419@gotplt.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/24/23 09:43, Siddhesh Poyarekar wrote:
> On 2023-05-24 08:44, Carlos O'Donell wrote:
>> Likewise, I do post-commit review using the per-commit emails.
>> 
>> Even if we had an advanced process to review and merge code that
>> process still needs a belt-and-suspenders review from senior
>> maintainers, and I do that by reviewing and often responding to the
>> per-commit emails to loop in the people that committed the code.
>> 
>> The question for me is "What is lower cost?"
>> 
>> (a) Walking the git commit history, making a note of where I
>> stopped and started, and then writing net new emails when I see
>> something that needs correctly. (b) Reviewing an mbox, deleting as
>> required, and reply-all when I see something that needs review.
>> 
>> I like the per-commit emails because it lets me have some
>> post-commit discussions easily e.g. (b).
> 
> Couldn't you use patchwork for this, filtering on Committed state?
> If we have 100% coverage (sending non-matching commits to the ML will
> achieve that), you would be able to look through committed patches
> and then start the conversation in the patch thread instead of a
> separate one through glibc-cvs.

Is 100% coverage an achievable and timely goal? :-)

I think that Patchwork *could* meet this need but isn't quite there yet.

> If noting where you stopped/started is cumbersome then you could add
> another Audited terminal state in patchwork to track that.

That would need to be a per-reviewer state that doesn't exist today in patchwork.

The Audited terminal state would be global, and Joseph and I notice different things
in our reviews and apply different criteria for calling out a patch that needs follow
up work or review.

In summary:

- Post-commit review facilitation for projects continues to be a value-add step
  in the maintainer process and is currently mbox-based.

- The bar for post-commit review today is an mbox review-style process and a
  replacement needs to handle multiple reviewers walking the queue at different
  rates and applying different criteria to review (tag-based scheme?)

-- 
Cheers,
Carlos.

