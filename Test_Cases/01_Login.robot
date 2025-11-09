*** Settings ***
Documentation       Sauce Demo (Swag Labs) Login Test.
Resource            ../Resources/Common_Keywords.robot
Library             SeleniumLibrary
Suite Setup         Open Browser To App
Suite Teardown      Close App
Test Setup          Open Browser To App
Test Teardown       Close App
Test Timeout        50s

*** Variables ***
# Locators for the Login Page
${USERNAME_FIELD}       id:user-name
${PASSWORD_FIELD}       id:password
${LOGIN_BUTTON}         id:login-button

# Locator for the Inventory Page
${INVENTORY_HEADER}     id:header_container

*** Test Cases ***
User Can Successfully Log In To Inventory Page
    Enter Standard Credentials
    Verify Successful Login

*** Keywords ***
Enter Standard Credentials
    [Documentation]    Inputs the standard valid credentials.
    Input Text          ${USERNAME_FIELD}    ${VALID_USERNAME}
    Input Password      ${PASSWORD_FIELD}    ${VALID_PASSWORD}
    Click Button        ${LOGIN_BUTTON}

Verify Successful Login
    [Documentation]    Verifies successful navigation to the inventory page.
    Wait Until Element Is Visible    ${INVENTORY_HEADER}    timeout=10s
    Location Should Contain          /inventory.html
    Wait Until Page Contains         Products
    Log To Console                   Login to Inventory Page Successful!
