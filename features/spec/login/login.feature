#language: pt

@login
Funcionalidade: Login
  Como usuário da Automation Practice
  Quero de realizar login no site
  Para gerenciar meus dados / realizar compras no site

  @login_invalidos
  Esquema do Cenário: Validar Login - Inválidos
    Dado acessar ao site
    Quando realizar o login com dados "<dados>"
    Então validar que o login não foi realizado com sucesso

    Exemplos:
      | dados      |
      | inválidos  |
      | branco     |

  @login_sucesso
  Cenário: Validar Login - Sucesso
    Dado acessar ao site
    E obter um usuário para logar no site 
    Quando realizar o login com dados "válidos"
    Então validar que o login foi realizado com sucesso
