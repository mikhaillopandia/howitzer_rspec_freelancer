require_relative 'freelancer_page'

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

  def fill_form(email: nil, username: nil, password: nil, looking_for: nil)
    Howitzer::Log.info 'Fill in Login Form with data:' \
               "email: #{email}, username: #{username} password: #{password},"\
               " looking_for: #{looking_for}"
    email_input_element.set(email)
    username_element.set(username)
    password_input_element.set(password)
    looking_to_hire_radio_element.click if looking_for == 'employer'
    looking_for_work_radio_element.click if looking_for == 'employee'
  end

  def submit_form
    Howitzer::Log.info 'Submit Login Form'
    create_acc_btn_element.click
  end
end
