Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BC21CD5D3
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719599766; cv=pass; b=daUzpAfwb1FesZNQRSRHWRu7N4F3N65ZBnvhr8Z/Bz592Vp1Dht7O1Yn8m6i8Pz0w2fQMeJHpGqurpfGg1U8LA2v5miLbaGlXitCmyn2SLexC0Scv84zj9zCs/dEqxBEfiKdACwbaK7Rp+K+mkeTtHc9/m3SBTPl7izd5NVS61I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719599766; c=relaxed/simple;
	bh=upfv4LQprAOeqs43DCoU3zRyMJ6bz10pjLQtEl7BuPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VSwMy3HutlmRyBwZJ1MQDfYf2Sy5cWt9aKT4re6nHsftoDtPHvkXs8dNDsPragDJxvyb/naYIFSeX3yIYG3X/X3w0N/mjIDhrKI3mOVPcs96xEWsdq7DNWpYoO6XQ4Bm8pCSrjr5Q5TM540XSA5Gx1DHziGzDm+CO6lBONxCSVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=OxNQH51E; arc=pass smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="OxNQH51E"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86131402BD
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 18:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvzZhRNOZpFT for <cti-tac@lists.linuxfoundation.org>;
 Fri, 28 Jun 2024 18:36:02 +0000 (UTC)
X-Greylist: delayed 1130 seconds by postgrey-1.37 at util1.osuosl.org; Fri, 28 Jun 2024 18:36:01 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0D7C402BE
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=gotplt.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0D7C402BE
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gotplt.org header.i=@gotplt.org header.a=rsa-sha256 header.s=dreamhost header.b=OxNQH51E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.222.40; helo=cornsilk.ash.relay.mailchannels.net; envelope-from=siddhesh@gotplt.org; receiver=<UNKNOWN> 
Received: from cornsilk.ash.relay.mailchannels.net (cornsilk.ash.relay.mailchannels.net [23.83.222.40])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B0D7C402BE
	for <cti-tac@lists.linuxfoundation.org>; Fri, 28 Jun 2024 18:36:01 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 95D264C36AF;
	Fri, 28 Jun 2024 18:17:10 +0000 (UTC)
Received: from pdx1-sub0-mail-a312.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3A1A74C2AB7;
	Fri, 28 Jun 2024 18:17:10 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1719598630; a=rsa-sha256;
	cv=none;
	b=Aa4O0DZvIeQ3uxibZc0SfC2ozVXXXZBqi5Xw63Ca5B7oSNPgdNW+/IS+njZ72j6z+GvPMT
	+BMty18bVoMQ7TP0zmLYhJACRzDOUJMgZctCxMnVgS6t1bfDRCzrGiTKRlsy9P3tyOTL+q
	QNZ/O8Q5rwtREEyUltzfdw5BnlKrY3TeAkYj7kb3o9Uw6iRNdLKrLAHZsSyIGLRQKFjQj+
	zhkNHpc/Kmu/wTRCvLYAnUzrj2uijiG3MOo2tTwjh7S8FG3mlD9vW3wvuz31VHrz3QGVP5
	plwMI7SwmECavrWfmAM0PoP8dsfSuGkaxMFBG9G/G5gBVar3v0VTG2tdIGyEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1719598630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=4NnX3Jjkh+iRL0DiA2qHm5KfSJVJ4FiX8wZY1Swof60=;
	b=kErX6GhyuFHqL3WRt1Ur1z/Bd9lzn00SiH3Dtg7QHDvRCvkp8WeZDUnAARvfdoZjM18GjI
	/Cu5cNfWwGLchZYa7z/GxurZ7zBr7CZkaVaQajvNbuYY4NNJxT4pfoMz+I9KB1RaeiMrul
	AHao4k+6tnpGivXyXIoF7kHkQ6GSZdih2cCxtAg25dVMXf9g+8alJ4oKYj2VTDJ1PRKNjl
	QSxNpgxR55MQ/rjjRpeRb3/JoNdgr8ubDGKlQ6SyQyTb7RpzLxHWAHTzkTqRo30cbgaz7z
	CVFeMmajPgEN9yT/mZ4RlNKBh8MDWMKOOZxu10wtRXG/RDmjKZdPpIuW7+E00A==
ARC-Authentication-Results: i=1;
	rspamd-7f76976655-cr7jf;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Whistle-Wiry: 6449243428c6a735_1719598630488_1872241599
X-MC-Loop-Signature: 1719598630488:345252433
X-MC-Ingress-Time: 1719598630488
Received: from pdx1-sub0-mail-a312.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.117.51.8 (trex/6.9.2);
	Fri, 28 Jun 2024 18:17:10 +0000
Received: from [192.168.0.182] (bras-base-toroon4859w-grc-81-74-12-54-126.dsl.bell.ca [74.12.54.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a312.dreamhost.com (Postfix) with ESMTPSA id 4W9kDP5HsPz5y;
	Fri, 28 Jun 2024 11:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1719598630;
	bh=4NnX3Jjkh+iRL0DiA2qHm5KfSJVJ4FiX8wZY1Swof60=;
	h=Date:Subject:To:From:Content-Type:Content-Transfer-Encoding;
	b=OxNQH51ERrqyBcbx4bBk7F7EwVthWICxo1/3GUkwCH1FIS/gR6QaPwjN7akx/cOls
	 /tJLoob+Zg6eJ/awC+IPPRT1+zRjt1IWamb64qq2iF0slXkehnhsnrR70bpPy0ihv8
	 RbiQcEXU+lmv+crOFbaAcu4+qxYvRsPNyNsDpbBo2sU9QrPwmIl7yXxflnljBKD4Nq
	 8OKGSJZI4CSEZzF24qLpV2JwTkfpoyORkCUM9S2FcgrYIxnMeSlbBEMovSdMc9DWyF
	 bY4t88zAyHOEaiH+laMGsDfjAeIzaOV1hRV+7SVSx4yVVV7vvlLkXEH2b4NLFSCK28
	 XR3z05eFBmY/Q==
Message-ID: <87e77aba-4ae6-433d-9aea-542fabb6dec6@gotplt.org>
Date: Fri, 28 Jun 2024 14:17:07 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] projects/glibc: Update status.
To: Carlos O'Donell <carlos@redhat.com>, cti-tac@lists.linuxfoundation.org
References: <20240628180618.427113-1-carlos@redhat.com>
Content-Language: en-US
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
In-Reply-To: <20240628180618.427113-1-carlos@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024-06-28 14:05, Carlos O'Donell wrote:
> Update the status of the glibc project to use CTI resources.
> 
> As part of that update also update the following documents:
> 
> tac/minutes: Add the additional minutes from recent TAC meetings.
> tac/audit: Include a link to the CY24 technical audit.
> tac/cy24audit: Include Ian Kelling's comments on the BBB service.
> tac/index: Include a link the CY24 technical audit.
> 
> Signed-off-by: Carlos O'Donell <carlos@redhat.com>
> ---
>   source/projects/glibc.rst | 53 ++++++++++++++++++++++-----------------
>   source/tac/audit.rst      |  2 +-
>   source/tac/cy24audit.rst  | 43 +++++++++++++++++++++++++++++++
>   source/tac/index.rst      |  3 ++-
>   source/tac/minutes.rst    |  4 +++
>   5 files changed, 80 insertions(+), 25 deletions(-)
>   create mode 100644 source/tac/cy24audit.rst
> 
> diff --git a/source/projects/glibc.rst b/source/projects/glibc.rst
> index 27e6b09..9d1bf32 100644
> --- a/source/projects/glibc.rst
> +++ b/source/projects/glibc.rst
> @@ -3,37 +3,44 @@ CY24: Migrate glibc to CTI services
>   
>   In 2024 the goal is to migrate the glibc project to use CTI services.
>   
> -The community feedback was collected from July to August 2023.
> -
>   Current Status
>   --------------
>   
> -The `GNU Maintainers for the glibc project
> -<https://sourceware.org/glibc/wiki/MAINTAINERS#Project_stewards_.28GNU_package_maintainers.29>`_
> -were asked to make a decision on switching to the services provided by
> -CTI and currently the following support has been tallied:
> -
> - * Ryan Arnold - Yay
> - * Paul Eggert - Nay
> - * Jakub Jelinek - Abstain
> - * Maxim Kuvyrkov - Yay
> - * Joseph Myers - Yay
> - * Carlos O'Donell - Yay
> - * Alexandre Oliva - Nay
> - * Andreas Schwab - No statement
> -
> -As of 2024-02-28 feedback from the stewards was being incorporated into
> -this document to provide assurances that FOSS would be used to provide
> -services and that there was a checking mechanism in place for services
> -to remain FOSS.
> +As of 2024-06-28 we have finalized a statement of work with the service
> +provider, Linux Foundation IT, and `recorded it here on the CTI TAC
> +mailing list <https://lore.kernel.org/cti-tac/2186f48a-12cd-4630-8944-26b9042e924a@redhat.com/T/#u>`_.
>   
>   Next steps
>   ----------
>   
> - * Revisit discussion with Paul Eggert and attain resolution in March 2024
> -   to move forward.
> +* Plan for CTI Board meeting to approve budget spend for SOW.
> +
> +* Start transition planning with Linux Foundation IT team.
> +
> +Notes
> +-----
> +
> +* Revisitied discussion with Paul Eggert and attain resolution in March 2024 to move forward. Posted originally `here <https://inbox.sourceware.org/libc-alpha/45e98807-908f-0968-b6fe-5dbb0af265b1@redhat.com/>`_

Revisited.  Looks good to me otherwise.

Reviewed-by: Siddhesh Poyarekar <siddhesh@gotplt.org>

> +
> + * 2024-03-08: CTI website launched on March 8th 2024 to attempt to resolve requests for documenation from Paul Eggert.
> +
> +* The `GNU Maintainers for the glibc project <https://sourceware.org/glibc/wiki/MAINTAINERS#Project_stewards_.28GNU_package_maintainers.29>`_ were asked to make a decision on switching to the services provided by CTI and currently the following support has been tallied:
> +
> +  * Ryan Arnold - Yay
> +  * Paul Eggert - Nay
> +  * Jakub Jelinek - Abstain
> +  * Maxim Kuvyrkov - Yay
> +  * Joseph Myers - Yay
> +  * Carlos O'Donell - Yay
> +  * Alexandre Oliva - Nay
> +  * Andreas Schwab - No statement
> +
> +* As of 2024-02-28 feedback from the stewards was being incorporated into
> +  this document to provide assurances that FOSS would be used to provide
> +  services and that there was a checking mechanism in place for services
> +  to remain FOSS.
>   
> -Posted originally here: https://inbox.sourceware.org/libc-alpha/45e98807-908f-0968-b6fe-5dbb0af265b1@redhat.com/
> +* Community feedback was collected from July to August 2023.
>   
>   Service migration
>   -----------------
> diff --git a/source/tac/audit.rst b/source/tac/audit.rst
> index 6398ef0..163eedb 100644
> --- a/source/tac/audit.rst
> +++ b/source/tac/audit.rst
> @@ -18,7 +18,7 @@ that will be noted in the public report and actions will be taken
>   by the TAC to discuss these with the community and current service
>   provider.
>   
> -The CY24 audit has not yet been conducted, but the audit will review
> +The :doc:`CY24 audit<cy24audit>`: has not yet been completed, but the audit will review
>   the current :doc:`services being used <../services/index>`:.
>   
>   -----------------
> diff --git a/source/tac/cy24audit.rst b/source/tac/cy24audit.rst
> new file mode 100644
> index 0000000..d8f556e
> --- /dev/null
> +++ b/source/tac/cy24audit.rst
> @@ -0,0 +1,43 @@
> +CY24 Technical Audit
> +======================
> +
> +The CTI TAC will conduct an annual technical audit of the services
> +provided to ensure that the services in use continue to meet the
> +technical requirements of the community.
> +
> +The audit will cover:
> +
> +  * Reviewing that services cover the current requirements, including any security requirements.
> +
> +  * Reviewing that the services are being provided using FOSS.
> +
> +  * Reviewing the cost of all services currently being provided.
> +
> +If prices have increased or services are not being provided by FOSS
> +that will be noted in the public report and actions will be taken
> +by the TAC to discuss these with the community and current service
> +provider.
> +
> +Service Audit
> +=============
> +
> +* Video conferencing services
> +
> +    * Service uses `BBB <https://github.com/bigbluebutton/bigbluebutton>`_
> +      which is FOSS and LGPL-3.0 licensed.
> +
> +It was raised by Ian Kelling that the current BigBlueButton conference service
> +currently has a `dependency on the non-free MongoDB <https://lore.kernel.org/cti-tac/87v846a1zi.fsf@fsf.org/>`_.
> +The upstream BigBlueButton developers intend to remove the dependency on this
> +non-free component, but that work has not yet completed. As part of the CY24
> +audit we should discuss what actions CTI will take regarding this issue since
> +we require that all services should be implemented with free software. The
> +best outcome would be to remove the dependency on MongoDB, but that needs to
> +be discussed with the broader FOSS community to see if we can help prioritize
> +or support that work.
> +
> +-----------------
> +
> +* :ref:`genindex`
> +
> +* :ref:`search`
> diff --git a/source/tac/index.rst b/source/tac/index.rst
> index 876b8c3..d19ac58 100644
> --- a/source/tac/index.rst
> +++ b/source/tac/index.rst
> @@ -6,8 +6,9 @@ Core Toolchain Infrastructure - Technical Advisory Council
>   
>   .. toctree::
>   
> -   Meetings Minutes <minutes>
> +   Meetings minutes <minutes>
>      Annual technical audit <audit>
> +   CY24 technical audit <cy24audit>
>   
>   The Core Toolchain Infrastructure Technical Advisory Council is
>   currently made up of the following community member (alphabetical):
> diff --git a/source/tac/minutes.rst b/source/tac/minutes.rst
> index b279cfb..2606abb 100644
> --- a/source/tac/minutes.rst
> +++ b/source/tac/minutes.rst
> @@ -7,6 +7,10 @@ The CTI TAC meetings minutes are sent to mailing list for archival: https://lore
>   
>   Recent meeting minutes are linked to here:
>   
> +  * `CTI TAC Meeting Notes 2024-06-27 <https://lore.kernel.org/cti-tac/a1e31779-b3c3-4016-ae69-27aced5971e9@redhat.com/T/#u>`_
> +  * `CTI TAC Meeting Notes 2024-05-29 <https://lore.kernel.org/cti-tac/69862ea2-d7e2-4fdc-91a6-a80525ecf423@redhat.com/T/#u>`_
> +  * `CTI TAC Meeting Notes 2024-04-24 <https://lore.kernel.org/cti-tac/4dc7d706-f6fc-4494-b24c-b1a38fc98810@redhat.com/T/#u>`_
> +  * `CTI TAC Meeting Notes 2024-03-27 <https://lore.kernel.org/cti-tac/d8b26d0d-7a68-4dcb-a7c7-1776c5cbbde2@redhat.com/T/#u>`_
>     * `CTI TAC Meeting Notes 2024-02-28 <https://lore.kernel.org/cti-tac/ea82c272-9bdf-4685-bc72-9fa6da83e6be@redhat.com/T/#u>`_
>     * `CTI TAC Meeting Notes 2024-01-31 <https://lore.kernel.org/cti-tac/6b433955-2865-232a-44c0-59682cbac446@redhat.com/T/#u>`_
>   
