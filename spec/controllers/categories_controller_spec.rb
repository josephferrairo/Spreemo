require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe "Get #index" do
    it "returns a successful http request status code" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "Get #show" do
    it "returns a successful http request status code" do
      category = FactoryGirl.create(:category)

      get :show, id: category.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "get #new" do
    it "returns a successful http status code" do

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "Post #create" do
    context "a successful create" do
      it "saves a new Category" do

        post :create, category: FactoryGirl.attributes_for(:category)
        expect(Category.count).to eq(1)
      end
    end
  end

  describe "Get #show" do
    it "returns a successful http status code" do
      category = FactoryGirl.create(:category)

      get :show, id: category.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "Put #update" do
    context "successful update"
    let(:abc) { FactoryGirl.create(:category, ailment: "ABC" ) }
    it "updates the modified Category object" do
      put :update, category: FactoryGirl.attributes_for(:category, ailment: "XYZ"), id: abc.id

      expect(Category.last.ailment).to eq("XYZ")
      expect(Category.last.ailment).not_to eq("ABC")
    end
  end

  describe "GET #edit" do
    let(:category) { FactoryGirl.create(:category) }
    it "sends a successful edit request" do
      get :edit, id: category

      expect(response).to have_http_status(:success)
    end
  end

  describe "delete #destroy" do
    let(:category) { FactoryGirl.create(:category) }
    it "deletes the category with the given id" do
      delete :destroy, id: category.id

      expect(Category.count).to eq(0)
    end
  end
end
