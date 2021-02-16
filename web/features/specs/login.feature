#language: pt



Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    Para que eu possa anunciar meus equipamentos musicais


    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "pete@yahoo.com" e "abc123"
        Então sou redirecionado para o Dashboard


    Esquema do Cenario: Tentar Logar
        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | email_input    | senha_input | mensagem_output                  |
            | pete@yahoo.com | aaa123      | Usuário e/ou senha inválidos.    |
            | pete@404.com   | abc123      | Usuário e/ou senha inválidos.    |
            | pete$yahoo.com | aaa123      | Oops. Informe um email válido!   |
            |                | aaa123      | Oops. Informe um email válido!   |
            | pete@yahoo.com |             | Oops. Informe sua senha secreta! |





