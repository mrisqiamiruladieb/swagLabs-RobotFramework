*** Settings ***
Library                     SeleniumLibrary
Test Setup                  Open Browser    ${WebSauceDemo}     ${BROWSER}    
Test Teardown               Close Browser       
Variables                   ../resources/login_locators.yaml
Variables                   ../resources/logout_locators.yaml

*** Variables ***
${WebSauceDemo}             https://saucedemo.com/
${BROWSER}                  chrome

*** Keywords ***
Input Username
    Input Text      ${UsernameField}    performance_glitch_user

Input Password
    Input Text      ${PasswordField}    secret_sauce

Click button login
    Click Element   ${LoginButton}
    Sleep           1s

Verify open menu button
    Wait Until Element Is Visible       ${OpenMenuButton}       10s

Click open menu button
    Click Element   ${OpenMenuButton}
    Sleep           1s

Verify logout button
    Wait Until Element Is Visible       ${LogoutButton}         10s

Click logout button
    Click Element   ${LogoutButton}
    Sleep           1s

Verify logout result
    Wait Until Element Is Visible       ${LoginButton}          10s
    Sleep           1s

*** Test Cases ***
User logout
    Maximize Browser Window
    Input Username
    Input Password
    Click button login
    Verify open menu button
    Click open menu button
    Verify logout button
    Click logout button
    Verify logout result