class AppointmentsController < ApplicationController
  before_action :set_appt, only: [:new, :create]
  before_action :set_appt_eud, only: [:edit, :update, :destroy]

  def new
    @appointment = Appointment.new
  end

  def create
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

  def edit
  end

  def update
    respond_to do |format|
      if @appointment.update_attributes(appointment_params)
        AppointmentNotifier.send_appointment_email(@appointment).deliver
        format.html { redirect_to @patient, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
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

  def set_appt
    @patient = Patient.find(params[:patient_id])
  end

  def set_appt_eud
    @patient = Patient.find(params[:patient_id])
    @appointment = @patient.appointments.find(params[:id])
  end


end
