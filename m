Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F8E19D891
	for <cti-tac@lists.linuxfoundation.org>; Wed,  5 Jun 2024 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717602083; cv=none; b=WCBPQI+X1kx2GrN7bh7Te1PkvYk2LReIhL4ceZ4ItUZDxbStBn33r9yp5SMydnp2YQqGcciHxDc7g80+Y9VbDHHyGr44ZuTGM0XhQTMDXpvTTOuXC2YFGUavStvNLBrVB5LpidDlhYWx3Qv6On3j7DXtNL8HkQYbiE8X+zVwzXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717602083; c=relaxed/simple;
	bh=MJcnsrhH9LkCUJ4Ipx3g9ujcpDWi1eoed2AwoIiVWSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nr4lTS2cJHkyj+TdU/1Ou7XF8cX1jVXLYpqWuCxeblKNYX9McJ0DcCm4dQsrCt3bJrwrztRnQh5w0ZlZgo7j+0wNYaMrlmnAHdra8C9Btf3CsVd+mxS4apAgEdL5pPqH6SxFeQU8ovqo832jDSUHrRXEj7MRhVwzddLxOFnQ3TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CQCjSHjw; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CQCjSHjw"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66CC04035C
	for <cti-tac@lists.linuxfoundation.org>; Wed,  5 Jun 2024 15:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlMUoxUer5af for <cti-tac@lists.linuxfoundation.org>;
 Wed,  5 Jun 2024 15:41:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A79D0406E0
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A79D0406E0
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CQCjSHjw
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A79D0406E0
	for <cti-tac@lists.linuxfoundation.org>; Wed,  5 Jun 2024 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717602077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2JAPA6NqenFkfVUz4Rm3awXV9Fs5ghPY/iQo88z5A3E=;
	b=CQCjSHjw//r36rkYo1LZ6nV3KwdRYAabImbmxO1QBKr3AeKvrJBwiHY4Lvt1hbT+JioV9h
	y2DLeLImPrcnxXBGzSDXSHFX0R0WAVlVhamjPBQTqu7V89DOY/5wKIQYuAtzV/rDmeAsFW
	NOk/iki13NQ5sqRbIOJJllwDs19ILcY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-kYW5kigsPEizIifq88vOJg-1; Wed, 05 Jun 2024 11:41:16 -0400
X-MC-Unique: kYW5kigsPEizIifq88vOJg-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4402cdba9dfso13439661cf.1
        for <cti-tac@lists.linuxfoundation.org>; Wed, 05 Jun 2024 08:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717602075; x=1718206875;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2JAPA6NqenFkfVUz4Rm3awXV9Fs5ghPY/iQo88z5A3E=;
        b=GvovSnCsPjJeCSvORH9odKPPF2m53Gc8tiJx7+EyWzA+LsUVUY69r6lZwWMxSCpM2K
         ROv0KWNBLkJoJmj7ZcKDtteHtwtJ1fnaLnlNUPLsbPFcxeq2/QQSUjuZ+P4lueTYS+R1
         mv2iJ6RJISZkRjqH+kM67rNQzm8k0pzzSXbfsyztjth6YOHWGbz00pbF64oD5+oPsoG7
         hvG9cnv5vqZeO/v8NkI0cm8QvtQesjcxV9PDl5QKnCZ9l3dcrunyHmLhPq5JvEUmQlke
         0nP+ysSCqzeqALBM4Wewi1Pm6QmX4u1crZ9XwDRRawR595DMlZFar6fiaIPzk4nARIWk
         CiGw==
X-Gm-Message-State: AOJu0YxEN7ytp16hjF3u0tQ3wm0jcKdYiv0HbSTtj8lFzuCGBhLRc07v
	p50drkYP4lyvnyLHQqAV7BpUSMqImac3qMe9BD3ts/RYBG8hwA4TLXx2LCF1/BdkqxhhDhpn+ay
	Monk6QoDYnwBhMgQL6dgO/tvU8g2764aE+Cd5pIwa7BT7MUiO38bIf/OTnDy0L8IcLSaYi0KrL8
	qFraELFdQvHHx9C6x0SfjHsOJLCSPsvwNcbAO0PpdftnXOgUfpGA==
X-Received: by 2002:a05:6214:2f06:b0:6af:bd70:3655 with SMTP id 6a1803df08f44-6b02bf224e2mr37507486d6.19.1717602075608;
        Wed, 05 Jun 2024 08:41:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH8dxrtTSKzvJI+5N1RftZcgQ+SsJbE2Zk15tyTExqlNH7l53Fk6WUE3BCChmd06fHv2qwIQ==
X-Received: by 2002:a05:6214:2f06:b0:6af:bd70:3655 with SMTP id 6a1803df08f44-6b02bf224e2mr37507016d6.19.1717602075001;
        Wed, 05 Jun 2024 08:41:15 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6afb8b33504sm31196126d6.74.2024.06.05.08.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 08:41:14 -0700 (PDT)
Message-ID: <c8da333c-1734-423a-976f-d2114ce597c0@redhat.com>
Date: Wed, 5 Jun 2024 11:41:13 -0400
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] source/faq/index: Update FAQ.
To: cti-tac@lists.linuxfoundation.org,
 Siddhesh Poyarekar <siddhesh@redhat.com>
References: <20240529135110.3917584-1-carlos@redhat.com>
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 vjq6hMJAjA==
Organization: Red Hat
In-Reply-To: <20240529135110.3917584-1-carlos@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/29/24 9:48 AM, Carlos O'Donell wrote:
> Update the FAQ with additional entries as requested by CTI TAC
> review.
> 
> Add information about relevant national standards and why we want
> to advance the state of our current infrastructure.
> 
> Add information about service bringup and how to achieve that.

Any input from the TAC?

I plan to push this next week as the FAQ items noted here expand on the
existing answer we had, and other answers are following what we're doing
today.

> Signed-off-by: Carlos O'Donell <carlos@redhat.com>
> ---
>  source/faq/index.rst | 60 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 59 insertions(+), 1 deletion(-)
> 
> diff --git a/source/faq/index.rst b/source/faq/index.rst
> index 66458c1..81bdc3c 100644
> --- a/source/faq/index.rst
> +++ b/source/faq/index.rst
> @@ -8,7 +8,7 @@ You have questions we have answers!
>  
>  Can we keep deploying services as we have?
>  """"""""""""""""""""""""""""""""""""""""""
> -No. The GNU Toolchain is a critical foundation of trust for the
> +The GNU Toolchain is a critical foundation of trust for the
>  GNU/Linux ecosystem and the demands on its infrastructure, services, and
>  security requirements have grown over time. The trend of increasing complexity
>  to support its development and associated financial demands will not abate.
> @@ -16,6 +16,38 @@ Different projects have different risk tolerances and the GNU Toolchain must
>  meet more stringent expectations to maintain the trust of the ecosystem. It is
>  with this context in mind that CTI has been formed.
>  
> +The global focus on security is clear and present and in direct relation to
> +the effective functioning of economies and societies. The GNU Toolchain plays
> +a hugely important role in companies and communities of all sizes, providing
> +tooling for compilation, assembly, linkage, running and debugging of
> +critical software.
> +
> +In order to continue to support these communities we must start to adhere to
> +the modern cybersecurity principles including moving towards zero-trust
> +architectures with strong application sandboxing for all provided services
> +e.g. NIST SP.800-207, separate and protect each environment involved
> +in software development e.g. NIST SP.800-218A PO.5.1, and use multi-factor,
> +risk-based authentication and conditional access for each environment.
> +
> +Governments around the world have increased their focus on Cybersecurity and
> +resilience in the face of cybersecurity attacks. In the European Union with
> +the creation of the Network and Information Security Directive (NIS 2016/1148,
> +NIS2 2022/2555), the Cybersecurity Act (2019/881), and now the Cyber Resilience
> +Act (2022/0272). In the United States with the publishing of the Executive
> +Order 14028 "Improving the Nation's Cybersecurity", with NIST's
> +Secure Software Development Framework (SSDF SP 800-218A), Cybersecurity
> +Framework 2.0 (CSF 2.0), and Software Supply Chain Security Guidance.
> +
> +Several of the components of the GNU Toolchain meet the definition of NIST's
> +"critical software" since they underpin ICAM (Identity, Credentials and
> +access management), network control (DNS stub resolver), and key operating
> +system components. We want to expand and continue to support FOSS in all
> +of these use cases we should strive to meet the increasing cybersecurity
> +best practices.
> +
> +The purpose of CTI is to help meet these requirements now and into the future
> +to ensure FOSS and the GNU Toolchain can be used by these users and communities.
> +
>  What concrete steps will CTI help with?
>  """""""""""""""""""""""""""""""""""""""
>  Some of the major goals include:
> @@ -109,6 +141,32 @@ That depends on the requirements given by the GNU Toolchain community.
>  The requirements from the community are input to the steering committee, and so
>  the answer depends largely on exactly what was the intended purpose.
>  
> +How are services validated prior to migration?
> +""""""""""""""""""""""""""""""""""""""""""""""
> +Services are validated on a per-service basis, with per-service functionality
> +being tested. Given the focus on strong service isolation and resilience the
> +inter-service integration pieces can and should be added in stages e.g.
> +email to bugzilla, git send-email to mailing lists, as services that can
> +communicate are brought online.
> +
> +The intent is not to stand up a monolithic integrated set of services, but to
> +start small and create well-isolated services that can operate independently
> +with loose coupling.
> +
> +Are all services migrated at the same time?
> +"""""""""""""""""""""""""""""""""""""""""""
> +There are no plans to construct a prototype of the entire constellation of
> +enumerated services for a project that is to be migrated to CTI services.
> +
> +Instead the approach taken is to stand up well-isolated services that can
> +operate independently of each other and with high resilience, and then add
> +the inter-service integration functionality.
> +
> +Since many of the services being provided are known to already be deployed
> +in production for other projects there is a lot of existing experience
> +to support deployment. What needs to be done is to ensure stronger isolation
> +between services as part of improving the project's cybersecurity position.
> +
>  Are there any presentations covering CTI?
>  """""""""""""""""""""""""""""""""""""""""
>  Yes, in October 2022 the CTI TAC gave an `FSF hosted community Q&A <https://media.libreplanet.org/u/libreplanet/m/the-gti-project-a-conversation-and-community-q-a/>`_.

-- 
Cheers,
Carlos.

