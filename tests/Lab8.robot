*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Computing Headless
    ${opts}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${opts}    add_argument    --headless
    Call Method    ${opts}    add_argument    --no-sandbox
    Call Method    ${opts}    add_argument    --disable-dev-shm-usage
    Call Method    ${opts}    add_argument    --disable-gpu
    Call Method    ${opts}    add_argument    "--window-size=1920,1080"
    Create Webdriver    Chrome    options=${opts}
    Go To    https://computing.kku.ac.th/

*** Test Cases ***
Open computing Website
    Open Computing Headless
    Title Should Contain    College of Computing
    Close Browser
