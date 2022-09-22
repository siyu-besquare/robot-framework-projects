*** Settings ***
Library    SeleniumLibrary
Resource       ../resources.robot

*** Keywords ***
Select Underlying
    Click Element    //*[@class="cq-symbol-select-btn"]
    Click Element    //*[@class="sc-mcd__filter__item " and contains(.,'Forex')]
    Click Element    //*[@class="sc-mcd__item__name" and contains(.,'AUD/USD')]


Select Contract Type
    Wait Until Page Contains Element    //*[@data-testid="dt_contract_dropdown"]    30
    Click Element    //*[@data-testid="dt_contract_dropdown"]
    Click Element    //*[@class="dc-text contract-type-item__title" and contains(.,'Higher/Lower')]

Select Duration
    Press Keys    //*[@name="duration"]    BACKSPACE
    Input Text    //*[@name="duration"]    4

Select Payout
    Click Element    //*[@class="dc-btn dc-btn__toggle dc-button-menu__button" and contains(.,'Payout')]
    Press Keys     //*[@class="dc-input-wrapper__input input--has-inline-prefix input trade-container__input"]    BACKSPACE    BACKSPACE    
    Input Text    //*[@class="dc-input-wrapper__input input--has-inline-prefix input input--error trade-container__input"]    15.50

Purchase
    Wait Until Page Contains Element    //*[@class="dc-text" and contains(.,'%')]    30
    Click Element    //*[@class="btn-purchase__info btn-purchase__info--left" and contains(.,'Lower')]


Validate Purchase
    Wait Until Page Contains Element    //*[@class="dc-contract-card__grid dc-contract-card__grid-underlying-trade dc-contract-card__grid-underlying-trade--trader"]    30
    Click Element    //*[@class="dc-contract-card dc-contract-card--red"]
    Wait Until Page Contains Element    //*[@class="dc-contract-card-item__body" and contains(.,'15.50')]
    Wait Until Page Contains Element    //*[@class="dc-text dc-contract-card__symbol" and contains(.,('AUD/USD'))]
    Wait Until Page Contains Element    //*[@class="dc-contract-type__type-label" and contains(.,'Lower')]

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

Payout
    Select Payout


Purchase Contract
    Purchase

Purchase Validation
    Validate Purchase