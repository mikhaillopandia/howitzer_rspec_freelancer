require_relative 'freelancer_page'

class SkillsPage < FreelancerPage
  path '/sellers/skill-select.php'
  validate :url, %r{/sellers/skill-select.php/?\z}
end
