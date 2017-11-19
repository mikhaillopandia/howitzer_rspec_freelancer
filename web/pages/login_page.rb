require_relative 'freelancer_page'

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
end
