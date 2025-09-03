*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}    https://volunteer-smart-beta.nu.ac.th/pwa_main
${BROWSER}      chrome
${DELAY}        0
${VALID USER}   phitsanulok
${VALID PASS}   29tbSOu@e?LQ
${ERROR URL}    ${LOGIN URL}

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Click Close Announcement
    Login Page Should Be Open

Go To Login Page
    Go To    ${LOGIN URL}
    Click Close Announcement
    Login Page Should Be Open

Click Close Announcement
    [Documentation]    Remove announcement modal and its backdrop if present
    # ตรวจสอบว่าป๊อปอัพโผล่ไหม (รอไม่เกิน 5 วินาที)
    ${popup}=    Run Keyword And Return Status
    ...          Wait Until Element Is Visible    css:div#announcementModal .btn    timeout=5s
    # ถ้ามี ให้ลบ modal, backdrop และคลาส modal-open ทิ้ง
    Run Keyword If    ${popup}
    ...    Execute Javascript    document.querySelector('#announcementModal')?.remove();
    Run Keyword If    ${popup}
    ...    Execute Javascript    var bg=document.querySelector('.modal-backdrop'); if(bg){bg.remove();}
    Run Keyword If    ${popup}
    ...    Execute Javascript    document.body.classList.remove('modal-open');
    Run Keyword If    ${popup}    Sleep    1s


Login Page Should Be Open
    [Documentation]    Wait until the login form appears
    Wait Until Element Is Visible    css:input#username    timeout=10s

Input Username
    [Arguments]    ${username}
    Wait Until Element Is Visible        css:input#username    timeout=10s
    Click Element                        css:input#username
    Input Text                           css:input#username    ${username}

Input Password
    [Arguments]    ${password}
    Wait Until Element Is Visible        css:input#password    timeout=10s
    Click Element                        css:input#password
    Input Text                           css:input#password    ${password}

Submit Credentials
    Wait Until Element Is Enabled        css:button[type="submit"]    timeout=10s
    Click Button                         css:button[type="submit"]

Welcome Page Should Be Open
    Wait Until Location Contains         /pwa_main?    timeout=20s
    Title Should Be                      vsmart-BETA

Login Should Have Failed
    Wait Until Location Is               ${ERROR URL}    timeout=10s
    Title Should Be                      vsmart-BETA