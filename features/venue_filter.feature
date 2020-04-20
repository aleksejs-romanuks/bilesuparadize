@VenueFilter
Feature: Venue Filter

  Scenario: as user I can search performances by specifying performance venue
    When  I open bilesuparadize filter page
    And   I specify Aizkraukles Kultūras nams as performance venue
    Then  Performances located in selected venue are listed

  Scenario: as user I can search performances by specifying performance venue
    When  I open bilesuparadize filter page
    And   I specify Bauskas pils as performance venue
    Then  Performances located in selected venue are listed

  Scenario: as user I can search performances by specifying performance venue
    When  I open bilesuparadize filter page
    And   I specify Berģu Kultūras centrs as performance venue
    Then  Performances located in selected venue are listed

  Scenario: as user I can search performances by specifying performance venue
    When  I open bilesuparadize filter page
    And   I specify CATA kultūras nams, Cēsis as performance venue
    Then  Performances located in selected venue are listed

  Scenario: as user I can search performances by specifying performance venue
    When  I open bilesuparadize filter page
    And   I specify Doles tautas nams as performance venue
    Then  Performances located in selected venue are listed



