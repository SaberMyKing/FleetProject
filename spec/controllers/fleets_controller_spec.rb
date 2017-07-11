require 'rails_helper'

RSpec.describe FleetsController, type: :controller do

  describe "get#index" do
    it "response successfully with 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")

    end
  end

  describe "get#create" do
    it "create new fleet and :enabled is true" do
    @fleet = FactoryGirl.create(:fleet)
    expect(@fleet[:enabled]).to eq(true)

    end
  end


  describe "soft_destroy" do
    it "soft delete" do

      @fleet = FactoryGirl.create(:fleet)
      post :soft_destroy, {"id"=>@fleet.id}
      expect(response).to have_http_status(302)

    end
  end

  describe "edit" do
    it "edit fleet" do
      @fleet = FactoryGirl.create(:fleet)
      get :edit, {"id"=>@fleet.id}
      expect(response).to have_http_status(200)

    end
  end

  describe "detail" do
    it "detail fleets" do
      @fleet = FactoryGirl.create(:fleet)
      get :detail, {"id"=>@fleet.id}
      expect(response).to have_http_status(200)

    end
  end
end
