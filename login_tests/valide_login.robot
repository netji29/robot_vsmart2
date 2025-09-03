*** Settings ***
Library         SeleniumLibrary
Resource        resource.robot

Suite Setup     Open Browser To Login Page
Suite Teardown  Go To Login Page

*** Variables ***
${USER}         ${VALID USER}
${PASS}         ${VALID PASS}

*** Test Cases ***
Valid Login
    [Documentation]    Smoke-test that a valid user can log in
    Input Username      ${USER}
    Input Password      ${PASS}
    Submit Credentials
    Welcome Page Should Be Open
