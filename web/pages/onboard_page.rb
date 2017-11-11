require_relative 'demo_app_page'

class OnboardPage < DemoAppPage
  path '/onboard/#/welcome'
  validate :title, /\AWelcome to Freelancer (\w+) | Freelancer\z/
  validate :url, %r{/onboard/#/welcome/?\z}
end
