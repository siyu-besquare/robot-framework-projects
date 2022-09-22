*** Settings ***
Resource    ../resources.robot

*** Test Cases ***
Login to Deriv
    Login

Validate Real Account
    Check Real Account
    
Switch to Virtual Account
    Switch to Demo


Validate Virtual Account
    Check Demo Account
