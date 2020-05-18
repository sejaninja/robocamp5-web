***Settings***
Documentation       Aqui teremos todas a palavras de ação dos testes autoamtizados

Library     SeleniumLibrary
Library     OperatingSystem

Library     libs/database.py

Resource    helpers.robot

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

    ${product_json}=       Get Product Json     ${json_file}

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

# exclusão

Dado "${json_file}" é um produto indesejado
    # Implementando com o conceito de Shared Steps
    # Dado que eu tenho um novo produto       ${json_file}
    # Quando faço o cadastro desse produto
    
    # Implementando chamando as Keywords
    ${product_json}=       Get Product Json     ${json_file}

    # Back To The Past
    Remove Product By Title     ${product_json['title']}

    ProductPage.Go To Add Form
    ProductPage.Create New Product  ${product_json}

    Set Test Variable      ${product_json}

Quando solicito a exclusão
    ProductPage.Request Removal  ${product_json['title']}

E confirmo a solicitação
    ProductPage.Confirm Removal

Então não devo ver esse item no catálogo
    Wait Until Element Does Not Contain     class:table     ${product_json['title']}