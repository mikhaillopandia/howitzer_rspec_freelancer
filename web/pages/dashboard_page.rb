require_relative 'demo_app_page'
class DashboardPage < DemoAppPage
  path '/'
  validate :title, /\AFreelancer | Online Jobs | Freelance Employment | Outsourcing Services | Programmers | Web Design | Freelancers\z/
  validate :url, %r{dashboard/?\z}
end
