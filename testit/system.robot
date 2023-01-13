*** Settings ***
Documentation    Testaukset järjestelmätesteille.

Library    SeleniumLibrary

*** Variables ***
${eka}    
${toka}
${kolmas}

*** Test Cases ***
Aakkosjärjestys
    Open Browser    http://localhost:3000/    Safari
    Maximize Browser Window
    Set Selenium Speed    0.02

    Click Element    xpath://a[contains(text(),'Projects')]
    Click Button    xpath://button[contains(text(),'More...')]
    Click Button    xpath://button[contains(text(),'More...')]
    Click Button    xpath://button[contains(text(),'More...')]
    Click Button    xpath://button[contains(text(),'More...')]
    
    ${eka}=    Get Text   css:.cols-sm:nth-child(1) strong
    ${toka}=     Get Text    css:.cols-sm:nth-child(40) strong
    ${kolmas}=     Get Text    css:.cols-sm:nth-child(95) strong

    Should Be True    ${{'${eka}' < '${toka}'}}
    Should Be True    ${{'${toka}' < '${kolmas}'}}

Päivitä lomake toimivilla tiedoilla
    
    Click Element    css:.cols-sm:nth-child(1) .bordered
    Page Should Contain Element    name:projectForm

    Click Element    id:name
    Input Text    id:name    Uusi Nimi5
    Click Element    id:description
    Input Text    id:description    Kuvaus
    Click Element    id:budget
    Input Text    id:budget    3000
    Click Element    id:isActive
    Click Button    xpath://button[contains(text(),'Save')]

    Page Should Contain    Uusi Nimi5
    Page Should Contain    Kuvaus
    Page Should Not Contain Element    name:projectForm



Täytä lomake virheellisillä tiedoilla
    Click Element    css:.cols-sm:nth-child(2) .bordered
    Click Element    id:name
    Input Text    id:name    Uu
    Page Should Contain Element    css:.error
    Click Element    id:name
    Input Text    id:name    Uusi

    Click Element    id:description
    Clear Element Text    id:description
    Click Element    id:budget
    Page Should Contain   Description is required.

    Clear Element Text    id:budget
    Page Should Contain    Budget must be more than $0.

    Click Button    xpath://button[contains(text(),'Save')]

    [Teardown]    Close Browser
    
Avaa Chromella ja muokkaa
    Create Webdriver    Chrome    executable_path=/Users/jennaviljakainen/Documents/chromedriver-2
    Sleep    2s
    Go To    http://localhost:3000
    Maximize Browser Window
    Set Selenium Speed    0.02
    
    Click Element    xpath://a[contains(text(),'Projects')]
    Click Element    css:.cols-sm:nth-child(4) .bordered
    Page Should Contain Element    name:projectForm

    Click Element    id:name
    Input Text    id:name    Projekti0
    Click Element    id:description
    Input Text    id:description    Kuvaus12
    Click Element    id:budget
    Input Text    id:budget    90
    Click Element    id:isActive
    Click Button    xpath://button[contains(text(),'Save')]

    Page Should Contain    Projekti0
    Page Should Contain    Kuvaus12
    Page Should Not Contain Element    name:projectForm
    
Avaa muokatun kentän tiedot
    Click Element    css:.cols-sm:nth-child(4) strong
    Page Should Contain    Projekti0
    Page Should Contain    Kuvaus12
    Page Should Contain    Budget : 90
    Page Should Contain    active
    [Teardown]    Close Browser
