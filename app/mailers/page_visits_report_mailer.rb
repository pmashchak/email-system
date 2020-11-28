class PageVisitsReportMailer < ApplicationMailer
  default from: 'weekly.report@email-system.com'

  def weekly_report
    @user = params[:user]
    @page_visits = @user.page_visits.weekly
    mail(to: @user.email, subject: "Visits report from: #{1.week.ago.to_date} to: #{Date.today}")
  end
end
