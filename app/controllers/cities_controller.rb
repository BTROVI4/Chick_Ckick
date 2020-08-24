class CitiesController < ApplicationController
  before_action :authenticate_user!
  
  layout 'application'

  def index
    @cities = City.all
  end
 
  def show
    @city = City.find(params[:id])
  end

  def new
    @city = City.new
    authorize @city
  end
 
  def create
    @city = City.new(city_params)
    authorize @city

    if @city.save
      redirect_to @city
    else
      render 'new'
    end
  end
 
  def update
    @city = City.find(params[:id])
    authorize @city
 
    if @city.update(city_params)
      redirect_to @city
    else
      render 'edit'
    end
  end
 
  def destroy
    @city = City.find(params[:id])
    authorize @city

    @city.destroy
 
    redirect_to cities_path
  end
 
  private
    def city_params
      params.require(:city).permit(:title, :code)
    end
    
end