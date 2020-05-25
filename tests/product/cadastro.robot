***Settings***
Documentation       Cadastro de produtos
...                 Sendo um administrador de catálogo
...                 Quero cadastrar novos produtos
...                 Para que eu possa disponibiliza-los na loja virtual

Resource        ../../resources/actions.robot

Suite Setup         Login Session  papito@ninjapixel.com    pwd123
Suite Teardown      Close Session

Test Teardown       After Test

***Test Cases***
Novo produto
    [tags]      new_product
    Dado que eu tenho um novo produto   dk.json
    Quando faço o cadastro desse produto
    Então devo ver esse item na lista

Produto duplicado
    [tags]      dup
    Dado que eu tenho um novo produto  master.json
    Mas eu ja cadastrei este item e não tinha lembrado
    Quando faço o cadastro desse produto
    Então devo ver a mensagem de erro     Oops - Este produto já foi cadastrado!
