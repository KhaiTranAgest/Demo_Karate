@ignore
Feature: Create a new job vacancy

  @create
  Scenario: Create a new job vacancy

    * print 'DEFAULT: Create a new job vacancy to OrangeHRM'
    * input(recruitment.vacancyName, vacancy.addVacancy.vacancyName)
    * delay(1000)
    * mouse().move("div.oxd-select-text.oxd-select-text--active").click()
    * delay(2000)
    #* click(recruitment.jobTitle)
    #* click(recruitment.jobSelect)
    * mouse().move("div.oxd-select-text-input[tabindex='0']").click()
    * delay(1000)
    * input(recruitment.description, vacancy.addVacancy.decription)
    * input(recruitment.hiringManager, vacancy.addVacancy.hiringManager)
    * input(recruitment.numberPosition, vacancy.addVacancy.numberPosition)