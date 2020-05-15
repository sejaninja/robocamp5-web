***Settings***
Documentation       Cadastro de produtos
...                 Sendo um administrador de catálogo
...                 Quero cadastrar novos produtos
...                 Para que eu possa disponibiliza-los na loja virtual

Library     OperatingSystem
Resource        ../resources/actions.robot

Suite Setup         Login Session  papito@ninjapixel.com    pwd123
Suite Teardown      Close Session

Test Teardown       After Test

***Test Cases***
Novo produto
    Dado que eu tenho um novo produto   dk.json
    Quando eu cadastro deste produto
    Então devo ver este item na lista

***Keywords***
Dado que eu tenho um novo produto
    [Arguments]     ${json_file}

    ${string_file}=        Get File    ${EXECDIR}/resources/fixtures/${json_file}
    ${product_json}=       Evaluate    json.loads($string_file)     json

    # Back To The Past
    Remove Product By Title     ${product_json['title']}

    Set Test Variable      ${product_json}

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