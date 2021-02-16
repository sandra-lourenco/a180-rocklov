#language: pt

Funcionalidade: Cadastro
    Sendo um músico que possui equipamentos musicais
    Quero fazer o meu cadastro no RockLov
    Para que eu possa disponibilizá-los para locação

    
    Cenario: Fazer cadastro

        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            | nome   | email            | senha  |
            | Sandra | sandra@yahoo.com | abc123 |
        Então sou redirecionado para o Dashboard

    Esquema do Cenario: Tentativa de Cadastro

        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            | nome         | email         | senha         |
            | <nome_input> | <email_input> | <senha_input> |
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | nome_input | email_input      | senha_input | mensagem_output                  |
            |            | sandra@yahoo.com | abc123      | Oops. Informe seu nome completo! |
            | Sandra     |                  | abc123      | Oops. Informe um email válido!   |
            | Sandra     | sandra$yahoo.com | abc123      | Oops. Informe um email válido!   |
            | Sandra     | sandra@yahoo.com |             | Oops. Informe sua senha secreta! |

