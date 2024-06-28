*** Settings ***
Library  SeleniumLibrary
Resource    ../../Resources/Membership/membership_keywords.robot
Resource  ../../Resources/Profile/profile_keywords.robot
Resource  ../../Resources/Login/login_keywords.robot
Resource    ../../../CommonKeywords/Resources/Cms/otp_keywords.robot
Resource  ../../Resources/Gaming/gaming_keywords.robot
Resource    ../../Resources/Membership/membership_page_navigation.robot

Test Setup      Launch Application
Test Teardown   Close Browser

*** Variables ***
${mobile_number_1}=  9870100171
${email_1}=  cc1781@gmail.com
${mobile_number_2}=  9870000132
${email_2}=  cc132@gmail.com
${mobile_number_3}=  9870000133
${email_3}=  cc133@gmail.com
${mobile_number_4}=  9870000134
${email_4}=  cc134@gmail.com
${mobile_number_5}=  9870000135
${email_5}=  cc135@gmail.com
${mobile_number_6}=  9870000136
${email_6}=  cc136@gmail.com
${mobile_number_7}=  9870000137
${email_7}=  cc137@gmail.com
${mobile_number_8}=  9870000138
${email_8}=  cc138@gmail.com
${mobile_number_9}=  9307338501
${email_9}=  pallavishelke932@gmail.com
${mobile_number_10}=  9870000139
${email_10}=  cc139@gmail.com
${mobile_number_11}=  9870000140
${email_11}=  cc140@gmail.com

*** Test Cases ***
TC_018 Verify user contain 3 membership plan on page
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
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Sleep    10s

TC_019 Verify that user can purchase junior membership plan
    Click On Login Button
    Enter Mobile Number     ${mobile_number_2}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_2}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration   ${email_2}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Sleep    20s
    Verify navigation to junior membership form
    Enter Required Details For Junior Membership
    Sleep    20s
    Submit the data and proceed to payment option
    verify payment process for membership plan
    Verify invoice creation of payment


TC_020 Verify coupon code section on required feilds screen for junior membership plan
    Click On Login Button
    Enter Mobile Number     ${mobile_number_3}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_3}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration     ${email_3}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Sleep    20s
    Verify navigation to junior membership form
    Enter Required Details For Junior Membership
    Verify coupon code section on required feilds screen for membership plan

TC_021 Verify that post completon of payment gateway
    verify delete all emails
    Click On Login Button
    Enter Mobile Number     ${mobile_number_9}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_9}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration  ${email_9}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Sleep    20s
    Verify navigation to junior membership form
    Enter Required Details For Junior Membership
    Sleep    20s
    Submit the data and proceed to payment option
    verify payment process for membership plan
    Verify invoice creation of payment
    Sleep    10s
    Verify Email


TC_022 Verify that user already purchased this plan then that membership plan button will disable
    Click On Login Button
    Enter Mobile Number     ${mobile_number_4}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_4}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration   ${email_4}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Sleep    20s
    Verify navigation to junior membership form
    Enter Required Details For Junior Membership
    Sleep    20s
    Submit the data and proceed to payment option
    verify payment process for membership plan
    Verify invoice creation of payment
    Verify membership plan purchase button is disable

TC_023 verify that when user use 100% off coupon then user will not get invoice
    Click On Login Button
    Enter Mobile Number     ${mobile_number_5}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_5}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration   ${email_5}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Verify navigation to junior membership form
    Enter Required Details For Junior Membership
    Enter data in coupon feild for 100% off on membership plan
    Sleep    20s
    Submit the data and proceed to payment option
    Sleep    60s
    Verify 10% discount for coupon code
    verify payment process for membership plan
    Verify invoice creation of payment

TC_024 verify that multiple users can use 10% off coupon for Junior membership plan
    Click On Login Button
    Enter Mobile Number     ${mobile_number_6}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_6}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration   ${email_6}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Verify navigation to junior membership form
    Enter Required Details For Junior Membership
    Enter data in coupon feild for junior membership plan
    Submit the data and proceed to payment option
    Verify 10% discount for coupon code
    verify payment process for membership plan
    Verify invoice creation of payment
    Verify logout button of website
    Click On Login Button
    Enter Mobile Number     ${mobile_number_7}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_7}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration   ${email_7}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Verify navigation to junior membership form
    Enter Required Details For Junior Membership
    Enter data in coupon feild for junior membership plan
    Submit the data and proceed to payment option
    Verify 10% discount for coupon code
    verify payment process for membership plan
    Verify invoice creation of payment

TC_025 verify that multiple users can use 10% off coupon for Pro membership plan
    Click On Login Button
    Enter Mobile Number     ${mobile_number_8}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_8}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration   ${email_8}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Verify navigation to pro membership form page
    Enter Required Details For pro Membership
    Verify coupon code section on required feilds screen for membership plan
    Enter data in coupon feild for pro membership plan
    Submit the data and proceed to payment option
    Verify 10% discount for coupon code
    verify payment process for membership plan
    Verify invoice creation of payment
    Verify logout button of website
    Click On Login Button
    Enter Mobile Number     ${mobile_number_10}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_10}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration   ${email_10}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Verify navigation to pro membership form page
    Enter Required Details For pro Membership
    Verify coupon code section on required feilds screen for membership plan
    Enter data in coupon feild for pro membership plan
    Submit the data and proceed to payment option
    Verify 10% discount for coupon code
    verify payment process for membership plan
    Verify invoice creation of payment

TC_026 Verify that UNIJUN coupon code can be used only once
    Click On Login Button
    Enter Mobile Number     ${mobile_number_11}
    Click on No Button
    Click On Send SMS Button
    ${otp}  Login Into CMS And Get OTP    ${mobile_number_11}
    Enter OTP  ${otp}
    Fill all fields in profile fields For Registration   ${email_11}
    Click And Verify Submit Button
    User Should Get Redirected To Purchase Membership Screen
    Verify Membership Plan In Card Format
    Verify Skip Step 3
    User Should Get Redirected To Congratulations Screen
    verify next button to congratulations screen
    Verify 3 membership plan are display on screen
    Verify navigation to junior membership form
    Enter Required Details For Junior Membership
    Enter Unique coupon code in coupon code feild for junior membership plan