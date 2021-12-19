*** Settings ***
Documentation                                      Product Detail Feature
Library                                            SeleniumLibrary
Variables                                          ../Resource/Environment.yaml
Variables                                          ../Resource/SearchLocator.yaml
Variables                                          ../Resource/CartLocator.yaml


*** Variables ***
${brand}                                            xpath=//*[contains(text(),'RST Wardrobe')]
${product}                                          xpath=//*[contains(text(),'Firsthand - BAJU KOKO AISEE')]



*** Keywords ***
Open toko homepage
    Open browser                                    ${url}    ${browser}
    Wait until page contains                        QA Candidate
    sleep                                           2s
Closing browser
    Close browser
User open Baju Koko AISEE product detail
    click element                                   ${brand}
    sleep                                           1s
    click element                                   ${product}
    Wait until page contains                        Deskripsi Produk
Scroll to view
    [Arguments]         ${xpath}
    ${tmp}=     SeleniumLibrary.get element attribute   ${xpath}    id
    assign id to element    ${xpath}     scrollID
    execute javascript      document.getElementById('scrollID').scrollIntoView();
    run keyword if  '${tmp}' != '${EMPTY}'    assign id to element    ${xpath}     ${tmp}
Scroll to Lihat Ulasan
    sleep                                           1s
    execute javascript                              window.scrollTo(0,document.body.scrollHeight)
    sleep                                           1s
    execute javascript                              window.scrollTo(0,document.body.scrollHeight)
    

***Test Cases***
User choose product variant
    [Documentation]                                 As user, I want to choose pick BAJU KOKO AISEE L Maroon
    Open toko homepage
    User open Baju Koko AISEE product detail   
    Scroll to view                                  xpath=//*[@id="__layout"]/div/div[4]/div[2]
    click element                                   ${size}   
    sleep                                           1s
    click element                                   ${color}   
    Wait until page contains                        Firsthand - BAJU KOKO AISEE L Maroon
    Closing browser

User see 5 stars product reviews            
    [Documentation]                                 As user, I want to see the 5 stars reviews
    Open toko homepage
    User open Baju Koko AISEE product detail 
    Scroll to Lihat Ulasan
    click element                                   ${review} 
    sleep                                           2s
    click element                                   ${5stars} 
    Closing browser

User see empty product reviews
    [Documentation]                                 As user, I want to see the 4 stars reviews
    Open toko homepage
    User open Baju Koko AISEE product detail
    Scroll to Lihat Ulasan
    click element                                   ${review}   
    sleep                                           2s
    click element                                   ${4stars}
    wait until page contains                        Ulasan tidak di temukan
    Closing browser

User add product to cart                            
    [Documentation]                                 As user, I want to checkout BAJU KOKO AISEE L Hitam
    Open toko homepage
    User open Baju Koko AISEE product detail 
    Scroll to view                                  xpath=//*[@id="__layout"]/div/div[4]/div[2]
    click element                                   ${size}   
    sleep                                           1s
    click element                                   ${addtocart}
    sleep                                           5s
    click element                                   ${seecart}
    wait until page contains                        Hitam - L
    Closing browser
