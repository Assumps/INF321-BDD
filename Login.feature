@ui @authentication
Feature: Login
    Feature usada para logar usuarios ja cadastrados

    Scenario Outline: Usuario com cadastro valido passando Email e senha validos

        Given O usuario cadastrado com email valido $<Email>
        And  senha valida $<Senha>
        When Clicando no botao Sign in
        Then o usuario e redirecionado a pagina do dashboard
        Examples:
            | Email                  | Senha    |
            | testetruebdd@gmail.com | teste123 |

    Scenario Outline: Usuario com cadastro valido passando email incorreto

        Given O usuario cadastrado com email valido $<Email>
        And  senha valida $<Senha>
        But passa um email invalido $<EmailInvalido>
        When Clicando no botao Sign in
        Then o usuario recebe uma mensagem de erro $<MensagemErro>
        Examples:
            | Email                  | Senha    | EmailInvalido         | MensagemErro                                     |
            | testetruebdd@gmail.com | teste123 | testetruebddgmail.com | Login Failed. Username or Password is incorrect. |

    Scenario Outline: Usuario sem cadastro

        Given O usuario nao cadastrado passando email $<Email>
        And  senha $<Senha>
        When Clicando no botao Sign in
        Then o usuario recebe uma mensagem de erro $<MensagemErro>
        Examples:
            | Email                  | Senha    | MensagemErro                                     |
            | testetruebdd@gmail.com | teste123 | Login Failed. Username or Password is incorrect. |

