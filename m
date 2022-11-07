Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A17D51D
	for <gti-tac@lists.linuxfoundation.org>; Mon,  7 Nov 2022 14:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C3FC81427
	for <gti-tac@lists.linuxfoundation.org>; Mon,  7 Nov 2022 14:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C3FC81427
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=f3mCgWv8
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
	with ESMTP id 03nkKp1a9BnK for <gti-tac@lists.linuxfoundation.org>;
	Mon,  7 Nov 2022 14:58:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F0C481422
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0F0C481422
	for <gti-tac@lists.linuxfoundation.org>; Mon,  7 Nov 2022 14:58:50 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id v8so7257151qkg.12
        for <gti-tac@lists.linuxfoundation.org>; Mon, 07 Nov 2022 06:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yr3xhx6XVcgsv6/rIe3ucVljRUSSd3WZuu19L4LalCc=;
        b=f3mCgWv8EWc1gjfLLgGva86kg3ptzFGQeAJ+217GBD4Sin4rLLrFNRXQgSbiQwz/v+
         heXWWXri9den3sV7+/SPyCNAha40aZV8foXj2wuYgGtm9S7FdTbk1UcKbk0Xw9d24eav
         HiFt4Xw3W1JT5sIxvhm50EbhBsIIHCMfGXsBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yr3xhx6XVcgsv6/rIe3ucVljRUSSd3WZuu19L4LalCc=;
        b=dzvem/qzCa+FLQ73Es+H4a3sq0wDsEl0jZsgPGQZaIl+6ZnlMrpH/MwInnQy8dSy1d
         5FMPyl73Fw0UoegYVtWvr7SFN8qEM+urKon/guUs8Co4sw/sMtWM2uE+LKi1fxl6DFjH
         P8n40e3x0Eh1GK22CztgT9+q+dvBox7HRMwsz0KsoRbPkrjJarnvoi+PlMhbu6FT+f2Y
         m8zYuwYQveu/n34ieFSboHa1R2XsUXJVHiawZZioahKnZFu0APyG/rtpyf4+JHky6L4P
         TGlbiQ03ioLViA27w0poFQuNngepq7EyPx3S10jliCQvVr0zQFwtwD9jPmb6hJbE5ctk
         AUaw==
X-Gm-Message-State: ACrzQf0VzWAShhmFsnOlpf79+SrsATzDflhRcotA5ENh8OQs5BST9gHP
	DZ+eYf5ZZsDlLE3FiTFdKSkdBsv1S7Y6zylE
X-Google-Smtp-Source: AMsMyM7Tkvu44jgffyoyPhz7o7lsy/wIpvPfRUmacj6QfMA3mmCJV8zmxbFLVhBlnK6CYMNZ/XJ4YQ==
X-Received: by 2002:a37:c246:0:b0:6fa:263c:574b with SMTP id j6-20020a37c246000000b006fa263c574bmr31697068qkm.484.1667833129730;
        Mon, 07 Nov 2022 06:58:49 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id u10-20020ac858ca000000b003a5172220dbsm6400449qta.8.2022.11.07.06.58.49
        for <gti-tac@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:58:49 -0800 (PST)
Date: Mon, 7 Nov 2022 09:58:47 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: gti-tac@lists.linuxfoundation.org
Subject: Requesting IT help
Message-ID: <20221107145847.o52aty3ghadjlw36@meerkat.local>
Precedence: bulk
X-Mailing-List: gti-tac@lists.linuxfoundation.org
List-Id: <gti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:gti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:gti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

We usually create a helpdesk@[domainname.foo] address for requesting help, but
since we're not up to that stage yet with GTI, please use the following
address to request IT help for GTI:

    it-coreprojects-helpdesk@linuxfoundation.org

Best regards,
Konstantin
