require_relative 'demo_app_page'
class ConfirmationEmployerEmailPage < DemoAppPage
  path "/users/onverify.php?id={token}"
  validate :url, %r{/users/onverify.php/?(w+)}
end
