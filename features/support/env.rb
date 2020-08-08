require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'faker'
require 'pry'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'

Dir[File.join(File.dirname(__FILE__), 'common/*.rb')].sort.each { |file| require_relative file }
Dir[File.join(File.dirname(__FILE__), 'factories/*.rb')].sort.each { |file| require_relative file }

World(Commons)

Faker::Config.locale = 'en-US'

def load_yaml_file(path)
  YAML.load_file(File.dirname(__FILE__) + path)
end

CONFIG_WEB = load_yaml_file('/config/environments.yml')
MSG_WEB = load_yaml_file('/config/message.yml')

case ENV['BROWSER']
when 'chrome'
  @driver = :selenium_chrome
when 'headless'
  Capybara.register_driver :selenium_chrome_headless do |app|
    chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
      options.add_argument '--headless'
      options.add_argument '--disable-gpu'
      options.add_argument '--no-sandbox'
      options.add_argument '--disable-site-isolation-trials'
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
  @driver = :selenium_chrome_headless
else
  puts 'Browser não disponível .....'
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.default_max_wait_time = 10
end

Capybara.page.driver.browser.manage.window.maximize
