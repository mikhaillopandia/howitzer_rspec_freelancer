class MainMenuSection < Howitzer::Web::Section
  me '.primary-navigation-section'

  element :menu_item, :xpath, ->(name) { ".//a[.='#{name}']" }
  element :logo, '.flicon-logo-fullcolor'
  element :menu, '#main_menu'

  def authenticated?
    has_no_menu_item_element?('Log In')
  end

  def not_authenticated?
    has_menu_item_element?('Log In')
  end

  def choose_menu(text)
    Howitzer::Log.info "Open '#{text}' menu"
    if text == 'Logo'
      then logo_element.click
    else
      menu_item_element(text).click
    end
  end
end
