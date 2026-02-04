*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      https://computing.kku.ac.th
${BROWSER}  headlesschrome

*** Test Cases ***
Open KKU Computing Website
    [Documentation]    เปิดเว็บ computing.kku.ac.th และตรวจสอบว่าเว็บเปิดได้
    Open Browser    ${URL}    ${BROWSER}
    Page Should Contain    คณะ
    Close Browser
