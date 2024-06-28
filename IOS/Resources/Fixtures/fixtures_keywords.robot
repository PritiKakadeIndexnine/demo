*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    ../../../CommonKeywords/Utilities/user_keywords.py
Resource    ../FLRP/flrp_keywords.robot
Variables   ../Login/login_locators.py
Variables   ../Fixtures/fixtures_locators.py
Variables   ../HomeScreen/home_screen_locators.py


*** Keywords ***
Click On Fixtures Button
    wait until page contains element    ${fixtures_button}
    click element    ${fixtures_button}
    wait until page contains    VS    timeout=30

Click On Add To Calender On Home Screen
    wait until page contains element    ${home_add_to_calender}    timeout=30
    Click Element     ${home_add_to_calender}

Click On Add To Calender On Fixtures Screen
    swipe down until element is visible    ${fixtures_add_to_calender}
    click element    ${fixtures_add_to_calender}

Click On Matchcenter Button On And Verify Details
    wait until page contains element    xpath=(//XCUIElementTypeStaticText[@name="MATCHCENTRE"])[12]    timeout=10
    click element    xpath=(//XCUIElementTypeStaticText[@name="MATCHCENTRE"])[12]
    wait until page contains    Match
    wait until page contains    Batters
    wait until page contains    Bowlers

Verify Add To Calender Functionality
    [Arguments]    ${email}    ${password}
    wait until page contains element     xpath=//XCUIElementTypeStaticText[@name="Google"]    timeout=30
    Click Element    xpath=//XCUIElementTypeStaticText[@name="Google"]
    ${status}    run keyword and return status   wait until page contains element    //XCUIElementTypeStaticText[@name="Use another account"]
    IF    ${status}
        click element    //XCUIElementTypeStaticText[@name="Use another account"]
    END
    wait until page contains element    accessibility_id=Email or phone
    click element    accessibility_id=Email or phone
    Input Text    accessibility_id=Email or phone    ${email}
    click element    xpath=(//XCUIElementTypeButton[@name="Done"])[2]
    wait until page contains element    //XCUIElementTypeButton[@name="Next"]
    click element    //XCUIElementTypeButton[@name="Next"]
    ${status}    run keyword and return status    wait until page contains element    accessibility_id=Continue
    IF    ${status}
        click element    accessibility_id=Continue
        sleep    1
        click element    accessibility_id=Continue
    ELSE
        wait until page contains element    accessibility_id=Enter your password
        click element    accessibility_id=Enter your password
        Input Text    accessibility_id=Enter your password    ${password}
        Click Element    xpath=(//XCUIElementTypeButton[@name="Done"])[2]
        wait until page contains element    accessibility_id=Next
        Click Element     accessibility_id=Next
        wait until page contains element    accessibility_id=Continue
        Click Element    accessibility_id=Continue
        sleep    1
        swipe up until element is visible    accessibility_id=Continue
        Click Element    accessibility_id=Continue
        wait until page contains    calendar synced to your email    timeout=30
    END

