class Accounts
  def self.create_user_accounts
    user_account = OpenStruct.new
    user_account.email = Faker::Internet.email
    user_account.first_name = Faker::Name.first_name
    user_account.last_name = Faker::Name.last_name
    user_account.passwd = Faker::Internet.password
    user_account.company = Faker::Space.company
    user_account.address = Faker::Address.street_address
    user_account.address_complement = Faker::Address.secondary_address
    user_account.city = Faker::Address.city
    user_account.zip_code = Faker::Address.zip_code.split('-').first
    user_account.state = Faker::Address.state
    user_account.mobile_phone = Faker::PhoneNumber.cell_phone
    user_account
  end
end
