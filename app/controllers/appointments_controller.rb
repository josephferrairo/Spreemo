class AppointmentsController < ApplicationController

  def new
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.new
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.create(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:start_date, :start_time, :doctor_id)
  end
end
