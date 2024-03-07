Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9E7137C5A
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709843257; cv=none; b=RhfYfoYv9OQbgYS8oLZc0lCJEN40xbL7SJSLQe7oiSOwlIaDwtQnroSZfnjHEdT3/CI2W9SAvOh7A+6s2hXiAdnLUIOftaINQo3V/VHnq+hwZcuA56dawhQB4u4YTAzwkMNsdVX+0oqvOh5rf91M56UTZSPOVnzjxeSGpE2gQbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709843257; c=relaxed/simple;
	bh=aul2fPB6IDzlrdfIJ59aedJOar/bn2Db1NGxwlvNH5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=e2Xd17KrAwErdizTXo/A4PQkSf7rIv3iIOdlwo5ae4RpkGFykMlIUVKNAw5WR++5akE/W6WpHZZ+mvMgrHqLWp10orZRS/ksoG5KaHwoxEkPqGy0y76+g2WA80D2AMv/9FB7GFD4Y8Tuojvt9jISbsdpLVyYCSYVide6odbZBQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J7Nq1Imu; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J7Nq1Imu"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 905F040462
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMKXvfhF63-6 for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 20:27:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D240B4029F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D240B4029F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J7Nq1Imu
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D240B4029F
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709843252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qoLLPZkxCBbLtUXH1Imkms8pKHwTcvmPr8fLi6aHhzs=;
	b=J7Nq1ImuBPXrnjnDnwjfIBPorFiFHn/fIFvYSZdQ/cEIawV/8NFSjQvCvSmqTam/r8unrt
	vKicyrYok6aW5z2470q9o2sQ6UyrcJAxSGCfejV9n8kP6LF8K6jr5EDdrpVGsdFArqyRob
	yq9e24rI8Cl6NDf5xQYp2wslLrUdHq8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-j_1lo3CxPrGLpaXnprEwdw-1; Thu, 07 Mar 2024 15:27:31 -0500
X-MC-Unique: j_1lo3CxPrGLpaXnprEwdw-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-788228e459dso19557285a.0
        for <cti-tac@lists.linuxfoundation.org>; Thu, 07 Mar 2024 12:27:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709843250; x=1710448050;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qoLLPZkxCBbLtUXH1Imkms8pKHwTcvmPr8fLi6aHhzs=;
        b=XL1sFsEyG3keRzfGafhmCBPqS5PUx3DwK8g6RxPUdtHMn8gurYaCSV5ARRULoehy1U
         OXfV8rKCDKsChrwkrTVIiONXCiL40kwlWbRzaiEAfJvQvTcA7NUdyoaJh2ojWmv6Yvs1
         f76I1SbMT6MyVRUREFrmCpPrKwH/n1FHd5kvZ9nYYmg/2hIIpSO5MMlmDs33Fu51FQ0v
         dxF5pbT2M0DimiFoauk/7hdoAQwxuQEcwFoYUC3Frsxuqf74kaKDqNG4j9fPM9XNpll2
         XM7efR/DiVpbuzfM1+eNb++Y7xv5m75KHfWWK2amsCN+KFbhSOpYPlrg5UmgPHzBsoBL
         VPIg==
X-Forwarded-Encrypted: i=1; AJvYcCUk078h82PrHLwx7hkIJbVxsRjBEKOurgvDc9WfEMi9cZKDlztHSPvOejrdiYp+bMOl+FiR502ymbSWNOs7PY+/6YRSkWJqgRUsS+e2xgoc8Dw=
X-Gm-Message-State: AOJu0YzvI11lHdExrG1p0iBfi/8qbB+gRp0jl729ScLaIO3tvfUzx/UX
	Z4x6EnUUoTkYl3qotl6v8ULCIEBud79DXquzIM71fGQEtYy7vsmAOJaCx5ejdSEED2ls302f1iu
	Ve/aG2sl8Cd0eeGsE7jSxVxXqztgUD7f0TufAwNOVhOCBm2bNenRpIF5nE9WOOEDAU5Av
X-Received: by 2002:a05:6214:1847:b0:690:6c95:c861 with SMTP id d7-20020a056214184700b006906c95c861mr9381691qvy.48.1709843250189;
        Thu, 07 Mar 2024 12:27:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlY8Dse34Jp17VUVVylqQZNyS6p3FttxYJiulExvOUl377pCj8q1W5igAli+4uDdfrWu4Tnw==
X-Received: by 2002:a05:6214:1847:b0:690:6c95:c861 with SMTP id d7-20020a056214184700b006906c95c861mr9381675qvy.48.1709843249794;
        Thu, 07 Mar 2024 12:27:29 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id ng10-20020a0562143bca00b0068fbe6d38f6sm9053251qvb.54.2024.03.07.12.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 12:27:29 -0800 (PST)
Message-ID: <8552a80d-5637-4d9a-a402-b1f45c3337bb@redhat.com>
Date: Thu, 7 Mar 2024 15:27:28 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] faq: Reformat so that it's not a list
To: Siddhesh Poyarekar <siddhesh@gotplt.org>,
 cti-tac@lists.linuxfoundation.org
References: <20240307193019.4028812-1-siddhesh@gotplt.org>
 <20240307193019.4028812-6-siddhesh@gotplt.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20240307193019.4028812-6-siddhesh@gotplt.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/7/24 14:30, Siddhesh Poyarekar wrote:
> Making it into subheadings and content instead not only makes it cleaner
> looking, it also gives us a nifty bar on the right to scroll through
> questions.
> 

LGTM.

Reviewed-by: Carlos O'Donell <carlos@redhat.com>

> Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
> ---
>  source/faq/index.rst | 223 ++++++++++++++++++++-----------------------
>  1 file changed, 106 insertions(+), 117 deletions(-)
> 
> diff --git a/source/faq/index.rst b/source/faq/index.rst
> index cb8a458..84ff30f 100644
> --- a/source/faq/index.rst
> +++ b/source/faq/index.rst
> @@ -6,123 +6,112 @@ FAQ
>  
>  You have questions we have answers!
>  
> -* Q: Can we keep deploying services as we have? 
> -
> -  * A: No. The GNU Toolchain is a critical foundation of trust for the GNU/Linux 
> -    ecosystem and the demands on its infrastructure, services, and security
> -    requirements have grown over time. The trend of increasing complexity to 
> -    support its development and associated financial demands will not abate.
> -    Different projects have different risk tolerances and the GNU Toolchain
> -    must meet more stringent expectations to maintain the trust of the 
> -    ecosystem. It is with this context in mind that CTI has been formed.
> -
> -* Q: What concrete steps will CTI help with?
> -
> -    * A: Some of the major goals include:
> -
> -        * Isolating all services in VMs or containers to increase service
> -          security and reduce service resource interference. 
> -
> -        * Allow volunteers to focus efforts outside of core infrastructure
> -          maintenance.
> - 
> -        * Prepare for additional software supply chain requirements from
> -
> -* Q: Why are you currently using Linux Foundation IT as the service provider?
> -
> -    * A: The CTI TAC recommendation is to use Linux Foundation IT services
> -      for core infrastructure. The LF IT team already supports many of
> -      the same services for the Linux kernel and at scale. The migration
> -      would involve moving services from Sourceware.org to LF IT servers.
> -      We continue to be thankful and appreciative of the time spent by
> -      Sourceware.org volunteers in support of the current services.
> -
> -* Q: What is the urgency vs what is the timeline?
> -
> -    * A: The GNU Toolchain community should be making consistent forward 
> -      progress to improve our infrastructure and cybersecurity position.
> -      Showing progress is important for the ecosystem to trust us as a
> -      secure and critical part of the software supply chain. We should
> -      not wait until there are Cybersecurity regulations that are beyond
> -      our ability to comply with as the FOSS ecosystem of tooling and
> -      infrastructure. Projects of similar scope and importance have been
> -      deploying significant resources for the use of the development community.
> -
> -* Q: Sourceware volunteers have fielded requests and organized volunteer 
> -  efforts that have worked well. Does LF allow volunteers to administer 
> -  the servers together with them? Have they in the past?
> -
> -    * A: The CTI TAC is the point of contact for volunteers.  CTI can fund 
> -      multiple activities, by multiple entities, and the way in which the
> -      volunteers engage may differ between them.
> -
> -* Q: How does this project relate to the GNU Project or the Free Software
> -  Foundation (FSF)?
> -
> -    * A: Many of the GNU Toolchain components are a part of the GNU
> -      Project, and contribute to the development of the GNU system.
> -      The FSF supports the GNU Project, and in turn supports the GNU
> -      Toolchain. The GNU Toolchain community works with the FSF via a 
> -      working together fund (https://www.fsf.org/working-together/fund)
> -      to support the development of the GNU Toolchain directly.
> -      The Core Toolchain Infrastructure project is distinct from the
> -      GNU Project and the FSF.
> -
> -* Q: How does this project relate to the GCC Compile Farm Project 
> -  (https://gcc.gnu.org/wiki/CompileFarm)?
> -
> -    * A: The GCC Compiler Farm is a unique resource for the GNU Toolchain
> -      and provides interactive systems for developers to manually test on 
> -      a wide variety of hardware and software configurations. This is not
> -      exactly the same set of requirements that the community might have
> -      for securing a supply chain, or using modern CI/CD workflows.
> -
> -* Q: How will the composition of the Core Toolchain infrastructure project
> -  reflect the communities it supports?
> -
> -    * A: Members of the GNU Toolchain community will always be invited to
> -      become members of the technical advisory council for the project.
> -
> -* Q: What is the composition of the project steering committee?
> -
> -    * A: The project steering committee will be composed of sponsoring 
> -      members of the Linux Foundation and members of the GNU Toolchain
> -      community.
> -
> -* Q: What does the project TAC do?
> -
> -    * A: The TAC takes input from the GNU Toolchain community and works 
> -      with the members to, implement, and resolve prioritized requirements.
> -
> -* Q: Is the GNU Toolchain development model going to change?
> -
> -    * A: No. The aim of the project is to provide additional infrastructure
> -      for the community that is being made available to support the 
> -      GNU Toolchain. All development changes will always be driven by the
> -      community.
> -
> -* Q: Is Sourceware (https://sourceware.org/) going to be deprecated?
> -
> -    * A: The GNU Toolchain Infrastructure project is distinct from Sourceware.
> -      The intent is to move critical infrastructure from Sourceware to the 
> -      Core Toolchain Infrastructure project to provide paid services.
> -
> -* Q: Who can use the new infrastructure?
> -
> -    * A: That depends on the requirements given by the GNU Toolchain community.
> -      The requirements from the community are input to the steering committee,
> -      and so the answer depends largely on exactly what was the intended purpose.
> -
> -* Q: What can the new infrastructure be used for?
> -
> -    * A: That depends on the requirements given by the GNU Toolchain community.
> -      The requirements from the community are input to the steering committee,
> -      and so the answer depends largely on exactly what was the intended purpose.
> -
> -* Q: Are there any presentations covering CTI?
> -
> -    * Yes, in October 2022 the CTI TAC gave an FSF hosted community Q&A:
> -      https://media.libreplanet.org/u/libreplanet/m/the-gti-project-a-conversation-and-community-q-a/
> +Can we keep deploying services as we have?
> +""""""""""""""""""""""""""""""""""""""""""
> +No. The GNU Toolchain is a critical foundation of trust for the
> +GNU/Linux ecosystem and the demands on its infrastructure, services, and
> +security requirements have grown over time. The trend of increasing complexity
> +to support its development and associated financial demands will not abate.
> +Different projects have different risk tolerances and the GNU Toolchain must
> +meet more stringent expectations to maintain the trust of the ecosystem. It is
> +with this context in mind that CTI has been formed.
> +
> +What concrete steps will CTI help with?
> +"""""""""""""""""""""""""""""""""""""""
> +Some of the major goals include:
> +
> +* Isolating all services in VMs or containers to increase service security and
> +  reduce service resource interference. 
> +
> +* Allow volunteers to focus efforts outside of core infrastructure maintenance.
> +
> +* Prepare for additional software supply chain requirements from
> +
> +Why are you currently using Linux Foundation IT as the service provider?
> +""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
> +The CTI TAC recommendation is to use Linux Foundation IT services for
> +core infrastructure. The LF IT team already supports many of the same services
> +for the Linux kernel and at scale. The migration would involve moving services
> +from Sourceware.org to LF IT servers.  We continue to be thankful and
> +appreciative of the time spent by Sourceware.org volunteers in support of the
> +current services.
> +
> +What is the urgency vs what is the timeline?
> +""""""""""""""""""""""""""""""""""""""""""""
> +The GNU Toolchain community should be making consistent forward progress
> +to improve our infrastructure and cybersecurity position.  Showing progress is
> +important for the ecosystem to trust us as a secure and critical part of the
> +software supply chain. We should not wait until there are Cybersecurity
> +regulations that are beyond our ability to comply with as the FOSS ecosystem of
> +tooling and infrastructure. Projects of similar scope and importance have been
> +deploying significant resources for the use of the development community.
> +
> +Sourceware volunteers have fielded requests and organized volunteer efforts that have worked well. Does LF allow volunteers to administer the servers together with them? Have they in the past?
> +""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
> +The CTI TAC is the point of contact for volunteers.  CTI can fund multiple
> +activities, by multiple entities, and the way in which the volunteers engage
> +may differ between them.
> +
> +How does this project relate to the GNU Project or the Free Software Foundation (FSF)?
> +""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
> +Many of the GNU Toolchain components are a part of the GNU Project, and
> +contribute to the development of the GNU system.  The FSF supports the GNU
> +Project, and in turn supports the GNU Toolchain. The GNU Toolchain community
> +works with the FSF via a `working together fund
> +<https://www.fsf.org/working-together/fund>`_ to support the development of the
> +GNU Toolchain directly.  The Core Toolchain Infrastructure project is distinct
> +from the GNU Project and the FSF.
> +
> +How does this project relate to the `GCC Compile Farm Project <https://gcc.gnu.org/wiki/CompileFarm>`_?
> +"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
> +The GCC Compiler Farm is a unique resource for the GNU Toolchain and
> +provides interactive systems for developers to manually test on a wide variety
> +of hardware and software configurations. This is not exactly the same set of
> +requirements that the community might have for securing a supply chain, or
> +using modern CI/CD workflows.
> +
> +How will the composition of the Core Toolchain infrastructure project reflect the communities it supports?
> +""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
> +Members of the GNU Toolchain community will always be invited to become members
> +of the technical advisory council for the project.
> +
> +What is the composition of the project steering committee?
> +""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
> +The project steering committee will be composed of sponsoring members of
> +the Linux Foundation and members of the GNU Toolchain community.
> +
> +What does the project TAC do?
> +"""""""""""""""""""""""""""""
> +The TAC takes input from the GNU Toolchain community and works with the
> +members to, implement, and resolve prioritized requirements.
> +
> +Is the GNU Toolchain development model going to change?
> +"""""""""""""""""""""""""""""""""""""""""""""""""""""""
> +No. The aim of the project is to provide additional infrastructure for
> +the community that is being made available to support the GNU Toolchain. All
> +development changes will always be driven by the community.
> +
> +Is `Sourceware <https://sourceware.org/>`_ going to be deprecated?
> +""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
> +The GNU Toolchain Infrastructure project is distinct from Sourceware.
> +The intent is to move critical infrastructure from Sourceware to the Core
> +Toolchain Infrastructure project to provide paid services.
> +
> +Who can use the new infrastructure?
> +"""""""""""""""""""""""""""""""""""
> +That depends on the requirements given by the GNU Toolchain community.
> +The requirements from the community are input to the steering committee, and so
> +the answer depends largely on exactly what was the intended purpose.
> +
> +What can the new infrastructure be used for?
> +""""""""""""""""""""""""""""""""""""""""""""
> +That depends on the requirements given by the GNU Toolchain community.
> +The requirements from the community are input to the steering committee, and so
> +the answer depends largely on exactly what was the intended purpose.
> +
> +Are there any presentations covering CTI?
> +"""""""""""""""""""""""""""""""""""""""""
> +Yes, in October 2022 the CTI TAC gave an `FSF hosted community Q&A <https://media.libreplanet.org/u/libreplanet/m/the-gti-project-a-conversation-and-community-q-a/>`_.
>  
>  -----------------
>  

-- 
Cheers,
Carlos.

