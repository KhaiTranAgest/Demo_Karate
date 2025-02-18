@ignore
Feature: Add Employee

  @add
  Scenario: Add Employee

    * print 'DEFAULT: add new empployee to OrangeHRM'
    * input(pim.firstnameTextBox, employeeData.validEmployee.firstname)
    * input(pim.lastnameTextBox, employeeData.validEmployee.lastname)

    #* input("//label[text()='Employee Id']/parent::div/following-sibling::div/input", "")
