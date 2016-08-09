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
        AppointmentNotifier.send_appointment_email(@appointment).deliver
        format.html { redirect_to @patient, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.find(params[:id])
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to @patient, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:start_date, :start_time, :doctor_id)
  end
end
