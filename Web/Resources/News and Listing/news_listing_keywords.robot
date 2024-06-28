*** Settings ***
Library  SeleniumLibrary
Variables  news_listing_locators.py
Variables  ../Login/login_page_locators.py
Resource    ../Fixtures and Results/fixturesresults_keywords.robot

*** Keywords ***
Click On Share Icon For Any Article
    Sleep    5s
    Click On Particular Element     ${shareoption_newspage}

Social Icons Option Is Visible
    FOR    ${i}    IN RANGE    1    5
    Wait Until Page Contains Element    (//div[@class="social-items datalayer-share"])[${i}]    timeout=10
    Page Should Contain Element    (//div[@class="social-items datalayer-share"])[${i}]
    END

Click On ClipBoard Icon
    Click On Particular Element    ${copylink_option}

