class PageVisitsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    byebug
    visits_service = VisitsService.new(user, visit_params[:page_url])

    if visits_service.handle_visit!
      render json: {}, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end

  private

  def visit_params
    params.permit(:email, :page_url)
  end

  def user
    @user ||= User.find_by!(email: visit_params[:email])
  end
end
