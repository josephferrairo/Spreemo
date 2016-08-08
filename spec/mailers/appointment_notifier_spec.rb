require 'rails_helper'

RSpec.describe AppointmentNotifier, type: :mailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @appointment = FactoryGirl.create(:appointment)
    @doctor = FactoryGirl.create(:doctor)
    @patient = FactoryGirl.create(:patient)
    EbookConfirmationMailer.confirmation_email(@appointment).deliver
  end
  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

#  it 'should send an email' do
  #  ActionMailer::Base.deliveries.count.should == 1
#  end
end
