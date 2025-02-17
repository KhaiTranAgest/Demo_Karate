Feature:

  Background:
    * url 'https://jsonplaceholder.typicode.com'
    * def postPayload =
      """
      {
        "title": "This is sample test",
        "body": "This is body of sample test",
        "userId": 1
      }
      """

  Scenario: Create a new post
    Given path '/posts'
    And request postPayload
    When method POST
    Then status 201
    And match response ==
      """
      {
        "title": "This is sample test",
        "body": "This is body of sample test",
        "userId": 1,
        "id": '#present'
      }
      """
    And def current_id = response.id
    * print "Post created, id:" + current_id