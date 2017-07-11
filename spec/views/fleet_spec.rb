require 'rails_helper'

feature 'Fleet', :type => :feature,  js: true do
  describe ".search"

  before :each do
    FactoryGirl.create :fleet, :name=>"apple", :mobile=>"135804444", :manager=>"sky", :location=>"Shenzhen"
    visit '/home/index'
    find('a', :text => "车队管理").click
  end


  it "delete exist" do
    expect(page).to have_content("Delete")
    first('a', :text => "Delete").click
    expect(page).not_to have_link "Delete"
  end

  it "edit" do
    expect(page).to have_content("Edit")
    first('a', :text => "Edit").click
    expect(page).to have_content("Edit")
  end

  it "detail" do
    save_and_open_page
    expect(page).to have_content("Detail")
    fleet = Fleet.new :name=>"apple", :mobile=>"135804444", :manager=>"sky", :location=>"Shenzhen"
    first('a', :text => "Detail").click
    save_and_open_page
    expect(page).to have_content("Detail")
    expect(page).to have_content(fleet[:name]);
    expect(page).to have_content(fleet[:mobile]);
  end

  it "list" do
    fleet = Fleet.new :fleet, :name=>"apple", :mobile=>"135804444", :manager=>"sky", :location=>"Shenzhen"
    %w{车队名 联系人 联系人号码 办公号码 车队驻地}.each do |title|
      expect(page).to have_content title
    end
    %w{name mobile manager location}.each do |attribute|
      expect(find("#inputSuccess#{attribute}").value).to eq fleet[attribute]
    end
  end

end
