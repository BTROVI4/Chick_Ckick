class SpecialistsController < ApplicationController
  before_action :authenticate_user!

  layout 'application'

  def index
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialists.all
  end

  def show
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialists.find(params[:id])
  end

  def edit
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialists.find(params[:id])
    authorize @specialist
  end
  
  def create
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialists.new(specialist_params)
    authorize @specialist
    @specialist.save
    redirect_to city_company_service_path(@city, @company, @service)
  end

  def update
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialists.find(params[:id])
    authorize @specialist

    if @specialist.update(specialist_params)
      redirect_to city_company_service_path(@city, @company, @service)
    else
      render 'edit'
    end
  end

  def destroy
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialists.find(params[:id])
    authorize @specialist
    @specialist.destroy
    redirect_to city_company_service_path(@city, @company, @service)
  end

  private
    def specialist_params
      params.require(:specialist).permit(:title, :speciality, :info)
    end
end 