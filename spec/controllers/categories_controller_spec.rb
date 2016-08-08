require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

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
end
