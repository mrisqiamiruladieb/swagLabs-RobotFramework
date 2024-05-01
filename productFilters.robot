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
${ProductSortButton}        //select[@class='product_sort_container'][@data-test='product-sort-container']
${AscNameProductSortOption}     //option[@value='az'][text()[contains(., 'Name (A to Z)')]]
${DescNameProductSortOption}    //option[@value='za'][text()[contains(., 'Name (Z to A)')]]
${AscPriceProductSortOption}     //option[@value='lohi'][text()[contains(., 'Price (low to high)')]]
${DescPriceProductSortOption}    //option[@value='hilo'][text()[contains(., 'Price (high to low)')]]

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

User verify descending name product sort option
    Wait Until Element Is Visible   ${DescNameProductSortOption}     10s

User click descending name product sort option
    Click Element   ${DescNameProductSortOption}
    Sleep           1s

User verify descending name product sort result
    Wait Until Element Is Visible   //div[@class='inventory_item'][contains(., 'Test.allTheThings() T-Shirt (Red)')]  10s

User verify ascending price product sort option
    Wait Until Element Is Visible   ${AscPriceProductSortOption}    10s

User click ascending price product sort option
    Click Element   ${AscPriceProductSortOption}
    Sleep           1s

User verify ascending price product sort result
    Wait Until Element Is Visible   //div[@class='inventory_item'][contains(., 'Sauce Labs Onesie')]  10s

User verify descending price product sort option
    Wait Until Element Is Visible   ${DescPriceProductSortOption}    10s

User click descending price product sort option
    Click Element   ${DescPriceProductSortOption}
    Sleep           1s
    
User verify descending price product sort result
    Wait Until Element Is Visible   //div[@class='inventory_item'][contains(., 'Sauce Labs Fleece Jacket')]  10s


*** Test Cases ***
Ascending Name Product Filters
    Maximize Browser Window
    User is on products page
    User click product sort button
    User verify ascending name product sort option
    User click ascending name product sort option
    User verify ascending name product sort result

Descending Name Product Filters
    Maximize Browser Window
    User is on products page
    User click product sort button
    User verify descending name product sort option
    User click descending name product sort option
    User verify descending name product sort result

Ascending Price Product Filters
    User is on products page
    User click product sort button
    User verify ascending price product sort option
    User click ascending price product sort option
    User verify ascending price product sort result

Descending Price Product Filters
    User is on products page
    User click product sort button
    User verify descending price product sort option
    User click descending price product sort option
    User verify descending price product sort result