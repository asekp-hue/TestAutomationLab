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

TC_002:Invalid Phone Number:
    Input Text    id=firstname    Somyod

    Input Text    id=lastname     Sodsai

    Input Text    id=organization    CS KKU
    
    Input Text    id=email    somyod@kkumail.com

    Input Text    id=phone        1234

    Click Button    id=registerButton

    Wait Until Element Contains    id=errors    Please enter a valid phone number!!
