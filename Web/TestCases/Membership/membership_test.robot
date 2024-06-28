*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Membership/membership_keywords.robot
Resource  ../../Resources/Profile/profile_keywords.robot
Resource  ../../Resources/Login/login_keywords.robot
Resource    ../../../CommonKeywords/Resources/Cms/otp_keywords.robot

Test Setup      Launch Application
Test Teardown   Close Browser

*** Variables ***
${mobile_number_1}=  9010270100
${mobile_number_2}=  9010370600
${email_1}=  xyz2388@gmail.com
${email_2}=  jkl900@gmail.com


*** Test Cases ***
Tc08 Verify membership plans
    Click On Login Button
    Enter Mobile Number     ${mobile_number_1}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_1}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration  ${email_1}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen

Tc09 Verify if user selectes pro plan and fill the required detail
    Click On Login Button
    Enter Mobile Number     ${mobile_number_2}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_2}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration  ${email_2}
    Click And Verify Submit Button
    Verify Membership Plan In Card Format
    Select Pro Membership Plan
    Enter Required Details For Membership
    Verify If User Selectes Pro Plan And Fill The Required Detail
    Verify User Should Redirect To Payment Gateway Screen