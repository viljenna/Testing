*** Settings ***
Documentation    Testaukset integraatiotesteille.

Library    SeleniumLibrary


*** Test Cases ***
Päivitä lomake ja tarkasta tallentuuko
    Open Browser    http://localhost:3000/    Safari
    Maximize Browser Window
    Set Selenium Speed    0.02

    Click Element    xpath://a[contains(text(),'Projects')]
    Click Element    css:.cols-sm:nth-child(1) .bordered
    Click Element    id:name
    Input Text    id:name    Projekti200
    Click Button    xpath://button[contains(text(),'Save')]
    Page Should Contain    Projekti200

Siirry Project Detaileihin
    Click Element    xpath://Strong[contains(text(),'Projekti200')]
    Page Should Contain    Project Detail
    Page Should Contain    Projekti200

Palaa Projekteihin
    Click Element    xpath://a[contains(text(),'Projects')]
    Click Button    xpath://button[contains(text(),'More...')]
    Click Button    xpath://button[contains(text(),'More...')]
    Click Button    xpath://button[contains(text(),'More...')]
    Click Button    xpath://button[contains(text(),'More...')]
    Page Should Contain    Projekti200

    [Teardown]    Close Browser




