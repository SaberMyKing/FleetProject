require 'rails_helper'

RSpec.describe Fleet, type: :model do

  describe ".search" do

    let(:params){
      {
          :search_str => "",
          :tag => "0"
      }
    }

    before(:each) do
      FactoryGirl.create_list(:fleet, 1, :name=>"Arthur Liang")
      FactoryGirl.create_list(:fleet, 1, :name=>"Aimee Zhou")
      FactoryGirl.create_list(:fleet, 3, :name=>"Tim Pig")
      FactoryGirl.create_list(:fleet, 1, :name=>"Shye Russo")
      FactoryGirl.create_list(:fleet, 1, :office_number=>"13128051504")
      FactoryGirl.create_list(:fleet, 1, :office_number=>"15807698888")
      FactoryGirl.create_list(:fleet, 3, :office_number=>"17504926547")
      FactoryGirl.create_list(:fleet, 1, :office_number=>"13150847599")
      FactoryGirl.create_list(:fleet, 1, :location=>"Shenzhen")
      FactoryGirl.create_list(:fleet, 1, :location=>"Guangzhou")
      FactoryGirl.create_list(:fleet, 3, :location=>"Beijing")
      FactoryGirl.create_list(:fleet, 1, :location=>"Shanghai")
    end

    it "empty search limit" do
      @fleets = FactoryGirl.create_list(:fleet, 20)
      @fleets = Fleet.search params
      expect(@fleets.count).to eq(38)
    end

    it "search fleet obj with name A" do
      params['search_str'] = "A"
      params['tag'] = "1"
      @fleets = Fleet.search params

      expect(@fleets.size).to eq(14)
    end

    it "search fleet obj with manager A" do
      params['search_str'] = "A"
      params['tag'] = "2"
      @fleets = Fleet.search params
      #puts "#{@fleets.as_json}\n"
      expect(@fleets.size).to eq(0)
    end

    it "search fleet obj with mobile " do
      params['search_str'] = "13"
      params['tag'] = "3"
      @fleets = Fleet.search params
      #puts "#{@fleets.as_json}\n"
      expect(@fleets.size).to eq(18)
    end

    it "search fleet obj with office number 131" do
      params['search_str'] = "131"
      params['tag'] = "4"
      @fleets = Fleet.search params
      #puts "#{@fleets.as_json}\n"
      expect(@fleets.size).to eq(2)
    end

    it "search fleet obj with location Shenzhen" do
      params['search_str'] = "Shenzhen"
      params['tag'] = "5"
      @fleets = Fleet.search params
      expect(@fleets.size).to eq(13)
    end

    it "no param action and jump to search page" do

      @fleets = FactoryGirl.create_list(:fleet, 20)
      @fleets = Fleet.search params
      expect(@fleets.count).to eq(38)
    end

  end
end
