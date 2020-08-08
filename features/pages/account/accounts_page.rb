module AutomationPractice
  class Accounts < SitePrism::Page
    element :form_create_account, '#uniform-id_gender1'
    elements :div_gender, '.radio-inline'
    element :input_first_name, '#customer_firstname'
    element :input_last_name, '#customer_lastname'
    element :input_passwd, '#passwd'
    element :input_company, '#company'
    element :input_address, '#address1'
    element :input_address_complement, '#address2'
    element :input_city, '#city'
    element :select_state, '#uniform-id_state'
    element :input_zip_code, '#postcode'
    element :input_mobile_phone, '#phone_mobile'
    element :button_create_account, '#submitAccount'
    element :a_account_logged, 'a.account'
    element :a_account_logout, 'a.logout'
    element :p_account_info, '#center_column'
  end
end
