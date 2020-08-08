#language: pt

Funcionalidade: Account
  Como usuário da Automation Practice
  Quero me cadastrar no site
  Para realizar compra de alguns produto do site

  @create_account
  Cenário: Criar Conta de acesso ao Site
    Dado acessar ao site
    E iniciar o cadastro do site 
    Quando efetuar o cadastro do usuário
    Então validar que o cadastrado é realizado com sucesso
    E realizar o logout no site
