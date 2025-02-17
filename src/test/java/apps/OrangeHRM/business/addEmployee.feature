@ignore
Feature: Add Employee

  @login
  Scenario: Add Employee

    * print 'DEFAULT: add new empployee to OrangeHRM'
    * input(pim.firstnameTextBox, employeeData.validEmployee.firstname)
    * input(pim.lastnameTextBox, employeeData.validEmployee.lastname)
    * input("//label[text()='Employee Id']/parent::div/following-sibling::div/input", ["29298", Key.TAB, Key.TAB, Key.TAB])
