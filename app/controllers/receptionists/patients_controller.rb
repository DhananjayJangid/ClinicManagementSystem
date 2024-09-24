module Receptionists
class PatientsController < ApplicationController
    before_action :set_patient, only: [:edit, :update]

    def new
        @patient = Patient.new
    end

    def index
        @patients = Patient.all
    end
  
    def edit
        @patient = Patient.find(params[:id])
    end


    def create
        @patient = Patient.new(patient_params)
        if @patient.save
          redirect_to receptionists_patients_path, notice: 'Patient was successfully created.'
        else
          render :new
        end
    end

      
    def show
        @patient = Patient.find(params[:id])
    end
  
    def update
      if @patient.update(patient_params)
        redirect_to receptionists_dashboard_path, notice: 'Patient was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @patient = Patient.find(params[:id])
      @patient.destroy
      redirect_to receptionists_patients_path, notice: 'Patient was successfully deleted.'
    end
    

    def chart_data
        # Group patients by the date they were created and count the number of patients per day
        patient_counts_by_day = Patient.group("DATE(created_at)").count
    
        # Prepare data for the chart (labels and data points)
        render json: {
          labels: patient_counts_by_day.keys,
          data: patient_counts_by_day.values
        }
    end
  
    private
  
    def set_patient
      @patient = Patient.find(params[:id])
    end
  
    def patient_params
      params.require(:patient).permit(:name, :age, :contact_info)  # Add other patient attributes as needed
    end
  end
end