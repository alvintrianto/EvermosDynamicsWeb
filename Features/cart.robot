*** Settings ***
Documentation                                      Cart Feature
Library                                            SeleniumLibrary
Variables                                          path/Resource/CartLocator.yaml

*** Variables ***
${url}                                              https://berikhtiar.com/qa.candida.f22
${browser}                                          Chrome
${cart}                                             xpath=//*[@id="appCover"]/div/div/a
${search_button}                                    xpath=//html/body/div[1]/div[3]/form/div[1]/div[1]/div[2]/div[2]/div[5]/center/input[1]

*** Test Cases ***
User open Blog Page
    [Documentation]                                 As a user I can open Evermos Dynamic Website
    open browser                                    ${url}    ${browser}
    wait until page contains                        QA Candidate
    click element                                   ${cart}
    close browser

