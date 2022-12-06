Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3BC27713
	for <gti-tac@lists.linuxfoundation.org>; Tue,  6 Dec 2022 17:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A974408F6
	for <gti-tac@lists.linuxfoundation.org>; Tue,  6 Dec 2022 17:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A974408F6
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MDl9DiEM
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
	with ESMTP id ZEmJ2lQgQkK0 for <gti-tac@lists.linuxfoundation.org>;
	Tue,  6 Dec 2022 17:43:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43622408EB
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 43622408EB
	for <gti-tac@lists.linuxfoundation.org>; Tue,  6 Dec 2022 17:43:58 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id x22so7959694ejs.11
        for <gti-tac@lists.linuxfoundation.org>; Tue, 06 Dec 2022 09:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WJlS2t60QZci8MpFYrAa7+68wdvDBfqFDFvLwBEklY8=;
        b=MDl9DiEMjGM1nsPyBq9b+nd0g23l4hg0Q5qg44P1tv10MnMMiTlT02sJW40tZ5B9q6
         4H6Wwcp5E1fFv9q1fI9/HcxRYai4khLOlfuvtbrY9v5MEvuLBVIFYSYEeCZWBeTF9uKD
         Ieg/sTx+z+ntYiivbm1gnQ80O2/8Dhnsh1Qb0CUgE8h9fxBATKtULH5kpFFwDqYZplAk
         VO97UgKACqzJEqG/eQYgm0CYOvpVmDcW4/WqAMOJMWK2njzV+T0qAGGZ9baDrdoQm196
         QycxvQJQrUAoBKdxo483vZKuLXT6GOZLqQs5WamUvOITyonfVktUB9l8jGykcgPguJWl
         +9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJlS2t60QZci8MpFYrAa7+68wdvDBfqFDFvLwBEklY8=;
        b=mPKHTpMrYC4Lvsrod1GrmaBX7jjEuwEcfsL3BtQcWZHr2DE4J/yHjWvL9kDB2bqeWg
         qskI1WFR80Iui9LEVEJUCq9F1zpRTUVxCgneAyZFRj6g6N/lOvjHPym7lTm4L/lL5MLx
         1Wp8wsmDcIBKmtqlxcHMMQyZB36eCT/iLwjiNdOg/hWPRnIW71z1ShUDxLQ3sgwhOh7X
         uMzPni8z6W8CIsuxxuyVJBVXkzSNlUKhm7Uw01ArpJvwi9NnY8E4C5A9a9tD/njQa+l+
         zkWfDjHXRZ1az54M8eXpf7UYNhsj4oJe2HkcFfSjngJWfJ9LZK2j0incO4OpzKI/fG1S
         OHQg==
X-Gm-Message-State: ANoB5pkZjlzKcvIYqoaS64NTruVq/0mZIAkC30x9RVnrxjhqaoAEXEOL
	wgjPWU2FIbjP+L9qxutmoKBEbSIDHO8QTD3KvJQ=
X-Google-Smtp-Source: AA0mqf6epiVMKIYKz4QMjNuYoGWsB3Dvk4J9NfM4X+5jZL3f0WmQ41kg9D+wmiJVPNBybAqUA3syaqQGehREUEk89U0=
X-Received: by 2002:a17:906:950a:b0:7ab:2559:8bc4 with SMTP id
 u10-20020a170906950a00b007ab25598bc4mr56968079ejx.682.1670348636404; Tue, 06
 Dec 2022 09:43:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
References: <3a81d482-c952-d501-f495-485f00400e85@redhat.com>
 <Y3rxAYa/oc5s/R/7@adacore.com> <da126be7-475f-e2ed-fb4f-4493271db5f3@codesourcery.com>
 <62439dc1-1bb6-76b2-d1be-e7d3a2b64522@efficios.com> <b755774c-3912-2dac-957c-91f659c95119@efficios.com>
In-Reply-To: <b755774c-3912-2dac-957c-91f659c95119@efficios.com>
From: David Edelsohn <dje.gcc@gmail.com>
Date: Tue, 6 Dec 2022 12:43:09 -0500
Message-ID: <CAGWvnykD0a=0zTDLYnE+N8V=DGh=tGG7h1KxnzdpwLZVKS0fjw@mail.gmail.com>
Subject: Re: Action: Setup working group for the GNU Toolchain proposal to
 migrate to LF IT managed services
To: Simon Marchi <simon.marchi@efficios.com>
Cc: Joseph Myers <joseph@codesourcery.com>, Joel Brobecker <brobecker@adacore.com>, 
	"Carlos O'Donell" <carlos@redhat.com>, gti-tac@lists.linuxfoundation.org
Content-Type: multipart/alternative; boundary="0000000000001fc01305ef2c593f"

--0000000000001fc01305ef2c593f
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 6, 2022 at 12:42 PM Simon Marchi <simon.marchi@efficios.com>
wrote:

> Here's a revised list for GDB, I added some user-facing / functional
> requirements I would think of.  It's probably still lacking some of the
> implementation details that you are looking for, but I probably don't
> know them, and it's hard to know what you don't know.
>
> * Git Repository
>   * Need push access
>   * Ability for project maintainers to request push access for new
>     contributors (or to do it themselves)
>   * Ability for users to create user-branches (e.g. users/simark/foo),
>     which will be ignored by the notification-sending script.
>
> * git hooks
>   * Need to be able to manage git hooks (
> https://github.com/AdaCore/git-hooks) on
>     the server (right now, ssh to sourceware.org)
>   * binutils-gdb.git/hooks-bin/commit-extra-checker.py
>
>     Verifies that we do not have this issue:
>
>         # With commits created using "git am" of patches sent via the gdb@
> or
>         # gdb-patches@ mailing list, it's possible that the author
> information
>         # gets changed into "xxx via xxx@sourceware.org". Catch and
> reject those,
>         # so the person doing the push can fix this before the push is
> allowed.
>
>   * /sourceware/infra/bin/email-to-bugzilla
>
>         Sends a copy of commit messages to bugzilla if commit
>         has a PR number in it.
>
>   * binutils-gdb.git/hooks-bin/post-receive
>
>         Calls the irker (IRC notification of new commits)
>
>   * Something sends emails about commits to the gdb-cvs mailing list
>
> * Web-based navigation of the Git repository
>   * Need to be able to browse the git repository online
>   * https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git
>   * If it exists, a more featureful git web frontends would be nice, one
>     that allows searching files by name for instance.
>
> * email-to-bugzilla script
>   * The goal is that when a commit is pushed to the git repository, we
>     check for any mention of a Bugzilla bugs, and post a message to those
>     bugs
>   * It accesses the Bugzilla database directly to check if a given bug
>     number exists (could easily be changed to use some HTTP request)
>   * It posts to bugzilla by sending an email to a local email account
>
> * mailing lists
>   * Those I know for sure are used / useful:
>     * gdb@
>     * gdb-announce@
>     * gdb-cvs@ (now misnaed, but can be used to follow commits to the
> repo)
>     * gdb-patches@
>     * gdb-prs@
>     * gdb-testers@
>   * Not sure about these:
>     * gdbadmin@: seems useful for whoever is responsible for snapshot
>       generation or other GDB-related automated task.  It seems a bit
>       spammy to send an email every day when the task succeeds.
>
>       The daily commits in binutils-gdb that bump the date are made using
>       this email address as the From, not sure if it matters
>   * Pretty sure we can ignore these:
>     * gdb-testresults@
>     * gdb-patches-prs@:
>     * gdb-webpages-cvs@
>
>   * We also have a "global maintainers" list hosted at AdaCore.  It could
>     make sense to move it to the main infrastructure.  Maybe Joel knows if
>     there's a reason it's separate.
>
> * Mailing list web interface
>   * The original one, which I find not so useful now that we have
>     public-inbox: https://sourceware.org/pipermail/gdb-patches/
>   * However, old links need to keep working
>   * public-inbox or something equivalent is necessary:
>     * have a way to browse easily message threads that span multiple
>       months / years
>     * have a way to download raw messages, to apply patches locally
>
> * daily snapshot generation
>   * We have a script that generates daily tarballs (I don't know where
>     or how)
>
> * daily bump
>   * We have a script that does a daily commit in the binutils-gdb repo
>     to update a date (I don't know where or how)
>
> * Website
>   * Handwritten pages (in a CVS (!) repository)
>   * scripts generating website contents (doc, ARI, etc)
>   * SSH access to the machine hosting the website is used, as the scripts
>     above generating website contents are run by the release manager, after
>     having ssh'ed onto sourceware.org.
>
> * Wiki
>   * Currently, anyone with write access can give someone else write access.
>   * At the very least, we need a way for project maintainers to request
>     write access for a new member, or do it themselves
>
> * bug tracker (bugzilla)
>   * Sends notifications of new bugs and comments to gdb-prs
>   * Sends notifications of comments on a big to users who are watching
>     that bug
>   * Accepts replies by email, both from users and from the
>     email-to-bugzilla script.
>
> * Release hosting
>   * Releases, the release manager must be able to upload there
>     * ftp://sourceware.org/pub/gdb/releases/
>     * http://sourceware.org/pub/gdb/releases/
>   * Snapshots, the daily script needs to be able to upload there
>     * https://sourceware.org/pub/gdb/snapshots/
>
> * patchwork (https://patchwork.sourceware.org/project/gdb/list/)
>   * It receives emails from the gdb-patches mailing list
>   * This instance doesn't get much use at the moment, because it gets
>     filled so quickly and is impossible to keep up to date.
>

Thanks for the additional detail!

Thanks, David

--0000000000001fc01305ef2c593f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Dec 6, 2022 at 12:42 PM Simon Mar=
chi &lt;<a href=3D"mailto:simon.marchi@efficios.com">simon.marchi@efficios.=
com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Here&#39;s a revised list for GDB, I added so=
me user-facing / functional<br>
requirements I would think of.=C2=A0 It&#39;s probably still lacking some o=
f the<br>
implementation details that you are looking for, but I probably don&#39;t<b=
r>
know them, and it&#39;s hard to know what you don&#39;t know.<br>
<br>
* Git Repository<br>
=C2=A0 * Need push access<br>
=C2=A0 * Ability for project maintainers to request push access for new<br>
=C2=A0 =C2=A0 contributors (or to do it themselves)<br>
=C2=A0 * Ability for users to create user-branches (e.g. users/simark/foo),=
<br>
=C2=A0 =C2=A0 which will be ignored by the notification-sending script.<br>
<br>
* git hooks<br>
=C2=A0 * Need to be able to manage git hooks (<a href=3D"https://github.com=
/AdaCore/git-hooks" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/AdaCore/git-hooks</a>) on<br>
=C2=A0 =C2=A0 the server (right now, ssh to <a href=3D"http://sourceware.or=
g" rel=3D"noreferrer" target=3D"_blank">sourceware.org</a>)<br>
=C2=A0 * binutils-gdb.git/hooks-bin/commit-extra-checker.py<br>
<br>
=C2=A0 =C2=A0 Verifies that we do not have this issue:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # With commits created using &quot;git am&quot;=
 of patches sent via the gdb@ or<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # gdb-patches@ mailing list, it&#39;s possible =
that the author information<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # gets changed into &quot;xxx via <a href=3D"ma=
ilto:xxx@sourceware.org" target=3D"_blank">xxx@sourceware.org</a>&quot;. Ca=
tch and reject those,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # so the person doing the push can fix this bef=
ore the push is allowed.<br>
<br>
=C2=A0 * /sourceware/infra/bin/email-to-bugzilla<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sends a copy of commit messages to bugzilla if =
commit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 has a PR number in it.<br>
<br>
=C2=A0 * binutils-gdb.git/hooks-bin/post-receive<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Calls the irker (IRC notification of new commit=
s)<br>
<br>
=C2=A0 * Something sends emails about commits to the gdb-cvs mailing list<b=
r>
<br>
* Web-based navigation of the Git repository<br>
=C2=A0 * Need to be able to browse the git repository online<br>
=C2=A0 * <a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.=
git" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/git/gitweb=
.cgi?p=3Dbinutils-gdb.git</a><br>
=C2=A0 * If it exists, a more featureful git web frontends would be nice, o=
ne<br>
=C2=A0 =C2=A0 that allows searching files by name for instance.<br>
<br>
* email-to-bugzilla script<br>
=C2=A0 * The goal is that when a commit is pushed to the git repository, we=
<br>
=C2=A0 =C2=A0 check for any mention of a Bugzilla bugs, and post a message =
to those<br>
=C2=A0 =C2=A0 bugs<br>
=C2=A0 * It accesses the Bugzilla database directly to check if a given bug=
<br>
=C2=A0 =C2=A0 number exists (could easily be changed to use some HTTP reque=
st)<br>
=C2=A0 * It posts to bugzilla by sending an email to a local email account<=
br>
<br>
* mailing lists<br>
=C2=A0 * Those I know for sure are used / useful:<br>
=C2=A0 =C2=A0 * gdb@<br>
=C2=A0 =C2=A0 * gdb-announce@<br>
=C2=A0 =C2=A0 * gdb-cvs@ (now misnaed, but can be used to follow commits to=
 the repo)<br>
=C2=A0 =C2=A0 * gdb-patches@<br>
=C2=A0 =C2=A0 * gdb-prs@<br>
=C2=A0 =C2=A0 * gdb-testers@<br>
=C2=A0 * Not sure about these:<br>
=C2=A0 =C2=A0 * gdbadmin@: seems useful for whoever is responsible for snap=
shot<br>
=C2=A0 =C2=A0 =C2=A0 generation or other GDB-related automated task.=C2=A0 =
It seems a bit<br>
=C2=A0 =C2=A0 =C2=A0 spammy to send an email every day when the task succee=
ds.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 The daily commits in binutils-gdb that bump the date a=
re made using<br>
=C2=A0 =C2=A0 =C2=A0 this email address as the From, not sure if it matters=
<br>
=C2=A0 * Pretty sure we can ignore these:<br>
=C2=A0 =C2=A0 * gdb-testresults@<br>
=C2=A0 =C2=A0 * gdb-patches-prs@:<br>
=C2=A0 =C2=A0 * gdb-webpages-cvs@<br>
<br>
=C2=A0 * We also have a &quot;global maintainers&quot; list hosted at AdaCo=
re.=C2=A0 It could<br>
=C2=A0 =C2=A0 make sense to move it to the main infrastructure.=C2=A0 Maybe=
 Joel knows if<br>
=C2=A0 =C2=A0 there&#39;s a reason it&#39;s separate.<br>
<br>
* Mailing list web interface<br>
=C2=A0 * The original one, which I find not so useful now that we have<br>
=C2=A0 =C2=A0 public-inbox: <a href=3D"https://sourceware.org/pipermail/gdb=
-patches/" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/pipe=
rmail/gdb-patches/</a><br>
=C2=A0 * However, old links need to keep working<br>
=C2=A0 * public-inbox or something equivalent is necessary:<br>
=C2=A0 =C2=A0 * have a way to browse easily message threads that span multi=
ple<br>
=C2=A0 =C2=A0 =C2=A0 months / years<br>
=C2=A0 =C2=A0 * have a way to download raw messages, to apply patches local=
ly<br>
<br>
* daily snapshot generation<br>
=C2=A0 * We have a script that generates daily tarballs (I don&#39;t know w=
here<br>
=C2=A0 =C2=A0 or how)<br>
<br>
* daily bump<br>
=C2=A0 * We have a script that does a daily commit in the binutils-gdb repo=
<br>
=C2=A0 =C2=A0 to update a date (I don&#39;t know where or how)<br>
<br>
* Website<br>
=C2=A0 * Handwritten pages (in a CVS (!) repository)<br>
=C2=A0 * scripts generating website contents (doc, ARI, etc)<br>
=C2=A0 * SSH access to the machine hosting the website is used, as the scri=
pts<br>
=C2=A0 =C2=A0 above generating website contents are run by the release mana=
ger, after<br>
=C2=A0 =C2=A0 having ssh&#39;ed onto <a href=3D"http://sourceware.org" rel=
=3D"noreferrer" target=3D"_blank">sourceware.org</a>.<br>
<br>
* Wiki<br>
=C2=A0 * Currently, anyone with write access can give someone else write ac=
cess.<br>
=C2=A0 * At the very least, we need a way for project maintainers to reques=
t<br>
=C2=A0 =C2=A0 write access for a new member, or do it themselves<br>
<br>
* bug tracker (bugzilla)<br>
=C2=A0 * Sends notifications of new bugs and comments to gdb-prs<br>
=C2=A0 * Sends notifications of comments on a big to users who are watching=
<br>
=C2=A0 =C2=A0 that bug<br>
=C2=A0 * Accepts replies by email, both from users and from the<br>
=C2=A0 =C2=A0 email-to-bugzilla script.<br>
<br>
* Release hosting<br>
=C2=A0 * Releases, the release manager must be able to upload there<br>
=C2=A0 =C2=A0 * <a href=3D"ftp://sourceware.org/pub/gdb/releases/" rel=3D"n=
oreferrer" target=3D"_blank">ftp://sourceware.org/pub/gdb/releases/</a><br>
=C2=A0 =C2=A0 * <a href=3D"http://sourceware.org/pub/gdb/releases/" rel=3D"=
noreferrer" target=3D"_blank">http://sourceware.org/pub/gdb/releases/</a><b=
r>
=C2=A0 * Snapshots, the daily script needs to be able to upload there<br>
=C2=A0 =C2=A0 * <a href=3D"https://sourceware.org/pub/gdb/snapshots/" rel=
=3D"noreferrer" target=3D"_blank">https://sourceware.org/pub/gdb/snapshots/=
</a><br>
<br>
* patchwork (<a href=3D"https://patchwork.sourceware.org/project/gdb/list/"=
 rel=3D"noreferrer" target=3D"_blank">https://patchwork.sourceware.org/proj=
ect/gdb/list/</a>)<br>
=C2=A0 * It receives emails from the gdb-patches mailing list<br>
=C2=A0 * This instance doesn&#39;t get much use at the moment, because it g=
ets<br>
=C2=A0 =C2=A0 filled so quickly and is impossible to keep up to date.<br></=
blockquote><div><br></div><div>Thanks for the additional detail!</div><div>=
<br></div><div>Thanks, David</div><div>=C2=A0</div></div></div>

--0000000000001fc01305ef2c593f--
