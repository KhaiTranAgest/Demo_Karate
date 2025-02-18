Feature: View timesheet record

  Background:
    * startConfig("chrome_local")
    * def loginpage = locator('OrangeHRM', 'loginpage')
    * def userData = data('OrangeHRM', 'users')
    * def appData = data('OrangeHRM', 'appData')
    * def dashboard = locator('OrangeHRM', 'dashboard')
    * def timesheet = locator('OrangeHRM','timesheet')



  Scenario: View timesheet record

    # Pre-Condition: User is logged in to OrangeHRM and is on the dashboard

    * driver appData.url

    * call OrangeHRM.login

    * delay(5000)


    #1. Navigate to the Time module

    * click(dashboard.timesheetTabIcon)

    #VP. Time module page is displayed

    * waitFor(timesheet.timesheetHeader)

    #2. Click "Reports" -> "Employee Reports"

    * click(timesheet.reportNav)
    * click(timesheet.employeeReportNav)
    * delay(3000)

    #3. Enter input for Employee Name and Date

    * def username = text(dashboard.employeeName)

    * def getStartOfCurrentWeek =
      """
      function() {
        var today = new Date();
        var startOfWeek = new Date(today.setDate(today.getDate() - today.getDay()));
        return startOfWeek.toISOString().split('T')[0];
      }
      """
    * delay(3000)
    
    * def getEndOfCurrentWeek =
      """
      function() {
        var today = new Date();
        var endOfWeek = new Date(today.setDate(today.getDate() + (6 - today.getDay())));
        return endOfWeek.toISOString().split('T')[0];
      }
      """

    * input(timesheet.employeeName, username)
    * input(timesheet.dateFrom, getStartOfCurrentWeek())
    * input(timesheet.dateTo, getEndOfCurrentWeek())

    * delay(3000)

    * def convertDateFormat =
      """
      function(date) {
        var parts = date.split('-');
        return parts[0] + '-' + parts[2] + '-' + parts[1];
      }
      """

    # VP. Employee Name and Date range are entered correctly
    * match value(timesheet.employeeName) == username
    * match value(timesheet.dateFrom) == convertDateFormat(getStartOfCurrentWeek())
    * match value(timesheet.dateTo) == getEndOfCurrentWeek()


    #4. Click "View"
    * delay(2000)
    * click(timesheet.viewButton)
    * delay(2000)