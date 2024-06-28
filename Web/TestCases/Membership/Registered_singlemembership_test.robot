*** Settings ***
Library  SeleniumLibrary
Library   DataDriver        ../../TestData/Registeredsingle_usermembership_data.xlsx
Resource  ../../Resources/Membership/membership_keywords.robot
Resource  ../../Resources/Profile/profile_keywords.robot
Resource  ../../Resources/Login/login_keywords.robot
Resource    ../../../CommonKeywords/Resources/Cms/otp_keywords.robot

Test Setup      Launch Application
Test Teardown   Close Browser
Test Template   Verify if the user selectes single memberships for regsistered User

*** Variables ***
${testdata_filepath}    ${CURDIR}${/}..${/}..${/}TestData${/}Registeredsingle_usermembership_data.xlsx


*** Test Cases ***
Verify if the user selectes single memberships for regsistered User     ${id}


*** Keywords ***
Verify if the user selectes single memberships for regsistered User
    [Arguments]    ${id}
    ${data}    fetch user data by id  ${testdata_filepath}  ${id}
    ${user_data}    create dictionary    &{data}
    Click On Login Button
    Enter Mobile Number     ${user_data.mobile_number}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${user_data.mobile_number}
    Enter OTP  ${otp}
    Select Second Membership Plan
    Select Membership Plan  ${user_data.membership}
    Verify If User Selectes Pro Plan And Fill The Required Detail
    Verify User Should Redirect To Payment Gateway Screen
