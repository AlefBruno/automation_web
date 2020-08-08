After do |scenario|
  evd_screen(scenario)
  Capybara.current_session.driver.quit
end
