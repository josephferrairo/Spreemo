class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  validates :start_date, :start_time, :doctor_id, presence: true
  validate :three_days_away
  after_create :send_appointment_mailer

private

  def three_days_away
    if start_date >= 3.days.from_now
      errors.add(:start_date, "must be 3 days away")
    end
  end
#I'm not sure why this method blows up my model test suite, it works fine when manually testing but I keep getting validation errors
  def send_appointment_mailer
    AppointmentNotifier.send_appointment_email(self).deliver
  end
end
