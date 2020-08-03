class Api::ServicesController < ApplicationController
  
  before_action :set_city_company_service, only: [:show, :update, :destroy]
  
  def index
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @services = @company.services
    render json: @services
  end
  
  def show
    render json: @service
  end

  def create
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.new(service_params)
    
    if @service.save
      render json: @service, status: :created, location: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:id])
    @service.destroy
  end
    
  private
    def service_params
      params.fetch(:service, {})
    end 
  
    def set_city_company_service
      @city = City.find(params[:city_id])
      @company = @city.companies.find(params[:company_id])
      @service = @company.services.find(params[:id])
    end
end  
