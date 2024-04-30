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
${ProductSortButton}        //select[@class='product_sort_container']
${AscNameProductSortOption}     //option[@value='az']

*** Keywords ***
User is on products page
    Input Text      ${UsernameField}    error_user
    Input Text      ${PasswordField}    secret_sauce
    Click Element   ${LoginButton}
    Sleep           1s  
    Wait Until Element Is Visible   ${ProductSortButton}   10s

User click product sort button
    Click Element   ${ProductSortButton}
    Sleep           1s

User verify ascending name product sort option
    Wait Until Element Is Visible   ${AscNameProductSortOption}     10s

User click ascending name product sort option
    Click Element   ${AscNameProductSortOption}
    Sleep           1s

User verify ascending name product sort result
    Wait Until Element Is Visible   //div[@class='inventory_item'][contains(., 'Sauce Labs Backpack')]  10s

*** Test Cases ***
Ascending Name Product Filters
    Maximize Browser Window
    User is on products page
    User click product sort button
    User verify ascending name product sort option
    User click ascending name product sort option
    User verify ascending name product sort result