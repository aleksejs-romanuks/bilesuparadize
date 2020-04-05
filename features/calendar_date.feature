@CalendarDate
Feature: Calendar Date

  Scenario: as user I can search performances by specifying 10.07.2018 as start date and 30.01.2021 as end date in calendar
    When  I open calendar
    When  I select 10 as from day, 7 as from month, 2018 as from year
    And   I select 30 as until day, 01 as until month, 2021 as until year
    And   I submit
    Then  Corresponding date filter is applied

  Scenario: as user I can search performances by specifying 04.05.2020 as start date and 05.11.2020 as end date in calendar
    When  I open calendar
    When  I select 4 as from day, 5 as from month, 2020 as from year
    And   I select 5 as until day, 11 as until month, 2020 as until year
    And   I submit
    Then  Corresponding date filter is applied

  Scenario: as user I can search performances by specifying 09.09.2019 as start date and 09.09.2019 as end date in calendar
    When  I open calendar
    When  I select 9 as from day, 9 as from month, 2019 as from year
    And   I select 9 as until day, 9 as until month, 2019 as until year
    And   I submit
    Then  Corresponding date filter is applied

  Scenario: as user I can search performances by specifying 17.10.2010 as start date and 08.08.2030 as end date in calendar
    When  I open calendar
    When  I select 17 as from day, 10 as from month, 2010 as from year
    And   I select 8 as until day, 8 as until month, 2030 as until year
    And   I submit
    Then  Corresponding date filter is applied

  Scenario: as user I can search performances by specifying 10.03.2020 as start date and 22.07.2020 as end date in calendar
    When  I open calendar
    When  I select 10 as from day, 3 as from month, 2020 as from year
    And   I select 22 as until day, 7 as until month, 2020 as until year
    And   I submit
    Then  Corresponding date filter is applied

