*** Settings ***
Library   AppiumLibrary
Library    OperatingSystem
Resource    ../../Resources/Login/login_keywords.robot
Resource    ../../Resources/FLRP/flrp_keywords.robot
Resource    ../../Resources/CometChat/comet_chat_keywords.robot
Variables    ../../Resources/CometChat/comet_chat_locators.py

#Test Setup    Open KC application
Test Teardown    Close Application

*** Test Cases ***
Verify registered user can join 'N' number of clubs in the given club list
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000035
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Join N Fan Chat Groups    1

Verify only moderator, admin can send the photos/videos, create the poll, pin the message
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000039
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Click On Joined Button
    Verify Admin | Moderator Can Send Photo | Video In Group
    Verify Admin | Moderator Can Create Poll In Group

Verify any members can send gif file
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000035
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Join A Group If Not Joined Any And Open Chat
    Send GIF In Group Chat

Verify admin can ban and remove any member in a club except admin and owner
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000039
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Click On Joined Button
    Verify Admin Can Ban Any Member    test 6
    Verify Admin Can Remove Any Member    test 7

Verify any member can leave the group
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000035
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Leave N Fan Chat Groups    2

Verify ban members can't join the same group , unless those ban members is unban
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000031
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Verify Ban User Can't Join Group    Fan Group 1

Verify only admin can promote demote participant, moderator and admin
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000040
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Click On Joined Button
    Verify Admin Can Promote Participant    test 2

Verify club search functionality
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000031
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Search Group Name    Group
    sleep    2
    Verify Search Functionality Of Comet Chat    Group

Verify any member can react, in-reply message and see message information
    set library search order    AppiumLibrary    SeleniumLibrary
    Open KC application
    Verify Login Screen
    Enter Mobile Number    9000000032
    Click On Request Otp Button
    Enter Otp    123456
    Click On Skip Button If Visible
    Click On Fan Chat Buttom
    Join A Group If Not Joined Any And Open Chat
    sleep    2
    ${count}    get matching xpath count    ${message_section}
    Verify User Can React On The Last Message    ${count}
    Verify User Can Reply Last Message With Comment    ${count}    nice
    sleep    2
    Verify Sent Message    nice