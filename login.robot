*** Settings ***
Library                     SeleniumLibrary
Test Setup                  Open Browser    ${WebSauceDemo}     ${BROWSER}    
Test Teardown               Close Browser       

*** Variables ***
${WebSauceDemo}             https://saucedemo.com/
${BROWSER}                  chrome

# Locator
${UsernameField}            //input[@id='user-name']
${PasswordField}            //input[@name='password']
${LoginButton}              //input[@type='submit'][@value='Login']

*** Keywords ***
Input Username
    Input Text      ${UsernameField}    performance_glitch_user

Input invalid Username
    Input Text      ${UsernameField}    this_is_wrong

Input Password
    Input Text      ${PasswordField}    secret_sauce

Input invalid Password
    Input Text      ${PasswordField}    secret_agent

Click button login
    Click Element   ${LoginButton}
    Sleep           1s

Verify on login page
    Page Should Contain     Sauce Labs Bike Light

Get Error Message
    Page Should Contain     Epic sadface: Username and password do not match any user in this service

*** Test Cases ***
User login with valid data
    Maximize Browser Window
    Input Username
    Input Password
    Click button login
    Verify on login page

User login with invalid account
    Maximize Browser Window
    Input invalid Username
    Input invalid Password
    Click button login
    Get Error Message