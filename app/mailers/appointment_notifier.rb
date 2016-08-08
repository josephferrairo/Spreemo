class AppointmentNotifier < ApplicationMailer
  default :from => 'example@example.com'

  def send_appointment_email(appointment)
    @doctor = appointment.doctor
    @patient = appointment.patient
    @appointment = appointment
    mail( :to => [@patient.email, @doctor.email],
    :subject => "A New Appointment has been booked")
  end
end
