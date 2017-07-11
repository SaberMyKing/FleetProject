require 'rails_helper'

feature 'Driver', :type => :feature,  js: true do
  describe ".search"

  before :each do
    FactoryGirl.create :driver
    FactoryGirl.create :fleet
    visit '/home/index'
    find('a', :text => "司机管理").click
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
    expect(page).to have_content("Detail")
    driver = Driver.new :name=>"apple", :mobile=>"135804444", :fleet_id=>"5", :id_card=>"12312432534645"
    allow(Driver).to receive(:search).and_return(driver)
    first('a', :text => "Detail").click
    expect(page).to have_content("Detail")
    expect(page).to have_content(driver[:name]);
    expect(page).to have_content(driver[:mobile]);
  end

  it "list" do
    driver = Driver.new :name=>"apple", :mobile=>"135804444", :fleet_id=>"5", :id_card=>"12312432534645"
    driver.save
    allow(Driver).to receive(:search).and_return(driver)
    click_button("检索")
    expect(page).to have_content("Detail")
    expect(page).to have_content(driver[:name]);
    expect(page).to have_content(driver[:mobile]);
  end

end
