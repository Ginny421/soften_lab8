*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      https://computing.kku.ac.th
${BROWSER}  headlesschrome

*** Test Cases ***
Open KKU Computing Website
    [Documentation]    เปิดเว็บ computing.kku.ac.th และตรวจสอบว่าเว็บเปิดได้
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless
    
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${URL}
    Page Should Contain    คณะ
    Close Browser