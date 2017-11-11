require_relative 'demo_app_page'

class VerifyPage < DemoAppPage
  path '/payments/verify.php'
  # validate :title, /\AFreelancer | Online Jobs | Freelance Employment | Outsourcing Services | Programmers | Web Design | Freelancers\z/
  validate :url, %r{/payments/verify.php?.+/?\z}
end
