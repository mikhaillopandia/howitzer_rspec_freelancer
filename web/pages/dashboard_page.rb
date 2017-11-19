require_relative 'freelancer_page'
class DashboardPage < FreelancerPage
  path '/'
  validate :url, %r{dashboard/?\z}
end
