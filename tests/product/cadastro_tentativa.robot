***Settings***
Documentation       Tentativa de cadastro de produtos
...                 Estes cenários enriquecem a história da suite cadastro.robot

Resource        ../../resources/actions.robot

Suite Setup         Product Add Session  papito@ninjapixel.com    pwd123
Suite Teardown      Close Session

Test Setup          Go To Route Form
Test Teardown       After Test
Test Template       Tentar cadastrar produtos

# Desafio implementar a tentativa de cadastro até 25 de maio de 2020

***Keywords***
Tentar cadastrar produtos
    [Arguments]     ${json_file}        ${expect_message}

    Dado que eu tenho um novo produto   ${json_file}
    Quando tento cadastrar esse produto
    Então devo ver uma mensagem informativa  ${expect_message}

***Test Cases***
Nome não informado          contra.json     Oops - Informe o nome do produto!
Categoria não selecionada   streetf2.json   Oops - Selecione uma categoria!
Preço não informado         shinobi.json    Oops - Informe o preço também!

