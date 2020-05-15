***Settings***
Documentation       Aqui teremos todas a palavras de ação dos testes autoamtizados

Library     SeleniumLibrary

Library     libs/database.py

Resource    pages/BasePage.robot
Resource    pages/SideBar.robot
Resource    pages/LoginPage.robot

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

# Desafio: Implementar Page Object para os dois steps abaixo.
# Crie o arquivo ProductPage

Quando eu cadastro deste produto
    Wait Until Element Is Visible   class:product-add
    Click Element                   class:product-add

    Input Text      css:input[placeholder$="produto?"]      ${product_json['title']}

    # selecione categoria
    Click Element   css:input[placeholder^=Gat]

    Wait Until Element Is Visible       xpath://li//span[text()='${product_json['cat']}']
    Click Element                       xpath://li//span[text()='${product_json['cat']}']

    Input Text      css:input[name=price]            ${product_json['price']}

    Click Element   id:create-product

Então devo ver este item na lista
    Table Should Contain    class:table     ${product_json['title']}