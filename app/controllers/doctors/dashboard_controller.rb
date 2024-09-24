class Doctors::DashboardController < ApplicationController
  before_action :require_login
  before_action :require_doctor

  def index
    @patients = Patient.all
  end

  def graph
    @patient_count_by_day = Patient.group(:registered_at).count
    # This will return a hash of {date => count}
  end

  private

  def require_doctor
    redirect_to root_path unless current_user.role == "Doctor"
  end
end
