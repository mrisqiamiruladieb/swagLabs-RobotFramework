*** Settings ***
Library         SeleniumLibrary
Test Setup      Open Browser    ${WebSauceDemo}     ${BROWSER}    
Test Teardown   Close Browser    

*** Variables ***
${WebSauceDemo}     https://saucedemo.com/
${BROWSER}          chrome

# Locator
${UsernameField}            //input[@id='user-name']
${PasswordField}            //input[@name='password']
${LoginButton}              //input[@type='submit'][@value='Login']
${TwitterButton}            //a[@target='_blank'][text()[contains(., 'Twitter')]]
${FacebookButton}           //a[@target='_blank'][text()[contains(., 'Facebook')]]
${LinkedInButton}           //a[@target='_blank'][text()[contains(., 'LinkedIn')]]

*** Keywords ***
User have login
    Input Text      ${UsernameField}    error_user
    Input Text      ${PasswordField}    secret_sauce
    Click Element   ${LoginButton}
    Sleep           1s  

User verify twitter link button
    Wait Until Element Is Visible   ${TwitterButton}    10s

User click twitter link button
    Click Element   ${TwitterButton}
    Sleep           1s

User verify twitter link result
    Switch Window   NEW
    Wait For Expected Condition     Url To Be   https://twitter.com/saucelabs

User verify facebook link button
    Wait Until Element Is Visible   ${FacebookButton}   10s

User click facebook link button
    Click Element   ${FacebookButton}
    Sleep           1s

User verify facebook link result
    Switch Window   NEW
    Wait For Expected Condition     Url To Be   https://web.facebook.com/saucelabs?_rdc=1&_rdr

User verify linkedin link button
    Wait Until Element Is Visible   ${LinkedInButton}   10s
    
User click linkedin link button
    Click Element   ${LinkedInButton}
    Sleep           1s
    
User verify linkedin link result
    Switch Window   NEW
    Wait For Expected Condition     Url To Be   https://www.linkedin.com/company/sauce-labs/

***Test Cases ***
Twitter Footer Links
    Maximize Browser Window
    User have login
    User verify twitter link button
    User click twitter link button
    User verify twitter link result

Facebook Footer Links
    Maximize Browser Window
    User have login
    User verify facebook link button
    User click facebook link button
    User verify facebook link result

LinkedIn Footer Links
    Maximize Browser Window
    User have login
    User verify linkedin link button
    User click linkedin link button
    User verify linkedin link result