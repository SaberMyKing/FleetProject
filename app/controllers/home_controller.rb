class HomeController < ApplicationController
  def index
  end

  def show
    #render 'index'
    redirect_to 'login'
  end

  def user_login
    redirect_to 'login'
  end


  def index
    @drivers = Driver.search params
    @fleets = Fleet.search params
  end


end
