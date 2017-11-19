require_relative 'freelancer_page'
class ConfirmationEmployerEmailPage < FreelancerPage
  path '/users/onverify.php?id={token}'
  validate :url, %r{/users/onverify.php/?(w+)}
end
