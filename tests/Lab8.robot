*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.computing.kku.ac.th

*** Test Cases ***
Open computing Website
    Open Browser    ${URL}    headlesschrome
    Title Should Be    College of Computing
    Close Browser
