@ignore
Feature: Login

  @login
  Scenario: Login
    * print 'DEFAULT: login to railway'
    * input(loginpage.usernameTextbox, userData.validUser.username)
    * input(loginpage.passwordTextbox, userData.validUser.password)
    * click(loginpage.loginButton)