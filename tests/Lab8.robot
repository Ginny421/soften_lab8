 Settings 
Library    SeleniumLibrary

 Keywords 
Open Computing Headless
    ${opts}=    Evaluate    import('selenium.webdriver').webdriver.ChromeOptions()
    Call Method    ${opts}    add_argument    --headless
    Call Method    ${opts}    add_argument    --no-sandbox
    Call Method    ${opts}    add_argument    --disable-dev-shm-usage
    Call Method    ${opts}    add_argument    --disable-gpu
    Call Method    ${opts}    add_argument    --window-size=1920,1080
    Create Webdriver    Chrome    options=${opts}
    Go To    https://computing.kku.ac.th/

 Test Cases 
Open computing Website
    Open Computing Headless
    ${title}=    Get Title
    Should Contain    ${title}    College of Computing
    Close Browser
