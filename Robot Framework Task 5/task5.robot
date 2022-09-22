*** Settings ***
Library    SeleniumLibrary
Resource    ../resources.robot

*** Keywords ***
Select Underlying
    Click Element    //*[@class="cq-symbol-select-btn"]
    Click Element    //*[@class="sc-mcd__filter__item " and contains(.,'Synthetic Indices')]
    Click Element    //*[@class="sc-mcd__item__name" and contains(.,'Volatility 50 Index')]


Select Contract Type
    Wait Until Page Contains Element    //*[@data-testid="dt_contract_dropdown"]    30
    Click Element    //*[@data-testid="dt_contract_dropdown"]
    Click Element    //*[@class="dc-text contract-type-item__title" and contains(.,'Multipliers')]
    Wait Until Page Contains Element    //*[@name="contract_type" and contains(.,'Multipliers')]

Check Stake
    Wait Until Page Contains Element    //*[@class="trade-container__fieldset-info trade-container__fieldset-info--left" and contains(.,'Stake')]

Check Payout
    Wait Until Page Does Not Contain Element    //*[@class="trade-container__fieldset-info trade-container__fieldset-info--left" and contains(.,'Payout')]

Check TP/SL
    Click Element    //*[@id='dc_take_profit-checkbox_input']/../span[@class='dc-checkbox__box']
    Click Element    //*[@id='dc_stop_loss-checkbox_input']/../span[@class='dc-checkbox__box']
    Checkbox Should Be Selected    //*[@id='dc_take_profit-checkbox_input']/../span[@class='dc-checkbox__box']
    Checkbox Should Be Selected    //*[@id='dc_stop_loss-checkbox_input']/../span[@class='dc-checkbox__box']
    Checkbox Should Not Be Selected    //*[@id='dt_cancellation-checkbox_input']/../span[@class='dc-checkbox__box']

Check Deal Cancellation
    Click Element    //*[@id='dt_cancellation-checkbox_input']/../span[@class='dc-checkbox__box']
    Checkbox Should Be Selected    //*[@id='dt_cancellation-checkbox_input']/../span[@class='dc-checkbox__box']
    Checkbox Should Not Be Selected    //*[@id='dc_take_profit-checkbox_input']/../span[@class='dc-checkbox__box']
    Checkbox Should Not Be Selected    //*[@id='dc_stop_loss-checkbox_input']/../span[@class='dc-checkbox__box']

*** Test Cases ***
Login to Demo
    Login
    Check Real Account
    Switch to Demo
    Check Demo Account

Underlying
    Select Underlying

Contract Type
    Select Contract Type


Check Stake and Payout
    Check Stake
    Check Payout

Check Deal Cancellation, TP/SL
    Check TP/SL
    Check Deal Cancellation