***Settings***
Documentation   Login
...             Sendo um administrador de catálogo
...             Quero me autenticar no sistema
...             Para que eu possa gerenciar os produtos da loja virtual

Resource        ../resources/actions.robot

Suite Setup         Open Session
Suite Teardown      Close Session

Test Teardown       After Test

***Test Cases***
Usuário autenticado
    [tags]     success_login
    Dado que acesso a página login
    Quando submeto minhas credenciais "papito@ninjapixel.com" e "pwd123"
    Então devo ser autenticado

    [Teardown]      Clear Local Storage

Senha invalida
    [Template]          Tentativa de login
    papito@ninjapixel.com       abc123      Usuário e/ou senha inválidos

Email não cadastrado
    [Template]          Tentativa de login
    404@gmail.com       abc123      Usuário e/ou senha inválidos

Email incorreto
    [Template]          Tentativa de login
    joao&yahoo.com       abc123      Usuário e/ou senha inválidos

Email não informado
    [Template]          Tentativa de login
    ${EMPTY}       abc123      Opps. Informe o seu email!

Senha não informada
    [Template]          Tentativa de login
    papito@ninjapixel.com       ${EMPTY}      Opps. Informe a sua senha!

***Keywords***
Tentativa de login
    [Arguments]         ${input_email}      ${input_pass}       ${output_text}

    Dado que acesso a página login
    Quando submeto minhas credenciais "${input_email}" e "${input_pass}"
    Então devo ver a mensagem de alerta "${output_text}"