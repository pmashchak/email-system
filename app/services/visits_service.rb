class VisitsService
  attr_accessor :user, :uri

  def initialize(user, page_url)
    self.user = user
    self.uri  = URI(page_url)
  end

  def handle_visit!
    page_visit = user.page_visits.create(host: uri.host, path: uri.path)
    page_visit.valid?
  end
end
