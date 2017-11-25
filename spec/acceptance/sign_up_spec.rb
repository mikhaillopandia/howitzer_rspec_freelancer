require 'spec_helper'

feature 'Sign Up', smoke: true do
  scenario 'Visitor can open sign up page via menu from home page' do
    HomePage.open
    HomePage.on { main_menu_section.choose_menu('Sign Up') }
    expect(SignUpPage).to be_displayed
  end

  scenario 'User can sign up with correct credentials as employee' do
    user = build(:user)
    SignUpPage.open
    SignUpPage.on do
      fill_form(username: user.name,
                email: user.email,
                password: user.password,
                looking_for: 'employee')
      submit_form
    end
    expect(SkillsPage).to be_displayed
    ConfirmationInstructionEmail.find_by_recipient(user.email).confirm_my_account
    VerifyPage.on do
      expect(text).to include('Success! Your email address is now verified.')
    end
    VerifyPage.on { main_menu_section.choose_menu('Logo') }
    expect(JobsPage).to be_displayed
    DashboardPage.open
    DashboardPage.on { is_expected.to have_no_main_menu_section }
  end

  scenario 'User can sign up with correct credentials as employer' do
    user = build(:user)
    SignUpPage.open
    SignUpPage.on do
      fill_form(username: user.name,
                email: user.email,
                password: user.password,
                looking_for: 'employer')
      submit_form
    end
    expect(OnboardPage).to be_displayed
    ConfirmationEmployerInstructionEmail.find_by_recipient(user.email).confirm_my_employer_account
    DashboardPage.on do
      expect(text).to include('I would like to verify my phone number.')
    end
    expect(DashboardPage).to be_displayed
    DashboardPage.open
    DashboardPage.on { is_expected.to have_no_main_menu_section }
  end

  scenario 'User can not sign up with blank data', p1: true do
    SignUpPage.open
    SignUpPage.on do
      fill_form(username: nil,
                email: nil,
                password: nil,
                looking_for: nil)
      submit_form
    end
    SignUpPage.on do
      expect(text).to include('Please enter an email address Please enter a username Please enter a password')
    end
  end

  scenario 'User can not sign up with incorrect data', p1: true do
    SignUpPage.open
    SignUpPage.on do
      fill_form(username: '1',
                email: 'test.123456789',
                password: '1',
                looking_for: nil)
      submit_form
    end
    SignUpPage.on do
      expect(text).to include('Please enter a valid email address. Username must be 3-16 characters '\
                                      'Password must be 6 characters minimum')
    end
  end
end
