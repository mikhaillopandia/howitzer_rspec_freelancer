require 'spec_helper'

RSpec.feature 'Log In', smoke: true do
  scenario 'user can open login page via menu' do
    HomePage.open
    HomePage.on { main_menu_section.choose_menu('Log In') }
    expect(LoginPage).to be_displayed
  end
end
