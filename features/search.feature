Feature: Search for streams

Scenario Outline:
  Given I am on the search streams page
  When I search for <search_term>
  Then I will see the movie <movie_title> in results

Examples:
  | search_term | movie_title                        |
  | batman      | Batman Begins                      |
  | matrix      | The Matrix                         |
  | star wars   | Star Wars: Episode IV - A New Hope |
