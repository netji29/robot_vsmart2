*** Settings ***
Resource    Setting.robot
Library    DateTime
Library    RequestsLibrary
Resource    ./Resource/checkResult.robot
Resource    ./Resource/Pattern_Check_Result.robot
Resource    ./Resource/Discord.robot

# Test Teardown    Update Result Status    Sheet1    ${sheet_id}
# Suite Teardown    Send Test Results to Discord    ${sheet_id}

*** Variables ***
${NOTEBOOK_PATH}    random_cid_name.ipynb  # Path to the Jupyter notebook file
${DATA_FILE}    get_username.ipynb
${Delay}    0s
${sheet_id}=    1h4rdR6xqOC7C8Aspy9AT-I3lD2sKXt_XxwDIxPk-Fuo


*** Test Cases ***
Username
    ${json_string}=    Get File    ${CURDIR}/json/data_test/username_json.json
    ${json_array}=    Evaluate    json.loads('''${json_string}''')    json
    
    # เข้าถึง object แรกในอาร์เรย์ (index 0)
    ${first_item}=    Get From List    ${json_array}    0
    
    # เข้าถึง values ของ keys ที่มีอยู่จริง
    ${province}=    Get From Dictionary    ${first_item}    province
    ${username}=    Get From Dictionary    ${first_item}    username
    ${password}=    Get From Dictionary    ${first_item}    password
    
    # แสดงค่าที่ได้
    Log    Province: ${province}
    Log    Username: ${username}
    Log    Password: ${password}

TC_1_001 | dwf_department_show_responsible_province

    Set Selenium Speed    ${Delay}
    ${json_string}=    Get File    ${CURDIR}/json/data_test/username_json.json
    ${json_array}=    Evaluate    json.loads('''${json_string}''')    json

    FOR    ${item}    IN    @{json_array}
        ${province}=    Get From Dictionary    ${item}    province
        ${username}=    Get From Dictionary    ${item}    username
        ${password}=    Get From Dictionary    ${item}    password

        Log    ------------------------------------------------------------------------${province}

        # ${citizen_id}   ${firstname}   ${lastname}   ${prefix}=    Run Notebook And Get Variables    random_cid_name.ipynb
        Login Vsmart    ${username}  ${password}
        Goto import doc case
        Wait Until Keyword Succeeds    1 min    100ms    Switch To New Window
        Sleep    3s  # Give time for the new window/tab to fully load
        FOR    ${i}    IN RANGE    3
            ${citizen_id}   ${firstname}   ${lastname}   ${prefix}=    Run Notebook And Get Variables    random_cid_name.ipynb
            Execute Javascript    window.location.reload();
            Sleep    3s  # Give time for the new window/tab to fully load
            Insert Consent Form
            Informer over 18 years old    ${citizen_id}    ${firstname}    ${lastname}    ${prefix}
            ${citizen_id}   ${firstname}   ${lastname}   ${prefix}=    Run Notebook And Get Variables    random_cid_name.ipynb
            People problem over 18 years old    ${citizen_id}    ${firstname}    ${lastname}    ${prefix}
            ${citizen_id}   ${firstname}   ${lastname}   ${prefix}=    Run Notebook And Get Variables    random_cid_name.ipynb
            Insert Family Memeber    ${citizen_id}    ${firstname}    ${lastname}    ${prefix}
            Random Info About Informer
            Insert House Condition    'Automated Test'
            ${backup_house_condition_2}    Set Variable    'Automated Test'
            Insert House Problem    'Automated test'
            ${backup_house_problem_2}    Set Variable    'Automated Test'
            Insert House Comment    'Automated test'
            ${backup_house_comment}    Set Variable    'Automated Test'
            ${backup_order}=    Random Order Value    xpath=//select[@name="order_name"]
            # Select From List By Value    xpath=//select[@name="order_name"]    '45'
            ${backup_money_help}=    Random Money Help    xpath=//input[@name="money_help"]
            ${backup_how_payment}=    Random How Payment Value    xpath=//select[@name="transfer_money_type"]
            ${backup_bank_name}=    Random Select By Text    xpath=//select[@name="bank_name"]
            Input Text    xpath=//input[@name='bank_branch']    automated test
            ${backup_bank_branch}    Set Variable    automated test
            Input Text    xpath=//input[@name='account_number']    1669931231
            ${backup_account_number}    Set Variable    1669931231
            Input Text    xpath=//input[@name='account_name']    automated test
            ${backup_account_name}    Set Variable    automated test
            ${backup_account_type}=    Random Select By Text    xpath=//select[@name="account_type"]
            
            Insert All Picture Inspect

            Click Element    xpath=//input[@value="บันทึกอย่างเดียว"]
            Handle Alert    ACCEPT
        END
        Sleep    5s
        Close All Browsers
    END


TC_1_001 | dwf_department_show_responsible_province

    Set Selenium Speed    ${Delay}
    ${json_string}=    Get File    ${CURDIR}/json/data_test/username_json.json
    ${json_array}=    Evaluate    json.loads('''${json_string}''')    json



    # ${citizen_id}   ${firstname}   ${lastname}   ${prefix}=    Run Notebook And Get Variables    random_cid_name.ipynb
    Login Vsmart    icetest33   88888888
    Goto import doc case
    Wait Until Keyword Succeeds    1 min    100ms    Switch To New Window
    Sleep    3s  # Give time for the new window/tab to fully load
    
    FOR    ${i}    IN RANGE    3
        ${citizen_id}   ${firstname}   ${lastname}   ${prefix}=    Run Notebook And Get Variables    random_cid_name.ipynb
        Execute Javascript    window.location.reload();
        Sleep    3s  # Give time for the new window/tab to fully load
        Insert Consent Form
        Informer over 18 years old    ${citizen_id}    ${firstname}    ${lastname}    ${prefix}
        ${citizen_id}   ${firstname}   ${lastname}   ${prefix}=    Run Notebook And Get Variables    random_cid_name.ipynb
        People problem over 18 years old    ${citizen_id}    ${firstname}    ${lastname}    ${prefix}
        ${citizen_id}   ${firstname}   ${lastname}   ${prefix}=    Run Notebook And Get Variables    random_cid_name.ipynb
        Insert Family Memeber    ${citizen_id}    ${firstname}    ${lastname}    ${prefix}
        Random Info About Informer
        Insert House Condition    'Automated Test'
        ${backup_house_condition_2}    Set Variable    'Automated Test'
        Insert House Problem    'Automated test'
        ${backup_house_problem_2}    Set Variable    'Automated Test'
        Insert House Comment    'Automated test'
        ${backup_house_comment}    Set Variable    'Automated Test'
        ${backup_order}=    Random Order Value    xpath=//select[@name="order_name"]
        # Select From List By Value    xpath=//select[@name="order_name"]    '45'
        ${backup_money_help}=    Random Money Help Set MAX    xpath=//input[@name="money_help"]    3000
        ${backup_how_payment}=    Random How Payment Value    xpath=//select[@name="transfer_money_type"]
        ${backup_bank_name}=    Random Select By Text    xpath=//select[@name="bank_name"]
        Input Text    xpath=//input[@name='bank_branch']    automated test
        ${backup_bank_branch}    Set Variable    automated test
        Input Text    xpath=//input[@name='account_number']    1669931231
        ${backup_account_number}    Set Variable    1669931231
        Input Text    xpath=//input[@name='account_name']    automated test
        ${backup_account_name}    Set Variable    automated test
        ${backup_account_type}=    Random Select By Text    xpath=//select[@name="account_type"]
        
        Insert All Picture Inspect

        Click Element    xpath=//input[@value="บันทึกอย่างเดียว"]
        Handle Alert    ACCEPT
    END

TC_2_001 | with json
    ${DATA_FILE_PATH}    Set Variable    ${CURDIR}${/}json${/}data_test/
    ${data}=    Read JSON Data    ${DATA_FILE_PATH}data1.json

    Set Selenium Speed    ${Delay}

    ${citizen_id}   ${firstname}   ${lastname}   ${prefix}=    Run Notebook And Get Variables    random_cid_name.ipynb
    Login Vsmart    icetest33   icetest#smart33
    Goto import doc case
    Wait Until Keyword Succeeds    1 min    100ms    Switch To New Window
    Sleep    3s  # Give time for the new window/tab to fully load
    Execute Javascript    window.location.reload();

    Fill Informer Form From JSON    ${data}
    Informer over 18 years old From JSON    ${data}
    Insert Family Memeber From JSON    ${data}
    Info About Informer From JSON    ${data}


    ${Type_Service}=    Set Variable    ${data['TypeService']}
    Select Random Multiple Checkboxes By Name FORM FIVE With Json    ${Type_Service}    modal_section5_
    Wait Until Element Is Visible    xpath=//a[@id='icon_checked_6']
    ${StatusProblem}=    Set Variable    ${data['StatusProblem']}
    Select Random Multiple Checkboxes By Name FORM SIX With Json    ${StatusProblem}    modal_section6_
    ${HelpingType}=    Set Variable    ${data['HelpingType']}
    Select Random Multiple Checkboxes By Name FORM SEVEN With Json    ${HelpingType}    modal_section7_
    ${Benefit}=    Set Variable    ${data['Benefit']}
    Select Random Multiple Checkboxes By Name FORM EIGHT With Json    ${Benefit}    modal_section8_


    ${VisitHome}=    Set Variable    ${data['VisitHome']}
    Execute JavaScript    document.querySelector('#s_housingconditions').value = '${VisitHome['s_housingconditions']}'    ARGUMENTS    1
    Execute JavaScript    document.querySelector('#s_problem').value = '${VisitHome['s_problem']}'    ARGUMENTS    1
    Execute JavaScript    document.querySelector('#s_comment').value = '${VisitHome['s_comment']}'    ARGUMENTS    1

    Select From List By Value    xpath=//select[@id='order_name']    ${VisitHome['order_name']}
    Input Text    xpath=//input[@id='money_help']    ${VisitHome['money_help']}
    Select From List By Value    xpath=//select[@id='transfer_money_type']    ${VisitHome['transfer_money_type']}
    Select From List By Value    xpath=//select[@id='bank_name']    ${VisitHome['bank_name']}
    Execute JavaScript    document.querySelector('#bank_branch').value = '${VisitHome['bank_branch']}'    ARGUMENTS    1
    Execute JavaScript    document.querySelector('#account_number').value = '${VisitHome['account_number']}'    ARGUMENTS    1
    Execute JavaScript    document.querySelector('#account_name').value = '${VisitHome['account_name']}'    ARGUMENTS    1
    Select From List By Value    xpath=//select[@name='account_type']    ${VisitHome['account_type']}
    
    Insert All Picture Inspect

    # Click Element    xpath=//input[@value="บันทึกอย่างเดียว"]
    # Handle Alert    ACCEPT

    # ${max_id}=    Get Max Table Row ID

    # Sleep    2s
    # Check Consent Form By JSON    ${data}    ${max_id}
    # Check Informer By JSON    ${data}    ${max_id}
    # Check Insert Family Member By Json    ${data}    ${max_id}



TC_2_002 | gen case some auto
    ${DATA_FILE_PATH}    Set Variable    ${CURDIR}${/}json${/}data_test/
    ${data}=    Read JSON Data    ${DATA_FILE_PATH}data1.json

    Set Selenium Speed    ${Delay}

    ${citizen_id}   ${firstname}   ${lastname}   ${prefix}=    Run Notebook And Get Variables    random_cid_name.ipynb
    Login Vsmart    icetest_phichit2    00470381Icezii!
    Goto import doc case
    Wait Until Keyword Succeeds    1 min    100ms    Switch To New Window
    Sleep    3s  # Give time for the new window/tab to fully load
    Execute Javascript    window.location.reload();

    Fill Informer Form From JSON    ${data}
    Informer over 18 years old From JSON    ${data}
    Insert Family Memeber From JSON    ${data}
    Info About Informer From JSON    ${data}


    ${Type_Service}=    Set Variable    ${data['TypeService']}
    Select Random Multiple Checkboxes By Name FORM FIVE With Json    ${Type_Service}    modal_section5_
    Wait Until Element Is Visible    xpath=//a[@id='icon_checked_6']
    ${StatusProblem}=    Set Variable    ${data['StatusProblem']}
    Select Random Multiple Checkboxes By Name FORM SIX With Json    ${StatusProblem}    modal_section6_
    ${HelpingType}=    Set Variable    ${data['HelpingType']}
    Select Random Multiple Checkboxes By Name FORM SEVEN With Json    ${HelpingType}    modal_section7_
    ${Benefit}=    Set Variable    ${data['Benefit']}
    Select Random Multiple Checkboxes By Name FORM EIGHT With Json    ${Benefit}    modal_section8_


    ${VisitHome}=    Set Variable    ${data['VisitHome']}
    Execute JavaScript    document.querySelector('#s_housingconditions').value = '${VisitHome['s_housingconditions']}'    ARGUMENTS    1
    Execute JavaScript    document.querySelector('#s_problem').value = '${VisitHome['s_problem']}'    ARGUMENTS    1
    Execute JavaScript    document.querySelector('#s_comment').value = '${VisitHome['s_comment']}'    ARGUMENTS    1

    Select From List By Value    xpath=//select[@id='order_name']    ${VisitHome['order_name']}
    Input Text    xpath=//input[@id='money_help']    ${VisitHome['money_help']}
    Select From List By Value    xpath=//select[@id='transfer_money_type']    ${VisitHome['transfer_money_type']}
    Select From List By Value    xpath=//select[@id='bank_name']    ${VisitHome['bank_name']}
    Execute JavaScript    document.querySelector('#bank_branch').value = '${VisitHome['bank_branch']}'    ARGUMENTS    1
    Execute JavaScript    document.querySelector('#account_number').value = '${VisitHome['account_number']}'    ARGUMENTS    1
    Execute JavaScript    document.querySelector('#account_name').value = '${VisitHome['account_name']}'    ARGUMENTS    1
    Select From List By Value    xpath=//select[@name='account_type']    ${VisitHome['account_type']}
    
    Insert All Picture Inspect

    Click Element    xpath=//input[@value="บันทึกอย่างเดียว"]
    Handle Alert    ACCEPT

    # ${max_id}=    Get Max Table Row ID

    # Sleep    2s
    # Check Consent Form By JSON    ${data}    ${max_id}
    # Check Informer By JSON    ${data}    ${max_id}
    # Check Insert Family Member By Json    ${data}    ${max_id}


*** Keywords ***
Switch To New Window
    ${window_handles}=    Get Window Handles
    ${new_window}=    Get From List    ${window_handles}    1
    Switch Window    ${new_window}

Post Request
    [Arguments]    ${url}    ${json}
    ${response}=    POST    ${url}    json=${json}
    Should Be Equal As Numbers    ${response.status_code}    200



# Send Discord Message
#     [Arguments]    ${message}
#     ${headers}    Create Dictionary    Content-Type=application/json
#     ${body}    Create Dictionary    content=${message}
#     ${response}    POST    ${DISCORD_WEBHOOK_URL}    json=${body}    headers=${headers}
#     Should Be Equal As Numbers    ${response.status_code}    204

# Send Discord Embed
#     [Arguments]    ${title}    ${description}    ${color}=16711680
#     ${embed}    Create Dictionary
#     ...    title=${title}
#     ...    description=${description}
#     ...    color=${color}
    
#     @{embed_list}    Create List    ${embed}
#     ${body}    Create Dictionary    embeds=${embed_list}
#     ${headers}    Create Dictionary    Content-Type=application/json
#     ${response}    POST    ${DISCORD_WEBHOOK_URL}    json=${body}    headers=${headers}
#     Should Be Equal As Numbers    ${response.status_code}    204


