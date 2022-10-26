Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CE68494
	for <gti-tac@lists.linuxfoundation.org>; Wed, 26 Oct 2022 17:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0344F80FB3
	for <gti-tac@lists.linuxfoundation.org>; Wed, 26 Oct 2022 17:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0344F80FB3
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=GIZxu/bl
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
X-Spam-Status: No, score=-2.101 tagged_above=-999 required=5
	tests=[BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=ham autolearn_force=no
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id swud2xF0aFNQ for <gti-tac@lists.linuxfoundation.org>;
	Wed, 26 Oct 2022 17:44:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD67380FAA
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DD67380FAA
	for <gti-tac@lists.linuxfoundation.org>; Wed, 26 Oct 2022 17:44:43 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id g11so10516585qts.1
        for <gti-tac@lists.linuxfoundation.org>; Wed, 26 Oct 2022 10:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H3hIPMVvRNWMWrJSvj1rrOgcrLy32bC7LQy/pUXdBEM=;
        b=GIZxu/blL8WiwpobYc3TJydwAbcElYoIDJzGet+pLkcpGMBANFGoMBs3M4S1L1ZakZ
         GeaDJpTYwo/2bcLD51u4XU/ii/aeF9x4Ul2AnLnKo6QmNCkc3L9Zseo7CzopbCQxAtsb
         xP8C7pEvwJHvuB6T6M7vJTKTcqWp4tUU7qCRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H3hIPMVvRNWMWrJSvj1rrOgcrLy32bC7LQy/pUXdBEM=;
        b=s+76Djk1y15kYQirVswhnsIg8TG0wjC09htOejKE0Sy8+HNThG6k6/kmxJhuOeDCFD
         JVQTRLvoJ4fAagitpPMAPjIaSSeaN4zvZ97IIw0QJgKqrB1/66K0EpYX+TXrgYByv/n/
         nMC68YqmTvFROctMkjWfCKOmcZExWTi9WQzcsi2IzgixPfcspscontmlNobh5ZqgSQZT
         DvjUGxv/yapem1tXJFHxb/GO0hwm3vQWPoa5ovI65X0oSWOO04yKT62TJ9kdlNi0qXne
         i4QBM43Eu42Ci+ajnm47ZzS/aBHPy24CYqqNq0+jaIq1kw1eVw4ly60UNVnSrdbeYgoV
         VIdQ==
X-Gm-Message-State: ACrzQf2p4I6SLzcPZVp/Zr5nAAh/zHYSF9VZt7xA3fpGCiXbhwz6/eQ4
	Kb77YlFUUZtKaQbal0Wz6OyWhztkMpxg3utp
X-Google-Smtp-Source: AMsMyM4gT6ijvwdQYGpt44MeqaXabnJ5LdHpwhe9mcPcyNWMCQh7SoVVgPPQWm4CBkKsMqA9Jg8Jtg==
X-Received: by 2002:ac8:7e8c:0:b0:39c:de52:a628 with SMTP id w12-20020ac87e8c000000b0039cde52a628mr37650071qtj.587.1666806282511;
        Wed, 26 Oct 2022 10:44:42 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id a1-20020a05620a438100b006cea2984c9bsm4241670qkp.100.2022.10.26.10.44.42
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 10:44:42 -0700 (PDT)
Date: Wed, 26 Oct 2022 13:44:40 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: gti-tac@lists.linuxfoundation.org
Subject: Welcome to the new gti-tac list
Message-ID: <20221026174440.3gds72wx6wzlet3p@meerkat.local>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

The gti-tac list is moving to a slightly different address in order to provide
free-as-in-freedom hosting using mlmmj and public-inbox. The new address is:

gti-tac@lists.linuxfoundation.org

List posting is restricted to subscribers, but archives are publicly available
at the following address:

https://lore.kernel.org/gti-tac/

Please let me know if you have any questions.

Best regards,
Konstantin
