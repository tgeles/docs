==================================
OpenStack Summit Austin April 2016
==================================

Monday April 25, 2016
~~~~~~~~~~~~~~~~~~~~~

Operations Guide Fishbowl
-------------------------
https://etherpad.openstack.org/p/AUS-ops-Docs-ops-guide

- HP is going task based information that is accessed through search. EPPO.
- Dead tree is dead. Huzzah! This simplifies publishing in RST.
- Can tasks in the guide be date/version stamped so that operators know what is
  relevant to their deployment
- maybe combine Arch and Ops Guide into one after removing lots of old ops
  content

Mitaka: Beyond the Release Notes
--------------------------------
https://etherpad.openstack.org/p/AUS-ops-Beyond-the-Release-Notes

Meet the OpenStack Personas (So Far)
------------------------------------
bit.ly/OpenStackPersonasAustin

- Workshop @Rackspace Austin

  - Attributes
  - cloud roles

- Workshop @IBM Design Austin

  - cloud adoption stages
  - OStack ecosystem
  - cloud roles

- integrate personas into your discussions
- participate in activies to document, validate, and update personas
- these different roles tend to emerge as a company gets bigger. Scale of an
  organization impacts the diversity of roles.

Big Tent: One Year Later
------------------------
Monty Taylor and Thierry Carrez

The Good:

- we are no longer stuck when trying to get projects from nascent to a part of
  OpenStack. Requirements for inclusion were too high before Big Tent.
- more collaboration. Disparate projects with the same goal are merging and
  working together more often.
- more reactivity. People/teams are more able to react to needs and
  requirements of operators and users.
- more competition. Now that anyone can be part of the Big Tent, new ideas can
  get a foothold and demonstrate they are better.
- forced us to document the OpenStack way
- adding more projects helped the TC to focus on selected projects

The Bad:

- single-vendor. TC no longer requires projects to involve multiple vendors
- confusion. The plethora of projects can be confusing for people new to the
  OStack ecosystem.
- made joining OpenStack harder for established projects because they have
  established processes that do not match the Big Tent requirements
- where do you set the limits of the tent?
- cleaning up the tent is difficult and will take time. Some projects that were
  accepted into the tent need to be removed when they are no longer maintained.

Next challenges:

- improving the end-user experience with the Big Tent
- rethinking the Design Summit to include Bit Tent

From Upstream Documentation To Downstream Product Knowledge Base
----------------------------------------------------------------
Stefano Maffulli and Caleb Boylan (DreamHost)

- How to instruct customers with constraints (small team)
- have to be smart: re-use, automate, collaborate

Ideal scenario
#. pull from upstream
#. build docs locally
#. publish html to helpdesk
#. go contribute straight upstream
#. receive patches

Publishing

- tox -> Sphinx -> Zendesk REST API
- https://github.com/dreamhost/zendesk-publish-script
- YAML file that nests files-to-publish inside the route for where they should
  be published
- automated using a Jenkins job that polls github repo and runs script when
  changes detected
- section titles that work well in context (e.g. Launch Instances), do not
  work well as isolated tasks and must be changed (e.g. How to Launch
  Instances)

Improve titles by making them more specific to help people know what a topic
is about and to improve SEO.


Tuesday April 26, 2016
~~~~~~~~~~~~~~~~~~~~~~


Wednesday April 27, 2016
~~~~~~~~~~~~~~~~~~~~~~~~


Thursday April 28, 2016
~~~~~~~~~~~~~~~~~~~~~~~


Friday April 29, 2016
~~~~~~~~~~~~~~~~~~~~~


To-Do
~~~~~
- Improve titles by making them more specific to help people know what a topic
  is about and to improve SEO.
