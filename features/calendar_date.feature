@CalendarDate
Feature: Calendar Date

  Scenario: as user I can search performances by specifying dates in calendar
    When  I open calendar
    When  I select 10 as from day, 7 as from month, 2018 as from year
    And   I select 30 as until day, 01 as until month, 2021 as until year
    And   I submit
    Then  Corresponding date filter is applied

  Scenario: as user I can search performances by specifying dates in calendar
    When  I open calendar
    When  I select 29 as from day, 7 as from month, 2020 as from year
    And   I select 10 as until day, 6 as until month, 2022 as until year
    And   I submit
    Then  Corresponding date filter is applied

