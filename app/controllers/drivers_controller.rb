class DriversController < ApplicationController

  def new
    @driver = Driver.new
  end

  def index
    @drivers = Driver.search params
  end

  def create
    @driver = Fleet.find(driver_params['fleet_id']).drivers.create driver_params

    if @driver.save
      redirect_to '/home/index?page_tag=true'
    else
      render 'new'
    end
  end

  def soft_destroy
    @driver = Driver.find params[:id]
    @driver.enabled = false
    @driver.save!

    redirect_to '/home/index?page_tag=true'
  end

  def edit
    @driver = Driver.find params[:id]
  end

  def detail
    @driver = Driver.find params[:id]
    @fleet = Fleet.joins(:drivers).where("drivers.id = ?", params['id']).first
  end

  def update
    @driver = Driver.find params[:driver][:id]
    @driver.update driver_params
    redirect_to '/home/index?page_tag=true'
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :mobile, :fleet_id, :id_card, :enabled )
  end



end
