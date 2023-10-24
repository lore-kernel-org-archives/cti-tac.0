Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCAC13FED
	for <cti-tac@lists.linuxfoundation.org>; Tue, 24 Oct 2023 15:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PfJ01pC0"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F57442FBE
	for <cti-tac@lists.linuxfoundation.org>; Tue, 24 Oct 2023 15:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F57442FBE
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PfJ01pC0
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H1s6cpWWF6ui for <cti-tac@lists.linuxfoundation.org>;
	Tue, 24 Oct 2023 15:01:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 11878400BF
	for <cti-tac@lists.linuxfoundation.org>; Tue, 24 Oct 2023 15:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11878400BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698159710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VZ1ngGAqaP4XO0zyRNF753MiVzyeincigqvljlsDaFs=;
	b=PfJ01pC024RIFqU6ofjFQ0DBwzcKiUNlxWa51/HAWlj8TaIYK7pqfBaY/q7pMGnhULfc8z
	eBVwfJFC3YAu8RuSwTS5Kea6UL3xgsnhlpeyxvbaAcionmA264Ep0knGAxoOWW5FVQh2lW
	JFhDGkY7qOGxGj2xQQFf5MDHCijYb2I=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-avDiqtfoOmCAPxB8siAdvA-1; Tue, 24 Oct 2023 11:01:38 -0400
X-MC-Unique: avDiqtfoOmCAPxB8siAdvA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-66cffe51b07so66926036d6.3
        for <cti-tac@lists.linuxfoundation.org>; Tue, 24 Oct 2023 08:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698159698; x=1698764498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ1ngGAqaP4XO0zyRNF753MiVzyeincigqvljlsDaFs=;
        b=DAW9XMM05zqNqXq8rGqerG4kmxYzyb3RjXjWW3RC3yQoLyGfGxa317cRx/+LIqASvz
         7BgHIB6rQ+8uZjLxWBSTINQFZvXML7J0U92HVqpq7hEt9VTAPaAWpl/btdGzEeVyD2uK
         UYV1b00eBG/dBAGyQ9g6SxbUOxjAa0cXafYJAZtFrNZIXuRdXVIy0pJbDYz2wAVXjkvb
         cKHLKdiIXcKKbND3w7QFAPioLk5E1JGm23oCoD8eEEnD/qGmd2WJdYRLxmfZu9R5RrgT
         1e8r/XQVf/zUTCfDPC0nk0+j+6P+siEtj8EToKBW/qnJxDNuoWNQmUqszaYq+Rqz6JwN
         Cc7w==
X-Gm-Message-State: AOJu0YwK6Xi7NY/RKdiQVPWy0+VywDbNzMh6zy9yY5Gi2JBXvl8tx6aG
	P/CUn8dwR3LnhFKl3P/OxCAsjh1HZKVsoA/3dFKflfaXZc8aQd79BzdS9exTGXzA9L6JEQUnTYP
	bPlf0begCeGLJjVOjcszLSP1lbkGnS5EOIGF2Z2/9Dzl4CFw=
X-Received: by 2002:a05:6214:212c:b0:656:4712:af9f with SMTP id r12-20020a056214212c00b006564712af9fmr15935874qvc.13.1698159698014;
        Tue, 24 Oct 2023 08:01:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYAK47MPJN2/Bz7wCG5OCxSCzE7Iw73h7YGc1BZkeLs42Shb3E9wLLynZZoU2SjfDBrS+frW7AbCbGb72odi8=
X-Received: by 2002:a05:6214:212c:b0:656:4712:af9f with SMTP id
 r12-20020a056214212c00b006564712af9fmr15935839qvc.13.1698159697693; Tue, 24
 Oct 2023 08:01:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
References: <CAEMqeSqoOgwMex-d+y=Hp1J476em_yAJFG5-daxcwkQ+uA7UvQ@mail.gmail.com>
 <20231023-moli-musi-weka-7d5150@meerkat>
In-Reply-To: <20231023-moli-musi-weka-7d5150@meerkat>
From: "Carlos O'Donell" <carlos@redhat.com>
Date: Tue, 24 Oct 2023 11:01:26 -0400
Message-ID: <CAEMqeSqJsjfvPLaC+Kdd-A+o_ybeO2esB1uEeXCS6sx6skUGrw@mail.gmail.com>
Subject: Re: Reminder: CTI TAC Meeting on October 25th at 11am EDT
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: cti-tac@lists.linuxfoundation.org, rday@linuxfoundation.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 1:22=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Mon, Oct 23, 2023 at 04:00:00AM -0400, Carlos O'Donell wrote:
> > Reminder: CTI TAC Meeting on October 25th at 11am EDT
> >
> > BBB Conference link:
> >  https://bbb.linuxfoundation.org/room/adm-iuc-px7-mk1
> >
> > Recurring last Wednesday monthly CTI TAC meeting.
> > Agenda:
> > - Standing monthly meeting for review.
> > - Discuss current TAC topics and progress.
>
> Hello, I'd like LF IT to attend:
>
> - Konstantin Ryabitsev
> - Ryan Day
>
> Please let me know if that's ok.

Absolutely! It's always OK :-)

Cheers,
Carlos.

