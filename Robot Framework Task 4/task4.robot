*** Settings ***
Library    SeleniumLibrary
Resource    ../resources.robot

*** Test Cases ***
Login Demo
    Login
    Check Real Account
    Switch to Demo
    Check Demo Account

Underlying
    Select Underlying    Forex    AUD/USD

Contract Type
    Select Contract Type    Higher/Lower

Duration
    Select Duration

Barrier
    Select Barrier

Payout
    Select Payout    10.00

Barrier Error
    Validate Barrier Error

