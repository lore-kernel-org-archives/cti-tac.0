Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4AC7E110
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Jul 2025 12:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753880284; cv=none; b=Ennqh/GPtFneGEnxdVeavIMfW6addBYkGbOdu1BpsH1oZP55T9pRsTYb2WqN2oWZvXKLVuCC6XAeOPnwXUJ9lK/3mRm/f+QPpRWfCYD1HVX2NNXtwndqdOC/qFjp6AeoogPH15C/4+5GE26EC+fDnsvrzvzlbo5Sk1udyl+0sc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753880284; c=relaxed/simple;
	bh=6qohIwBd5GC92i7AO6EHjFkUgUIP87VxCBpmrkcknkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=FLb/MMkkC65k5wgKV0OuFlmCVPbEnVp4u8ppdKTpyE8s+fwiHSLhsKxSdTQXVbKBNg5A/9nsr44P/0GTi6tyOJ1bMviBPvciZOTA8j15j2bnoulHgqNFukF27b2OwP2EpjMs2di2C72DFCbOycX7UePoQ2N3jKqvvaaXcDrkvgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L4Sw/3pT; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L4Sw/3pT"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6097783D8A
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Jul 2025 12:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -3.282
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVdxE2CHIc2Y for <cti-tac@lists.linuxfoundation.org>;
 Wed, 30 Jul 2025 12:58:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=carlos@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E01383D81
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E01383D81
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L4Sw/3pT
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8E01383D81
	for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Jul 2025 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753880277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=La5Y75trzcT9Agsm3AvwwLSmKmjU8A/rC7FLFcEUrFs=;
	b=L4Sw/3pTWcta0Fd9vx0foWJVDoNaS09rlVhocKETwXlmqzxI5wWHDOT9o4pe7D1j1eJFCY
	k8QfCd1ezmFz+BaYJTVm0dtFhjif9P53kWeiLE/Hn2b4LqkmCpHS3lNzgyAQRy1MoNJziF
	VPLVjsrPaCX5wDKKaVbhq+xBoeSUnuk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-K1EdZionORaBhutHXxo2ww-1; Wed, 30 Jul 2025 08:57:56 -0400
X-MC-Unique: K1EdZionORaBhutHXxo2ww-1
X-Mimecast-MFC-AGG-ID: K1EdZionORaBhutHXxo2ww_1753880276
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e03ac1bf79so531426685a.3
        for <cti-tac@lists.linuxfoundation.org>; Wed, 30 Jul 2025 05:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880275; x=1754485075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=La5Y75trzcT9Agsm3AvwwLSmKmjU8A/rC7FLFcEUrFs=;
        b=WSn1GzunGmEuLfFyxW3I3lnpKZbJh2Qc5HpJ2ft4Co30L5HFtpc5IWPGnk9IcjozOI
         jEFflNJOlmVCX7rt3m6poWxh9dJl7Yf/0EsKuc+RQs9Ln4+SUEhO9x7PpdviTFT366ux
         QMCxfIzuWhEWugOUJwFCKcUBYONVgSL+/KOPZSYLpeDAyUrKzUsjioTes9LyeTAsifpm
         7Isb0TxpuxApChmiFvMYroP876jZUDJr9KJDjkUSs1khUB8dHUB/QgDgJuGNHKDLbRLN
         CQLj7+16POkdS3niQL+6VRYu3f3/wd4dfRRxmU1l6a13I9kjLkF+5T8h1ip56ViKEU4H
         piww==
X-Gm-Message-State: AOJu0YwvzIT6qCweyj57ij9F/CS3Hy18DbRcVR3P1aNLwaui2VV/YJpF
	o3OL0D/j2ONfy1KZ/Yc87Hcb4+YbLeV4tASz8LVaQW9j8qZ04949Hqbk8gu0hfUrMRceAzddKzs
	mIpzZlyeo20+cCObDUeshSDdqv/hdlVjwZXPus4xmbwCY1uJ8/Gh/2tbh2G7bkHbMbETYsN/1EX
	BvXGFCqk77nowGO/iQEOrUgTqwenaPeAUonCyusrDP4bc4kl4oQbCLCg==
X-Gm-Gg: ASbGnctsOjjz9Xla4YQpGR4bQhnik8Y61hp4gbxx3mR9PpTRv37qTyI+CL2YIVV1eR3
	Z0UQZoJa2uv5dBzeZmncyS214QGoOStfrZDmlOtSMiJyPkNVmRrftCDlPVjcD30YruFLJft4q47
	K3c8a6Lzv4lyfDM/Smf7L+sj0+US2TJTSHebpcwCcZka21XhuTD9QKdH16vOiaG7z4JAdnj01FA
	u7L8ZTGLnq2LTcofbG/W4sMy0RNG9lNE+Mn/msIz+8uh9U3kr1mPKs7n1YlrqDPr42EHm9fzmEm
	Ccn5HH1+3RRto1oLDHAetOhi/iGBKqpHHHZgUxpSIg==
X-Received: by 2002:a05:6214:518a:b0:704:e079:19e1 with SMTP id 6a1803df08f44-70766f934c3mr50625576d6.22.1753880275167;
        Wed, 30 Jul 2025 05:57:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAtfWIp61aRQXTGMH1WqmrBq3kHWqZA9TW+S1wzJmcN3chGMHEyHdFSgk2huXGgytxbQmkJg==
X-Received: by 2002:a05:6214:518a:b0:704:e079:19e1 with SMTP id 6a1803df08f44-70766f934c3mr50625056d6.22.1753880274414;
        Wed, 30 Jul 2025 05:57:54 -0700 (PDT)
Received: from athas.redhat.com ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70729aa81bcsm60040856d6.41.2025.07.30.05.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 05:57:53 -0700 (PDT)
From: Carlos O'Donell <carlos@redhat.com>
To: cti-tac@lists.linuxfoundation.org
Cc: Carlos O'Donell <carlos@redhat.com>
Subject: [PATCH] gov/charter: Publish existing CTI charter.
Date: Wed, 30 Jul 2025 08:57:41 -0400
Message-ID: <20250730125747.1074158-1-carlos@redhat.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: cti-tac@lists.linuxfoundation.org
List-Id: <cti-tac.lists.linuxfoundation.org>
List-Subscribe: <mailto:cti-tac+subscribe@lists.linuxfoundation.org>
List-Unsubscribe: <mailto:cti-tac+unsubscribe@lists.linuxfoundation.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9k2Za7SzKbpMQM5t_Wu4T5FLjxyCpoj6y9i3vhiCSSc_1753880276
X-Mimecast-Originator: redhat.com
Content-type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Carlos O'Donell <carlos@redhat.com>
---
 source/gov/charter.rst       | 237 +++++++++++++++++++++++++++++++++++
 source/gov/index.rst         |  11 ++
 source/name_wordlist.txt     |   1 +
 source/spelling_wordlist.txt |   9 ++
 4 files changed, 258 insertions(+)
 create mode 100644 source/gov/charter.rst

diff --git a/source/gov/charter.rst b/source/gov/charter.rst
new file mode 100644
index 0000000..b72a29a
--- /dev/null
+++ b/source/gov/charter.rst
@@ -0,0 +1,237 @@
+.. index::
+   single: Core Toolchain Initiative Fund Charter
+
+The Core Toolchain Initiative Fund Charter
+==========================================
+
+The Linux Foundation
+Update June 1, 2022
+
+1) Mission and Scope of the Core Toolchain Initiative (CTI) Fund.
+
+   a) The purpose of the Core Toolchain Initiative Fund (the “Directed Fund”) is to raise,
+      budget and spend funds in support of the core toolchain projects (the “Technical
+      Project”), in accordance with the provisions of this Charter. The governance of the
+      Technical Project is as set forth in the charter for the Technical Project.
+
+   b) The Directed Fund supports the Technical Project. The Directed Fund operates under the
+      guidance of the Governing Board of the Directed Fund (the “Governing Board”) and The
+      Linux Foundation (the “LF”) as may be consistent with The Linux Foundation’s tax-
+      exempt status.
+
+   b) The Governing Board manages the Directed Fund. The Directed Fund will also have an
+      Outreach Committee and other working groups, councils, committees and similar bodies
+      (collectively, “Committees”) that may be established by the Governing Board. These
+      committees report to the Governing Board.
+
+2) Membership.
+
+   a) The Directed Fund will be composed of Premier, General and Associate Members (each,
+      a “Member” and, collectively, the “Members”) in Good Standing. All Members must be
+      current corporate members of the LF (at any level) to participate in the Directed Fund as
+      a member. All participants in the Directed Fund, enjoy the privileges and undertake the
+      obligations described in this Charter, and as amended by the Governing Board with the
+      approval of the LF. During the term of their membership, all members will comply with
+      all such policies as the LF Board of Directors and/or the Directed Fund may adopt with
+      notice to members.
+
+   b) Premier Members will be entitled to appoint a representative to the Governing Board and
+      any Committee. Premier Members will be given the opportunity to have their logo
+      prominently displayed as a Premier member of the CTI.
+
+   c) General Members will be given the opportunity to have their logo displayed as a General
+      member of the CTI.
+
+   d) The Associate Member category of membership is limited to Associate Members of The
+      Linux Foundation. Associate Members will be given the opportunity to have their logo
+      displayed as an Associate member of the CTI.
+
+   e) Members will be entitled to:
+
+      i) participate in Directed Fund general meetings, initiatives, events and any other
+         activities; and
+
+      ii) identify themselves as members of the CTI Fund supporting the core toolchain
+          community.
+
+3) Governing Board
+
+   a) The Governing Board voting members will consist of:
+
+      i) one voting representative appointed by each Premier Member; and
+
+      ii) one voting representative (the TAC Representative”) of the Technical Advisory
+          Committee of the Technical Project (the “TAC”)
+
+   b) Up to two Premier Members that are part of a group of Related Companies (as defined in
+      Section 4) may appoint a voting representative to the Governing Board.
+
+      i) Please note that it will be acceptable for a Premier Member to appoint a
+         representative to the Governing Board and have another of its employees, or an
+         employee of one of its Related Companies, serve as the TAC Representative on the
+         Governing Board.
+
+   c) Conduct of Meetings
+
+      i) Governing Board meetings will be limited to the Governing Board representatives,
+         TAC Observers, invited guests and LF staff.
+
+      ii) Governing Board meetings follow the requirements for quorum and voting outlined in
+          this Charter. The Governing Board may decide whether to allow named
+          representatives (one per Member per Governing Board and per Committee) to attend
+          as an alternate.
+
+      iii) The Governing Board meetings will be private unless decided otherwise by the
+           Governing Board. The Governing Board may invite guests to participate in
+           consideration of specific Governing Board topics (but such guests may not participate
+           in any vote on any matter before the Governing Board).
+
+   d) The TAC Representative will serve as the Chairperson for the Governing Board.
+
+   e) The Governing Board will be responsible solely for approving proposals from the TAC
+      members for adding and removing individuals on the TAC.
+
+4) Technical Advisory Committee (“TAC”)
+
+   a) The Technical Advisory Committee will consist of contributors to the Technical Project.
+      The initial TAC will be composed of David Edelshon, Joel Brobecker, and Carlos
+      O’Donell.
+
+   b) TAC members will be permitted to attend Governing Board meetings as Observers. For
+      avoidance of doubt, Observers do not count toward quorum and participate in meeting
+      proceedings, including votes.
+
+   c) The TAC will be responsible for initiating the addition or removal of TAC members,
+      subject to approval of the Governing Board.
+
+5) Voting
+
+   a) Quorum for Governing Board and Committee meetings will require at least fifty percent
+      of the voting representatives. If advance notice of the meeting has been given per normal
+      means and timing, the Governing Board may continue to meet even if quorum is not met,
+      but will be prevented from making any decisions at the meeting.
+
+   b) Ideally decisions will be made based on consensus. If, however, any decision requires a
+      vote to move forward, the representatives of the Governing Board or Committee, as
+      applicable, will vote on a one vote per voting representative basis.
+
+   c) Except as provided in Section 13.a. or elsewhere in this Charter, decisions by vote at a
+      meeting will require a simple majority vote, provided quorum is met. Except as provided
+      in Section 13.a. or elsewhere in this Charter, decisions by electronic vote without a
+      meeting will require a majority of all voting representatives.
+
+   d) In the event of a tied vote with respect to an action that cannot be resolved by the
+      Governing Board, the Chair may refer the matter to the LF for assistance in reaching a
+      decision. If there is a tied vote in any Committee that cannot be resolved, the matter may
+      be referred to the Governing Board.
+
+6) Subsidiaries and Related Companies
+
+   a) Definitions:
+
+      i) “Subsidiaries” means any entity in which a Member owns, directly or indirectly, more
+         than fifty percent of the voting securities or membership interests of the entity in
+         question;
+
+      ii) “Related Company” means any entity which controls or is controlled by a Member or
+          which, together with a Member, is under the common control of a third party, in each
+          case where such control results from ownership, either directly or indirectly, of more
+          than fifty percent of the voting securities or membership interests of the entity in
+          question; and
+
+      iii) “Related Companies” are entities that are each a Related Company of a Member.
+
+   b) Only the legal entity which has executed a Participation Agreement and its Subsidiaries
+      will be entitled to enjoy the rights and privileges of such Membership; provided,
+      however, that such Member and its Subsidiaries will be treated together as a single
+      Member.
+
+   c) If a Member is itself a foundation, association, consortium, open source project,
+      membership organization, user group or other entity that has members or sponsors, then
+      the rights and privileges granted to such Member will extend only to the employee-
+      representatives of such Member, and not to its members or sponsors, unless otherwise
+      approved by the Governing Board in a specific case.
+
+   d) Directed Fund Membership is non-transferable, non-salable and non-assignable, except a
+      Member may transfer its current Membership benefits and obligations to a successor of
+      substantially all of its business or assets, whether by merger, sale or otherwise; provided
+      that the transferee agrees to be bound by this Charter and the Bylaws and policies
+      required by LF membership.
+
+7) Good Standing
+
+   a) The Linux Foundation’s Good Standing Policy is available at
+      https://www.linuxfoundation.org/good-standing-policy and will apply to Members of this
+      Directed Fund.
+
+8) Trademarks
+
+   a) Any trademarks relating to the Directed Fund or the Technical Project, including without
+      limitation any mark relating to any Conformance Program, must be transferred to and
+      held by LF Projects, LLC or the Linux Foundation and available for use pursuant to LF
+      Projects, LLC’s trademark usage policy, available at www.lfprojects.org/trademarks/.
+
+9) Antitrust Guidelines
+
+   a) All Members must abide by The Linux Foundation’s Antitrust Policy available at
+      http://www.linuxfoundation.org/antitrust-policy.
+
+   b) All Members must encourage open participation from any organization able to meet the
+      membership requirements, regardless of competitive interests. Put another way, the
+      Governing Board will not seek to exclude any member based on any criteria,
+      requirements or reasons other than those that are reasonable and applied on a non-
+      discriminatory basis to all members.
+
+10) Budget
+
+   a) The Governing Board will approve an annual budget and never commit to spend in
+      excess of funds raised. The budget and the purposes to which it is applied must be
+      consistent with both (a) the non-profit and tax-exempt mission of The Linux Foundation
+      and (b) the goals of the Technical Project.
+
+   b) The Linux Foundation will provide the Governing Board with regular reports of spend
+      levels against the budget. Under no circumstances will The Linux Foundation have any
+      expectation or obligation to undertake an action on behalf of the Directed Fund or
+      otherwise related to the Directed Fund that is not covered in full by funds raised by the
+      Directed Fund.
+
+   c) In the event an unbudgeted or otherwise unfunded obligation arises related to the
+      Directed Fund, The Linux Foundation will coordinate with the Governing Board to
+      address gap funding requirements.
+
+11) General & Administrative Expenses
+
+   a) The Linux Foundation will have custody of and final authority over the usage of any fees,
+      funds and other cash receipts.
+
+   b) A General & Administrative (G&A) fee will be applied by The Linux Foundation to
+      funds raised to cover membership records, finance, accounting, and human resources
+      operations. The G&A fee will be 9% of the Directed Fund’s first $1,000,000 of gross
+      receipts each year and 6% of the Directed Fund’s gross receipts each year over
+      $1,000,000.
+
+12) General Rules and Operations. The Directed Fund activities must:
+
+   a) engage in the work of the project in a professional manner consistent with maintaining a
+      cohesive community, while also maintaining the goodwill and esteem of The Linux
+      Foundation in the open source community;
+
+   b) respect the rights of all trademark owners, including any branding and usage guidelines;
+
+   c) engage or coordinate with The Linux Foundation on all outreach, website and marketing
+      activities regarding the Directed Fund or on behalf of the Technical Project that invoke or
+      associate the name of the Technical Project or The Linux Foundation; and
+      d)operate under such rules and procedures as may be approved by the Governing Board and
+      confirmed by The Linux Foundation.
+
+13) Amendments
+
+   a) This Charter may be amended by a two-thirds vote of the entire Governing Board with
+      approval of the TAC and The Linux Foundation.
+
+-----------------
+
+* :ref:`genindex`
+
+* :ref:`search`
+
diff --git a/source/gov/index.rst b/source/gov/index.rst
index 0bfef38..fd9a7c8 100644
--- a/source/gov/index.rst
+++ b/source/gov/index.rst
@@ -32,6 +32,17 @@ to one GB seat and one TAC seat.
 The initial TAC bootstrap included 3 community members and was expanded to
 10 community members. Membership in the TAC requires GB approval.
 
+The current Governing Board membership is as follows:
+
+ * `Open Source Security Foundation <https://openssf.org/>`.
+ * One TAC member, nominated by the TAC.
+
+The current Charter is here:
+
+.. toctree::
+
+   charter
+
 -----------------
 
 * :ref:`genindex`
diff --git a/source/name_wordlist.txt b/source/name_wordlist.txt
index 6940cdd..c2d9800 100644
--- a/source/name_wordlist.txt
+++ b/source/name_wordlist.txt
@@ -10,6 +10,7 @@ David
 Delorie
 Donell
 Edelsohn
+Edelshon
 Eggert
 Eigler
 Faylor
diff --git a/source/spelling_wordlist.txt b/source/spelling_wordlist.txt
index 1975aab..4bc5caa 100644
--- a/source/spelling_wordlist.txt
+++ b/source/spelling_wordlist.txt
@@ -4,8 +4,10 @@ Cybersecurity
 Django
 Pipermail
 Sourceware
+TAC
 Toolchain
 Yay
+aren
 backend
 binutils
 bugzilla
@@ -19,7 +21,9 @@ curation
 curator
 cvs
 cybersecurity
+didn
 django
+doesn
 editbugs
 featureful
 frontends
@@ -35,6 +39,7 @@ html
 https
 irc
 jit
+lfprojects
 libc
 mlmmj
 namespaces
@@ -58,7 +63,11 @@ spammy
 svn
 testresults
 toolchain
+transferee
 trybot
 trybots
+unbudgeted
+ve
 webpages
 whitespace
+www
-- 
2.50.1

