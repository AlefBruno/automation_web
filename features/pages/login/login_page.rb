module AutomationPractice
  class Login < SitePrism::Page
    element :h1_heading, '.page-heading'
    element :input_email_create, '#email_create'
    element :button_submit_create, '#SubmitCreate'

    element :input_email_login, '#email'
    element :input_passwd_login, '#passwd'
    element :button_submit_login, '#SubmitLogin'
    element :alert_message_auth_failed, "div[class='alert alert-danger'] > ol"

    def start_create_account(email)
      wait_until_h1_heading_visible
      wait_until_input_email_create_visible
      wait_until_button_submit_create_visible
      input_email_create.set email
      button_submit_create.click
    end

    def sign_in_user(user, passwd)
      wait_until_h1_heading_visible
      wait_until_input_email_login_visible
      wait_until_input_passwd_login_visible
      wait_until_button_submit_login_visible
      input_email_login.set user
      input_passwd_login.set passwd
      button_submit_login.click
    end
  end
end
