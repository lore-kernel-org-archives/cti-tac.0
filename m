Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E776125
	for <gti-tac@lists.linuxfoundation.org>; Mon,  5 Dec 2022 17:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2494340484
	for <gti-tac@lists.linuxfoundation.org>; Mon,  5 Dec 2022 17:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2494340484
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XIH7l1f/
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
X-Spam-Status: No, score=-2.098 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
	SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5sKjoMJ34jqw for <gti-tac@lists.linuxfoundation.org>;
	Mon,  5 Dec 2022 17:46:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC83240193
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AC83240193
	for <gti-tac@lists.linuxfoundation.org>; Mon,  5 Dec 2022 17:46:14 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id r26so16822310edc.10
        for <gti-tac@lists.linuxfoundation.org>; Mon, 05 Dec 2022 09:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EMUjva6f05v1geBK+GK64b6iex++R2LVGnPSUGkNuKY=;
        b=XIH7l1f/HBgNdTCxOs8QiX0rW50vFoMjHb4H1KIMTjJ3rdISx4ixPlBjXujBap4+UL
         ajr8C4zyo5y3Yrz744+b0TY26WF6jZLjWxeJwsAKcF6Agwut/xN/hmpAuypIUmgV2nFe
         RPUifVvjwm4+cwrTpNTk/nMziqaGLd1um6FJHHyQkq6rBo07HFJxzHJozJN4HVmrSiLg
         KsDIjk1CLKZwVL/v/fLKJt89T350C3jadWkzAgwlD1jZXLS6o2MgMLfGLPtjv8oa7C3z
         6IHQpqKOzwT69w4xFM4WtLP1DMpFE6gxVSi0V0wNjVDAPStWf5USxISRwUvIHo39Ulv0
         G02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMUjva6f05v1geBK+GK64b6iex++R2LVGnPSUGkNuKY=;
        b=Kr25+j/RKnbotI6kVEenUXV1m2+aV9tbDBWRcH1YKX3b35V7yVzOqJxwx27UV9EZKg
         q11xhbvpK6RqlxHUUQCezOsh2r4mMaaWtu0pfoA1INkd2ePawFV4PwnvmFYTDTOyEohu
         u1eOk4Ye7GIJ67wmNg+ZSYMEv853w5AApcfY4zs6Oof+VFwoz8n4aPN4BMGIVuxHNPrT
         Z8zUulYpQwQdSP7HrUlA3Wcup7dfOGLr4CXcOK9+C45i8Qh/+MfYPC3Gc19mZvmmaBNi
         trkJZYaozb6ULVLsV2Z72Mt4xeLdeGPBGOfx2GFyNzoG5P9hltLYzogrh90B9QQYRLD6
         CMEQ==
X-Gm-Message-State: ANoB5plrPay/v2/Wtf2ZOXaUwcX1s9GvkU2YQjEegW0P9vN08YBr+QwW
	ACFrW+o+phX00iXO4JUIpqQA31nAgzps6iFIFnM=
X-Google-Smtp-Source: AA0mqf6hq54nwsJ4OY6B6Re/pYE4uc13uGV3wF75PWCAbCTGt+Y3zMt0h4I1OnIYVkOL1h62LE/sQ3DA5f8RggPJ1p4=
X-Received: by 2002:a05:6402:1814:b0:46a:b1ba:22b8 with SMTP id
 g20-20020a056402181400b0046ab1ba22b8mr42198714edy.316.1670262372866; Mon, 05
 Dec 2022 09:46:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
References: <3a81d482-c952-d501-f495-485f00400e85@redhat.com>
 <Y3rxAYa/oc5s/R/7@adacore.com> <da126be7-475f-e2ed-fb4f-4493271db5f3@codesourcery.com>
In-Reply-To: <da126be7-475f-e2ed-fb4f-4493271db5f3@codesourcery.com>
From: David Edelsohn <dje.gcc@gmail.com>
Date: Mon, 5 Dec 2022 12:45:54 -0500
Message-ID: <CAGWvnyn-age684gnQB+ViF52BEHPSN5rvZ8hfjsVvDsf1omsRw@mail.gmail.com>
Subject: Re: Action: Setup working group for the GNU Toolchain proposal to
 migrate to LF IT managed services
To: Joseph Myers <joseph@codesourcery.com>, Joel Brobecker <brobecker@adacore.com>
Cc: "Carlos O'Donell" <carlos@redhat.com>, gti-tac@lists.linuxfoundation.org
Content-Type: multipart/alternative; boundary="0000000000006a9c6f05ef184315"

--0000000000006a9c6f05ef184315
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 21, 2022 at 3:56 PM Joseph Myers <joseph@codesourcery.com>
wrote:

> On Mon, 21 Nov 2022, Joel Brobecker wrote:
>
> > * bug tracker (bugzilla)
>
> I think this needs to go into more details.  Details of incoming email
> handling (some Bugzilla installations don't use incoming email, we need to
> be explicit about how it's a key feature used in our installations),
> details of outgoing email handling, details of local changes to the
> Bugzilla installation and how account creation is handled, for example.
>
> >   - /sourceware/infra/bin/email-to-bugzilla
> >
> >         Sends a copy of commit messages to bugzilla if commit
> >         has a PR number in it.
>
> The fact that this currently seems to use SQL access to the database is a
> really important thing to include in the list of services.  Remember that
> we're trying for more isolation of components with minimal interfaces
> between them, to improve security.  So if this script could be changed or
> rewritten to use the (public) REST interface instead of SQL access to
> check for whether bugs exist, that would be helpful.  (The fact that it
> sends email to add to Bugzilla is also relevant, because it means that any
> system running this script needs to be able to send email - and for any
> system sending email, it will be necessary to avoid losing outgoing email
> if it's a transient system and there's a transient email problem.)
>
> In general, details of exactly what interfaces are used by components to
> interact with others - especially if they make any assumptions about
> direct database or filesystem access, or about different services being
> hosted on the same system - are really important.  (This would then give a
> list of cases where we should *change* the interfaces used to remove such
> dependencies - for example, using the public read-only REST API to extract
> information from Bugzilla instead of SQL access.)
>
>
Joel and Simon,

Can the GDB analysis be updated to the level of detail that Carlos provided
for GLIBC in his separate message?

Thanks, David

--0000000000006a9c6f05ef184315
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Nov 21, 2022 at 3:56 PM Joseph My=
ers &lt;<a href=3D"mailto:joseph@codesourcery.com" target=3D"_blank">joseph=
@codesourcery.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Mon, 21 Nov 2022, Joel Brobe=
cker wrote:<br>
<br>
&gt; * bug tracker (bugzilla)<br>
<br>
I think this needs to go into more details.=C2=A0 Details of incoming email=
 <br>
handling (some Bugzilla installations don&#39;t use incoming email, we need=
 to <br>
be explicit about how it&#39;s a key feature used in our installations), <b=
r>
details of outgoing email handling, details of local changes to the <br>
Bugzilla installation and how account creation is handled, for example.<br>
<br>
&gt;=C2=A0 =C2=A0- /sourceware/infra/bin/email-to-bugzilla<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Sends a copy of commit messages to bu=
gzilla if commit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0has a PR number in it.<br>
<br>
The fact that this currently seems to use SQL access to the database is a <=
br>
really important thing to include in the list of services.=C2=A0 Remember t=
hat <br>
we&#39;re trying for more isolation of components with minimal interfaces <=
br>
between them, to improve security.=C2=A0 So if this script could be changed=
 or <br>
rewritten to use the (public) REST interface instead of SQL access to <br>
check for whether bugs exist, that would be helpful.=C2=A0 (The fact that i=
t <br>
sends email to add to Bugzilla is also relevant, because it means that any =
<br>
system running this script needs to be able to send email - and for any <br=
>
system sending email, it will be necessary to avoid losing outgoing email <=
br>
if it&#39;s a transient system and there&#39;s a transient email problem.)<=
br>
<br>
In general, details of exactly what interfaces are used by components to <b=
r>
interact with others - especially if they make any assumptions about <br>
direct database or filesystem access, or about different services being <br=
>
hosted on the same system - are really important.=C2=A0 (This would then gi=
ve a <br>
list of cases where we should *change* the interfaces used to remove such <=
br>
dependencies - for example, using the public read-only REST API to extract =
<br>
information from Bugzilla instead of SQL access.)<br><br></blockquote><div>=
<br></div><div>Joel and Simon,</div><div><br></div><div>Can the GDB analysi=
s be updated to the level of detail that Carlos provided for GLIBC in his s=
eparate message?</div><div><br></div><div>Thanks, David</div><div>=C2=A0</d=
iv></div></div>

--0000000000006a9c6f05ef184315--
