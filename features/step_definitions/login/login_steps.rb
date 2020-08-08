Dado('obter um usuário para logar no site') do
  step 'iniciar o cadastro do site'
  step 'efetuar o cadastro do usuário'
  step 'validar que o cadastrado é realizado com sucesso'
  step 'realizar o logout no site'
end

Quando('realizar o login com dados {string}') do |dados|
  practice_home_pages.wait_until_a_sign_in_visible
  practice_home_pages.a_sign_in.click
  if dados.eql?('válidos')
    user = @user_account.email
    passwd = @user_account.passwd
  else
    @account = messages_web_load("automation_practice accounts login #{dados}")
    user = @account['user']
    passwd = @account['passwd']
  end
  practice_login_pages.sign_in_user(user, passwd)
end

Então('validar que o login não foi realizado com sucesso') do
  expect(practice_login_pages.alert_message_auth_failed.text).to eql @account['message']
end

Então('validar que o login foi realizado com sucesso') do
  step 'validar que o cadastrado é realizado com sucesso'
end
