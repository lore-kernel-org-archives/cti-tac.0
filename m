Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286BC3B3E0
	for <cti-tac@lists.linuxfoundation.org>; Wed,  7 Jun 2023 23:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD10741E3B
	for <cti-tac@lists.linuxfoundation.org>; Wed,  7 Jun 2023 23:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD10741E3B
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kruH/Fyk
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
X-Spam-Status: No, score=-2.098 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
	SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LBiRD3bFRGdY for <cti-tac@lists.linuxfoundation.org>;
	Wed,  7 Jun 2023 23:05:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1451041E3A
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1451041E3A
	for <cti-tac@lists.linuxfoundation.org>; Wed,  7 Jun 2023 23:05:00 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-976a0a1a92bso3964066b.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 07 Jun 2023 16:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686179099; x=1688771099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fKF0KPqL0pa3FaIYzejI7OxKCBsG8P8+EsM9ZlpC5io=;
        b=kruH/FykC3A1tvfW18gImH2o1SLuG8SZ4AnG+q8ee30/1X7Hs5rFzQHYd/zBk04D9z
         I9lPObovqA8eA77J5ceF6SAaEI4vRTPYgd4laiL29eqWTpvXDNcp0seuLf3Nx/wAqh7T
         srHqFHlZdGlI+bcXN7+sDqp95j1NmU0OAoZb7Y/CMhDUXwfa55GVOTRtPb/tjchta5ZC
         Nu3paMT6/IVEA1it0bvKpzAzjDqntCLaJhClRXwdoh/x+luijoPpwhwXA/cDpyis10NB
         uGM15x9i6X2l3yzuJ6c1Uy0CAB8xPtXMw6d9c/O6xMGY7+1xtrio9rEZwEQ7b1bmQu/P
         xtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686179099; x=1688771099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKF0KPqL0pa3FaIYzejI7OxKCBsG8P8+EsM9ZlpC5io=;
        b=OZlpGF9RBe6TrtLzVcXZ1P+i7yrhXCEyOu9xCDaN5nCWqBDaGdRSUbjfO0V4naipbi
         AceRmBiyVIhPzazasiV3rdoMOKRflzFTibNI26m8jNurmPltyBwyJaBwP/AZF4BTdKX7
         EQegXrwZu5YgAICr1u3j4j0ay1Jpt/kgereQ6dz4N83N62MPIZjF+JAcg3d2utx7TVFh
         aLI3ntc8eIyYvXAvlxACLz/z19gkxWBwuWxyd/tpy25iCHhVDm3k4S9HAQYtb35u+Q82
         p54zcikT1N0CxLuvuMOoVLu5jpnACut7EekZa3mSB6nIhb4ky26bg27WWIzykgGSIrmq
         xOuQ==
X-Gm-Message-State: AC+VfDySBQaCZh9DcsogZLtXdIMiEidLYjj4ZKszk6CIva0A2zliUU8F
	K6GH2p2/qs4CDh9DiKN4Uu2Su3BCXK06E36hKqY=
X-Google-Smtp-Source: ACHHUZ5JNYxOQi/YGbOdiOODuQrG3LTJ2kp5JIKZAzviPQgPF/OmTdjEH/yBwc/FWnoT6mwOKVE703vv8rUZclBwCqw=
X-Received: by 2002:a17:907:9444:b0:974:7713:293f with SMTP id
 dl4-20020a170907944400b009747713293fmr6522917ejc.41.1686179098965; Wed, 07
 Jun 2023 16:04:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
References: <2b961760-b1c5-0bf3-1da4-b76d06cb925f@redhat.com> <20230607-lob-grove-nab-0a1320@meerkat>
In-Reply-To: <20230607-lob-grove-nab-0a1320@meerkat>
From: David Edelsohn <dje.gcc@gmail.com>
Date: Wed, 7 Jun 2023 19:04:47 -0400
Message-ID: <CAGWvnyn5PX2Xvefx8Ev=P_2sNB1sejBKBtqwc4w4xvNBv3idHg@mail.gmail.com>
Subject: Re: Status of glibc-related service cost review for CTI?
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Carlos O'Donell" <carlos@redhat.com>, cti-tac@lists.linuxfoundation.org
Content-Type: multipart/alternative; boundary="00000000000038b91e05fd922ae1"

--00000000000038b91e05fd922ae1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 7, 2023 at 3:37=E2=80=AFPM Konstantin Ryabitsev <
konstantin@linuxfoundation.org> wrote:

> On Thu, Jun 01, 2023 at 08:18:20AM -0400, Carlos O'Donell wrote:
> > Konstantin,
> >
> > This issue came up in today's CTI TAC meeting and I took the AI to emai=
l
> you here.
> >
> > Do we have an update on the status of the cost of CTI supporting glibc'=
s
> service requirements?
> >
> > Is glibc too small to even count?
> >
> > Does it make it hard to estimate?
> >
> > Would you rather budget this or estimate a price based on load or
> resources used?
> >
> > We have a similar outstanding question to ensure the LF's BBB instance
> stays funded for glibc
> > community patch review meetings, CTI TAC meetings, and possibly Office
> Hours for the projects.
>
> Carlos:
>
> I think there's a general disconnect on the topic of costs. As far as LF
> IT is
> concerned, your migration, hosting, and support is already covered via
> OpenSSF
> directed funds. I understand that it's important for you to properly
> understand the cost of running the project on the LF IT infrastructure, b=
ut
> it's not a trivial matter to come up with a precise number. A lot of it
> would
> be running on shared resources that serve several other projects or on
> infrastructure that is straight-out donated to LF (e.g. via CDN and Equin=
ix
> Metal frontends that serve most of our traffic). Some of the cloud
> environments we use have special agreements with LF, such as our Openstac=
k
> partner, Vexxhost, who excludes bandwidth from their bills because they
> know
> we try to serve any large requests from other resources.
>
> So, if we try to calculate an accurate "slice of IT" that glibc would be
> using, it would too difficult to come up with a meaningful number. If you
> like, we'll be happy to pass along any invoices that are exclusive to
> CTI infrastructure -- we do it for transparency reasons with many other
> projects.
>
> In general, LF IT is ready to start moving you over at any time -- in
> whole,
> piecemeal, or in any other form that makes it least disruptive to the
> members
> of your community. I suggest we focus on the technical aspects of this
> migration -- once we start receiving bills, I'll be happy to pass along a=
ny
> and all of them that are exclusive to CTI so you have a clear picture.
>

Hi, Konstantin

Thanks for your effort to analyze the services and the costs.

Yes, the CTI work is covered through an OpenSSF directed fund, but we, CTI,
are responsible for the directed funds.  OpenSSF has generously agreed to
bootstrap CTI, but we need to create a self-sustaining organization in the
long run.  Carlos, I, and the OpenSSF leadership need an estimate of the
cost to determine how much we need to fundraise.

We thought that LF IT could estimate the cost of the services for just
GLIBC and separately the total cost for the eventual inclusion of all of
the GNU Toolchain projects.  If that is impractical, then maybe we need to
calculate the cost based on a metric for the proportional use of LF IT
systems by CTI relative to the other tenants, such as the bandwidth,
transaction to gitolite, mail messages, size of repository, or the cpu
usage of the VMs providing the services.  I don't mean a variable amount
each month, but we base it on the proportion of usage of LF IT shared
services instead of based on independent services in isolation.

Thanks, David

--00000000000038b91e05fd922ae1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jun 7, 2023 at 3:37=E2=80=AFPM Ko=
nstantin Ryabitsev &lt;<a href=3D"mailto:konstantin@linuxfoundation.org">ko=
nstantin@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jun 01, 2023=
 at 08:18:20AM -0400, Carlos O&#39;Donell wrote:<br>
&gt; Konstantin,<br>
&gt; <br>
&gt; This issue came up in today&#39;s CTI TAC meeting and I took the AI to=
 email you here.<br>
&gt; <br>
&gt; Do we have an update on the status of the cost of CTI supporting glibc=
&#39;s service requirements?<br>
&gt; <br>
&gt; Is glibc too small to even count?<br>
&gt; <br>
&gt; Does it make it hard to estimate?<br>
&gt; <br>
&gt; Would you rather budget this or estimate a price based on load or reso=
urces used?<br>
&gt; <br>
&gt; We have a similar outstanding question to ensure the LF&#39;s BBB inst=
ance stays funded for glibc<br>
&gt; community patch review meetings, CTI TAC meetings, and possibly Office=
 Hours for the projects.<br>
<br>
Carlos:<br>
<br>
I think there&#39;s a general disconnect on the topic of costs. As far as L=
F IT is<br>
concerned, your migration, hosting, and support is already covered via Open=
SSF<br>
directed funds. I understand that it&#39;s important for you to properly<br=
>
understand the cost of running the project on the LF IT infrastructure, but=
<br>
it&#39;s not a trivial matter to come up with a precise number. A lot of it=
 would<br>
be running on shared resources that serve several other projects or on<br>
infrastructure that is straight-out donated to LF (e.g. via CDN and Equinix=
<br>
Metal frontends that serve most of our traffic). Some of the cloud<br>
environments we use have special agreements with LF, such as our Openstack<=
br>
partner, Vexxhost, who excludes bandwidth from their bills because they kno=
w<br>
we try to serve any large requests from other resources.<br>
<br>
So, if we try to calculate an accurate &quot;slice of IT&quot; that glibc w=
ould be<br>
using, it would too difficult to come up with a meaningful number. If you<b=
r>
like, we&#39;ll be happy to pass along any invoices that are exclusive to<b=
r>
CTI infrastructure -- we do it for transparency reasons with many other<br>
projects.<br>
<br>
In general, LF IT is ready to start moving you over at any time -- in whole=
,<br>
piecemeal, or in any other form that makes it least disruptive to the membe=
rs<br>
of your community. I suggest we focus on the technical aspects of this<br>
migration -- once we start receiving bills, I&#39;ll be happy to pass along=
 any<br>
and all of them that are exclusive to CTI so you have a clear picture.<br><=
/blockquote><div><br></div><div>Hi, Konstantin</div><div><br></div><div>Tha=
nks for your effort to analyze the services and the costs.</div><div><br></=
div><div>Yes, the CTI work is covered through an OpenSSF directed fund, but=
 we, CTI, are responsible for the directed funds.=C2=A0 OpenSSF has generou=
sly agreed to bootstrap CTI, but we need to create a self-sustaining organi=
zation in the long run.=C2=A0 Carlos, I, and the OpenSSF leadership need an=
 estimate of the cost to determine how much we need to fundraise.</div><div=
><br></div><div>We thought that LF IT could estimate the cost of the servic=
es for just GLIBC and separately the total cost for the eventual inclusion =
of all of the GNU Toolchain projects.=C2=A0 If that is impractical, then ma=
ybe we need to calculate the cost based on a metric for the proportional us=
e of LF IT systems by CTI relative to the other=C2=A0tenants, such as the b=
andwidth,=C2=A0 transaction to gitolite, mail messages, size of repository,=
 or the cpu usage of the VMs providing the services.=C2=A0 I don&#39;t mean=
 a variable amount each month, but we base it on the proportion of usage of=
 LF IT shared services instead of based on independent services in isolatio=
n.</div><div><br></div><div>Thanks, David</div><div><br></div><div><br></di=
v></div></div>

--00000000000038b91e05fd922ae1--
