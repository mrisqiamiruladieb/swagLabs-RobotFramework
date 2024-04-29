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
${AddSauceLabsBikeLight}    name:add-to-cart-sauce-labs-bike-light
${ShoppingCartBadge1}       //span[@class='shopping_cart_badge'][text()[contains(., '1')]]
${CartButton}               //a[@class='shopping_cart_link']
${OpenMenuButton}           //button[@id='react-burger-menu-btn'][text()[contains(., 'Open Menu')]]
${AllItemsButton}           id:inventory_sidebar_link
${AboutButton}              id:about_sidebar_link
${ResetAppStateButton}      id:reset_sidebar_link
${ShoppingCartBadge1}       //span[@class='shopping_cart_badge'][text()[contains(., '1')]]

*** Keywords ***
User has logged in
    Input Text      ${UsernameField}    error_user
    Input Text      ${PasswordField}    secret_sauce
    Click Element   ${LoginButton}
    Sleep           1s   

User verify product to add to cart
    Wait Until Element Is Visible     ${AddSauceLabsBikeLight}    10s

User click add product to cart button
    Click Element   ${AddSauceLabsBikeLight}
    Sleep           1s

User verify cart contents
    Wait Until Element Is Visible   ${ShoppingCartBadge1}   10s 

User click cart button
    Click Element   ${CartButton}
    Sleep           1s

User verify open menu link button
    Wait Until Element Is Visible   ${OpenMenuButton}   10s

User click open menu link button
    Click Element   ${OpenMenuButton}
    Sleep           1s
    
User verify all items button
    Wait Until Element Is Visible   ${AllItemsButton}   10s
    
User click all items button
    Click Element   ${AllItemsButton}
    Sleep           1s

User verify all items button result
    Wait Until Element Is Visible   //span[@class='title'][contains(text(), 'Products')]    10s

User verify about button
    Wait Until Element Is Visible   ${AboutButton}  10s

User click about button
    Click Element   ${AboutButton}
    Sleep           1s

User verify about button result
    Wait For Expected Condition     Url To Be     https://saucelabs.com/

User verify reset app state button
    Wait Until Element Is Visible   ${ResetAppStateButton}  10s

User click reset app state button
    Click Element   ${ResetAppStateButton}
    Sleep           1s

User verify reset app state result
    Wait Until Element Is Not Visible   ${ShoppingCartBadge1}   10s

*** Test Cases ***
All Items Action Open Menu
    Maximize Browser Window
    User has logged in
    User verify product to add to cart
    User click add product to cart button
    User verify cart contents
    User click cart button
    User verify open menu link button
    User click open menu link button
    User verify all items button
    User click all items button
    User verify all items button result

About Action Open Menu
    Maximize Browser Window
    User has logged in
    User verify open menu link button
    User click open menu link button
    User verify about button
    User click about button
    User verify about button result

Reset App State Action Open Menu
    Maximize Browser Window
    User has logged in
    User verify product to add to cart
    User click add product to cart button
    User verify cart contents
    User click open menu link button
    User verify reset app state button
    User click reset app state button
    User verify reset app state result