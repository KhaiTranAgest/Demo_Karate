Feature: Add a new employee with a profile picture

  Background:
    * startConfig("chrome_local")
    * def loginpage = locator('OrangeHRM', 'loginpage')
    * def userData = data('OrangeHRM', 'users')
    * def appData = data('OrangeHRM', 'appData')
    * def dashboard = locator('OrangeHRM', 'dashboard')
    * def pim = locator('OrangeHRM', 'pim')
    * def employeeData =  data('OrangeHRM','users')


  Scenario: Add a new employee

  # Pre-Condition: User is logged in to OrangeHRM and is on the dashboard

  * driver appData.url

  * call OrangeHRM.login

  * delay(5000)

  * match exists(dashboard.dashboardHeader) == true

  # 1. Click on the "PIM" tab

    * click(dashboard.pimTabIcon)

   # VP. PIM menu is displayed

    * waitFor(pim.pimHeader)

   # 2. Click on "Add Employee"

    * click(pim.addEmployee)

    #VP. Add Employee form is displayed

    #* waitFor(pim.employeeTitle)

    #3. Enter a valid First Name
    #4. Enter a valid Last Name

    * call OrangeHRM.addEmployee

    * delay(2000)
    #VP. First name field is populated
    #VP. Last name filed is populated

    #* waitFor(pim.firstnameTextBox)

    #* waitFor(pim.lastnameTextBox)

    #5. Select the "Browse" button for the "Profile Picture" field

    * click(pim.employeeImage)
    * locate("//div[@class='employee-image-wrapper']//img[@alt='profile picture']").click()
    * click("//div[@class='employee-image-wrapper']//img[@alt='profile picture']")
    * locate(pim.employeeImage).click()
    * locate(pim.employeeImage).click()

    * click('abc')


    # 5. Select the "Browse" button for the "Profile Picture" field
    # VP. File upload dialog opens

    * robot {highlight: true}
    * print "windows:" + robot.allWindows
    # robot.root.locate("//window{Open}")
    # robot.root.exists("//window[@name='Open']")
    # match robot.windowExist('Open') == true
    * delay(5999999)

    * def openWindow = robot.windowOptional('Open')
    * match openWindow.exists() == true

    #6. Select a valid image file (e.g., .jpg, .png)

    # robot {highlight: true}
    # robot.root.locate("//window{Open}")
    * robot.input('C:\\khai.tran\\khai-29.jpg')
    * delay (2000)

    #VP. File is selected

    * def dialogOpen = robot.windownOptional('Open').locate('//combobox{File name:}').value
    * match dialogOpen != null

    #7. Click "Open"

    * robot.input(Key.Enter)
    * delay(5000)

    #8. Click "Save" button

    * click(pim.saveButton)
    * delay(3000)

  #VP. A success message is displayed indicating "Employee has been saved"