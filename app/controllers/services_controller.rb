class ServicesController < ApplicationController
  before_action :authenticate_user!

  layout 'application'

  def index
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.all
  end

  def show
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:id])
    
  end
 
  def edit
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:id])
    authorize @service
  end

  def create
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.new(service_params)
    authorize @service
    @service.save
    redirect_to city_company_path(@city, @company)
  end

  def update
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:id])
    authorize @service

    if @service.update(service_params)
      redirect_to city_company_path(@city, @company)
    else
      render 'edit'
    end
  end
  
  def destroy
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:id])
    authorize @service
    @service.destroy
    redirect_to city_company_path(@city, @company)
  end

  private
    def service_params
      params.require(:service).permit(:title, :cost, :wminutes)
    end
end