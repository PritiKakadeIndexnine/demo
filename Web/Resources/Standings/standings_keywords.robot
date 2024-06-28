*** Settings ***
Library  SeleniumLibrary
Variables  standings_locators.py
Resource    ../Fixtures and Results/fixturesresults_keywords.robot

*** Keywords ***
Click On Accordion
    Sleep    15s
    Wait Until Element Is Visible     ${accordin_loc}   timeout=20s
    Wait Until Keyword Succeeds    5    5    Press Keys     ${accordin_loc}     Enter
    Wait Until Page Contains Element    (//p[contains(text()," Previous Match")])[1]    timeout=20s

Able To See Latest 3 Matches For Team Stands And Scorecard Text
    FOR    ${i}    IN RANGE    1    4
        Wait Until Page Contains Element    ((//div[@class="match-listing"])[1]//div[@class="match-details"])[${i}]    timeout=10
    END

Click On First Match Card
    ${text1}     Get Text    ${matchcard_loc_first}
    Click On Particular Element   ${matchcard_loc_first}
    RETURN  ${text1}

Redirect To Rescpective Match Center Screen
    ${text2}     Get Text    ${matchcentertext}
    Element Should Contain   ${matchcentertext}    ${text2}


