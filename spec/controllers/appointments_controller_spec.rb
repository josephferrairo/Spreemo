require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do

  describe "Get #new" do
    before(:each) do
      @patient = FactoryGirl.create(:patient)
    end

    it "returns a successful http request status code" do
      get :new, :patient_id => @patient
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    before(:each) do
      @patient = FactoryGirl.create(:patient)
      @doctor = FactoryGirl.create(:doctor)
    end

    context "a successful create " do
      it "saves a new appointment" do
        post :create, :patient_id => @patient,
        appointment: FactoryGirl.attributes_for(:appointment)
        expect(Appointment.count).to eq(1)
        ActionMailer::Base.deliveries.count.should == 1
      end
    end
  end
end
