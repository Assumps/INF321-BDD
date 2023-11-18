
    @ui
Feature: Register
Feature usada para logar usuarios ja cadastrados

Scenario Outline: Usuario com cadastro valido passando Email e senha validos    

    Given O usuario cadastrado com email valido $<Email> 
    And  senha valida $<Senha>
    When Clicando no botao Sign in
    Then o usuario e redirecionado a pagina do dashboard
    Examples: 
    | Email | Senha | 
    | testetruebdd@gmail.com     | teste123        |