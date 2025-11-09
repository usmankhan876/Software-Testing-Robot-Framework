*** Settings ***
Documentation       Sauce Demo Feature: Full End-to-End Checkout Flow.
Library             SeleniumLibrary
Resource            ../Resources/Common_Keywords.robot
Suite Setup         Open Browser To App
Suite Teardown      Close App
Test Timeout        30s

*** Variables ***
# Locators for Login Page
${USERNAME_FIELD}       id:user-name
${PASSWORD_FIELD}       id:password
${LOGIN_BUTTON}         id:login-button

# Locators for Inventory Page
${FIRST_ADD_TO_CART_BTN}    id:add-to-cart-sauce-labs-backpack
${CART_BADGE}               class:shopping_cart_badge
${CART_LINK}                class:shopping_cart_link

# Locators for Checkout Pages
${CHECKOUT_BTN}             id:checkout
${FIRST_NAME_FIELD}         id:first-name
${LAST_NAME_FIELD}          id:last-name
${POSTAL_CODE_FIELD}        id:postal-code
${CONTINUE_BTN}             id:continue
${FINISH_BTN}               id:finish
${BACK_TO_PRODUCTS_BTN}     id:back-to-products

# Test Data
${FIRST_NAME}               John
${LAST_NAME}                Doe
${POSTAL_CODE}              90210
${PRODUCT_NAME}             Sauce Labs Backpack

*** Test Cases ***
User Can Complete Full Checkout Process
    Login And Add Item
    Navigate To Checkout
    Enter Customer Information
    Verify And Finish Order
    Verify Order Confirmation

*** Keywords ***
Login And Add Item
    [Documentation]    Logs in and adds the first item to the cart.
    Input Text          ${USERNAME_FIELD}    ${VALID_USERNAME}
    Input Password      ${PASSWORD_FIELD}    ${VALID_PASSWORD}
    Click Button        ${LOGIN_BUTTON}
    Wait Until Location Contains    /inventory.html    timeout=10s
    Wait Until Element Is Visible  ${FIRST_ADD_TO_CART_BTN}    timeout=10s
    Click Button        ${FIRST_ADD_TO_CART_BTN}
    Wait Until Element Is Visible  ${CART_BADGE}    timeout=5s
    Log To Console      Login and add-to-cart completed.

Navigate To Checkout
    [Documentation]    Opens cart and proceeds to checkout.
    Click Element       ${CART_LINK}
    Wait Until Page Contains  Your Cart
    Click Button        ${CHECKOUT_BTN}
    Wait Until Page Contains  Checkout: Your Information

Enter Customer Information
    [Documentation]    Fills out the checkout information form.
    Input Text          ${FIRST_NAME_FIELD}    ${FIRST_NAME}
    Input Text          ${LAST_NAME_FIELD}     ${LAST_NAME}
    Input Text          ${POSTAL_CODE_FIELD}   ${POSTAL_CODE}
    Click Button        ${CONTINUE_BTN}
    Wait Until Page Contains  Checkout: Overview

Verify And Finish Order
    [Documentation]    Verifies the item is in the overview and finishes the order.
    Page Should Contain       ${PRODUCT_NAME}
    Page Should Contain       Payment Information
    Click Button              ${FINISH_BTN}

Verify Order Confirmation
    [Documentation]    Confirms the success message and returns to inventory.
    Wait Until Page Contains  Checkout: Complete!    timeout=10s
    Wait Until Page Contains  Thank you for your order!
    Click Button              ${BACK_TO_PRODUCTS_BTN}
    # Wait Until Location Contains /inventory.html
    Log To Console            E2E Checkout Successful
