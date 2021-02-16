#language: pt

Funcionalidade: Receber pedido de locação
    Sendo um anunciante que possui equipamentos cadastrados
    Desejo receber pedidos de locação
    Para que eu possa decidir se quero aprova-los ou rejeita-los
    @pedido
    Cenario: Receber pedido

        Dado que meu perfil de anunciante é "anunciante@yahoo.com" e "abc123"
            E que eu tenho o seguinte equipamento cadastrado:
            | thumb     | trompete.jpg |
            | nome      | Trompete     |
            | categoria | Outros       |
            | preco     | 100          |
            E acesso o meu dashboard
        Quando a "locataria@yahoo.com" e "abc123" solicita a locação desse equipo
        Então devo ver a seguinte mensagem
            """
            locataria@yahoo.com deseja alugar o equipamento: Trompete em: DATA_ATUAL
            """
            E devo ver os links: "ACEITAR" e "REJEITAR" no pedido