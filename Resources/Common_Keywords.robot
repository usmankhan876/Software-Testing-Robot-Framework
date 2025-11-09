*** Settings ***
Documentation       Common keywords and setup for Sauce Demo tests
Library             SeleniumLibrary

*** Variables ***
${BASE_URL}         https://www.saucedemo.com/
${BROWSER}          chrome

# Standard valid credentials
${VALID_USERNAME}   standard_user
${VALID_PASSWORD}   secret_sauce

*** Keywords ***
Open Browser To App
    [Documentation]    Opens the Sauce Demo login page in the selected browser.
    Open Browser       ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    id:user-name    timeout=10s
    Log To Console     Browser opened and navigated to Sauce Demo Login Page.

Close App
    [Documentation]    Closes the browser after test execution.
    Close Browser
    Log To Console     Browser closed successfully.

*** Keywords ***
Login To Inventory Page
    Input Text          id:user-name    ${VALID_USERNAME}
    Input Password      id:password     ${VALID_PASSWORD}
    Click Button        id:login-button
    Wait Until Location Contains    /inventory.html    timeout=10s

