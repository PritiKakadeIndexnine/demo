*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Login/login_keywords.robot
Resource  ../../Resources/Profile/profile_keywords.robot
Resource    ../../../CommonKeywords/Resources/Cms/otp_keywords.robot

Test Setup  Launch Application
Test Teardown  Close Browser

*** Variables ***
${mobile_number_1}=  8300008311
${mobile_number_2}=  8300008312
${email_1}=  jain123@gmail.com
${email_2}=  jain1234@gmail.com

*** Test Cases ***
Verify the fields on incomplete profile
    Click On Login Button
    Enter Mobile Number     ${mobile_number_1}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_1}
    Enter OTP  ${otp}
    Verify all fields on incomplete profile

Verify submit button functionality once all the mandatory fields get filled
    Click On Login Button
    Enter Mobile Number     ${mobile_number_2}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_2}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration  ${email_2}
#    Verify User Should Accept Valid Email Id
#    Validate and Check Unique Email Address
#    ${is_valid_email}=    Should Be Valid Email    ${email_address}
#    ${is_unique}=    Check Email Uniqueness    ${email_address}    ${registered_emails}
#    Should Be True    ${is_valid_email}
#    Should Be True    ${is_unique}
#    User Should Able To View Error Message Of Email Already In Use
    Click And Verify Submit Button
