*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless
    
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    https://computing.kku.ac.th

Close Browser Session
    Close Browser

*** Test Cases ***
Open KKU Computing Website
    [Documentation]    เปิดเว็บ computing.kku.ac.th และตรวจสอบว่าโหลดหน้าเว็บได้
    Open Browser To Login Page
    Title Should Be    คณะวิทยาการคอมพิวเตอร์ มหาวิทยาลัยขอนแก่น
    Close Browser Session
