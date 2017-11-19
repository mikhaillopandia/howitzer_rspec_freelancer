require_relative 'freelancer_page'

class JobsPage < FreelancerPage
  path '/jobs/myskills/'
  validate :title, /\AJobs Matching My Skills\s\s| Freelancer\z/
  validate :url, %r{freelancer.co.uk/jobs/myskills/?\z}
end
