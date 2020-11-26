Feature: Installing modules from MdDocuments version 2 and 3


Background:
  Given I set default module platformid to "platform:f29"


Scenario: Install module, profile from the latest module context with MdDocument version 2
  Given I use repository "dnf-ci-multicontext-hybrid-multiversion-modular"
   When I execute dnf with args "module enable postgresql:9.6"
   Then the exit code is 0
    And modules state is following
        | Module        | State     | Stream    | Profiles  |
        | postgresql    | enabled   |    9.6    |           |
   When I execute dnf with args "module install nodejs:5/testlatest"
   Then the exit code is 0
    And modules state is following
        | Module   | State     | Stream    | Profiles   |
        | nodejs   |  enabled  |     5     | testlatest |
    And Transaction is following
        | Action                    | Package                                          |
        | module-stream-enable      | nodejs:5                                         |
        | module-profile-install    | nodejs/testlatest                                |
        | install-group             | postgresql-0:9.6.8-1.module_1710+b535a823.x86_64 |

Scenario: Install module, profile from the latest module context with MdDocument version 3
  Given I use repository "dnf-ci-multicontext-hybrid-multiversion-modular-v3"
   When I execute dnf with args "module enable postgresql:9.6"
   Then the exit code is 0
    And modules state is following
        | Module        | State     | Stream    | Profiles  |
        | postgresql    | enabled   |    9.6    |           |
   When I execute dnf with args "module install nodejs:5/testlatest"
   Then the exit code is 0
    And modules state is following
        | Module   | State     | Stream    | Profiles   |
        | nodejs   |  enabled  |     5     | testlatest |
    And Transaction is following
        | Action                    | Package                                             |
        | module-stream-enable      | nodejs:5                                            |
        | module-profile-install    | nodejs/testlatest                                   |
        | install-group             | postgresql-0:9.6.8-1.module_1710+b535a823_V3.x86_64 |
