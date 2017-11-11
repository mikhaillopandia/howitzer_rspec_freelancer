require_relative 'demo_app_page'

class SignUpPage < Howitzer::Web::Page
  path '/signup'
  validate :title, /\AUser Signup | Freelancer\z/
  validate :url, %r{\/signup\/?\z}

  element :email_input, :fillable_field, 'new-email'
  element :username, :fillable_field, 'new-username'
  element :password_input, :fillable_field, 'signup-form-passwd'

  element :create_acc_btn, '#signup_btn'

  element :looking_for_work_radio, :radio_button, 'looking_for_work'
  element :looking_to_hire_radio, :radio_button, 'looking_to_hire'

  def fill_form(email: nil, username: nil, password: nil, looking_for_work_radio: nil)
    Howitzer::Log.info 'Fill in Login Form with data:' \
               "email: #{email}, username: #{username} password: #{password},"\
               " looking_for_work_radio: #{looking_for_work_radio}"
    email_input_element.set(email) unless email.nil?
    username_element.set(username) unless username.nil?
    password_input_element.set(password) unless password.nil?
    if looking_for_work_radio == 'hire'
      then looking_to_hire_radio_element.click
    elsif looking_for_work_radio == 'work'
      then looking_for_work_radio_element.click
    end
    self
  end

  def submit_form
    Howitzer::Log.info 'Submit Login Form'
    create_acc_btn_element.click
  end

  def login_as(email, username, password, looking_for_work_radio)
    Howitzer::Log.info "Login with: Email=#{email}, Username = #{username} Password=#{password}, Looking For=#{looking_for_work_radio}"
    fill_form(email: email, username: username, password: password, looking_for_radio: looking_for_work_radio)
    submit_form
    HomePage.given
  end
end
