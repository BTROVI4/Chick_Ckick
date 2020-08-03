class Api::WhoursController < ApplicationController
  before_action :set_city_company_service_specialist_whour, only: [:show, :update, :destroy]
  
  def index
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialists.find(params[:specialist_id])
    @whours = @specialist.whours
    render json: @whours
  end
  
  def show
    render json: @whour
  end
  
  def create
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialists.find(params[:specialist_id])
    @whour = @specialist.whours.new(whour_params)
    if @whour.save
      render json: @whour, status: :created, location: @whour
    else
      render json: @whour.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialists.find(params[:specialist_id])
    @whour = @specialist.whours.find(params[:id])
    @whour.destroy
  end

  private
    def whour_params
      params.fetch(:whour, {})
    end

    def set_city_company_service_specialist_whour
      @city = City.find(params[:city_id])
      @company = @city.companies.find(params[:company_id])
      @service = @company.services.find(params[:service_id])
      @specialist = @service.specialists.find(params[:specialist_id])
      @whour = @specialist.whours.find(params[:id])
    end
end