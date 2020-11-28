class WeeklyEmailer
  def self.run_all
    User.find_each do |user|
      PageVisitsReportMailer.with(user: user).weekly_report.deliver_later
    end
  end
end
