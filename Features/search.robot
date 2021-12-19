*** Settings ***
Documentation                                      Product Search Feature
Library                                            SeleniumLibrary
Variables                                          ../Resource/Environment.yaml
Variables                                          ../Resource/Flashsale.yaml
Variables                                          ../Resource/CartLocator.yaml


*** Variables ***
${brand}                                            xpath=//*[contains(text(),'RST Wardrobe')]
${product}                                          xpath=//*[contains(text(),'Firsthand - BAJU KOKO AISEE')]
${search_field}                                     xpath=//*[@class='appHeading__search__input']
${search_button}                                    xpath=//*[@class='appHeading__search__button'] 
${url_search}                                       https://berikhtiar.com/qa.candida.f22/browse?q=

*** Keywords ***
Open toko homepage search
    Open browser                                    ${url_search}    ${browser}
    Wait until page contains                        Total Model
    sleep                                           2s
Closing browser
    Close browser
User open search
    [Arguments]                                     ${search_input}  ${search_text}
    Input text                                      ${search_field}  ${search_input}
    Click element                                   ${search_button}  
    Wait until page contains                        ${search_text}

*** Test Cases ***
User want to search listed products
    [Documentation]                                 As user I want to search "Madu" products list
    Open toko homepage search
    User open search                                Madu            Madu
    Closing browser

User search unlisted product
    [Documentation]                                 As user I want to search "Handphone" products list
    Open toko homepage search
    User open search                                Handphone       -
    Closing browser

