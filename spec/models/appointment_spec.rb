require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { should belong_to(:patient) }
  it { should belong_to(:doctor) }
  #  it { should validate_presence_of(:start_time)}
  #  it { should validate_presence_of(:start_date)}
  #  it { should validate_presence_of(:doctor_id)}

end
