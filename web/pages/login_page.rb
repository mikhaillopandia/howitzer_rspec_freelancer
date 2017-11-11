require_relative 'demo_app_page'

class LoginPage < Howitzer::Web::Page
  path '/login'
  validate :title, /\ALogin to Hire Freelancers & Find Work | Freelancer\z/
  validate :url, %r{\/login\/?\z}

  element :email_input, :fillable_field, 'username'
  element :password_input, :fillable_field, 'passwd'
  element :remember_me, :checkbox, 'loginpermanent'
  element :login_btn, '#login_btn'

  element :sign_up_link, :link, 'Sign Up'
  element :forgot_password_link, :link, 'forgot-password-btn'

  def fill_form(email: nil, password: nil, remember_me: nil)
    Howitzer::Log.info 'Fill in Login Form with data:' \
               "email: #{email}, password: #{password}, remember_me: #{remember_me}"
    email_input_element.set(email) unless email.nil?
    password_input_element.set(password) unless password.nil?
    remember_me_element.set(true) unless remember_me.nil?
    self
  end

  def submit_form
    Howitzer::Log.info 'Submit Login Form'
    login_btn_element.click
  end

  def login_as(email, password, remember_me = false)
    Howitzer::Log.info "Login with: Email=#{email}, Password=#{password}, Remember Me=#{remember_me}"
    fill_form(email: email, password: password, remember_me: remember_me)
    submit_form
    HomePage.given
  end

  def navigate_to_forgot_password_page
    Howitzer::Log.info 'Navigate to forgot password page'
    forgot_password_link_element.click
  end
end
