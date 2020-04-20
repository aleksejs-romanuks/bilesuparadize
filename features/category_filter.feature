@CategoryFilter
Feature: Category Filter

  Scenario: as user I can search performances by specifying performance category
    When  I open bilesuparadize filter page
    And   I specify -- Operete as performance category
    Then  Performances belonged to specified category are listed
