class FleetsController < ApplicationController

  def new
    @fleet = Fleet.new
  end

  def index
    @fleets = Fleet.search params
  end

  def create
    @fleet = Fleet.new(fleet_params)

    if @fleet.save
      redirect_to '/home/index?page_tag=false'
    else
      render 'new'
    end
  end

  def soft_destroy

    @fleet = Fleet.find(params[:id])
    @fleet.enabled = false
    @fleet.save!

    redirect_to '/home/index?page_tag=false'
  end

  def edit
    @fleet = Fleet.find(params[:id])
  end

  def detail
    @fleet = Fleet.find(params[:id])

    @drivers = Driver.search({"tag" => "3", "search_str" => params[:id]})
  end

  def update

    @fleet = Fleet.find(params[:fleet][:id])
    @fleet.update(fleet_params)
    redirect_to '/home/index?page_tag=false'
  end

  private

  def fleet_params
    params.require(:fleet).permit(:name, :manager, :mobile, :office_number, :location, :enabled)
  end


end
