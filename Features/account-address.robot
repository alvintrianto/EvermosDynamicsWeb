*** Settings ***
Documentation                                      Homepage Feature
Library                                            SeleniumLibrary
Variables                                          ../Resource/Environment.yaml
Variables                                          ../Resource/Address.yaml
Variables                                          ../Resource/CartLocator.yaml

*** Keywords ***
Open toko homepage 
    Open browser                                    ${url}    ${browser}
    Wait until page contains                        QA Candidate
    sleep                                           2s
Closing browser
    Close browser
Open Daftar Alamat Pengiriman page
    click element                                   ${menu_akun}
    sleep                                           2s
    click element                                   ${address_page}
    sleep                                           2s
User click tambah alamat
    click element                                   ${add_address}
    sleep                                           2s
User input new address form
    Input Text                                      ${address_title_form}       Rumah 1
    Input Text                                      ${address_name_form}        Testing User
    Input Text                                      ${address_phone_form}       0812345768343
    Click element                                   ${address_choose}               
    Sleep                                           2s
    Input Text                                      ${address_choose_search}    Gambir                    
    Sleep                                           5s
    Click element                                   ${address_choose_pick}
    sleep                                           5s
    Input Text                                      ${address_detail_form}      Jl. Kenangan no.10
    click element                                   ${save_address} 
    Sleep                                           2s
Choose Ok On Next Confirmation      
    Click Element   xpath=//a[contains(.,'OK')]
    Confirm Action 

***Test Cases***

User add new address
    Open toko homepage 
    Open Daftar Alamat Pengiriman page
    User click tambah alamat
    User input new address form
    Choose Ok On Next Confirmation   
    wait until page contains                        Rumah 1
    Closing browser