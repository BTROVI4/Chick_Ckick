class WhoursController < ApplicationController::Base

  def create
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialists.find(params[:specialist_id])
    whour = @specialist.whours.new(whour_params)
    whour.save
    redirect_to city_company_service_specialist_path(@city, @company, @service, @specialist)
  end

  def destroy
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialists.find(params[:specialist_id])
    @whour = @specialist.whours.find(params[:id])
    @whour.destroy
    redirect_to city_company_service_specialist_path(@city, @company, @service, @specialist)
  end

  private
    def whour_params
      params.require(:whour).permit(:month, :year, :day, :time)
    end
end