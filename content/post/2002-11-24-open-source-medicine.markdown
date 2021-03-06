---
categories:
- free-software
- open-source
- medicine
- writing
date: '2002-11-24T00:00:00'
title: Open Source Medicine
---


I wrote up a [little intro piece on the use of open source software in medical applications (PDF)](http://kurup.org/files/OpenSourceMedicine.pdf). HTML below...

Improving the communication of patient information is the key to
improving healthcare quality and efficiency. In most health care
organizations, written records are the main conduit of this
information, yet they are notoriously illegible and difficult to
browse. Reviewing past problems and past interventions is
time-consuming, if not impossible. The record is used mostly as a
one-way device for the clinician to record data. It is used much less
efficiently to provide important data or reminders back to the
clinician. This leads to redundant testing and treatment, as well as
to critical data being overlooked. Multiple providers and
administrative departments need access to patient information, yet the
paper record can only be in one place at a time. As a comprehensive
storehouse of patient information, the paper record is obsolete.

The electronical medical record (EMR) is an important weapon in the
fight against healthcare inefficiency. EMRs are software programs that
allow the clinician to record patient information. They are usually
tied in with other ancillary services such as pathology, laboratory,
pharmacy and radiology to provide a comprehensive view of a patient’s
condition. EMRs have several advantages over written records. Records
can easily be searched for pertinent information leading to less
duplication of testing and treatment. The record can be programmed to
notify the clinician of drug interactions, abnormal lab results as
well as routine preventive health recommendations for which the
patient is eligible. This decreases medical errors and improves
quality. Decreasing errors will, in turn, decrease malpractice
costs. EMRs can recognize missed appointments and automatically send
letters to the patient reminding them to reschedule. Computers can
handle the routine, repetitive aspects of patient care that they do
best, allowing the clinician to concentrate on the care of the
patient. EMRs can be programmed to translate clinician diagnostic
information and documentation into insurer-required diagnosis and
billing codes, which makes billing and reporting more accurate and
efficient. EMRs can include access to medical references, thus
allowing the clinician to apply new knowledge immediately. EMRs have
the potential to improve communication between patients, providers and
consultants. All three groups can have access to the record at the
same time. Properly done, clinicians in different geographic areas and
using different computer systems can access and update a
patient's record. Finally, EMRs also promise to improve the
security and confidentiality of patient information. Paper records can
be inspected by any number of people while in transit. EMRs will only
let individuals with proper credentials view patient information and
different parts of the record can be guarded with different levels of
security.

Most EMR software packages are proprietary. The source code is
controlled by the vendor and there are restrictions on the use and
distribution of the software. As an example, Microsoft Word is a
proprietary program. The source code is not available. Users must
purchase a copy of the program and use it on only one computer. They
are not allowed to copy or redistribute the program and there is no
way for them to make changes to the way the program runs.

Proprietary software is not a good solution for the healthcare
industry. The software is expensive, often prohibitively so for small
clinician groups or for those in developing countries. The software is
complex and doesn't meet the clinician's needs. This is due
to the fact that clinicians are often not involved in the EMR
development process. While the software may be developed in
conjunction with advice from a few clinicians, users in the field have
little abilty to provide feedback or direction to
developers. Proprietary software packages often address only one
problem in the healthcare arena, such as recordkeeping, billing,
transcription, scheduling or medical reference. Unfortunately, since
each application is built by a different vendor, there is no
communication between applications, thus reducing their overall
benefit. There is no incentive for an EMR vendor to allow their
application to communicate with another vendor's billing
application, for example, because it would reduce their profit
potential if they were ever to develop a competing billing
application. This leads to the problem of vendor lock-in. Once a
healthcare organization implements an EMR, it becomes very difficult
to make a change. The vendor can essentially hold the organization
hostage to their pricing decision because the organization's
patient data is tied up in the current system. This especially becomes
a problem when the organization requests that problems be fixed or
features be added. They are at the mercy of the vendor who may be slow
to fix problems which don't affect their larger customers, or to
introduce features which won't be widely demanded. Unfortunately,
in the healthcare space, one size does not fit all. If the vendor ever
goes out of business or changes their focus, then the organization
faces an expensive migration. In addition, many current EMRs run on
Windows which has poor reliability and security records in comparison
to Linux and UNIX. For all these reasons, using proprietary software
is a poor solution for healthcare.

The alternative is Open Source Software (OSS). OSS is free. Free, in
this definition, means liberty, not necessarily price. While OSS may
have a price tag, the user always has complete liberty to do with the
code as they wish, including redistributing it for a charge or no
charge. Users have complete access to the source code which defines
the behavior of the software. They have the liberty to change the code
to suit their purposes. There are various open source licenses (GPL,
BSD) which each have their own various stipulations.

The most visible example of OSS is Linux, an operating system which
competes with Microsoft Windows. Apache, the most common web server in
use, and Openoffice, a suite of applications similar to Microsoft
Office, are 2 other successful examples. Anyone is free to download
these software programs, change them and redistribute them, if
desired. The strength of these programs come when users make changes
to fix problems or add features and then return those changes back to
the original developers.

David Wheeler has done an amazingly comprehensive analysis of OSS and
concludes:

>OSS/FS (Open Source Software / Free Software) has significant market share in many markets, is often the most reliable software, and in many cases has the best performance. OSS/FS scales, both in problem size and project size. OSS/FS software often has far better security, particularly when compared to Windows. Total cost of ownership for OSS/FS is often far less than proprietary software, particularly as the number of platforms increases. These statements are not merely opinions; these effects can be shown *quantitatively*, using a wide variety of measures. This doesn't even consider other issues that are hard to measure, such as freedom from control by a single source, freedom from licensing management (with its accompanying risk of audit and litigation), and increased flexibility.

OSS also lowers the cost for vendors who support it. When proprietary
vendors create a product, they start with an empty slate, often
rebulding many pieces that have been built by other vendors. OSS
vendors start with an established code base, saving time and
money. Their final work then gets returned to the community, thus
improving the base at which other vendors start. There is much less
reinvention and correspondingly more room for innovation. Users are
empowered with OSS. Since they have full access to the source code,
they are able to fix problems that are important to
them. Alternatively, they can hire outside developers to fix
problems. There's no need to rely on the original developers, so if
the original developers ever leave the project or "go out of
business", the consumer can simply hire another team. The code is
theirs. In 1999, Medicalogic introduced an internet-based medical
record called LogicianInternet. Physicians took advantage of this
system to keep an EMR which was housed on Medicalogic's
computers. When Medicalogic was sold to GE Medical Systems, GE decided
to discontinue the program. All the physicians now have to print out
their patient records and switch back to paper records, or re-enter
all the patient information into a new EMR which they must purchase
and install. If the application had been open source, the users could
continue to use it, hiring new developers as needed to keep it
updated. Arsdigita was a company which specialized in building
community-centered websites and they released their code as open
source. As the dot-com economy recessed, they were forced to change
focus and were eventually bought out by another company. If they had
not released their code, all the users of their system would have been
forced to live with the program as it was, without updates or
enhancements. Alternatively, they would have had to migrate to another
system, which would be expensive. Instead, a community grew around the
software, called OpenACS
([http://www.openacs.org](http://www.openacs.org)). This community has
taken the software and improved it. Arsdigita's customers benefit
because, unlike Medicalogic's customers, they can continue to use and
customize their software. In addition, since the OpenACS community has
flourished, former Arsdigita customers can find developers through
OpenACS to fix problems and customize their software.

OSS is especially relevant in the medical arena. The medical community
is known to value academic freedom. Researchers regularly publish
their findings and if an intervention improves patient care, it makes
sense that it should be spread as widely as possible. The same should
be true of software which improves patient care. Proprietary software
is also more risky in the healthcare arena since medical software
companies are, as a rule, small outfits and are more prone to failure
as a business. The reasons small companies abound in the current arena
is because medical practices vary widely in their sizes,
characteristics and needs and their problems can not be solved with
one homogenous solution. Yet they still need to be able to communicate
with other heterogenous systems and legacy systems need to be
interfaced, not thrown away. OSS is an ideal method to develop
conduits which translate between proprietary software programs, if not
to replace them completely. In addition, OSS is a natural fit for
international collaboration due to the lack of intellectual property
issues and the need for customization of software for local
needs. Healthcare organizations in other countries will feel more
secure having control over the source code, rather than relinquishing
such control to vendors who may be in other countries and subject to
different regulations. Overall, OSS will lead to software that
improves the clinician's ability to function and improves patient
care.

There are numerous vibrant OSS healthcare projects in existance and I
encourage readers to follow the URLs to their websites for more
information: (See attached list)

How can you get involved? It's easy to make a difference in the Open
Source world. All it takes is personal interest, diligence and a
willingness to learn. Competence is rewarded. Try out the sotware. See
how it works and how it breaks. Report difficulties that you have or
features that you'd like to see. Be aware that developers are
sometimes working on their own free time, so be courteous and
patient. Take the time to read documentation and follow the
discussions before jumping in. Offer to help out where you can. Keep
notes about your experiences. These notes can help other new users and
help developers improve the program. Non-programmers can help by
submitting problem reports, writing documentation, and assisting
developers with domain advice. Most importantly, promote open
standards and open discussions among those around you. OSS software is
the best approach to building software that will solve real healthcare
problems.

## References

- Bray B. *Keynote speech at the Inaugaration of the Openkaart Initiative.* 9/26/2001

- Bruegger BP, Dal Molin J. *Open Source – Open Content – A Perfect Match for Sustainable Development.* PowerPoint Slideshow

- Carnall D. [*Open Source Software in Healthcare*](http://www.carnall.demon.co.uk/OpSrcHth.htm)

- Carnall D. [*Vital Signs*](http://www.linuxuser.co.uk/articles/issue15/lu15-Real_Life_Linux-Vital_signs.pdf) LinuxUser. October 2001

- Carnall D. [*Healthy Outlook.*](http://www.linuxuser.co.uk/articles/issue2/lu2-Real_Life_Linux-Healthy_Outlook.pdf) LinuxUser. July/August 2000 

- Carnall D. *Medical software's free future.* BMJ 2000; 321:976.

- Cook B. [*Wipeout: Lessons on protecting Web-based EMR data.*](http://www.ama-assn.org/sci-pubs/amnews/pick_02/bisa0819.htm) AMNews. 8/19/2002. 

- Johnson DL. [*Open Source Medical Information Management.*](http://lorenzo.uwstout.edu/QQMIM/qq4.html)

- Johnson DL. [*Medical Enterprises and Open Source.*](http://amygdala.danlj.org/~danlj/OpenSource/MedicalEnterprise.html)

- O'Reilly T. [*Ten Myths about Open Source Software.*](http://opensource.oreilly.com/news/myths_1199.html)

- Wheeler DA. [*Why Open Source Software / Free Software (OSS/FS)? Look at the numbers!*](http://www.dwheeler.com/oss_fs_why.html)

## Links: General Medical Informatics:

- [Handbook of Medical Informatics](http://www.mihandbook.stanford.edu/handbook/home.htm)

- [International Medical Informatics Association](http://www.imia.org/)

- [American Medical Informatics Association](http://www.amia.org/)

## Links: General Open Source:

- [Open Source Initiative](http://www.opensource.org/)

- [Free Software Foundation](http://www.fsf.org/)

- [The Cathedral and the Bazaar](http://www.tuxedo.org/~esr/writings/cathedral-bazaar)

- [Why Open Source Software?](http://www.dwheeler.com/oss_fs_why.html)

## Links: Open Source Medical Projects:

- [An up-to-date list of projects is maintained here](http://www.linuxmednews.com/linuxmednews/LMNProjects/Projects/folder_contents)

- [VISTA – Veteran Administrations comprehensive healthcare software](http://www.hardhats.org/)

- [GEHR (Good Electronic Health Record)](http://www.gehr.org/)

- [OIO (Open Infrastructure for Outcomes)](http://www.txoutcome.org/)

- [OpenEMed](http://www.openemed.org/)

Last Modified: 9/19/02
