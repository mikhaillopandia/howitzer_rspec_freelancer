require_relative 'freelancer_page'

class OnboardPage < FreelancerPage
  path '/onboard/#/welcome'
  validate :title, /\AWelcome to Freelancer (\w+) | Freelancer\z/
  validate :url, %r{/onboard/#/welcome/?\z}
end
