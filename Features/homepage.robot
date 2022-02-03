*** Settings ***
Documentation                                      Homepage Feature
Library                                            SeleniumLibrary
Variables                                          ../Resource/Environment.yaml
Variables                                          ../Resource/Flashsale.yaml
Variables                                          ../Resource/CartLocator.yaml


*** Variables ***
${brand}                                            xpath=//*[contains(text(),'RST Wardrobe')]
${product}                                          xpath=//*[contains(text(),'Firsthand - BAJU KOKO AISEE')]


*** Keywords ***
Open toko homepage
    Open browser                                    ${url}    ${browser}
  #  Wait until page contains                        QA Candidate
    sleep                                           2s
Closing browser
    Close browser
User click "lihat semua" flashsale
    click element                                   ${flashsale_list}
    sleep                                           2s
    wait until page contains                        Flashsale


*** Test Cases ***
Open Toko QA Candidate homepage  
    [Documentation]                                 As a user I want to open Toko QA Candidate on my browser
    Open toko homepage
    Closing browser

User see produk list from Brand Tersedia
    [Documentation]                                 As a user I want to see products list from Naisha Hijrah brand
    Open toko homepage
    click element                                   ${brand}
    wait until page contains                        Firsthand - BAJU KOKO AISEE
    Closing browser

User see FlashSale products list
    [Documentation]                                 As a user I want to see flashsale products list
    Open toko homepage
    User click "lihat semua" flashsale
    Closing browser

User see Flashsale product by Brand
    [Documentation]                                 As a user I want to see flashsale products list from brand Sahabah Store
    Open toko homepage
    User click "lihat semua" flashsale
    sleep                                           2s
    click element                                   ${flashsale_brand_choose}  
    sleep                                           1s
    click element                                   ${flashsale_brand} 
    wait until page contains                        Indahcraft
    Closing browser

User pick one product in flashsale list
    [Documentation]                                 As a user I want to add see the detail of product in flash sale 
    Open toko homepage
    sleep                                           2s
    User click "lihat semua" flashsale
    sleep                                           2s
    click element                                   ${flashsale_product}
    sleep                                           2s
    wait until page contains                        Deskripsi Produk
    Closing browser




