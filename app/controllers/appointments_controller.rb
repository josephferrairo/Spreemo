class AppointmentsController < ApplicationController

  def new
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.new
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.create(appointment_params)
    redirect_to patient_path(@patient)
  end

  private
  def appointment_params
    params.require(:appointment).permit(:start_date, :start_time, :doctor_id)
  end
end
