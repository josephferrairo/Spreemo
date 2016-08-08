class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  validates :start_date, :start_time, :doctor_id, presence: true
  validate :three_days_away
  after_create :send_appointment_mailer

  def three_days_away
    if start_date <= 2.days.from_now
      errors.add(:start_date, "must be 3 days away")
    end
  end

  def send_appointment_mailer
    AppointmentNotifier.send_appointment_email(self).deliver
  end
end
