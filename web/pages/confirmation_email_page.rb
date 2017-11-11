require_relative 'demo_app_page'
class ConfirmationEmailPage < DemoAppPage
  path "/users/login-quick.php?token={token}"
  validate :url, %r{/users/login-quick.php/?(w+)}
end
