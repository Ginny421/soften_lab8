*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Computing Headless Mac
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --window-size=1920,1080
    Create Webdriver    Chrome    options=${options}
    Go To    https://computing.kku.ac.th/

*** Test Cases ***
Open computing Website
    Open Computing Headless Mac
    ${title}=    Get Title
    Should Contain    ${title}    College of Computing
    Close Browser
