*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${email field}    //input[@type='email']
${account info button}    dt_core_account-info_acc-info
${loading interface}    //*[@aria-label="Loading interface..."]
${rise button}    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]


*** Keywords ***
Login
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${rise button}    30
    Click Element    dt_login_button
    Wait Until Page Contains Element    ${email field}    10
    Input Text    ${email field}    insertemail@hotmail.com
    Input Text    //input[@type='password']    InsertPasswordHere
    Click Element    //button[@type='submit']
    Wait Until Page Does Not Contain Element    ${loading interface}      30


Check Real Account
    Click Element    ${account info button}
    Wait Until Page Contains Element    //*[@class='acc-switcher__account acc-switcher__account--selected']

Switch to Demo
    Click Element    dt_core_account-switcher_demo-tab
    Click Element    //*[@class='acc-switcher__id']

Check Demo Account
    Wait Until Page Does Not Contain Element    ${loading interface}    30
    Click Element    ${account info button}
    Wait Until Page Contains Element    //*[@class='acc-switcher__account acc-switcher__account--selected']


Select Underlying
    [Arguments]    ${market}    ${indices}
    Click Element    //*[@class="cq-symbol-select-btn"]
    Click Element    //*[@class="sc-mcd__filter__item " and contains(.,'${market}')]
    Wait Until Page Contains Element    //*[@class="sc-mcd__filter__item sc-mcd__filter__item--selected"]    30
    Click Element    //*[@class="sc-mcd__item__name" and contains(.,'${indices}')]


Select Contract Type
    [Arguments]    ${type}
    Wait Until Page Contains Element    //*[@data-testid="dt_contract_dropdown"]    30
    Click Element    //*[@data-testid="dt_contract_dropdown"]
    Click Element    //*[@class="dc-text contract-type-item__title" and contains(.,'${type}')]

Select Duration
    Press Keys    //*[@name="duration"]    BACKSPACE
    Input Text    //*[@name="duration"]    4

Select Stake
    Press Keys    //*[@class="dc-input-wrapper__input input--has-inline-prefix input trade-container__input"]    CTRL+A    BACKSPACE
    Input Text    //*[@class="dc-input-wrapper__input input--has-inline-prefix input input--error trade-container__input"]    10.00

Select Payout
    [Arguments]    ${payout}
    Click Element    //*[@class="dc-btn dc-btn__toggle dc-button-menu__button" and contains(.,'Payout')]
    Press Keys     //*[@class="dc-input-wrapper__input input--has-inline-prefix input trade-container__input"]    CTRL+A    BACKSPACE    
    Input Text    //*[@class="dc-input-wrapper__input input--has-inline-prefix input input--error trade-container__input"]    ${payout}

Purchase
    [Arguments]    ${purchase}
    Wait Until Page Contains Element    //div[@class="btn-purchase__text_wrapper" and contains(.,'%')]    30
    Click Element    ${purchase}

Validate Purchase
    [Arguments]    ${type of card}    ${card to click}    ${price}    ${indices}    ${type of purchase}    ${duration}
    Wait Until Page Contains Element    ${type of card}    30
    Click Element    ${card to click}
    Wait Until Page Contains Element    //*[@class="dc-contract-card-item__body" and contains(.,${price})]
    Wait Until Page Contains Element    //*[@class="dc-text dc-contract-card__symbol" and contains(.,(${indices}))]
    Wait Until Page Contains Element    //*[@class="dc-contract-type__type-label" and contains(.,${type of purchase})]
    Wait Until Page Contains Element    ${duration}

Select Barrier
    Press Keys    //*[@class="input trade-container__input trade-container__barriers-input trade-container__barriers-single-input"]    HOME    SHIFT+=

Validate Barrier Error
    Wait Until Page Contains Element    //*[@class="trade-container__tooltip dc-tooltip dc-tooltip--error"]
    Wait Until Page Contains Element    //*[@class="trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled"]