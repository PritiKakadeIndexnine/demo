*** Settings ***
Library   AppiumLibrary
Library    OperatingSystem
Resource    ../../Resources/Login/login_keywords.robot
Resource    ../../Resources/FLRP/flrp_keywords.robot
Resource    ../../Resources/Fixtures/fixtures_keywords.robot

Test Teardown    Logout From App

*** Test Cases ***
Verify user do Click on popups receives 50 tokens (upto 2 times)
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000033
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    ${tokens_before}    Get Tokens Earned
    Click On Back Button
    Click Button On In App Notifications
    Click On Back Button
    Click On Back Button
    Click On Home Button
    wait for 5 seconds
    Verify Tokens Are Created    ${tokens_before}    50

Verify user do view content receives 10 tokens (upto 2 times)
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000033
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    ${tokens_before}    Get Tokens Earned
    Click On Back Button
    Go To News Article Page
    click on first news article
    Click On Back Button
    sleep    1
    Click On Back Button
    Click On Home Button
    wait for 5 seconds
    verify tokens are created    ${tokens_before}    10

Verify user do react/share receives 10 tokens (upto 2 times)
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000033
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    ${tokens}    Get Tokens Earned
    Click On Back Button
    Open Any Podcast of Knight TV
    Click On Like Icon
    Click On Back Button
    Wait for 5 seconds
    Verify Tokens Are Created    ${tokens}    10

Verify user do interaction with matchcenter receives 10 tokens (upto 2 times)
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000033
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    ${tokens_before}    Get Tokens Earned
    Click On Back Button
    Click On Fixtures Button
    Click On Matchcenter Button On And Verify Details
    Click On Back Button
    Click On Home Button
    wait for 5 seconds
    verify tokens are created    ${tokens_before}    10

Verify that when a user exchanges tokens for a coupon, the system deducts the appropriate number of tokens from their account in accordance with the specific amount of that coupon.
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000033
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    ${tokens_before_redeem}    Get Tokens Left
    redeem coupen    250
    Verify Coupen Redeem Alert
    Click On Back Button
    Click On Back Button
    Verify Tokens Are Deducted From Account    ${tokens_before_redeem}    250


Confirm that users cannot redeem coupons with a value exceeding their available budget and also verify the alert message of "Insufficient Balance"
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000033
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    ${tokens}    Get Tokens Earned
    Redeem Coupen    750
    Verify The Alert Message Of Insufficient Balance
    Click On Back Button

Verify the system accurately distributes coupons based on user activity and also distributes the corresponding coupon codes to those specific users.
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000033
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    ${tokens_before_redeem}    Get Tokens Left
    redeem coupen    250
    Verify Coupen Redeem Alert
    Verify User Gets Coupen Code After Redeem
    Click On Back Button
    Click On Back Button

Verify that users must check the checkbox indicating acceptance of the terms and conditions before being allowed to redeem coupons.
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000033
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    ${tokens}    Get Tokens Earned
    Verify Checkbox Must Be checked Before Redeeming Coupen
    Click On Back Button

Verify that users are prohibited from redeeming tokens for coupons when the status is either "Redeemed" or "Coming Soon".
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000033
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    Verify Redeemed | Coming Soon Coupens Are Prohibited    Coming Soon
#    Verify Redeemed | Coming Soon Coupens Are Prohibited    Redeemed
    Click On Back Button








