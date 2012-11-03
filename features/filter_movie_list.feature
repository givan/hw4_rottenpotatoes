Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

Background: movies have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |director|
  | Aladdin                 | G      | 25-Nov-1992  |n/a     |
  | The Terminator          | R      | 26-Oct-1984  |n/a     |
  | When Harry Met Sally    | R      | 21-Jul-1989  |n/a     |  
  | The Help                | PG-13  | 10-Aug-2011  |  	     |
  | Chocolat                | PG-13  | 5-Jan-2001   |        |
  | Amelie                  | R      | 25-Apr-2001  |        |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |        |
  | The Incredibles         | PG     | 5-Nov-2004   |        |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |        |
  | Chicken Run             | G      | 21-Jun-2000  |        |

  And  I am on the RottenPotatoes home page
  
Scenario: restrict to movies with 'PG' or 'R' ratings
  When I check the following ratings: PG, R
    And I press "Refresh"
  Then I should only see movies with these ratings 

Scenario: no ratings selected
  When I check the following ratings: PG, R
    And I press "Refresh"
    And I uncheck all ratings
    And I press "Refresh" 
  Then show me the page
 And I should only see movies with ratings: PG, R

Scenario: all ratings selected
  When I check all ratings
    And I press "Refresh"
  Then I should see all of the movies