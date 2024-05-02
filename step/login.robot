*** Settings ***
Library                     SeleniumLibrary
Library                     String
Test Setup                  Open Browser    ${WebSauceDemo}     ${BROWSER}    
Test Teardown               Close Browser       
Variables                   ../resources/login_locators.yaml

*** Variables ***
${WebSauceDemo}             https://saucedemo.com/
${BROWSER}                  chrome

*** Keywords ***
Input Username
    Input Text      ${UsernameField}    performance_glitch_user

Input invalid Username
    ${randomNumbers}  Generate Random String   4   [NUMBERS]  
    Input Text      ${UsernameField}    this_is_wrong${randomNumbers}

Input Password
    Input Text      ${PasswordField}    secret_sauce

Input invalid Password
    ${randomNumbers}  Generate Random String   4   [NUMBERS]  
    Input Text      ${PasswordField}    secret_agent${randomNumbers}

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