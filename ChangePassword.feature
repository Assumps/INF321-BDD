@ui @account
Feature: Change Password
    Feature usada para alterar senha do usuário logado

    Scenario Outline: Usuário insere senha válida e senha nova válida
        Given O usuário com senha antiga $<Senha>
        And  senha nova válida $<SenhaNova>
        And  repetindo senha nova $<RepeteSenhaNova>

        When Clicando no botao Change Password

        Then Usuário recebe uma mensagem de sucesso $<Mensagem>

        Examples:
            | Senha           | SenhaNova       | RepeteSenhaNova | Mensagem                       |
            | OldPassword.233 | NewPassword.233 | NewPassword.233 | Request completed with success |

    Scenario Outline: Usuário insere senha antiga inválida e senha nova
        Given O usuário com senha antiga inválida $<SenhaInvalida>
        And  senha nova válida $<SenhaNova>
        And  repetindo senha nova válida $<RepeteSenhaNova>

        When Clicando no botao Change Password

        Then Usuário recebe uma mensagem $<Mensagem>

        Examples:
            | SenhaInvalida   | SenhaNova       | RepeteSenhaNova | Mensagem         |
            | OldPassword.233 | NewPassword.233 | NewPassword.233 | Invalid Password |

    Scenario Outline: Usuário insere senha antiga e senha nova inválida
        Given O usuário com senha antiga $<SenhaAntiga>
        And  senha antiga $<SenhaNovaInvalida>
        And  repetindo senha nova $<RepeteSenhaNovaInvalida>

        When usuário termina de digitar

        Then Usuário recebe uma mensagem $<Mensagem>
        And Botão Change Password é bloqueado
        Examples:
            | Senha           | SenhaNovaInvalida | RepeteSenhaNovaInvalida | Mensagem                               |
            | OldPassword.233 | 23                | 23                      | Password must be at least 6 characters |
            | OldPassword.233 | NewPassword.233   | 23                      | Both password must match               |
            | OldPassword.233 |                   | NewPassword.233         | Please provide a new password          |
            | OldPassword.233 | 123323            |                         | Repeat Password                        |
