class PageVisitsController < ApplicationController
  def create
    visits_service = VisitsService.new(visit_params[:page_url])

    if visits_service.handle_visit!
      render status: :ok
    else
      render status: :server_error
    end
  end

  private

  def visit_params
    params.permit(:user_id, :page_url)
  end

  def user
    @user ||= User.find(visit_params[:user_id])
  end
end
