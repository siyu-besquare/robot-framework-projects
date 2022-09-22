*** Settings ***
Library    SeleniumLibrary
Resource    ../resources.robot

*** Keywords ***
Select Barrier
    Press Keys    //*[@class="input trade-container__input trade-container__barriers-input trade-container__barriers-single-input"]    HOME    SHIFT+=

Validate Barrier Error
    Wait Until Page Contains Element    //*[@class="trade-container__tooltip dc-tooltip dc-tooltip--error"]
    Wait Until Page Contains Element    ..*[@class="trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled"]

*** Test Cases ***
Login Demo
    Login
    Check Real Account
    Switch to Demo
    Check Demo Account

Underlying
    Select Underlying

Contract Type
    Select Contract Type

Duration
    Select Duration

Barrier
    Select Barrier

Payout
    Select Payout    15.50

