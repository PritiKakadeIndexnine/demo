*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    ../../../CommonKeywords/Utilities/user_keywords.py
Variables   ../Login/login_locators.py
Variables   ../HomeScreen/home_screen_locators.py


*** Keywords ***
Get Tokens Earned
    wait until page contains element    ${user_icon}    timeout=30
    click element    ${user_icon}
    wait until page contains element    xpath=(//XCUIElementTypeStaticText[@name="TOKENS LEFT"]/following-sibling::XCUIElementTypeStaticText)[5]
    ${tokens}    get element attribute    xpath=(//XCUIElementTypeStaticText[@name="TOKENS LEFT"]/following-sibling::XCUIElementTypeStaticText)[5]    value
    RETURN    ${tokens}

Get Tokens Left
    wait until page contains element    ${user_icon}    timeout=30
    click element    ${user_icon}
    wait until page contains element    ${tokens_left}    timeout=30
    ${tokens}    get text    ${tokens_left}
    RETURN    ${tokens}

Go To News Article Page
    wait until page contains element    ${menu_button}    timeout=30
    click element    ${menu_button}
    wait until page contains element    ${news_menu}    timeout=30
    click element    ${news_menu}
    wait until page contains element    ${news_first_article}    timeout=30

Click On First News Article
    wait until page contains element    //XCUIElementTypeStaticText[@name="News"]/preceding-sibling::XCUIElementTypeStaticText[2]    timeout=30
    ${news_title}    get element attribute    //XCUIElementTypeStaticText[@name="News"]/preceding-sibling::XCUIElementTypeStaticText[2]    value
    click element    //XCUIElementTypeStaticText[@name="News"]/preceding-sibling::XCUIElementTypeStaticText[2]
    wait until page contains element    //XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeStaticText     timeout=30
    ${news_title_2}    get element attribute    //XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeStaticText    value
    should be equal    ${news_title}    ${news_title_2}

Swipe Up Until Element Is Visible
    [Arguments]    ${element}
    FOR  ${count}  IN RANGE    0    10
        ${status}    run keyword and return status    wait until element is visible   ${element}
        IF    ${status}
            exit for loop
        END
        Swipe    ${191}    ${665}    ${194}    ${277}
    END

Swipe down Until Element Is Visible
    [Arguments]    ${element}
    FOR  ${count}  IN RANGE    0    10
        ${status}    run keyword and return status    wait until element is visible   ${element}
        IF    ${status}
            exit for loop
        END
        Swipe    ${191}    ${185}    ${186}    ${716}
    END

Click Button On In App Notifications
    wait until page contains element    //XCUIElementTypeStaticText[@name="news detail"]    timeout=10
    click element    //XCUIElementTypeStaticText[@name="news detail"]

Click On Back Button
    wait until page contains element    accessibility_id=back icon
    click element    accessibility_id=back icon

Click On Home Button
  wait until page contains element    ${home_button}
  click element    ${home_button}

Verify Tokens Are Created
  [Arguments]     ${tokens_before}    ${new_token}
  ${tokens}    evaluate    ${tokens_before}+${new_token}
  ${tokens_2}    Get Tokens Earned
  should be equal as numbers    ${tokens}    ${tokens_2}

Redeem Coupen
    [Arguments]    ${token}
    Click Element     xpath=//XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[3]
    wait until page contains element    accessibility_id=check box unselected
    Click Element     accessibility_id=check box unselected
    swipe up until element is visible    //XCUIElementTypeStaticText[@name="${token}"]/following-sibling::XCUIElementTypeButton[@name="REDEEM"]
    Click Element     //XCUIElementTypeStaticText[@name="${token}"]/following-sibling::XCUIElementTypeButton[@name="REDEEM"]

Verify The Alert Message Of Insufficient Balance
    wait until page contains element    xpath=//XCUIElementTypeStaticText[@name="Insufficient Balance !!!"]

Verify Redeemed | Coming Soon Coupens Are Prohibited
    [Arguments]    ${type}
    Click Element     xpath=//XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[3]
    wait until page contains element    accessibility_id=check box unselected
    Click Element     accessibility_id=check box unselected
    Swipe Up Until Element Is Visible    xpath=//XCUIElementTypeStaticText[@name="${type}"][1]
    click element    xpath=//XCUIElementTypeStaticText[@name="${type}"][1]
    wait until page contains element    //XCUIElementTypeStaticText[@name="HEY! YOU HAVE REDEEMED YOUR COINS."]


Verify Checkbox Must Be checked Before Redeeming Coupen
    Click Element     xpath=//XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[3]
    wait until page contains element    xpath=(//XCUIElementTypeButton[@name="REDEEM"])[1]
    click element    xpath=(//XCUIElementTypeButton[@name="REDEEM"])[1]
    wait until page contains element    //XCUIElementTypeStaticText[@name="Please accept our T&C before proceeding further."]
    wait until page contains element    accessibility_id=check box unselected
    Click Element     accessibility_id=check box unselected
    click element    xpath=(//XCUIElementTypeButton[@name="REDEEM"])[1]
    wait until page contains element    //XCUIElementTypeStaticText[@name="HEY! YOU HAVE REDEEMED YOUR COINS."]

Verify Coupen Redeem Alert
    wait until page contains element    //XCUIElementTypeStaticText[@name="HEY! YOU HAVE REDEEMED YOUR COINS."]

Verify Tokens Are Deducted From Account
    [Arguments]    ${tokens_before_redeem}    ${coupen_value}
    wait until page contains element    ${tokens_left}
    ${tokens_after_redeem}    get element attribute    ${tokens_left}    value
    ${expected_tokens_left}    evaluate    ${tokens_before_redeem}-${coupen_value}
    should be equal as numbers    ${tokens_after_redeem}    ${expected_tokens_left}

Verify User Gets Coupen Code After Redeem
    ${coupen_code}    get text    //XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeStaticText
    should not be empty    ${coupen_code}

Open Any Podcast of Knight TV
    Swipe Up Until Element Is Visible    //XCUIElementTypeStaticText[@name="Knights TV"]
    click element    //XCUIElementTypeStaticText[@name="Knights TV"]
    wait until page contains element    //XCUIElementTypeOther/XCUIElementTypeButton[@name="flrp like icon"]    timeout=30

Click On Like Icon
    wait until page contains element    //XCUIElementTypeOther/XCUIElementTypeButton[@name="flrp like icon"]    timeout=30
    click element    //XCUIElementTypeOther/XCUIElementTypeButton[@name="flrp like icon"]
