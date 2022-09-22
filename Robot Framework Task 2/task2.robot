*** Settings ***
Library    SeleniumLibrary
Resource    ../resources.robot

*** Variables ***
${rise button}    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]

*** Keywords ***
Select Underlying
    Click Element    //*[@class="cq-symbol-select-btn"]
    Wait Until Page Contains Element    //*[@class="sc-mcd__filter__item sc-mcd__filter__item--selected"]    30
    Click Element    //*[@class="sc-mcd__item__name" and contains(.,'Volatility 10 (1s) Index')]

Select Duration
    Wait Until Page Does Not Contain Element    ${loading interface}      30
    Wait Until Page Contains Element    //*[@id="dt_range_slider_label" and contains(.,'5 Ticks')]
Select Stake
    Press Keys    //*[@class="dc-input-wrapper__input input--has-inline-prefix input trade-container__input"]    BACKSPACE    BACKSPACE
    Input Text    //*[@class="dc-input-wrapper__input input--has-inline-prefix input input--error trade-container__input"]    10.00


Buy Contract
    Wait Until Page Contains Element    //div[@class="btn-purchase__text_wrapper" and contains(.,'%')]    30
    Click Element    ${rise button}


Validate Purchase
    Wait Until Page Contains Element    //*[@class="dc-result__caption-wrapper"]    30
    Click Element    //*[@class="dc-result__caption-wrapper"]
    Wait Until Page Contains Element    //*[@class="dc-contract-card-item__body" and contains(.,'10.00')]
    Wait Until Page Contains Element    //*[@class="dc-text dc-contract-card__symbol" and contains(.,('Volatility 10 (1s) Index'))]
    Wait Until Page Contains Element    //*[@class="dc-contract-type__type-label" and contains(.,'Rise')]
    Wait Until Page Contains Element    //*[@class="dc-text contract-audit__value" and contains(.,'5 ticks')]

*** Test Cases ***
Login Demo
    Login
    Check Real Account
    Switch to Demo
    Check Demo Account

Underlying
    Select Underlying

Duration
    Select Duration

Stake
    Select Stake

Purchase Rise Contract
    Buy Contract
    
Purchase Validation
    Validate Purchase