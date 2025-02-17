@ignore
Feature: login

  @login
  Scenario: login
    * print 'DEFAULT: login to OrangeHRM'
    * input(loginpage.usernameTextBox, userData.validUser.username)
    * input(loginpage.passwordTextBox, userData.validUser.password)
    * click(loginpage.loginButton)