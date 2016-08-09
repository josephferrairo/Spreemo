require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  before(:each) do
    @patient = FactoryGirl.create(:patient)
    @doctor = FactoryGirl.create(:doctor)
    @appointment = FactoryGirl.create(:appointment, patient: @patient)
    @appointment_attributes = FactoryGirl.attributes_for(:appointment)
  end

  describe "Get #new" do
    it "returns a successful http request status code" do
      get :new, :patient_id => @patient
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    context "a successful create " do
      it "saves a new appointment" do
        expect { post :create, :patient_id => @patient,
        appointment: @appointment_attributes }.to change(
        Appointment, :count).by(1)
        ActionMailer::Base.deliveries.count.should == 1
      end
    end
  end

  describe '#DELETE destroy' do
    it "destroys the requested appointment" do
      expect { delete :destroy, { :patient_id => @patient, :id => @appointment.id }
    }.to change(Appointment, :count).by(-1)
  end
end

end
