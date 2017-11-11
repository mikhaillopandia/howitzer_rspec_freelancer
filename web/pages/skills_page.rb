require_relative 'demo_app_page'

class SkillsPage < DemoAppPage
  path '/sellers/skill-select.php'
  validate :title, /\AFreelancer | Online Jobs | Freelance Employment | Outsourcing Services | Programmers | Web Design | Freelancers\z/
  validate :url, %r{/sellers/skill-select.php/?\z}
end
