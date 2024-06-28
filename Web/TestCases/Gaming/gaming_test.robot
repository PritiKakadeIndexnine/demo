*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Membership/membership_keywords.robot
Resource  ../../Resources/Profile/profile_keywords.robot
Resource  ../../Resources/Login/login_keywords.robot
Resource    ../../../CommonKeywords/Resources/Cms/otp_keywords.robot
Resource    ../../Resources/Gaming/gaming_keywords.robot

Test Setup      Launch Application
Test Teardown   Close Browser

*** Variables ***
${mobile_number_1}=  8500000001
${mobile_number_2}=  8600000002

*** Test Cases ***
Tc10 Verify if user is logged and redirecting quizer page
    Click On Login Button
    Enter Mobile Number     ${mobile_number_1}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_1}
    Enter OTP  ${otp}
    Click On Quizzer From Menu
    User Shouldn't Ask For Login Again Will Able To View Play Now Button

Tc11 Verify If User Is Not Logged In And Try To Access Quizer
    Click On Login Button
    Click On Quizzer From Menu
    CLick On Quizzer Menu Without Login
    Enter Mobile Number     ${mobile_number_2}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_2}
    Enter OTP  ${otp}
    Getting Login Screen And Play Now Button



