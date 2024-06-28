*** Settings ***
Library      SeleniumLibrary
Library      Collections
Resource    ../../Resources/Login/login_keywords.robot
Resource    ../../Resources/Profile/profile_keywords.robot
Resource    ../../../CommonKeywords/Resources/Cms/otp_keywords.robot
Test Setup  Launch Application
Test Teardown  Close Browser

*** Variables ***
${mobile_number}        9112870060
${mobile_number_two}    9126170674

*** Test Cases ***
#OTP less login
Tc01 Verify if new clicks on yes button
    Click On Login Button
    Enter Mobile Number     ${mobile_number}
    Click on No Button
    Verify OTP less sign in pop-up should get displayed to user

Tc02 Verify the click on whats app icon
    Click On Login Button
    Enter Mobile Number     ${mobile_number}
    Click On Yes Button
    Click on whatsapp icon
    Verify User should able to view barcode to scan

Tc03 Login Step With OTP Existing User
    Click On Login Button
    Verify Mobile Number Field
    Validate Mobile Number According To Country Code  ${mobile_number}    91
    Validate Mobile Number Field    ${mobile_number}
    Mobile No Field Should not be blank     ${mobile_number_loc}
    Verify Error Message on Blank Login Field
    Capture Page Screenshot

Tc04 Verify If New User Enters Mobile Number And Clicks On NO Button
    Click On Login Button
    Enter Mobile Number     ${mobile_number_two}
    Click on No Button
    Send OTP Via SMS Button Should Get Displayed To User

Tc05 Verify The OTP Section
    Click On Login Button
    Enter Mobile Number     ${mobile_number_two}
    Click on No Button
    Click On Send SMS Button
    Verify User should Able To View Six Boxes To Enter Six Digit Received OTP

Tc06 Verify Valid OTP
    Click On Login Button
    Enter Mobile Number     ${mobile_number_two}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_two}
    Enter OTP  ${otp}
    Verify System Should Accept The OTP

Tc07 Verify Invalid OTP
    Click On Login Button
    Enter Mobile Number     ${mobile_number_two}
    Click on No Button
    Click On Send SMS Button
    Enter Wrong OTP
    Verify Failed Message Should Visible To User
    Capture Page Screenshot
