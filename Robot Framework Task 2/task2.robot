*** Settings ***
Library    SeleniumLibrary
Resource    ../resources.robot

*** Variables ***
${clickable card}    //*[@class="dc-result__caption-wrapper"]

*** Keywords ***
Select Duration
    Wait Until Page Does Not Contain Element    ${loading interface}      30
    Wait Until Page Contains Element    //*[@id="dt_range_slider_label" and contains(.,'5 Ticks')]

*** Test Cases ***
Login Demo
    Login
    Check Real Account
    Switch to Demo
    Check Demo Account

Underlying
    Select Underlying    Synthetic Indices    Volatility 10 (1s) Index

Duration
    Select Duration

Stake
    Select Stake

Purchase Rise Contract
    Purchase    ${rise button}
    
Purchase Validation
    Validate Purchase    ${clickable card}    ${clickable card}    10.00    'Volatility 10 (1s) Index'    'Rise'    //*[@class="dc-text contract-audit__value" and contains(.,'5 ticks')]