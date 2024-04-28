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
${AddSauceLabsBackpack}     id:add-to-cart-sauce-labs-backpack
${AddSauceLabsBikeLight}    name:add-to-cart-sauce-labs-bike-light
${AddSauceLabsBoltT-Shirt}  id:add-to-cart-sauce-labs-bolt-t-shirt
${AddSauceLabsFleeceJacket}     name:add-to-cart-sauce-labs-fleece-jacket
${AddSauceLabsOnesie}       id:add-to-cart-sauce-labs-onesie
${AddTest.allTheThings()T-Shirt(Red)}   name:add-to-cart-test.allthethings()-t-shirt-(red)
${RemoveSauceLabsBackpack}     id:remove-sauce-labs-backpack
${RemoveSauceLabsBikeLight}    name:remove-sauce-labs-bike-light
${RemoveSauceLabsBoltT-Shirt}  id:remove-sauce-labs-bolt-t-shirt
${RemoveSauceLabsFleeceJacket}  name:remove-sauce-labs-fleece-jacket
${RemoveSauceLabsOnesie}       id:remove-sauce-labs-onesie
${RemoveTest.allTheThings()T-Shirt(Red)}    name:remove-test.allthethings()-t-shirt-(red)
${ShoppingCartBadge1}       //span[@class='shopping_cart_badge'][text()[contains(., '1')]]
${ShoppingCartBadge2}       //span[@class='shopping_cart_badge'][text()[contains(., '2')]]
${ShoppingCartBadge3}       //span[@class='shopping_cart_badge'][text()[contains(., '3')]]
${ShoppingCartBadge4}       //span[@class='shopping_cart_badge'][text()[contains(., '4')]]
${ShoppingCartBadge5}       //span[@class='shopping_cart_badge'][text()[contains(., '5')]]
${ShoppingCartBadge6}       //span[@class='shopping_cart_badge'][text()[contains(., '6')]]
${CartButton}               //a[@class='shopping_cart_link']
${ContinueShoppingButton}   name:continue-shopping
${LogoutButton}             //a[@id='logout_sidebar_link'][text()[contains(., 'Logout')]]
${CheckoutButton}           //button[@class='btn btn_action btn_medium checkout_button '][text()[contains(., 'Checkout')]]
${FirstNameField}           id:first-name
${LastNameField}            name:lastName
${Zip_PostalCodeField}      id:postal-code
${ContinueButton}           name:continue
${FinishButton}             //button[@data-test='finish'][text()[contains(., 'Finish')]]
${BackHomeButton}           id:back-to-products
${CancelButton}             //button[@data-test='cancel']

*** Keywords ***
Input Username
    Input Text      ${UsernameField}    performance_glitch_user

Input Password
    Input Text      ${PasswordField}    secret_sauce

Click button login
    Click Element   ${LoginButton}
    Sleep           1s

Verify products to add to cart
    Wait Until Element Is Visible   ${AddSauceLabsBackpack}    10s

Click Add Products To Cart
    Click Element   ${AddSauceLabsBackpack}
    Wait Until Element Is Visible   ${ShoppingCartBadge1}   10s
    Click Element   ${AddSauceLabsBikeLight}
    Wait Until Element Is Visible   ${ShoppingCartBadge2}   10s
    Click Element   ${AddSauceLabsBoltT-Shirt}
    Wait Until Element Is Visible   ${ShoppingCartBadge3}   10s
    Click Element   ${AddSauceLabsFleeceJacket}
    Wait Until Element Is Visible   ${ShoppingCartBadge4}   10s
    Click Element   ${AddSauceLabsOnesie}
    Wait Until Element Is Visible   ${ShoppingCartBadge5}   10s
    Click Element   ${AddTest.allTheThings()T-Shirt(Red)}

Verifies The Number Of Products Added
    Wait Until Element Is Visible   ${ShoppingCartBadge6}   10s

Click The Cart Button
    Click Element   ${CartButton}
    Sleep           1s

Verify Products To Remove From Cart
    Wait Until Element Is Visible   ${RemoveSauceLabsBackpack}  10s

Click Remove Products From Cart
    Click Element   ${RemoveSauceLabsBackpack}
    Wait Until Element Is Visible   ${ShoppingCartBadge5}   10s
    Click Element   ${RemoveSauceLabsBikeLight}
    Wait Until Element Is Visible   ${ShoppingCartBadge4}   10s
    Click Element   ${RemoveSauceLabsBoltT-Shirt}
    Wait Until Element Is Visible   ${ShoppingCartBadge3}   10s
    Click Element   ${RemoveSauceLabsFleeceJacket}
    Wait Until Element Is Visible   ${ShoppingCartBadge2}   10s
    Click Element   ${RemoveSauceLabsOnesie}

Verifies The Number Of Products Removed
    Wait Until Element Is Visible   ${ShoppingCartBadge1}   10s

Click Continue Shopping Button
    Click Element   ${ContinueShoppingButton}
    Sleep   1s

Verify Remove Products Result
    Wait Until Element Is Visible   ${ShoppingCartBadge1}   10s

Verify Checkout Button
    Wait Until Element Is Visible   ${CheckoutButton}       10s

Click Checkout Button
    Click Element   ${CheckoutButton}
    Sleep   1s

Verify personal data checkout page
    Wait Until Element Is Visible   ${FirstNameField}   10s
    Wait Until Element Is Visible   ${LastNameField}   10s
    Wait Until Element Is Visible   ${Zip_PostalCodeField}   10s
    Wait Until Element Is Visible   ${ContinueButton}   10s

Fill data on personal data checkout page
    Input Text  ${FirstNameField}   Red
    Input Text  ${LastNameField}    Bulls
    Input Text  ${Zip_PostalCodeField}  12321  

Click continue button
    Click Element   ${ContinueButton}
    Sleep   1s

Verify checkout overview page
    Wait Until Element Is Visible   //span[@class='title'][text()[contains(., 'Checkout: Overview')]]   10s
    Wait Until Element Is Visible   ${FinishButton}   10s
    Wait Until Element Is Visible   ${CancelButton}   10s

Click finish button
    Click Element   ${FinishButton}
    Sleep   1s

Verify checkout result
    Wait Until Element Is Visible   //span[@class='title'][text()[contains(., 'Checkout: Complete!')]]  10s
    Wait Until Element Is Visible   ${BackHomeButton}   10s

Click back to products button
    Click Element   ${BackHomeButton}
    Sleep   1s

Verify products page
    Wait Until Element Is Visible   //*[@class='title'][text()[contains(., 'Products')]]    10s

Click Cancel Button
    Click Element   ${CancelButton}
    Sleep   1s

*** Test Cases ***
Add Remove Products
    Maximize Browser Window
    Input Username
    Input Password
    Click button login
    Verify products to add to cart
    Click Add Products To Cart
    Verifies The Number Of Products Added
    Click The Cart Button
    Verify Products To Remove From Cart
    Click Remove Products From Cart
    Verifies The Number Of Products Removed
    Click Continue Shopping Button
    Verify Remove Products Result

Checkout
    Maximize Browser Window
    Input Username
    Input Password
    Click button login
    Verify products to add to cart
    Click Add Products To Cart
    Verifies The Number Of Products Added
    Click The Cart Button
    Verify Checkout Button
    Click Checkout Button
    Verify personal data checkout page
    Fill data on personal data checkout page
    Click continue button
    Verify checkout overview page
    Click finish button
    Verify checkout result
    Click back to products button
    Verify products page

Cancel Checkout
    Maximize Browser Window
    Input Username
    Input Password
    Click button login
    Verify products to add to cart
    Click Add Products To Cart
    Verifies The Number Of Products Added
    Click The Cart Button
    Verify Checkout Button
    Click Checkout Button
    Verify personal data checkout page
    Fill data on personal data checkout page
    Click continue button
    Verify checkout overview page
    Click Cancel Button
    Verify products page