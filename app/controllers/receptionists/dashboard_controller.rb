class Receptionists::DashboardController < ApplicationController
  before_action :require_login
  before_action :require_receptionist

  def index
    @patients = Patient.all
  end

  private

  def require_receptionist
    redirect_to root_path unless current_user.role == "Receptionist"
  end
end
