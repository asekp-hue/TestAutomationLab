*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    C:/Users/USER/Downloads/ChromeForTesting/chrome-win64/chrome.exe
${CHROME_DRIVER_PATH}     C:/Users/USER/Downloads/ChromeForTesting/chromedriver-win64/chromedriver.exe
${URL}                    http://localhost:7272/Registration.html

*** Test Cases ***
TC_001:Open Workshop Registration Page
    # 1. สร้าง Options
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    
    # 2. กำหนด Path Browser 
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    
    # 3. สร้าง Service 
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    
    # 4. เปิด Browser
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${URL}

TC_002:Register Success No Organization Info
    Input Text    id=firstname    Somyod

    Input Text    id=lastname     Sodsai
    
    Input Text    id=email        somyod@kkumail.com
    
    Input Text    id=phone        091-001-1234

    Click Button    id=registerButton

    Wait Until Element Contains    tag=h1    Thank you for registering with us.

    Wait Until Element Contains    tag=h2    We will send a confirmation to your email soon.

    Title Should Be    Success
    