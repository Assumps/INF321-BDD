@ui @Register
Feature: Register
    Feature usada para criar contas na plataforma

    Scenario Outline: Criando conta com input de dados validos

        Given O usuario ainda nao cadastrado com primeiro nome $<firstName>
        And  Ultimo nome $<lastName>
        And dado o pais $<Country>
        And  o estado $<State>
        And o endereco de email $<emailAddress>
        And a senha $<Password>
        And a repeticao de senha $<repeatPassword>

        When Clicando no botao Create An Account

        Then o usuario e redirecionado a pagina do dashboard

        Examples:
            | firstName | lastName  | Country | State     | emailAddress                 | Password | repeatPassword |
            | Joao      | Assumpcao | Brazil  | Sao Paulo | inf321bdd123csharp@teste.com | 123456   | 123456         |

    Scenario Outline: Criando conta com email ja existente e retornando erro

        Given O usuario ainda nao cadastrado com primeiro nome $<firstName>
        And  Ultimo nome $<lastName>
        And dado o pais $<Country>
        And  o estado $<State>
        And o endereco de email $<emailAddress>
        And a senha $<Password>
        And a repeticao de senha $<repeatPassword>

        When Clicando no botao Create An Account

        Then o usuario recebe a mensagem de erro $<errorMessage>

        Examples:
            | firstName | lastName  | Country | State     | emailAddress                 | Password | repeatPassword | errorMessage                                       |
            | Joao      | Assumpcao | Brazil  | Sao Paulo | inf321bdd123csharp@teste.com | 123456   | 123456         | User with user name already exists for this store. |

    Scenario Outline: Criando conta sem parametros obrigatorios e retornando erro

        Given O usuario ainda nao cadastrado sem passar nenhuma entrada de dados

        When Clicando no botao Create An Account

        Then o usuario recebe a mensagem de erro $<errorEmail>
        And mensagem de erro de campo generico $<errorField>
        And mensagem de erro de campo generico $<errorField>
        And mensagem de erro de campo senha $<errorPassword>
        And mensagem de erro de campo usuario $<errorUsername>

        Examples:
            | errorEmail                | errorField     | errorPassword                   | errorUsername         |
            | Email address is required | Field required | registration.password.not.empty | User name is required |