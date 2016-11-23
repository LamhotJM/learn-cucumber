Feature: Login
  
  User who has registered with bukalapak account before can logged in with these methods:
  1. username
  2. email
  3. facebook
  4. google+

  Scenario: User login using username
    Given there is user that have been registered
    When user login
    Then user will see their name on the navbar
