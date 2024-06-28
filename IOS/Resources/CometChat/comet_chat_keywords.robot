*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    ../../../CommonKeywords/Utilities/user_keywords.py
Resource    ../FLRP/flrp_keywords.robot
Resource    ../Login/login_keywords.robot
Variables   ../Login/login_locators.py
Variables   ../HomeScreen/home_screen_locators.py


*** Keywords ***
Join N Fan Chat Groups
    [Arguments]    ${number}
    FOR    ${count}    IN RANGE   1    ${number}+1
        swipe up until element is visible    xpath=(//XCUIElementTypeButton[@name="JOIN"])[1]
        click element    xpath=(//XCUIElementTypeButton[@name="JOIN"])[1]
        wait until element is visible    //XCUIElementTypeNavigationBar[@name="KKR_App.CometChatMessageList"]
        wait until element is visible    //XCUIElementTypeButton[@name="send icon"]
        click element    accessibility_id=back icon
    END

Join A Group If Not Joined Any And Open Chat
    ${status}    run keyword and return status    wait until element is visible   //XCUIElementTypeButton[@name="JOINED"][1]
    IF    ${status}
        log to console    Already Joined One
        click element    //XCUIElementTypeButton[@name="JOINED"][1]
    ELSE
        wait until element is visible    xpath=(//XCUIElementTypeButton[@name="JOIN"])[1]
        click element    xpath=(//XCUIElementTypeButton[@name="JOIN"])[1]
    END
    wait until element is visible    accessibility_id=gify icon

Verify User Can React On The Last Message
    [Arguments]    ${count}
    long press    //XCUIElementTypeTable/XCUIElementTypeCell[${count}]
    wait until element is visible    //XCUIElementTypeStaticText[@name="😂"]
    click element    //XCUIElementTypeStaticText[@name="😂"]
    wait until element is visible    //XCUIElementTypeTable/XCUIElementTypeCell[${count}]/XCUIElementTypeStaticText[contains(@name,"😂")]
    click element    //XCUIElementTypeTable/XCUIElementTypeCell[${count}]/XCUIElementTypeStaticText[contains(@name,"😂")]

Verify User Can Reply Last Message With Comment
    [Arguments]     ${count}    ${comment}
    long press    //XCUIElementTypeTable/XCUIElementTypeCell[${count}]
    wait until element is visible   accessibility_id=Reply Message
    click element    accessibility_id=Reply Message
    wait until element is visible    accessibility_id=messages close circle
    wait until element is visible    //XCUIElementTypeTextView    #write comment
    input text   //XCUIElementTypeTextView   ${comment}
    click element    accessibility_id=send icon

Verify Sent Message
    [Arguments]    ${expected_message}
    ${count}    get matching xpath count    //XCUIElementTypeTable/XCUIElementTypeCell
    ${actual_message}   get text    //XCUIElementTypeTable/XCUIElementTypeCell[${count}]/XCUIElementTypeStaticText[1]
    should be equal    ${actual_message}    ${expected_message}

Click On Joined Button
    wait until element is visible    //XCUIElementTypeButton[@name="JOINED"][1]    timeout=10
    click element    //XCUIElementTypeButton[@name="JOINED"][1]

Leave N Fan Chat Groups
    [Arguments]    ${number}
    FOR    ${count}    IN RANGE   1    ${number}+1
        swipe up until element is visible    //XCUIElementTypeButton[@name="JOINED"][1]
        click element    //XCUIElementTypeButton[@name="JOINED"][1]
        wait until element is visible     //XCUIElementTypeNavigationBar[@name="KKR_App.CometChatMessageList"]/XCUIElementTypeOther[1]/XCUIElementTypeImage
        click element    //XCUIElementTypeNavigationBar[@name="KKR_App.CometChatMessageList"]/XCUIElementTypeOther[1]/XCUIElementTypeImage
        wait until element is visible    accessibility_id=Close
        swipe up until element is visible    accessibility_id=Leave Group
        click element    accessibility_id=Leave Group
        wait until element is visible    accessibility_id=Leave
        click element    accessibility_id=Leave
        wait until element is visible    ${fan_chat}
        click element    ${fan_chat}
    END

Verify Admin | Moderator Can Send Photo | Video In Group
    wait until page contains element    accessibility_id=add club icon    timeout=30
    ${el1} =    Set Variable     accessibility_id=add club icon
    Click Element    ${el1}
    wait until page contains element    accessibility_id=Photo & Video Library    timeout=30
    ${el2} =    Set Variable     accessibility_id=Photo & Video Library
    Click Element    ${el2}
    wait until page contains element    accessibility_id=Screenshot, 16 May, 3:08 PM
    ${el3} =    Set Variable     accessibility_id=Screenshot, 16 May, 3:08 PM
    Click Element    ${el3}
    wait until page contains element    accessibility_id=Just Now    timeout=30

Verify Admin | Moderator Can Create Poll In Group
    ${el5} =    Set Variable     accessibility_id=add club icon
    Click Element    ${el5}
    wait until page contains element    accessibility_id=Create a Poll
    ${el6} =    Set Variable     accessibility_id=Create a Poll
    Click Element    ${el6}
    wait until page contains element    xpath=//XCUIElementTypeTextField[@value="Enter your question"]
    ${el7} =    Set Variable     xpath=//XCUIElementTypeTextField[@value="Enter your question"]
    Input Text    ${el7}    who will win today?
    ${el8} =    Set Variable     xpath=(//XCUIElementTypeTextField[@value="Enter your option"])[1]
    Input Text    ${el8}    KKR
    ${el9} =    Set Variable     xpath=//XCUIElementTypeTextField[@value="Enter your option"]
    Input Text    ${el9}    MI
    ${el10} =    Set Variable     accessibility_id=Done
    Click Element    ${el10}
    wait until element is visible    xpath=//XCUIElementTypeStaticText[@name="Create${SPACE}${SPACE}Poll"]
    ${el11} =    Set Variable     xpath=//XCUIElementTypeStaticText[@name="Create${SPACE}${SPACE}Poll"]
    Click Element    ${el11}
    wait until page contains element    accessibility_id=who will win today?    timeout=30
    wait until element is visible     accessibility_id=KKR
    wait until element is visible     accessibility_id=MI

Verify Admin Can Ban Any Member
    [Arguments]    ${member}
    wait until element is visible     //XCUIElementTypeNavigationBar[@name="KKR_App.CometChatMessageList"]/XCUIElementTypeOther[1]/XCUIElementTypeImage
    click element    //XCUIElementTypeNavigationBar[@name="KKR_App.CometChatMessageList"]/XCUIElementTypeOther[1]/XCUIElementTypeImage
    wait until element is visible    accessibility_id=Close
    swipe up until element is visible    //XCUIElementTypeStaticText[@name="${member}"]
    long press    //XCUIElementTypeStaticText[@name="${member}"]
    wait until element is visible    accessibility_id=Ban Member
    click element    accessibility_id=Ban Member
    wait for 5 seconds
    page should not contain element    //XCUIElementTypeStaticText[@name="${member}"]

Verify Admin Can Remove Any Member
    [Arguments]    ${member}
    wait until element is visible    //XCUIElementTypeStaticText[@name="${member}"]
    long press    //XCUIElementTypeStaticText[@name="${member}"]
    wait until element is visible    accessibility_id=Remove Member
    click element    accessibility_id=Remove Member
    page should not contain element    //XCUIElementTypeStaticText[@name="${member}"]

Verify Admin Can Promote Participant
    [Arguments]    ${member}
    wait until element is visible     //XCUIElementTypeNavigationBar[@name="KKR_App.CometChatMessageList"]/XCUIElementTypeOther[1]/XCUIElementTypeImage
    click element    //XCUIElementTypeNavigationBar[@name="KKR_App.CometChatMessageList"]/XCUIElementTypeOther[1]/XCUIElementTypeImage
    wait until element is visible    accessibility_id=Close
    wait until element is visible    accessibility_id=Administrators
    wait until element is visible    accessibility_id=Moderators
    click element    accessibility_id=Administrators
    wait until element is visible    accessibility_id=Add admin
    click element    accessibility_id=Add admin
    wait until element is visible    (//XCUIElementTypeStaticText[@name="${member}"])[2]
    long press    (//XCUIElementTypeStaticText[@name="${member}"])[2]
    wait until element is visible    accessibility_id=Assign as group admin
    click element    accessibility_id=Assign as group admin

Click On Fan Chat Buttom
    wait until page contains element    ${fan_chat}     timeout=30
    click element    ${fan_chat}

Send GIF In Group Chat
    wait until element is visible     accessibility_id=gify icon
    click element    accessibility_id=gify icon
    wait until element is visible    //XCUIElementTypeCollectionView/XCUIElementTypeCell[1]/XCUIElementTypeOther/XCUIElementTypeImage    timeout=30
    click element    //XCUIElementTypeCollectionView/XCUIElementTypeCell[1]/XCUIElementTypeOther/XCUIElementTypeImage
    wait until element is visible    accessibility_id=send icon
    wait until element is visible    accessibility_id=Just Now

Search Group Name
    [Arguments]    ${name}
    wait until element is visible    accessibility_id=Search
    click element    accessibility_id=Search
    wait until element is visible    //XCUIElementTypeSearchField[@name="Search"]
    input text    //XCUIElementTypeSearchField[@name="Search"]    ${name}
    wait until element is visible    //XCUIElementTypeButton[@name="Search"]
    click element    //XCUIElementTypeButton[@name="Search"]

Verify Search Functionality Of Comet Chat
    [Arguments]    ${name}
    ${element_count}    get matching xpath count    //XCUIElementTypeTable/XCUIElementTypeCell
    IF    ${element_count}==0
        page should contain element    accessibility_id=No club found!
    ELSE
        FOR    ${i}    IN RANGE    ${element_count}+1
            ${group_name}    get text    //XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText
            should contain    ${group_name}    ${name}
        END
    END

Verify Ban User Can't Join Group
    [Arguments]    ${group_name}
    wait until element is visible    //XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText[@name="${group_name}"]//following-sibling::XCUIElementTypeButton[@name="JOIN"]
    click element    //XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText[@name="${group_name}"]//following-sibling::XCUIElementTypeButton[@name="JOIN"]
    wait until element is visible    accessibility_id=The user with UID 919000000038 is banned from a group with GUID 1001.
