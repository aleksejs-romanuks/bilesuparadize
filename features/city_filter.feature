@CityFilter
Feature: City Filter

  Scenario: as user I can search performances by specifying performance location city
    When  I open bilesuparadize filter page
    And   I specify Rīga as performance location city
    Then  Performances located in selected city are listed

  Scenario: as user I can search performances by specifying performance location city
    When  I open bilesuparadize filter page
    And   I specify Dobele as performance location city
    Then  Performances located in selected city are listed

  Scenario: as user I can search performances by specifying performance location city
    When  I open bilesuparadize filter page
    And   I specify Dāviņu pagasts as performance location city
    Then  Performances located in selected city are listed

  Scenario: as user I can search performances by specifying performance location city
    When  I open bilesuparadize filter page
    And   I specify Lūznava as performance location city
    Then  Performances located in selected city are listed

  Scenario: as user I can search performances by specifying performance location city
    When  I open bilesuparadize filter page
    And   I specify Bauskas novads as performance location city
    Then  Performances located in selected city are listed