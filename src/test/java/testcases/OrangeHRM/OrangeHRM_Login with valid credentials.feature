Feature: Login with valid credentials

  Background:
    * startConfig("chrome")
    * def loginpage = locator('OrangeHRM', 'loginpage')
    * def userData = data('OrangeHRM', 'users')
    * def appData = data('OrangeHRM', 'appData')
    * def dashboard = locator('OrangeHRM', 'dashboard')

  Scenario: Log in

   # Pre-Condition: User is on the OrangeHRM login page

   * driver appData.url

   # 1. Enter a valid username
   # 2. Enter a valid password
   # 3. Click on the "Login" button

   * call OrangeHRM.login

   # VP. User is redirected to the OrangeHRM dashboard

    * waitFor(dashboard.dashboardHeader)

