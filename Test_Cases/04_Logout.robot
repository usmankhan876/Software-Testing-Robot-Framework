*** Settings ***
Documentation       Sauce Demo Feature: Verify Logout
Library             SeleniumLibrary
Resource            ../Resources/Common_Keywords.robot
Suite Setup         Open Browser To App
Suite Teardown      Close App
Test Timeout        20s

*** Test Cases ***
User Can Successfully Log Out
    [Documentation]    Logs in and verifies that the logout works.
    Login To Inventory Page
    Open Menu And Click Logout
    Wait Until Element Is Visible    id:login-button    timeout=10s
    Page Should Contain Element       id:login-button
    Log To Console     Logout successful.

*** Keywords ***
Open Menu And Click Logout
    [Documentation]    Opens the sidebar menu and clicks the logout link.
    Click Element        id:react-burger-menu-btn
    Wait Until Element Is Visible    id:logout_sidebar_link    timeout=5s
    Click Element        id:logout_sidebar_link
    Sleep                1s
