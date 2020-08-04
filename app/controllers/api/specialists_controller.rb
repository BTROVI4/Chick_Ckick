class Api::SpecialistsController < ApplicationController
  before_action :set_city_company_service_specialist, only: [:show, :update, :destroy]

  def index
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialists = @service.specialists
    render json: @specialists
  end
  
  def show
    render json: @specialist
  end

  def create
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialist.new(specialist_params)
  
    if @specialist.save
      render json: @specialist, status: :created, location: @specialist
    else
      render json: @specialist.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialist.find(params[:id])
    @specialist.destroy
  end

  def book_appointment
    pp params
  end

  private
    def specialist_params
      params.fetch(:specialist, {})
    end

    def set_city_company_service_specialist
      @city = City.find(params[:city_id])
      @company = @city.companies.find(params[:company_id])
      @service = @company.services.find(params[:service_id])
      @specialist = @service.specialists.find(params[:id])
    end
end