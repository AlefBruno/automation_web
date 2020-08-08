module AutomationPractice
  class Home < SitePrism::Page
    set_url CONFIG_WEB['automation_practice']['host']

    element :ul_page_tabs, '#home-page-tabs'
    element :div_slider, '#slider_row'
    element :a_sign_in, '.login'
  end
end
