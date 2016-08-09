FactoryGirl.define do
  factory :appointment do
    start_date { 3.days.from_now }
    start_time { Time.now }
    doctor_id { 1 }
    association :patient
  end
end
