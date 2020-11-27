class PageVisitsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    visits_service = VisitsService.new(user, visit_params[:page_url])

    if visits_service.handle_visit!
      render status: :ok
    else
      render status: :server_error
    end
  end

  private

  def visit_params
    params.permit(:email, :page_url)
  end

  def user
    @user ||= User.find_by(email: visit_params[:email])
  end
end
