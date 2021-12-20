*** Settings ***
Documentation                                      Cart Feature
Library                                            SeleniumLibrary
Variables                                          ../Resource/CartLocator.yaml
Variables                                          ../Resource/Environment.yaml

*** Variables ***
${brand}                                            xpath=//*[contains(text(),'Toko MQ')]
${product}                                          xpath=//*[contains(text(),'Toko MQ Nutri Goat Susu Kambing ( Promo Get 1 )')]

*** Keywords ***

Open toko homepage
    Open browser                                    ${url}    ${browser}
    Wait until page contains                        QA Candidate
    sleep                                           2s
Closing browser
    Close browser
User add product to cart list
    [Arguments]                                     ${brand_choose}  ${product_choose}
    click element                                   ${brand_choose}
    sleep                                           1s
    click element                                   ${product_choose}
    sleep                                           2s
    click element                                   ${addtocart}
    sleep                                           5s
    wait until page contains                        Lihat Keranjang
    click element                                   ${seecart}
    wait until page contains                        Toko MQ Nutri Goat Susu Kambing ( Promo Get 1 ) 200gr Putih Biru


*** Test Cases ***
User open their cart page
    [Documentation]                                 As a user I want to check my cart list
    open browser                                    ${url}    ${browser}
    wait until page contains                        QA Candidate
    click element                                   ${cart}
    wait until page contains                        Keranjang
    Closing browser

User add product to cart 
    [Documentation]                                 As a user I can add product to cart list
    Open toko homepage
    User add product to cart list                   ${brand}  ${product}
    Closing browser

User change product's quantity in the cart
    [Documentation]                                 As a user I want to change Nutri Goat susu kambing quantity to 3
    Open toko homepage
    User add product to cart list                   ${brand}  ${product}
    sleep                                           2s
    click element                                   ${productCartItem_quantity}
    sleep                                           2s
    click element                                   ${productCartItem_quantity_option3}
    wait until page contains                        Rp196.650
    closing browser

User add product notes
    [Documentation]                                 As a user I want add notes
    Open toko homepage
    User add product to cart list                   ${brand}  ${product}
    sleep                                           2s
    click element                                   ${productCartNote_button}
    Sleep                                           2s
    Input Text                                      ${productCartNote_field}      Kantong kresek double
    click element                                   ${productCartNote_confirm}
    sleep                                           5s
    wait until page contains                        Kantong kresek double
    closing browser

User add infaq 
    [Documentation]                                 As a user I want add infaq by Rp10.000
    Open toko homepage
    User add product to cart list                   ${brand}  ${product}
    sleep                                           2s
    click element                                   ${infaq_checkbox}
    Sleep                                           1s
    click element                                   ${infaq_choose}
    wait until page contains                        Rp10.000






