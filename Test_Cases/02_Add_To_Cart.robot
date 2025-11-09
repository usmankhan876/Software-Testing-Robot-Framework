*** Settings ***
Documentation       Sauce Demo Feature: Add an Item to the Shopping Cart.
Library             SeleniumLibrary
Resource            ../Resources/Common_Keywords.robot
Suite Setup         Open Browser To App
Suite Teardown      Close App
Test Setup          Open Browser To App
Test Teardown       Close App
Test Timeout        20s

*** Variables ***
# Locators for Login Page
${USERNAME_FIELD}       id:user-name
${PASSWORD_FIELD}       id:password
${LOGIN_BUTTON}         id:login-button

# Locators for Product Page
${FIRST_ADD_TO_CART_BTN}    id:add-to-cart-sauce-labs-backpack
${REMOVE_BUTTON}            id:remove-sauce-labs-backpack
${CART_BADGE}               class:shopping_cart_badge

*** Test Cases ***
User Can Add Item To Cart And Verify Count
    Login To Inventory Page
    # Add First Product To Cart
    # Verify Cart Badge And Button
    # Remove Product From Cart
    # Verify Cart Badge And Button


*** Keywords ***
Login To Inventory Page
    [Documentation]    Logs in with valid credentials to reach the inventory page.
    Input Text          ${USERNAME_FIELD}    ${VALID_USERNAME}
    Input Password      ${PASSWORD_FIELD}    ${VALID_PASSWORD}
    
