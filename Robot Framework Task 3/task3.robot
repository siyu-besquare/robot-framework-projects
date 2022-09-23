*** Settings ***
Library    SeleniumLibrary
Resource       ../resources.robot

*** Keywords ***
Select Duration
    Press Keys    //*[@name="duration"]    BACKSPACE
    Input Text    //*[@name="duration"]    4

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

Payout
    Select Payout    15.50


Purchase Contract
    Purchase    //*[@class="btn-purchase__info btn-purchase__info--left" and contains(.,'Lower')]

Purchase Validation
    Validate Purchase    //*[@class="dc-contract-card__grid dc-contract-card__grid-underlying-trade dc-contract-card__grid-underlying-trade--trader"]    //*[@class="dc-contract-card dc-contract-card--red"]    15.50    'AUD/USD'    'Lower'    //*[@class="dc-remaining-time"]