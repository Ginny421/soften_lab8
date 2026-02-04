*** Settings ***
Library    SeleniumLibrary [cite: 8]

*** Variables ***
${URL}      https://computing.kku.ac.th [cite: 8]
${BROWSER}  headlesschrome [cite: 8]

*** Test Cases ***
Open KKU Computing Website
    [Documentation]    เปิดเว็บ computing.kku.ac.th และตรวจสอบว่าเว็บเปิดได้ [cite: 8]
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    # เพิ่ม Arguments ที่จำเป็นสำหรับการรันใน Docker
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --window-size\=1920,1080
    
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${URL}
    Page Should Contain    คณะ [cite: 8]
    Close Browser [cite: 8]
