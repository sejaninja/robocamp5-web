***Settings***
Documentation       BasePage
...                 Representa a inicialização do Selenium e demais cursos como ganchos e helpers

Resource    Components.robot
Resource    LoginPage.robot
Resource    ProductPage.robot

***Variables***
${base_url}         http://pixel-web:3000

***Keywords***
## hooks
Open Session
    Open Chrome
    Set Window Size     1440    900

    Set Selenium Implicit Wait  5

Login Session
    [Arguments]     ${email}       ${pass}
    Open Session
    Go To           ${base_url}/login
    Login With      ${email}      ${pass}

Product Add Session
    [Arguments]     ${email}       ${pass}
    Login Session   ${email}       ${pass}
    ProductPage.Go To Add Form


Close Session
    Close Browser

Clear Local Storage
    Execute Javascript      localStorage.clear();

After Test
    Capture Page Screenshot

## helpers
Open Chrome
    Open Browser        about:blank     chrome    options=add_experimental_option('excludeSwitches', ['enable-logging'])

