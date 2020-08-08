Dado('acessar ao site') do
  practice_home_pages.load
  practice_home_pages.wait_until_ul_page_tabs_visible
  practice_home_pages.wait_until_div_slider_visible
end

E('iniciar o cadastro do site') do
  practice_home_pages.wait_until_a_sign_in_visible
  practice_home_pages.a_sign_in.click
  @user_account = Accounts.create_user_accounts
  practice_login_pages.start_create_account(@user_account.email)
  practice_accounts_pages.wait_until_form_create_account_visible
end

Quando('efetuar o cadastro do usuário') do
  practice_accounts_pages.div_gender.sample.click
  practice_accounts_pages.input_first_name.set @user_account.first_name
  practice_accounts_pages.input_last_name.set @user_account.last_name
  practice_accounts_pages.input_passwd.set @user_account.passwd
  practice_accounts_pages.input_company.set @user_account.company
  practice_accounts_pages.input_address.set @user_account.address
  practice_accounts_pages.input_address_complement.set @user_account.address_complement
  practice_accounts_pages.input_city.set @user_account.city
  practice_accounts_pages.select_state.select @user_account.state
  practice_accounts_pages.input_zip_code.set @user_account.zip_code
  practice_accounts_pages.input_mobile_phone.set @user_account.mobile_phone
  practice_accounts_pages.button_create_account.click
end

Então('validar que o cadastrado é realizado com sucesso') do
  practice_accounts_pages.wait_until_p_account_info_visible
  expect(practice_accounts_pages.a_account_logged.text).to eql "#{@user_account.first_name} #{@user_account.last_name}"
end

E('realizar o logout no site') do
  practice_accounts_pages.wait_until_a_account_logout_visible
  practice_accounts_pages.a_account_logout.click
  expect(practice_home_pages.a_sign_in.visible?).to eql true
end
