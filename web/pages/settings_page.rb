require_relative 'demo_app_page'

class SettingsPage < DemoAppPage
  path '/users/settings.php'
  # validate :title, /\AFreelancer | Online Jobs | Freelance Employment | Outsourcing Services | Programmers | Web Design | Freelancers\z/
  validate :url, %r{/users/settings.php\?.+/?\z}
end
