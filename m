Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB5F1386BF
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709843116; cv=none; b=Iyzf86MrE2Qt2yIVR25rgFxmBH6DRpVFhJof+wo5r9c5QY+t7SRCkUPwNbvgoPeNkiJ8cIZ3+uZPvpGnD+DHd+uyof+EyNSfuCPsQ7Ti75CW73L8n3rjP4WvGplrt8gUgamjxLm6Car6J3+p2AptTRgEHkPpM8Hy27UbEbnIkSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709843116; c=relaxed/simple;
	bh=QcXVAJqBuGHqxhfyDTqmMDEtaJ0VGAu1Y2FIdvOfVjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=F4NO0uYc/M4Eu7AOYxrFCksm6mxcHvETIwJuxxyS4q5IPILqfFVhx/jG0PpyVNTonZ2ivWD0ChqUy5xtmP4jitEPIitVu5MVNNKIRXHPcgBhEO34kS6LAocmDmF8cweHHpe2KigK8v88XBOSbYtf3/rnCkLY8yjOQiXnuzlefC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WChSnVEm; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WChSnVEm"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF17680F26
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nXoBbyMCsl0M for <cti-tac@lists.linuxfoundation.org>;
	Thu,  7 Mar 2024 20:25:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F20AE80F04
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F20AE80F04
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WChSnVEm
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F20AE80F04
	for <cti-tac@lists.linuxfoundation.org>; Thu,  7 Mar 2024 20:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709843112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2xSYz5bvjaFAleQR4B4pK8ZxLtAsqMzs/wWPwsYEvW0=;
	b=WChSnVEmHh3STujlwdZe++rVu9ezvBj6IajhYLgY9lrYaxSBhCdEk3ztMohIdERvtu700k
	OMuj1ZbcVEb0Y7rf1VgLt8P7dbrdB9PggBnYK/si1aZKIkBsfflvOReHNI0D50+MLz70Cq
	M9N9daLM5EBM/HOZ+RnHG4AYu5X68Os=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-gpESLNHQPVSCW16vMJa7jA-1; Thu, 07 Mar 2024 15:25:11 -0500
X-MC-Unique: gpESLNHQPVSCW16vMJa7jA-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3c2283e13deso840101b6e.3
        for <cti-tac@lists.linuxfoundation.org>; Thu, 07 Mar 2024 12:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709843110; x=1710447910;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2xSYz5bvjaFAleQR4B4pK8ZxLtAsqMzs/wWPwsYEvW0=;
        b=jVLb8IV2/9Cwe1/beHLSjGSRm8lmXKfWCpQzKiImkR4EyyAVXOthqXEiLCBV+cTx2J
         kGDJgPj8amfVN3wjnvNNAF8+U0KaaouiPlS46FGQq1r35p+l3BM8Sfutfsf/7FejITNt
         inXmB0DmZXlTLoFhtpBZh9z+94HQigzK8MZd1EyRvs5lrMsfTcyI4sDZOOitrI/+Ep7s
         IDBz+r44Dfmevca8dQ/GmU49csUcWKbY4UZwPpvY47TvQTNAiDvr2X1SeHXm+QI0BxzK
         jvD32Aov+mhOmIMWX6oMAhwITbtuY4++RtMSE+EtIqNOf/QDU2LB7FGizd8mbRZuLsMv
         yLtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqq22bEvbm20gBlQqVXKiUevDhgzmBLmidU8YKx5UxsRLiL4flXp94WnK9zUVnKG9zI21FYQaiY57TqaLG69llvXCatFBm45FwycacBXwK32A=
X-Gm-Message-State: AOJu0Yzs0TS0pU4/3iEqntL8QtVlcmihbhDX22FuzjijycstV25SiXf9
	FWnAK8BLTYarhjIyYOGqq0ajJf2TU4uu/DzeYznT6sE+DlAeopHHEoJdZPxAGim7v7Fd1WacT1F
	R5RXxd0HEhz2/Shh60LNyyJ7MPrQnhjmoH0klXCacwi3dNEJYGG+YAr6rtqtYkOW71xr7uU5fFz
	BB
X-Received: by 2002:a05:6358:7243:b0:17b:6171:ada5 with SMTP id i3-20020a056358724300b0017b6171ada5mr10623610rwa.19.1709843110493;
        Thu, 07 Mar 2024 12:25:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFS0+5FWxLEGTo13iFG1GYZYcipLYfNercmNr1/kVAkUPtTaZpZblyJdbNLiWJTWmqbyrGOZQ==
X-Received: by 2002:a05:6358:7243:b0:17b:6171:ada5 with SMTP id i3-20020a056358724300b0017b6171ada5mr10623593rwa.19.1709843110138;
        Thu, 07 Mar 2024 12:25:10 -0800 (PST)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id ng10-20020a0562143bca00b0068fbe6d38f6sm9053251qvb.54.2024.03.07.12.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 12:25:09 -0800 (PST)
Message-ID: <ac03517b-3ccc-4117-9a5d-edb2893a8220@redhat.com>
Date: Thu, 7 Mar 2024 15:25:09 -0500
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] Add a toplevel README
To: Siddhesh Poyarekar <siddhesh@gotplt.org>,
 cti-tac@lists.linuxfoundation.org
References: <20240307193019.4028812-1-siddhesh@gotplt.org>
 <20240307193019.4028812-3-siddhesh@gotplt.org>
From: Carlos O'Donell <carlos@redhat.com>
Organization: Red Hat
In-Reply-To: <20240307193019.4028812-3-siddhesh@gotplt.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/7/24 14:30, Siddhesh Poyarekar wrote:
> Add basic instructions to allow one to test and later submit changes for
> review and inclusion.
> 
> Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>

Content looks good though, you can keep my RB and push so long as you call it README.md.

Reviewed-by: Carlos O'Donell <carlos@redhat.com>

> ---
>  README | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 README
> 
> diff --git a/README b/README
> new file mode 100644
> index 0000000..f0a7f64
> --- /dev/null
> +++ b/README
> @@ -0,0 +1,15 @@
> +CTI documentation portal
> +========================
> +
> +You need sphinxcontrib-spelling and piccolo-theme to build html pages
> +from the rst sources, both of which are available through pip.  Once you
> +have them, run
> +
> +  make html
> +
> +To build the html pages for testing.
> +
> +Submitting changes
> +------------------
> +
> +Send your patches to cti-tac@lists.linuxfoundation.org.

-- 
Cheers,
Carlos.

