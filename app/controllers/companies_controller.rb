class CompaniesController < ApplicationController
    
  layout 'application'

  def show
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:id])
  end
    
  def create
    @city = City.find(params[:city_id])
    company = @city.companies.new(company_params)
    company.save
    redirect_to city_path(@city)
  end
  
  def destroy
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:id])
    @company.destroy
    redirect_to city_path(@city)
  end
  
  private
    def company_params
      params.require(:company).permit(:title, :adress)
    end
end