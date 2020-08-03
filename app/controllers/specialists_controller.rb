class SpecialistsController < ActionController::Base
  
  layout 'application'
  
  def show
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialists.find(params[:id])
  end

  def create
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    specialist = @service.specialists.new(specialist_params)
    specialist.save
    redirect_to city_company_service_path(@city, @company, @service)
  end

  def destroy
    @city = City.find(params[:city_id])
    @company = @city.companies.find(params[:company_id])
    @service = @company.services.find(params[:service_id])
    @specialist = @service.specialists.find(params[:id])
    @specialist.destroy
    redirect_to city_company_service_path(@city, @company, @service)
  end

  private
    def specialist_params
      params.require(:specialist).permit(:title, :speciality, :info)
    end
end 