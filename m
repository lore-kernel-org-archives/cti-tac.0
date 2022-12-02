Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93B84C71
	for <gti-tac@lists.linuxfoundation.org>; Fri,  2 Dec 2022 16:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83D9240223
	for <gti-tac@lists.linuxfoundation.org>; Fri,  2 Dec 2022 16:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83D9240223
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Ba9X7OeB
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kjpILVxNsJhM for <gti-tac@lists.linuxfoundation.org>;
	Fri,  2 Dec 2022 16:00:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40867401DD
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 40867401DD
	for <gti-tac@lists.linuxfoundation.org>; Fri,  2 Dec 2022 16:00:32 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id fz10so5724048qtb.3
        for <gti-tac@lists.linuxfoundation.org>; Fri, 02 Dec 2022 08:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/zlmrFNSAyp/MmPGWWx+fTuK+EInvCRlh2ujRU0O/Pw=;
        b=Ba9X7OeBmGzBQF6zDDeNCA11Sqmf5QRmjtdJfGCdI3GFN4HERkx9DcoLyDBzmZ1zFN
         r2Y2QfmRbmS0NrPYgcJ6qm5oUhRIy0LAHJKv9unjgHpeaiX/TuTwaQPUgoefpb5g7V02
         ghG7wbaz0/mUv5BxtkUdpn2Fq25MyP4Yfwfag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zlmrFNSAyp/MmPGWWx+fTuK+EInvCRlh2ujRU0O/Pw=;
        b=bj8evu4tqNXj5yWDs0vTVA6q96qlcJyRUue89bliXgImkXKovB14LeAUNDRM77G9Kl
         RhDPMOdSbhX7uRvgJRnvJY0crdIu/t2PoQvnZbu/REUx2DtAtlybL0mdyZGcA+MBL1wm
         UCi+3yp3OdnVVhQgCh8AQ2+lXCdLPuvLS+bO4/o8n4eU0gjMG0pAw65s21Qtf4zWltnl
         IYF+0a0TXfFsSJFZ/r0k8P9bBQ5bEsWfAnnUb0/ZHwNKj0Fo1147dsqzaYfrZVND4A/F
         JbWNnR5l3RshHymXvATfvzMXCAgz12RNA0iUUj4lvxU46W0TpiY73wdV93hcw65o+pbx
         in8w==
X-Gm-Message-State: ANoB5pnEWa/vv999l/8xWraHPz/+XNDB24A6EeK7SFnMUEvORIUNiLFj
	J0rxWYbV6sgE8b/MSwi1U/8mcNxa7UL3DPBoJeI=
X-Google-Smtp-Source: AA0mqf4E6eY5g4ILVpKgHwWgpPO2Qy/bi8thybOJB+d82tilWsN9YxpKhizC/o8XhfDd+oA5n/8K2w==
X-Received: by 2002:ae9:e703:0:b0:6fc:773a:624f with SMTP id m3-20020ae9e703000000b006fc773a624fmr22839138qka.618.1669996830794;
        Fri, 02 Dec 2022 08:00:30 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id x20-20020ac87314000000b003a56796a764sm4364112qto.25.2022.12.02.08.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:00:30 -0800 (PST)
Date: Fri, 2 Dec 2022 11:00:28 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: gti-tac@lists.linuxfoundation.org
Subject: Re: Testing LF BBB instance for GTI TAC meetings.
Message-ID: <20221202160028.ese522ykukctsg3v@meerkat.local>
References: <957106ad-24b6-e144-1132-faa7f1714371@redhat.com>
 <20221130181102.qnteq5nvbxuiezob@meerkat.local>
 <385054cf-6062-c379-413f-052627cb1c05@redhat.com>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <385054cf-6062-c379-413f-052627cb1c05@redhat.com>

On Wed, Nov 30, 2022 at 01:25:05PM -0500, Carlos O'Donell wrote:
> > FYI, the hosting provider is doing some backend work today to complete the
> > move, so please don't be alarmed if you get an error in the next few hours.
> 
> Thank you for the update.
> 
> We'll test tomorrow to give them time to complete the move.

Carlos:

We ran a couple of actual meetings in it yesterday for testing purposes and it
worked really well. Please let me know how your tests go.

-Konstantin
