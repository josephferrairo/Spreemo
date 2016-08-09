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

  describe "Get #edit" do
    let(:appointment) { @appointment }
    it "sends a successful edit request" do
      get :edit, id: @appointment, :patient_id => @patient
      expect(response).to have_http_status(:success)
    end
  end

  describe "Put #update" do
    context "successful update" do
      let(:abc) { FactoryGirl.create(:appointment, patient: @patient, start_date: Date.parse('2012-01-01').to_s) }
      it "updates the modified appointment object" do
        put :update, :patient_id => @patient, appointment: FactoryGirl.attributes_for(:appointment, start_date: Date.parse('2012-02-01').to_s ),
        id: abc.id

        expect(Appointment.last.start_date.to_s).to eq(Date.parse('2012-02-01').to_s)
        expect(Appointment.last.start_date.to_s).not_to eq(Date.parse('2012-01-01').to_s)
      end

    end
  end
end
