class VisitorsController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.admin?
      redirect_to users_path
    elsif current_user.receptionist?
      redirect_to appointments_path
    elsif current_user.doctor?
      redirect_to pets_path
    elsif current_user.customer?
      redirect_to pets_path
    end
  end
end
