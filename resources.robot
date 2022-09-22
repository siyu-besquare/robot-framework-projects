*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${email field}    //input[@type='email']
${account info button}    dt_core_account-info_acc-info
${loading interface}    //*[@aria-label="Loading interface..."]


*** Keywords ***
Login
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    dt_login_button
    Wait Until Page Contains Element    ${email field}    10
    Input Text    ${email field}    si.yu@besquare.com.my
    Input Text    //input[@type='password']    DerivPassWord123
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
    [Arguments]    ${val}
    Click Element    //*[@class="dc-btn dc-btn__toggle dc-button-menu__button" and contains(.,'Payout')]
    Press Keys     //*[@class="dc-input-wrapper__input input--has-inline-prefix input trade-container__input"]    CTRL+A    BACKSPACE    
    Input Text    //*[@class="dc-input-wrapper__input input--has-inline-prefix input input--error trade-container__input"]    ${val}

Purchase
    Wait Until Page Contains Element    //*[@class="dc-text" and contains(.,'%')]    30
    Click Element    //*[@class="btn-purchase__info btn-purchase__info--left" and contains(.,'Lower')]

