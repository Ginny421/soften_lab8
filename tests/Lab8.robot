*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        https://computing.kku.ac.th/

*** Test Cases ***
Open computing Website
    Open Browser    ${URL}    ${BROWSER}
    ...    options=add_argument(--headless)
    ...    options=add_argument(--no-sandbox)
    ...    options=add_argument(--disable-dev-shm-usage)
    ...    options=add_argument(--disable-gpu)
    ...    options=add_argument(--window-size\=1920,1080)

    ${title}=    Get Title
    Should Contain    ${title}    College of Computing
    Close Browser
