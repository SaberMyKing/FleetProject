require 'rails_helper'

RSpec.describe DriversController, type: :controller do


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
      @driver = FactoryGirl.create(:driver)
      expect(@driver[:enabled]).to eq(true)

    end
  end


  describe "soft_destroy" do
    it "soft delete" do

      @driver = FactoryGirl.create(:driver)
      post :soft_destroy, {"id"=>@driver.id}
      expect(response).to have_http_status(302)

    end
  end

  describe "edit" do
    it "edit driver" do
      @driver = FactoryGirl.create(:driver)
      get :edit, {"id"=>@driver.id}
      expect(response).to have_http_status(200)

    end
  end

  describe "detail" do
    it "detail drivers" do
      @driver = FactoryGirl.create(:driver)
      get :detail, {"id"=>@driver.id}
      expect(response).to have_http_status(200)

    end
  end



end
