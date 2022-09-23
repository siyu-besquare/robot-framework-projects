*** Settings ***
Library    SeleniumLibrary
Resource    ../resources.robot

*** Variables ***
${active deal cancellation checkbox}    //*[@id='dt_cancellation-checkbox_input']/../span[@class="dc-checkbox__box dc-checkbox__box--active"]

*** Keywords ***
Check Stake
    Wait Until Page Contains Element    //*[@class="trade-container__fieldset-info trade-container__fieldset-info--left" and contains(.,'Stake')]

Check Payout
    Wait Until Page Does Not Contain Element    //*[@class="trade-container__fieldset-info trade-container__fieldset-info--left" and contains(.,'Payout')]

Check TP/SL
    Click Element    //*[@id='dc_take_profit-checkbox_input']/../span[@class='dc-checkbox__box']
    Input Text    //*[@class="dc-input-wrapper__input input--has-inline-prefix input input--error trade-container__input"]    10.00
    Click Element    //*[@id='dc_stop_loss-checkbox_input']/../span[@class='dc-checkbox__box']
    Input Text    //*[@class="dc-input-wrapper__input input--has-inline-prefix input input--error trade-container__input"]    10.00
    Wait Until Page Contains Element    //*[@id='dc_take_profit-checkbox_input']/../*[@class="dc-checkbox__box dc-checkbox__box--active"]    30
    Wait Until Page Contains Element    //*[@id='dc_stop_loss-checkbox_input']/../*[@class="dc-checkbox__box dc-checkbox__box--active"]    30
    Wait Until Page Contains Element    //*[@id='dt_cancellation-checkbox_input']/../span[@class='dc-checkbox__box']    30

Check Deal Cancellation
    Click Element    //*[@for="dt_cancellation-checkbox_input"]
    Wait Until Page Contains Element    ${active deal cancellation checkbox}    30
    Wait Until Page Contains Element    //*[@id='dc_take_profit-checkbox_input']/../span[@class='dc-checkbox__box']    30
    Wait Until Page Contains Element    //*[@id='dc_stop_loss-checkbox_input']/../span[@class='dc-checkbox__box']    30


Check Multiplier Selection
    Click Element    //*[@class="dc-text dc-dropdown__display-text"]
    Wait Until Page Contains Element    //*[@class="dc-list__item dc-list__item--selected" and contains(.,'20')]    30
    Wait Until Page Contains Element    //*[@class="dc-list__item" and contains(.,'40')]    30
    Wait Until Page Contains Element    //*[@class="dc-list__item" and contains(.,'60')]    30
    Wait Until Page Contains Element    //*[@class="dc-list__item" and contains(.,'100')]    30
    Wait Until Page Contains Element    //*[@class="dc-list__item" and contains(.,'200')]    30

Check Deal Cancellation Increases
    Press Keys    //*[@class="dc-input-wrapper__input input--has-inline-prefix input trade-container__input"]    CTRL+A    BACKSPACE
    Input Text    //*[@class="dc-input-wrapper__input input--has-inline-prefix input input--error trade-container__input"]    10.00
    Wait Until Page Contains Element    ${active deal cancellation checkbox}    30
    Click Element    dt_amount_input_add
    Wait Until Page Contains Element    //*[@class="trade-container__price-info-currency" and contains(.,'0.48')]    30


Check Maximum Stake
    Press Keys    //*[@class="dc-input-wrapper__input input--has-inline-prefix input trade-container__input"]    CTRL+A    BACKSPACE
    Input Text    //*[@class="dc-input-wrapper__input input--has-inline-prefix input input--error trade-container__input"]    2001
    Wait Until Page Contains Element    //*[@class="trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled" and contains(.,'0.00')]    30

Check Minimum Stake
    Press Keys    //*[@class="dc-input-wrapper__input input--has-inline-prefix input trade-container__input"]    CTRL+A    BACKSPACE
    Input Text    //*[@class="dc-input-wrapper__input input--has-inline-prefix input input--error trade-container__input"]    0.5
    Wait Until Page Contains Element    //*[@class="trade-container__tooltip dc-tooltip dc-tooltip--error"]    30

Test Plus Button
    Click Element    dt_amount_input_add
    Wait Until Page Contains Element    //*[@value="1.5"]    30


Test Minus Button
    Click Element    dt_amount_input_sub
    Wait Until Page Contains Element    //*[@value="0.5"]    30


Check Deal Cancellation Duration
    Wait Until Page Contains Element    ${active deal cancellation checkbox}    30
    Wait Until Page Contains Element    //*[@class="dc-text dc-dropdown__display-text" and contains(.,'minutes')]    30
    Click Element    //*[@class="dc-text dc-dropdown__display-text" and contains(.,'minutes')]
    Wait Until Page Contains Element    //*[@value="5m"]    30
    Wait Until Page Contains Element    //*[@value="10m"]    30
    Wait Until Page Contains Element    //*[@value="15m"]    30
    Wait Until Page Contains Element    //*[@value="30m"]    30
    Wait Until Page Contains Element    //*[@class="dc-list__item dc-list__item--selected"]    30


*** Test Cases ***
Login to Demo
    Login
    Check Real Account
    Switch to Demo
    Check Demo Account

Underlying
    Select Underlying    Synthetic Indices    Volatility 50 Index

Contract Type
    Select Contract Type    Multipliers


Check Stake and Payout
    Check Stake
    Check Payout

Check Deal Cancellation, TP/SL
    Check TP/SL
    Check Deal Cancellation

Multiplier
    Check Multiplier Selection


Does Deal Cancellation Increase
    Check Deal Cancellation Increases

Maximum Stake
    Check Maximum Stake

Minimum Stake
    Check Minimum Stake

Plus Button Test
    Test Plus Button

Minus Button Test
    Test Minus Button

Deal Cancellation Duration
    Check Deal Cancellation Duration