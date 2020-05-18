***Settings***
Documentation       Exclusão de produtos
...                 Sendo um administrador de catálogo que possui produtos indesejados
...                 Quero deletes esses produtos
...                 Para que eu possa manter meu catálogo organizado

Resource        ../resources/actions.robot

Suite Setup         Login Session  papito@ninjapixel.com    pwd123
Suite Teardown      Close Session

Test Teardown       After Test

***Test Cases***
Apagar produto
    [tags]  delete_product

    Dado "mario.json" é um produto indesejado
    Quando solicito a exclusão
    E confirmo a solicitação
    Então não devo ver esse item no catálogo

# Desafio do Ninja
Desistir da remoção
    Dado que eu tenho o rpoduto "zelda.json"
    Quando solicito a exclusão
    Mas cancelo a solicitação
    Então devo ver este esse na lista