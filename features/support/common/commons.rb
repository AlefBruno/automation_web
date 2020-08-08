module Commons
  def messages_web_load(keys)
    data = search_keys(keys, MSG_WEB || {})
    return data unless data.nil?
  end

  def search_keys(keys, data)
    keys = keys.split(' ') if keys.instance_of? String
    keys.each do |key|
      data = data[key]
      break if data.nil?
    end
    data
  end

  def evd_screen(scenario)
    nome_cenario = scenario.name.gsub(/[^A-Za-z0-9]/, '')
    nome_cenario = nome_cenario.gsub(' ', '_').downcase!
    screen = "features/support/results/#{nome_cenario}.png"
    page.save_screenshot(screen, full: true)
    embed(screen, 'image/png', 'Evidências ===> ')
  end
end
