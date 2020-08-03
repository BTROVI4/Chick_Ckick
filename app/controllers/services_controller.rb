class ServicesController < ApplicationController
 
  layout 'application'

  def show
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:id])
  end

  def create
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    service = @company.services.new(service_params)
    service.save
    redirect_to city_company_path(@city, @company)
  end

  def destroy
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:id])
    @service.destroy
    redirect_to city_company_path(@city, @company)
  end

  private
    def service_params
      params.require(:service).permit(:title, :cost, :wminutes)
    end
end