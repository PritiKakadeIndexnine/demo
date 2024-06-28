*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    ../../../CommonKeywords/Utilities/user_keywords.py
Variables   login_locators.py

*** Variables ***
${iOS_environment}  ${CURDIR}${/}..${/}..${/}..${/}Environment${/}ios_environment.json

*** Keywords ***
Open KC application
    ${env_data}  Get Environment Data    ${iOS_environment}
    Log To Console    ${env_data}
    ${env_data}  Create Dictionary  &{env_data}
    Open Application    ${env_data.host}    platformName=${env_data.platformName}   deviceName=${env_data.deviceName}   bundleId=${env_data.bundleId}    autoGrantPermissions=true    automationName=${env_data.automationName}    noReset=true     udid=${env_data.udid}
#    Open Application    ${env_data.host}    platformName=${env_data.platformName}   deviceName=${env_data.deviceName}   app=${env_data.ipa_file}    autoGrantPermissions=true    automationName=${env_data.automationName}    noReset=true     udid=${env_data.udid}

Verify Login Screen
    wait Until Element Is Visible   ${login_label}   timeout=30
    wait Until Element is Visible   ${welcome_text}  timeout=20

Enter Mobile Number
    [Arguments]  ${mobile_number}
    Click Element   ${enter_mobile_number_text}
    Input Text    ${mobile_field}    ${mobile_number}
    sleep    8s
    AppiumLibrary.wait Until Element is Visible    ${done_button_keypad}    timeout=10
    Click Element   ${done_button_keypad}

Click On Skip Button If Visible
    ${status}    run keyword and return status    wait until element is visible     accessibility_id=Skip
    IF    ${status}
        click element     accessibility_id=Skip
    END

Wait for 5 seconds
    sleep    5s

Click On Request Otp Button
    Wait Until Element is Visible   ${request_otp_button}  timeout=5
    Click Element    ${request_otp_button}

Verify Country Code And Mobile Number
    ${country_code}  Get Text    ${country_code_field}
    Should Be Equal    ${country_code}    +91
    ${mobile_number}  Get Text    ${mobile_field}
    Length Should Be    ${mobile_number}    10
    Click On Request Otp Button

Verify Incorrect Mobile Number Message
    Wait Until Page Contains Element    ${wrong_number_text}   timeout=30

Click And Verify Skip Button
    Wait Until Element Is Visible   ${skip_button}   timeout=30
    Click Element    ${skip_button}
    ${status}  Run Keyword And Return Status  Wait Until Page Contains Element    ${cross_button}  timeout=10
    IF    ${status}
         Click Element  ${cross_button}
    END
    Wait Until Page Contains Element    ${homepage_title}  timeout=30

Enter Otp
    [Arguments]    ${otp}
    ${otp}     convert to string    ${otp}
    wait until page contains element    ${otp_field}  timeout=30
    Input Text    ${otp_field}    ${otp}[0]
    Input Text    ${otp_field}    ${otp}[1]
    Input Text    ${otp_field}    ${otp}[2]
    Input Text    ${otp_field}    ${otp}[3]
    Input Text    ${otp_field}    ${otp}[4]
    Input Text    ${otp_field}    ${otp}[5]
    ${el8} =    Set Variable     xpath=(//XCUIElementTypeButton[@name="checkBox"])[1]
    Click Element    ${el8}
    ${el9} =    Set Variable     xpath=(//XCUIElementTypeButton[@name="checkBox"])[2]
    Click Element    ${el9}
    ${el10} =    Set Variable     xpath=//XCUIElementTypeButton[@name="SUBMIT${SPACE}${SPACE}"]
    Click Element    ${el10}

Open IOS Notifications
    sleep    1
    Swipe    ${35}    ${0}    ${28}    ${650}
    sleep    1

Logout From App
    wait until page contains element     accessibility_id=edit profile
    Click Element    accessibility_id=edit profile
    wait until page contains element     accessibility_id=Logout
    Click Element    accessibility_id=Logout
    wait until page contains element     accessibility_id=OK
    Click Element    accessibility_id=OK

# code is in progress -
#Close the application
#    ${env_data}  Get Environment Data    ${iOS_environment}
#    Log To Console    ${env_data}
#    ${env_data}  Create Dictionary  &{env_data}
#    execute adb shell    pm uninstall   ${env_data.bundleId}
