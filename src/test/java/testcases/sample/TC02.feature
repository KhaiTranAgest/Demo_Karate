Feature:

  Scenario:
    * def tc01_output = call read('TC01.feature')
    * def id = tc01_output.current_id
    * print "id = " + id
