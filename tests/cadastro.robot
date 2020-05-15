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
