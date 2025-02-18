Feature: Create a new job vacancy

  Background:
    * startConfig("chrome_local")
    * def loginpage = locator('OrangeHRM', 'loginpage')
    * def userData = data('OrangeHRM', 'users')
    * def appData = data('OrangeHRM', 'appData')
    * def dashboard = locator('OrangeHRM', 'dashboard')
    * def recruitment = locator('OrangeHRM','recruitment')
    * def vacancy = data('OrangeHRM','users')

  Scenario: Create a new job vacancy

  #Pre-condition: User is logged in to OrangeHRM

    * driver appData.url

    * call OrangeHRM.login

    * delay(5000)

    #1. Navigate to the Recruitment module, go to Vacancies tab

    * click(dashboard.recruitmentTab)
    * delay(1000)
    #VP. Recruitment module page is displayed
    * waitFor(recruitment.recruitmentTitle)
    * delay(1000)
    * click(recruitment.vacanciesTab)
    * delay(1000)

    #2. Click "Add Job Vacancy"

    * click(recruitment.addVacancies)
    * delay(2000)
    #VP. Add Job Vacancy form is displayed
    * waitFor(recruitment.vacanciesForm)
    * delay(1000)

    #3. Fill in the required fields

    * call OrangeHRM.createNewJob

    #VP. Fields are filled

    * delay(3000)
    * match recruitment.vacancyName != null
    * match recruitment.jobTitle != null
    * match recruitment.description != null
    * match recruitment.hiringManager != null
    * match recruitment.numberPosition != null

    #4. Click "Save"

    * delay(1000)
    * click(recruitment.saveButton)



