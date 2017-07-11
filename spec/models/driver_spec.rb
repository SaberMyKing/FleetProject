require 'rails_helper'

RSpec.describe Driver, type: :model do
  describe ".search" do

    let(:params){
      {
          :search_str => "",
          :tag => "0"
      }
    }

    before(:each) do
      FactoryGirl.create_list(:driver, 1, :name=>"Arthur Liang")
      FactoryGirl.create_list(:driver, 1, :name=>"Aimee Zhou")
      FactoryGirl.create_list(:driver, 3, :name=>"Tim Pig")
      FactoryGirl.create_list(:driver, 1, :name=>"Shye Russo")
      FactoryGirl.create_list(:driver, 1, :mobile=>"13128051504")
      FactoryGirl.create_list(:driver, 1, :mobile=>"15807698888")
      FactoryGirl.create_list(:driver, 3, :mobile=>"17504926547")
      FactoryGirl.create_list(:driver, 1, :mobile=>"13150847599")
      FactoryGirl.create_list(:driver, 1, :fleet_id=>"5")
      FactoryGirl.create_list(:driver, 1, :fleet_id=>"4")
      FactoryGirl.create_list(:driver, 3, :fleet_id=>"5")
      FactoryGirl.create_list(:driver, 1, :id_card=>"1317465645412")
      FactoryGirl.create_list(:driver, 1, :id_card=>"4131724257852412")
      FactoryGirl.create_list(:driver, 3, :id_card=>"4523127545612345")
      FactoryGirl.create_list(:driver, 1, :id_card=>"56456165415641787")
    end

    it "empty search limit" do
      @drivers = FactoryGirl.create_list(:driver, 20)
      @drivers = Driver.search params
      expect(@drivers.count).to eq(43)
    end

    it "search driver obj with name A" do
      params['search_str'] = "A"
      params['tag'] = "1"
      @drivers = Driver.search params

      expect(@drivers.size).to eq(19)
    end

    it "search driver obj with mobile 13" do
      params['search_str'] = "13"
      params['tag'] = "2"
      @drivers = Driver.search params
      #puts "#{@drivers.as_json}\n"
      expect(@drivers.size).to eq(19)
    end

    it "search driver obj with fleet_id 4" do
      params['search_str'] = "4"
      params['tag'] = "3"
      @drivers = Driver.search params
      #puts "#{@drivers.as_json}\n"
      expect(@drivers.size).to eq(1)
    end

    it "search driver obj with id_card number 131" do
      params['search_str'] = "131"
      params['tag'] = "4"
      @drivers = Driver.search params
      #puts "#{@drivers.as_json}\n"
      expect(@drivers.size).to eq(2)
    end

    it "no param action and jump to search page" do

      @drivers = FactoryGirl.create_list(:driver, 20)
      @drivers = Driver.search params
      expect(@drivers.count).to eq(43)
    end
  end
end
