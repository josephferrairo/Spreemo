class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  validates :start_date, :start_time, :doctor_id, presence: true
  validate :three_days_away

  def three_days_away
    if start_date <= 2.days.from_now
      errors.add(:start_date, "must be 3 days away")
    end
  end
end
