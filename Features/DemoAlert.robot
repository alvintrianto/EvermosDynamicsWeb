*** Settings ***
Documentation                                      Demo Alert Feature
Library                                            SeleniumLibrary
Variables                                          ../Resource/Environment.yaml

***Variables***
${alert_button}                                     xpath=//*[contains(text(),'Click Me')]

*** Keywords ***
Open Web
    Open browser                                    ${url2}    ${browser}
    Wait until page contains                        Alert
    sleep                                           2s
Choose Ok On Next Confirmation      
    click element                                   ${alert_button}
    Handle Alert                                    action=ACCEPT
    Wait until page contains                        You pressed OK!


*** Test Cases ***
Handling Alert Popup
    Open Web
    Choose Ok On Next Confirmation