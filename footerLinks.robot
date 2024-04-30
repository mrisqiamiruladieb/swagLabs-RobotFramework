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

***Test Cases ***
Twitter Footer Links
    Maximize Browser Window
    User have login
    User verify twitter link button
    User click twitter link button
    User verify twitter link result