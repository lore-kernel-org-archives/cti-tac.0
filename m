Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38176116
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 22:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51EFB81551
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 22:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51EFB81551
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ia6OQ/wN
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
	with ESMTP id 1SLoIgbZE_xt for <gti-tac@lists.linuxfoundation.org>;
	Mon,  6 Feb 2023 22:09:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56FBB81521
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 56FBB81521
	for <gti-tac@lists.linuxfoundation.org>; Mon,  6 Feb 2023 22:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675721391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+7NrDHFAQNSU6BYaDMsjY9rGpBDjE5ka5jWPW2/Jhk=;
	b=ia6OQ/wN68D4p/U9UQM8OGYjfLqaPPz5amGohk96ukoxe17KVtbutqCpY8+VwWVJXgLEph
	2mz9C/o26oAFniuIrRmky3p5dzpAnaJcMZ9ed7G5qhDfLsgOvZPTvWMmpC2XkKLkKYWxoe
	WZP0XOy+02elE9YnYEW08UismrIclUg=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-qS97f5GRNtWfkAsRQm6iYQ-1; Mon, 06 Feb 2023 17:09:49 -0500
X-MC-Unique: qS97f5GRNtWfkAsRQm6iYQ-1
Received: by mail-io1-f72.google.com with SMTP id r25-20020a6bd919000000b0071cfef31f97so7827467ioc.4
        for <gti-tac@lists.linuxfoundation.org>; Mon, 06 Feb 2023 14:09:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+7NrDHFAQNSU6BYaDMsjY9rGpBDjE5ka5jWPW2/Jhk=;
        b=7QO4GzFVtKZpaFiFdnS2Ou218If4fhR1l0D+eRObIMZI7cYofxNsrJzuXo4GI99J4v
         JT2Ok/nNnJ5P2ZUzlyp1Zoaj7WZW9txjqsVz3rP0cy8AghM7+Re2M7TDPvGxLASSLP0a
         6ckbJiQK6G9YvX0aKc4JIpaaR/MkrBJDS1avF+7ehLEQpF80BYQIDBEQIPhRoCnTWoUP
         +vN+5Uaz7vcJSUAqNlOf3A1IbdesaPPu7XG85XQiNEn/sFsrgiUR4x/jOrm4bXflBndQ
         yRSkKE/pjiMSQ36YMGryh5q1qg2UceXTpt/gVLZoRsjPUVNXuUen3edx6N7Ns79QVPT9
         uX5A==
X-Gm-Message-State: AO0yUKXJqFunxFhGcpsQggO0dKNFe/yasHNO503f859dqEedDBz2j8Ba
	TEpj2i1aVSRxuOZ9/UD7Gffp7X8KBLwo3TKIvjni19iLt5EbSmXKxQI1qiCrVTgWbanfHNUSY/c
	l9HUAEgDZhwQF7JkCEHDmxE8LN6wmq1o=
X-Received: by 2002:a92:cda8:0:b0:313:b6de:4e92 with SMTP id g8-20020a92cda8000000b00313b6de4e92mr649047ild.23.1675721389081;
        Mon, 06 Feb 2023 14:09:49 -0800 (PST)
X-Google-Smtp-Source: AK7set974ELXE6Ozn0dxzVmQXF6DM1rK95HXGKtspizZmLLK4CWLuI36fKYwSh/ZADswm13brlVIdA==
X-Received: by 2002:a92:cda8:0:b0:313:b6de:4e92 with SMTP id g8-20020a92cda8000000b00313b6de4e92mr649036ild.23.1675721388853;
        Mon, 06 Feb 2023 14:09:48 -0800 (PST)
Received: from [192.168.0.241] (192-0-145-146.cpe.teksavvy.com. [192.0.145.146])
        by smtp.gmail.com with ESMTPSA id cp9-20020a056638480900b003a53692d6dbsm3940966jab.124.2023.02.06.14.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 14:09:48 -0800 (PST)
Message-ID: <4718eb70-b843-0f46-9555-cbba58f70713@redhat.com>
Date: Mon, 6 Feb 2023 17:09:47 -0500
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: CY23 - Status of service enumeration.
To: Simon Marchi <simon.marchi@efficios.com>,
 gti-tac@lists.linuxfoundation.org, Nick Clifton <nickc@redhat.com>
References: <d8790f60-483b-dfc6-dd7f-cb408334eb40@redhat.com>
 <bc978ef9-3d6e-d032-252b-3aae460c895a@efficios.com>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <bc978ef9-3d6e-d032-252b-3aae460c895a@efficios.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/6/23 14:11, Simon Marchi wrote:
>> Joel, Simon,
>>
>> Is binutils going to be any different from gdb?
> I don't know about the binutils process.  Perhaps we can ask Nick
> Clifton to review our list for GDB and complement it with any
> information specific for binutils?

Simon,

Good idea!

Nick,

Would it be possible for you to look over the gdb list of services here:

https://lore.kernel.org/gti-tac/Y6aOvWPYmFXgyva5@adacore.com/T/#m9b3f915a4ba6cc5aab388ed28c02e5ee9f18e65c

... and comment on if there is anything that binutils does differently?

-- 
Cheers,
Carlos.

