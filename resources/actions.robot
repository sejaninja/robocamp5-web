***Settings***
Documentation       Aqui teremos todas a palavras de ação dos testes autoamtizados

Library     SeleniumLibrary
Library     OperatingSystem

Library     libs/database.py

Resource    pages/BasePage.robot
Resource    pages/SideBar.robot
Resource    pages/LoginPage.robot
Resource    pages/ProductPage.robot

***Keywords***
## steps
Dado que acesso a página login
    Go To       ${base_url}/login

Quando submeto minhas credenciais "${email}" e "${pass}"
    LoginPage.Login With      ${email}      ${pass}

Então devo ser autenticado
    Wait Until Element Is Visible       ${LOGGED_USER}
    Wait Until Element Contains         ${LOGGED_USER}      Papito
    
Então devo ver a mensagem de alerta "${expect_alert}"
    Wait Until Element Is Visible       ${DIV_ALERT}
    Element Text Should Be              ${DIV_ALERT}     ${expect_alert}

# produtos

Dado que eu tenho um novo produto
    [Arguments]     ${json_file}

    ${string_file}=        Get File    ${EXECDIR}/resources/fixtures/${json_file}
    ${product_json}=       Evaluate    json.loads($string_file)     json

    # Back To The Past
    Remove Product By Title     ${product_json['title']}

    Set Test Variable      ${product_json}

Mas eu ja cadastrei este item e não tinha lembrado
    ProductPage.Go To Add Form
    ProductPage.Create New Product  ${product_json}

Quando faço o cadastro desse produto
    ProductPage.Go To Add Form
    ProductPage.Create New Product  ${product_json}

Então devo ver este item na lista
    Table Should Contain    class:table     ${product_json['title']}

Então devo ver a mensagem de alerta
    [Arguments]         ${expect_alert}
    Wait Until Element Contains     ${ALERT_DANGER}      ${expect_alert}