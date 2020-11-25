class VisitsController < ApplicationController
  def create

  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end
end
